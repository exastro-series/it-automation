#!/bin/bash
#   Copyright 2019 NEC Corporation
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#
############################################################
#
# 【概要】
#    ITAをデプロイする
#
#
############################################################

#-----関数定義ここから-----
############################################################
# ログ出力
# @param    $1    string    ログに出力する文字列
# @return   なし
############################################################
log() {
    echo "["`date +"%Y-%m-%d %H:%M:%S"`"] $1" | tee -a "$LOG_FILE"
}

############################################################
# exit時に/tmp等にコピーしたファイルを削除する
# @param    $1    string    削除するファイル
# @return   なし
############################################################
func_exit_and_delete_file() {
    if ! test -e /tmp/ita_answers.txt ; then
        rm -rf /tmp/ita_answers.txt
    fi
    exit
}

############################################################
# 記入漏れをチェック
# @param    なし
# @return   なし
############################################################
func_answer_format_check() {
    #空白でないかチェック用
    if [ "$key" = "" -o "$val" = "" ]; then
        ANSWER_ERR_FLG=1
        log "ERROR : The format of Answer-file is incorrect.(key:$key)"
        log 'INFO : Abort installation.'
        func_exit_and_delete_file
    fi
    #$keyの値が正しいかチェック用
    FORMAT_CHECK_CNT=$((FORMAT_CHECK_CNT+1))
}

############################################################
# 全角文字をチェック
# @param    なし
# @return   なし
############################################################
setting_file_format_check() {
    if [ `echo "$LINE" | LANG=C grep -v '^[[:cntrl:][:print:]]*$'` ];then
        log "ERROR : Double-byte characters cannot be used in the setting files"
        log "Applicable line : $LINE"
        func_exit_and_delete_file
    fi
}


#-----関数定義ここまで-----



#ディレクトリ変数定義
BASE_DIR=`dirname ${0}`
BIN_DIR="$BASE_DIR/bin"
LIST_DIR="$BASE_DIR/list"
SQL_DIR="$BASE_DIR/sql"
LOG_DIR="$BASE_DIR/log"
LOG_FILE="$LOG_DIR/ita_installer.log"
ANSWER_FILE="$BASE_DIR/ita_answers.txt"

#log用ディレクトリ作成
if [ ! -e "$LOG_DIR" ]; then
    mkdir -m 755 "$LOG_DIR"
fi

############################################################
log 'INFO : Start process.'
############################################################


############################################################
log 'INFO : Authorization check.'
############################################################
if [ ${EUID:-${UID}} -ne 0 ]; then
    log 'ERROR : Execute with root authority.'
    log 'INFO : Abort installation.'
    exit
fi

############################################################
log 'INFO : Duplicate start-up check.'
############################################################
for((i=0; i<3; i++)); do
    PS_RES=`ps -ef`
    RES=`echo "$PS_RES" | grep "$0" -c`
    if [ "$RES" -gt 1 ]; then
        log 'INFO : Duplicate start-up is detected.'
        log 'INFO : Abort installation.'
        exit
    fi

    if [ "$i" -ne 2 ]; then
        sleep 0.1
    fi
done

# ディレクトリ移動
cd ${BASE_DIR}

############################################################
log 'INFO : Reading answer-file.'
############################################################

#answersファイルの存在を確認
if ! test -e "$ANSWER_FILE" ; then
    log 'ERROR : Answer-file does not be found.'
    log 'INFO : Abort installation.'
    exit
fi

#answersファイルの内容を格納する変数を定義
COPY_ANSWER_FILE="/tmp/ita_answers.txt"
INSTALL_MODE=''
ITA_DIRECTORY=''
ITA_LANGUAGE=''
LINUX_OS=''
AWS_FLG=''
DB_ROOT_PASSWORD=''
DB_NAME=''
DB_USERNAME=''
DB_PASSWORD=''
DB_PASSWORD_ON_CMD=''

# ita_answers.txtを/tmpにコピー
rm -f "$COPY_ANSWER_FILE" 2>> "$LOG_FILE"
cp "$ANSWER_FILE" "$COPY_ANSWER_FILE" 2>> "$LOG_FILE"
# 空行を削除
sed -i -e '/^$/d' "$COPY_ANSWER_FILE" 2>> "$LOG_FILE"
# BOMを削除
sed -i -e '1s/^\xef\xbb\xbf//' "$COPY_ANSWER_FILE" 2>> "$LOG_FILE"
# 末尾に改行を追加
echo "$(cat "$COPY_ANSWER_FILE")" 1> "$COPY_ANSWER_FILE" 2>> "$LOG_FILE"

#answersファイル読み込み
ANSWERS_TEXT=$(cat "$COPY_ANSWER_FILE")
#IFSバックアップ
SRC_IFS="$IFS"
#IFSに"\n"をセット
IFS="
"
for LINE in $ANSWERS_TEXT;do
    if [ "$(echo "$LINE"|grep -E '^[^#: ]+:[ ]*[^ ]+[ ]*$')" != "" ];then
        setting_file_format_check

        key="$(echo "$LINE" | sed 's/[[:space:]]*$//' | sed -E "s/^([^:]+):[[:space:]]*(.+)$/\1/")"
        val="$(echo "$LINE" | sed 's/[[:space:]]*$//' | sed -E "s/^([^:]+):[[:space:]]*(.+)$/\2/")"

        #インストールモード取得
        if [ "$key" = 'install_mode' ]; then
            func_answer_format_check
            INSTALL_MODE="$val"
            #フォーマットのチェック
            if [ "${INSTALL_MODE}" != 'Install_Online' -a "${INSTALL_MODE}" != 'Install_Offline' -a "${INSTALL_MODE}" != 'Gather_Library' -a "${INSTALL_MODE}" != 'Install_ITA' -a "${INSTALL_MODE}" != 'Versionup' -a "${INSTALL_MODE}" != 'Uninstall' ]; then
                log "ERROR : $key should be set to Install_Online or Install_Offline or Gather_Library or Install_ITA or Versionup or Uninstall."
                log 'INFO : Abort installation.'
                func_exit_and_delete_file
            fi
        fi

        #--ita_language,db_passwordが必要なのはINSTALL_MODE = Install_Online or Install_Offline or Install_ITAの時
        if [ "$INSTALL_MODE" = "Install_Online" -o "$INSTALL_MODE" = "Install_Offline" -o "$INSTALL_MODE" = "Install_ITA" ]; then
            #言語の取得
            if [ "$key" = 'ita_language' ]; then
                func_answer_format_check
                ITA_LANGUAGE="$val"
                if [ "${ITA_LANGUAGE}" != 'ja_JP' -a "${ITA_LANGUAGE}" != 'en_US' ]; then
                    log "ERROR : $key should be set to ja_JP or en_US."
                    log 'INFO : Abort installation.'
                    func_exit_and_delete_file
                fi
            #DBパスワード取得
            elif [ "$key" = 'db_password' ]; then
                func_answer_format_check
                DB_PASSWORD_ON_CMD="$val"
                val="$(echo "$val"|sed -e 's/\\/\\\\\\\\/g')"
                val="$(echo "$val"|sed -e 's|/|\\\\\\/|g')"
                val="$(echo "$val"|sed -e 's/&/\\\\\\&/g')"
                DB_PASSWORD="$(echo "$val"|sed -e "s/'/\\\\\\\'/g")"
            fi
        fi
        #--
    
        #ITA用のディレクトリ取得
        if [ "$key" = 'ita_directory' ]; then
            if [[ "$val" != "/"* ]]; then
                log "ERROR : Enter the absolute path in $key."
                log 'INFO : Abort installation.'
                func_exit_and_delete_file
            fi
            func_answer_format_check
            ITA_DIRECTORY="$val"
        #OSの取得
        elif [ "$key" = 'linux_os' ]; then
            func_answer_format_check
            LINUX_OS="$val"

            if [ "${LINUX_OS}" != 'CentOS7' -a "${LINUX_OS}" != 'CentOS8' -a "${LINUX_OS}" != 'RHEL7' -a "${LINUX_OS}" != 'RHEL8' -a "${LINUX_OS}" != 'RHEL7_AWS' -a "${LINUX_OS}" != 'RHEL8_AWS' ]; then
                log "ERROR : $key should be set to CentOS7 or CentOS8 or RHEL7 or RHEL8 or RHEL7_AWS or RHEL8_AWS"
                log 'INFO : Abort installation.'
                func_exit_and_delete_file
            fi

            if [ "${LINUX_OS}" == 'RHEL7_AWS' ]; then
                LINUX_OS='RHEL7'
                AWS_FLG='yes'
            elif [ "${LINUX_OS}" == 'RHEL8_AWS' ]; then
                LINUX_OS='RHEL8'
                AWS_FLG='yes'
            else
                AWS_FLG='no'
            fi
        #DBルートパスワード取得
        elif [ "$key" = 'db_root_password' ]; then
            func_answer_format_check
            DB_ROOT_PASSWORD="$val"
        #DB名取得
        elif [ "$key" = 'db_name' ]; then
            func_answer_format_check
            DB_NAME="$val"
        #DBユーザー名取得
        elif [ "$key" = 'db_username' ]; then
            func_answer_format_check
            DB_USERNAME="$val"
        fi
    fi
done

#IFSリストア
IFS="$SRC_IFS"

#アンサーファイルの内容が読み取れているか

if [ "$INSTALL_MODE" = "Install_Online" -o "$INSTALL_MODE" = "Install_Offline" -o "$INSTALL_MODE" = "Install_ITA" ]; then
    if [ "$FORMAT_CHECK_CNT" != 8 ]; then
        log 'ERROR : The format of Answer-file is incorrect.'
        log 'INFO : Abort installation.'
    fi
elif [ "$INSTALL_MODE" = "Gather_Library" -o "$INSTALL_MODE" = "Versionup" -o "$INSTALL_MODE" = "Uninstall" ]; then
    if [ "$FORMAT_CHECK_CNT" != 6 ]; then
        log 'ERROR : The format of Answer-file is incorrect.'
        log 'INFO : Abort installation.'
    fi
else
    log 'ERROR : The format of Answer-file is incorrect.'
    log 'INFO : Abort installation.'
fi


#$keyの値が正しいかチェック用
FORMAT_CHECK_CNT=$((FORMAT_CHECK_CNT+1))


#インストールモード分岐
case "$INSTALL_MODE" in
    "Install_Online")
    #オンラインインストール処理実行
        if [ -e ./bin/ita_builder_core.sh ]; then
            exec_mode=3
            source ./bin/ita_builder_core.sh
            exit
        else
            log 'ERROR : ./bin/ita_builder_core.sh does not exist.'
            log 'INFO : Abort installation.'
            exit
        fi
    ;;
    "Install_Offline")
    #オフラインインストール処理実行
        if [ -e ./bin/ita_builder_core.sh ]; then
            exec_mode=2
            source ./bin/ita_builder_core.sh
            exit
        else
            log 'ERROR : ./bin/ita_builder_core.sh does not exist.'
            log 'INFO : Abort installation.'
            exit
        fi
    ;;
    "Gather_Library")
    #ライブラリ収集スクリプト実行
        if [ -e ./bin/ita_builder_core.sh ]; then
            exec_mode=1
            source ./bin/ita_builder_core.sh
            exit
        else
            log 'ERROR : ./bin/ita_builder_core.sh does not exist.'
            log 'INFO : Abort installation.'
            exit
        fi
    ;;
    "Install_ITA")
    #ITAインストール処理実行
        if [ -e ./bin/install.sh ]; then
            source ./bin/install.sh
            exit
        else
            log 'ERROR : ./bin/install.sh does not exist.'
            log 'INFO : Abort installation.'
            exit
        fi
    ;;
    "Versionup")
    #バージョンアップ処理実行
        if [ -e ./bin/ita_version_up.sh ]; then
            source ./bin/ita_version_up.sh
            exit
        else
            log 'ERROR : ./bin/ita_version_up.sh does not exist.'
            log 'INFO : Abort installation.'
            exit
        fi
    ;;
    "Uninstall")
    #アンインストール処理実行
        if [ -e ./bin/uninstall.sh ]; then
            source ./bin/uninstall.sh
            exit
        else
            log 'ERROR : ./bin/uninstall.sh does not exist.'
            log 'INFO : Abort uninstallation.'
            exit
        fi
    ;;
esac    
