<?php
//   Copyright 2019 NEC Corporation
//
//   Licensed under the Apache License, Version 2.0 (the "License");
//   you may not use this file except in compliance with the License.
//   You may obtain a copy of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in writing, software
//   distributed under the License is distributed on an "AS IS" BASIS,
//   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//   See the License for the specific language governing permissions and
//   limitations under the License.
//
////ja_JP_UTF-8_ITABASEH_MNU
$ary[101020] = "作業対象ホストの情報をメンテナンス(閲覧/登録/更新/廃止)できます。<BR>各オーケストレータの実行前に作業対象ホストに応じた必要情報を登録してください。";
$ary[101030] = "管理システム項番";
$ary[101040] = "ITA管理対象システム一覧";
$ary[101050] = "ITA管理対象システム一覧";
$ary[101060] = "HW機器種別";
$ary[101070] = "HW機器の種別を選択します。\n・NW(ネットワーク)\n・ST(ストレージ)\n・SV(サーバー)";
$ary[101080] = "ホスト名";
$ary[101090] = "[最大長]128バイト";
$ary[102010] = "IPアドレス";
$ary[102020] = "[最大長]15バイト\nxxx.xxx.xxx.xxxの形式で入力してください。";
$ary[102024] = "Ansible利用情報";
$ary[102025] = "Pioneer利用情報";
$ary[102026] = "Tower利用情報";
$ary[102030] = "プロトコル";
$ary[102040] = "Ansible-Pioneerにて機器ログインする際のプロトコルです。";
$ary[102050] = "ログインユーザID";
$ary[102060] = "[最大長]30バイト";
$ary[102061] = "ログインパスワード";
$ary[102062] = "管理";
$ary[102063] = "●の場合、ログインパスワードは必須です。";
$ary[102070] = "ログインパスワード";
$ary[102071] = "ログインパスワード管理を●とする場合、ログインパスワードの入力は必須です。";
$ary[102072] = "ログインパスワード管理を●としない場合、ログインパスワードの入力は禁止です。";
$ary[102073] = "認証方式がパスワード認証の場合、ログインパスワードの入力は必須です。";
$ary[102074] = "認証方式がパスワード認証の場合、ログインパスワードの管理は必須です。";
$ary[102075] = "認証方式の入力値が不正です。";
$ary[102080] = "[最大長]30バイト";
$ary[102085] = "Legacy/Role利用情報";
$ary[102088] = "認証方式";
$ary[102089] = "パスワード方式の場合、ログインパスワードの管理は、●である必要があります。\n鍵方式の場合、ログインユーザでのsudo権限を/etc/sudoersに設定しておく必要があります。";
$ary[102090] = "OS種別";
$ary[102110] = "EtherWakeOnLan";
$ary[102120] = "電源ON";
$ary[102130] = "電源ON";
$ary[102140] = "MACアドレス";
$ary[102150] = "[最大長]17バイト";
$ary[102160] = "ネットワークデバイス名";
$ary[102170] = "[最大長]256バイト";
$ary[103010] = "Ansible-Pioneerにて対象機器のOS種別ごとに対話ファイルを使い分けるために利用します。";
$ary[103015] = "Cobbler利用情報";
$ary[103020] = "プロファイル";
$ary[103030] = "[元データ]Cobblerコンソール/プロファイルリスト";
$ary[103040] = "Interface";
$ary[103050] = "[最大長]256バイト";
$ary[103051] = "接続タイプ";
$ary[103052] = "AnsibleTower認証情報の接続タイプを設定します。通常はmachineを選択します。ansible_connectionをloclaに設定する必要があるネットワーク機器の場合にNetworkを選択します。";
$ary[103060] = "MACアドレス";
$ary[103070] = "[最大長]17バイト";
$ary[103080] = "Netmask";
$ary[103090] = "[最大長]15バイト";
$ary[104010] = "Gateway";
$ary[104020] = "[最大長]15バイト";
$ary[104030] = "Static";
$ary[104040] = "[最大長]32バイト";
$ary[104050] = "表示順序";
$ary[104060] = "表示順序の制御用";
$ary[104070] = "投入オペレーション一覧をメンテナンス(閲覧/登録/更新/廃止)できます。 ";
$ary[104080] = "No.";
$ary[104090] = "投入オペレーション一覧情報";
$ary[104101] = "SCRAB利用情報";
$ary[104111] = "ポート番号";
$ary[104112] = "OS種別がLinux系の場合は、ssh接続する際のポート番号です。
OS種別がWindows系の場合は、WinRM接続する際のポート番号です。
通常は
ssh接続の場合:22
WinRM接続の場合:5985";
$ary[104121] = "OS種別";
$ary[104122] = "構築対象ノードのOS種別です。";
$ary[104131] = "データ連携";
$ary[104132] = "SCARBのサーバー情報とデータ連携する場合に「●」を選択して下さい。";
$ary[104141] = "ホスト指定方式";
$ary[104142] = "構築対象ノードの指定方法です。";
$ary[104151] = "認証方式";
$ary[104152] = "SCARBとの認証方式を指定して下さい。
OS種別がWindows系の場合は、PowerShellのバージョンを選択してください。
PowerShellバージョン4以前
PowerShellバージョン5以降
OS種別がLinux系の場合は、以下の認証方式より選択してください。
パスワード認証
ssh鍵認証
sshコンフィグファイル";
$ary[104161] = "ssh認証鍵ファイル";
$ary[104162] = "認証方式でssh鍵認証を指定した場合に鍵認証ファイルのパスを入力します。
鍵認証ファイルはSCRABサーバーに配置されている必要があります。";
$ary[104171] = "sshコンフィグファイル";
$ary[104172] = "認証方式でsshコンフィグファイルを指定した場合にsshコンフィグファイルのパスを入力します。
sshコンフィグファイルはSCRABサーバーに配置されている必要があります。";
$ary[104201] = "OpenAudIT利用情報";
$ary[104211] = "接続種別";
$ary[104212] = "";
$ary[104213] = "Community";
$ary[104214] = "";
$ary[104215] = "ユーザネーム";
$ary[104216] = "";
$ary[104217] = "パスワード";
$ary[104218] = "";
$ary[104219] = "KEYファイル";
$ary[104220] = "";
$ary[104221] = "Security name";
$ary[104222] = "";
$ary[104223] = "Security level";
$ary[104224] = "";
$ary[104225] = "Authentication protocol";
$ary[104226] = "";
$ary[104227] = "Authentication passphrase";
$ary[104228] = "";
$ary[104229] = "Privacy protocol";
$ary[104230] = "";
$ary[104231] = "Privacy passphrase";
$ary[104232] = "";
$ary[104501] = "DSC利用情報";
$ary[104502] = "証明書ファイル";
$ary[104503] = "証資格情報を暗号化する場合に証明書ファイルを入力します。";
$ary[104504] = "サムプリント";
$ary[104505] = "証資格情報を暗号化する場合にサムプリントを入力します。";
$ary[104600] = "WinRM接続情報";
$ary[104605] = "ポート番号";
$ary[104606] = "WindowsServerにWinRM接続する際のポート番号を入力します。
未指定の場合はデフォルト(http:5985)でのWinRM接続となります。";
$ary[104610] = "サーバー証明書";
$ary[104611] = "WindowsServerにhttpsでWinRM接続する際のサーバー証明書を入力します。
Pythonのバージョンが2.7以降でhttpsのサーバー証明書の検証を行わない場合、インベントリファイル追加オプションに下記のパラメータを入力して下さい。
    ansible_winrm_server_cert_validation: ignore";
$ary[104615] = "接続オプション";
$ary[104616] = "プロトコルがsshの場合\n/etc/ansible/ansible.cfgのssh_argsに設定しているsshオプション以外のオプションを設定したい場合>、設定したいオプションを入力します。\n(例)\n    sshコンフィグファイルを指定する場合\n      -F /root/.ssh/ssh_config\n\nプロトコルがtelnetの場合\ntelnet接続時のオプションを設定したい場合、設定したいオプションを入力します。\n(例)\n    ポート番号を11123に指定する場合\n      11123";
$ary[104620] = "インベントリファイル\n追加オプション";
$ary[104621] = "ITAが設定していないインベントリファイルのオプションパラメータをyaml形式で入力します。
(例)
    ansible_connection: network_cli
    ansible_network_os: nxos";
$ary[104630] = "インスタンスグループ名";
$ary[104631] = "AnsibleTower/AWX のインベントリに設定するインスタンスグループを指定します。";
$ary[105010] = "投入オペレーション一覧情報";
$ary[105020] = "オペレーション名";
$ary[105030] = "[最大長]256バイト";
$ary[105040] = "実施予定日時";
$ary[105050] = "システム的には利用していません。";
$ary[105060] = "オペレーションID";
$ary[105070] = "オペレーションID(自動採番)";
$ary[105080] = "表示順序";
$ary[105090] = "表示順序の制御用";
$ary[106010] = "選択";
$ary[106020] = "OS種別をメンテナンス(閲覧/登録/更新/廃止)できます。 ";
$ary[106030] = "OS種別ID";
$ary[106040] = "OS種別マスタ情報";
$ary[106050] = "OS種別マスタ情報";
$ary[106060] = "OS種別名";
$ary[106070] = "バージョンまで含めることをお勧めします。\n(例)RHEL7.2";
$ary[106075] = "機器種別";
$ary[106080] = "SV";
$ary[106090] = "";
$ary[107010] = "NW";
$ary[107020] = "";
$ary[107030] = "ST";
$ary[107040] = "";
$ary[107050] = "表示順序";
$ary[107060] = "表示順序の制御用";
$ary[107070] = "Movementとオーケストレータの関連付けを閲覧できます。";
$ary[107080] = "Movement ID";
$ary[107090] = "Movement";
$ary[108010] = "Movement";
$ary[108020] = "Movement名";
$ary[108030] = "[最大長]256バイト";
$ary[108040] = "オーケストレータ";
$ary[108050] = "使用するオーケストレータが表示されます。";
$ary[108060] = "遅延タイマー";
$ary[108070] = "Movementが指定期間(分)を遅延した場合にステータスを遅延として警告します。";
$ary[108075] = "Ansible利用情報";
$ary[108080] = "ホスト指定形式";
$ary[108090] = "構築対象ノードの指定方法です。";
$ary[108091] = "並列実行数";
$ary[108092] = "NULLまたは正の整数";
$ary[108100] = "WinRM接続";
$ary[108110] = "構築対象ノードがWindowsServerでWinRM接続する場合に選択します。";
$ary[108120] = "gather_facts";
$ary[108130] = "Playbook実行時に構築対象ノードの情報(gather_facts)を取得したい場合に選択します。";
$ary[108200] = "OpenStack利用情報";
$ary[108210] = "HEATテンプレート";
$ary[108220] = "実行するHEATテンプレートをアップロードします。[最大サイズ]4GB";
$ary[108230] = "環境設定ファイル";
$ary[108240] = "HEATテンプレート実行後、実行されるスクリプトファイルをアップロードします。[最大サイズ]4GB";
$ary[108241] = "Tower利用情報";
$ary[108242] = "virtualenv";
$ary[108243] = "virtualenvで構築されているansible実行環境をディレクトリで表示しています。\n実行したいansible実行環境を選択します。\n未選択の場合はTowerインストール時にインストールされたansible実行環境を使用します。";
$ary[108300] = "DSC利用情報";
$ary[108310] = "エラーリトライタイムアウト";
$ary[108320] = "Movementが指定時間（秒）を超えてエラーが継続した場合にステータスを異常とします。";
$ary[109006] = "ssh認証鍵ファイル";
$ary[109007] = "ssh認証鍵ファイルを指定して鍵認証する場合のファイルを入力します。\nrootユーザーで認証可能なssh認証鍵ファイルを用意して下さい。";
$ary[109010] = "表示順序";
$ary[109020] = "表示順序の制御用";
$ary[109030] = "Symphonyクラスを閲覧できます。<br>「詳細」を押下するとSymphonyクラス編集メニューに遷移します。";
$ary[109040] = "SymphonyクラスID";
$ary[109050] = "Symphonyクラス情報";
$ary[109060] = "Symphonyクラス情報";
$ary[109070] = "Symphony名称";
$ary[109080] = "[最大長]256バイト";
$ary[109090] = "説明";
$ary[201010] = "詳細表示";
$ary[201020] = "詳細";
$ary[201030] = "表示順序";
$ary[201040] = "表示順序の制御用";
$ary[201050] = "選択";
$ary[201060] = "Symphony作業一覧(実行履歴)を閲覧できます。 <br>「詳細」を押下するとSymphony作業確認メニューに遷移します。";
$ary[201070] = "SymphonyインスタンスID";
$ary[201080] = "Symphonyインスタンス情報";
$ary[201090] = "Symphonyインスタンス情報";
$ary[201110] = "実行ユーザ";
$ary[201120] = "[元データ]ユーザ管理";
$ary[202010] = "詳細表示";
$ary[202020] = "詳細";
$ary[202030] = "Symphony名称";
$ary[202040] = "[元データ]Symphonyクラス一覧";
$ary[202050] = "オペレーション";
$ary[202060] = "[元データ]投入オペレーション一覧";
$ary[202070] = "オペレーション名";
$ary[202080] = "[最大長]256バイト";
$ary[202090] = "ステータス";
$ary[203010] = "ステータスには以下の状態が存在します。\n
・未実行\n
・未実行(予約)\n
・実行中\n
・実行中(遅延)\n
・正常終了\n
・緊急停止\n
・異常終了\n
・想定外エラー\n
・予約取消";
$ary[203020] = "緊急停止発令フラグ";
$ary[203030] = "[元データ]Symphony作業確認";
$ary[203040] = "予約日時";
$ary[203050] = "[形式]YYYY/MM/DD HH:MM";
$ary[203060] = "開始日時";
$ary[203070] = "[形式]YYYY/MM/DD HH:MM:SS";
$ary[203080] = "終了日時";
$ary[203090] = "[形式]YYYY/MM/DD HH:MM:SS";
$ary[204010] = "表示順序";
$ary[204020] = "表示順序の制御用";
$ary[204030] = "選択";
$ary[204040] = "説明";
$ary[204050] = "Symphony編集";
$ary[204060] = "SymphonyクラスID";
$ary[204070] = "Symphony名称";
$ary[204080] = "説明";
$ary[204090] = "start";
$ary[205010] = "表示フィルタ";
$ary[205020] = "内容";
$ary[205030] = "オートフィルタ";
$ary[205040] = "フィルタ";
$ary[205050] = "フィルタをクリア";
$ary[205060] = "スケジューリング";
$ary[205065] = "Symphonyを実行できます。<BR>・即時実行<BR>・予約実行<BR>が可能です。<BR>実行時にはSymphonyクラスIDとオペレーションIDを選択して下さい。";
$ary[205070] = "予約日時を指定する場合は、日時フォーマット(YYYY/MM/DD HH:II)で入力して下さい。
ブランクの場合は即時実行となります";
$ary[205080] = "予約日時";
$ary[205090] = "Symphony[フィルタ]";
$ary[206010] = "Symphony[一覧]";
$ary[206020] = "オペレーション[フィルタ]";
$ary[206030] = "オペレーション[一覧]";
$ary[206040] = "Symphony実行";
$ary[206050] = "SymphonyクラスID";
$ary[206060] = "Symphony名称";
$ary[206070] = "説明";
$ary[206080] = "start";
$ary[206090] = "オペレーションID";
$ary[207010] = "オペレーション名";
$ary[207020] = "Symphony作業確認";
$ary[207030] = "SymphonyインスタンスID";
$ary[207040] = "Symphony名称";
$ary[207050] = "説明";
$ary[207060] = "start";
$ary[207070] = "オペレーションID";
$ary[207080] = "オペレーション名";
$ary[207090] = "ステータス";
$ary[208010] = "予約日時";
$ary[208020] = "緊急停止命令";
$ary[209000] = "Symphonyクラスに紐付Movementを閲覧出来ます。";
$ary[209001] = "Movement class ID";
$ary[209002] = "Symphony紐付Movement一覧";
$ary[209003] = "Orchestrator ID";
$ary[209004] = "Movement ID";
$ary[209005] = "Sequence no";
$ary[209006] = "Pause";
$ary[209007] = "Description";
$ary[209008] = "Symphony class no";
$ary[209100] = "Symphonyインスタンスに紐付くMovementインスタンスを閲覧出来ます。";
$ary[209101] = "Symphony instance id";
$ary[209102] = "Movement instance list";
$ary[209103] = "Movement class no";
$ary[209104] = "Orchestrator id";
$ary[209105] = "Pattern id";
$ary[209106] = "Pattern name";
$ary[209107] = "Time limit";
$ary[209108] = "Ansible host designate type id";
$ary[209109] = "Ansible winrm id";
$ary[209110] = "DSC retry timeout";
$ary[209111] = "Movement sequence number";
$ary[209112] = "Flag of next Pending";
$ary[209113] = "Description";
$ary[209114] = "Symphony instance no";
$ary[209115] = "Execution no";
$ary[209116] = "Status id";
$ary[209117] = "Flag of abort recepted";
$ary[209118] = "Start time";
$ary[209119] = "End time";
$ary[209120] = "Flag to hold release";
$ary[209121] = "Flag to skip execution";
$ary[209122] = "Overwrite operation no";
$ary[209123] = "Overwrite operation name";
$ary[209124] = "Overwrite operation id";
$ary[211000] = "代入値自動登録設定に紐付けるメニューをメンテナンス(閲覧/登録/更新/廃止)できます。";
$ary[211001] = "項番";
$ary[211002] = "Ansible紐付対象メニュー";
$ary[211003] = "Ansible紐付対象メニュー";
$ary[211004] = "メニューグループ";
$ary[211005] = "ID";
$ary[211006] = "登録・更新時は当該項目は更新対象ではない。(メニューIDを更新すること)";
$ary[211007] = "名称";
$ary[211008] = "登録・更新時は当該項目は更新対象ではない。(メニューIDを更新すること)";
$ary[211009] = "メニュー";
$ary[211010] = "ID";
$ary[211011] = "登録・更新時は当該項目は更新対象ではない。(メニューグループ:メニューを更新すること)";
$ary[211012] = "名称";
$ary[211013] = "登録・更新時は当該項目は更新対象ではない。(メニューグループ:メニューを更新すること)";
$ary[211014] = "メニューグループ:メニュー";
$ary[212000] = "紐付対象メニューテーブル管理";
$ary[212001] = "項番";
$ary[212002] = "紐付対象メニューテーブル管理";
$ary[212003] = "紐付対象メニューテーブル管理";
$ary[212004] = "メニュー";
$ary[212005] = "テーブル名";
$ary[212006] = "主キー";
$ary[213000] = "紐付対象メニューカラム管理";
$ary[213001] = "項番";
$ary[213002] = "紐付対象メニューカラム管理";
$ary[213003] = "紐付対象メニューカラム管理";
$ary[213004] = "メニュー";
$ary[213005] = "カラム";
$ary[213006] = "項目名";
$ary[213007] = "参照テーブル";
$ary[213008] = "参照主キー";
$ary[213009] = "参照カラム";
$ary[213010] = "表示順";
$ary[213011] = "クラス";
$ary[214001] = "オペレーションが保存期間切れのデータを削除する情報をメンテナンス(閲覧/登録/更新/廃止)できます。 ";
$ary[214002] = "項番";
$ary[214003] = "オペレーション削除管理";
$ary[214004] = "オペレーション削除管理";
$ary[214005] = "論理削除日数";
$ary[214006] = "";
$ary[214007] = "物理削除日数";
$ary[214008] = "";
$ary[214009] = "テーブル名";
$ary[214010] = "";
$ary[214011] = "主キーカラム名";
$ary[214012] = "";
$ary[214013] = "オペレーションIDカラム名";
$ary[214014] = "";
$ary[214015] = "データストレージパス取得SQL";
$ary[214016] = "";
$ary[214017] = "履歴データパス1";
$ary[214018] = "";
$ary[214019] = "履歴データパス2";
$ary[214020] = "";
$ary[214021] = "履歴データパス3";
$ary[214022] = "";
$ary[214023] = "履歴データパス4";
$ary[214024] = "";
$ary[215001] = "ファイルが保存期間切れのデータを削除する情報をメンテナンス(閲覧/登録/更新/廃止)できます。 ";
$ary[215002] = "項番";
$ary[215003] = "ファイル削除管理";
$ary[215004] = "ファイル削除管理";
$ary[215005] = "削除日数";
$ary[215006] = "";
$ary[215007] = "削除対象ディレクトリ";
$ary[215008] = "";
$ary[215009] = "削除対象ファイル";
$ary[215010] = "";
$ary[215011] = "サブディレクトリ削除有無";
$ary[215012] = "";
$ary[301010] = "ADグループ判定";
$ary[301020] = "項番";
$ary[301030] = "ADグループ判定";
$ary[301040] = "ADグループ判定";
$ary[301050] = "ADグループ識別子";
$ary[301060] = "ADグループ識別子";
$ary[301070] = "ITAロール";
$ary[301080] = "ITAロール";
$ary[302010] = "ADユーザ判定";
$ary[302020] = "項番";
$ary[302030] = "ADユーザ判定";
$ary[302040] = "ADユーザ判定";
$ary[302050] = "ADユーザ識別子";
$ary[302060] = "ADユーザ識別子";
$ary[302070] = "ITAユーザ";
$ary[302080] = "ITAユーザ";
$ary[303000] = "Symphonyのインターフェース情報をメンテナンス(閲覧/登録/更新/廃止)できます。 <br>本メニューは必ず1レコード>である必要があります。";
$ary[303010] = "No";
$ary[303020] = "Symphonyインターフェース情報";
$ary[303030] = "Symphonyインターフェース情報";
$ary[303040] = "データリレイストレージパス";
$ary[303050] = "ITA側のSymphonyインスタンス毎の共有ディレクトリです。";
$ary[303060] = "状態監視周期(単位ミリ秒)";
$ary[303070] = "Symphony実行時の作業状況をリフレッシュする間隔です。\n環境毎にチューニングを要しますが、通常は3000ミリ秒程度が推奨値です。";
$ary[900001] = "エクスポート";
$ary[900002] = "アップロード";
$ary[900003] = "インポート";
$ary[900004] = "インポートするファイルをアップロードしてください。";
$ary[900005] = "ファイルをアップロードしてください。";
$ary[900006] = "メニューエクスポート";
$ary[900007] = "メニューインポート";
$ary[900008] = "エクスポート/インポート管理";
$ary[900009] = "メニューインポート処理を受け付けました。<br>実行No.：[<strong>{}</strong>]";
$ary[900010] = "下記の機能を提供しています。<br>・エクスポート/インポートデータの閲覧";
$ary[900011] = "下記の機能を提供しています。<br>・インポートデータのアップロード<br>&nbsp;&nbsp;&nbsp;&nbsp;インポートするデータを圧縮したkymファイルをアップロードしてください。<br><br>・メニューインポート<br>&nbsp;&nbsp;&nbsp;&nbsp;インポート可能なメニューが一覧表示されます。<br>&nbsp;&nbsp;&nbsp;&nbsp;インポートするメニューを選択し、インポートボタンをクリックしてください。<br>&nbsp;&nbsp;&nbsp;&nbsp;インポートするデータの状態はメニューインポート管理で確認できます。";
$ary[900012] = "下記の機能を提供しています。<br>&nbsp;&nbsp;・メニューエクスポート<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;データをエクスポートするメニューを選択し、エクスポートボタンをクリックしてください。";
$ary[900013] = "実行No.";
$ary[900014] = "ステータス";
$ary[900015] = "ファイル名";
$ary[900016] = "ステータスには以下の状態が存在します。\n・未実行\n・実行中\n・完了\n・完了(異常)";
$ary[900017] = "自動登録のため編集不可。";
$ary[900018] = "すべてのメニュー";
$ary[900019] = "インポート(廃止を除く)";
$ary[900020] = "インポート種別";
$ary[900021] = "インポート種別には以下が存在します。\n・通常\n・廃止を除く";
$ary[900022] = "処理種別";
$ary[900023] = "処理種別には以下が存在します。\n・エクスポート\n・インポート";
$ary[900024] = "メニューエクスポート処理を受け付けました。<br>実行No.：[<strong>{}</strong>]";
$ary[900051] = "下記の機能を提供しています。<br>&nbsp;&nbsp;・Symphony/オペレーションエクスポート<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;エクスポートするSymphonyとオペレーションを選択し、エクスポートボタンをクリックしてください。";
$ary[900052] = "下記の機能を提供しています。<br>・Symphony/オペレーションのインポートデータのアップロード<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;インポートするデータを圧縮したkym2ファイルをアップロードしてください。<br><br>・Symphony/オペレーションインポート<br>&nbsp;&nbsp;&nbsp;&nbsp;インポート可能なSymphony/オペレーションが一覧表示されます。<br>&nbsp;&nbsp;&nbsp;&nbsp;インポートするSymphony/オペレーションを選択し、インポートボタンをクリックしてください。<br>&nbsp;&nbsp;&nbsp;&nbsp;インポートするデータの状態はSymphony/オペレーションエクスポート/インポート管理で確認できます。";
$ary[900053] = "すべてのオペレーション";
$ary[900054] = "すべてのSymphony";
$ary[900055] = "下記の機能を提供しています。<br>・エクスポート/インポートデータの閲覧";
$ary[900056] = "Symphony/オペレーションエクスポート/インポート管理";
$ary[900057] = "Symphony/オペレーションエクスポート";
$ary[900058] = "Symphony/オペレーションエクスポート処理を受け付けました。<br>実行No.：[<strong>{}</strong>]";
$ary[900059] = "Symphony/オペレーションインポート";
$ary[900060] = "Symphony/オペレーションインポート処理を受け付けました。<br>実行No.：[<strong>{}</strong>]";
$ary[105075] = "最終実行日時";
$ary[105076] = "オペレーションを実行した実績の日時";
$ary[910001] = "バージョン情報";
$ary[910002] = "ドライバ";
$ary[910003] = "バージョン";
$ary[900100] = "Orchestrator ID";
$ary[900101] = "Movement ID";
$ary[900102] = "一時停止(OFF:/ON:checkedValue)";
$ary[900103] = "説明";
$ary[900104] = "オペレーションID(個別指定)";
$ary[920001] = "Symphonyをスケジュールにしたがって定期的に実行させることができます。<br>対象のsymphony, operationを選択し、「スケジュール設定」から詳細な設定を入力してください。";
$ary[920002] = "定期作業実行ID";
$ary[920003] = "定期作業実行情報";
$ary[920004] = "定期作業実行情報";
$ary[920005] = "作業一覧確認";
$ary[920006] = "ステータス";
$ary[920007] = "ステータスには以下の状態が存在します。\n
・準備中\n
・稼働中\n
・完了\n
・不整合エラー\n
・紐付けエラー\n
・想定外エラー\n
・symphony廃止\n
・operation廃止";
$ary[920008] = "スケジュール設定";
$ary[920009] = "スケジュール";
$ary[920010] = "次回実行日付";
$ary[920011] = "開始日付";
$ary[920012] = "終了日付";
$ary[920013] = "周期";
$ary[920014] = "間隔";
$ary[920015] = "週番号";
$ary[920016] = "曜日";
$ary[920017] = "日";
$ary[920018] = "時間";
$ary[920019] = "作業停止期間";
$ary[920020] = "開始";
$ary[920021] = "終了";
$ary[920022] = "Symphony名称";
$ary[920023] = "[元データ]Symphonyクラス一覧";
$ary[920024] = "オペレーション名";
$ary[920025] = "[元データ]投入オペレーション一覧";
$ary[920026] = "自動入力";
$ary[111010] = "Terraform利用情報";
$ary[111020] = "Organization:Workspace";
$ary[111030] = "対象のOrganization:Workspaceです。";
$ary[304000] = "Conductorのインターフェース情報をメンテナンス(閲覧/登録/更新/廃止)できます。 <br>本メニューは必ず1レコードである必要があります。";
$ary[304010] = "No";
$ary[304020] = "Conductorインターフェース情報";
$ary[304030] = "Conductorインターフェース情報";
$ary[304040] = "データリレイストレージパス";
$ary[304050] = "ITA側Conductorインスタンス毎の共有ディレクトリです。";
$ary[304060] = "状態監視周期(単位ミリ秒)";
$ary[304070] = "Conductor実行時の作業状況をリフレッシュする間隔です。\n環境毎にチューニングを要しますが、通常は3000ミリ秒程度が推奨値です。";
$ary[305030] = "Conductorクラスを閲覧できます。<br>「詳細」を押下するとConductorクラス編集メニューに遷移します。";
$ary[305040] = "ConductorクラスID";
$ary[305050] = "Conductorクラス情報";
$ary[305060] = "Conductorクラス情報";
$ary[305070] = "Conductor名称";
$ary[305080] = "[最大長]256バイト";
$ary[305090] = "説明";
$ary[306010] = "Conductor作業一覧(実行履歴)を閲覧できます。 <br>「詳細」を押下するとConductor作業確認メニューに遷移します。";
$ary[306020] = "ConductorインスタンスID";
$ary[306030] = "Conductorインスタンス情報";
$ary[306040] = "Conductorインスタンス情報";
$ary[306050] = "Conductor名称";
$ary[306060] = "[元データ]Conductorクラス一覧";
$ary[306070] = "緊急停止発令フラグ";
$ary[306080] = "[元データ]Conductor作業確認";
$ary[307001] = "Conductorをスケジュールにしたがって定期的に実行させることができます。<br>対象のConductor, operationを選択し、「スケジュール設定」から詳細な設定を入力してください。";
$ary[307002] = "定期作業実行ID";
$ary[307003] = "定期作業実行情報";
$ary[307004] = "定期作業実行情報";
$ary[307005] = "作業一覧確認";
$ary[307006] = "ステータス";
$ary[307007] = "ステータスには以下の状態が存在します。\n
・準備中\n
・稼働中\n
・完了\n
・不整合エラー\n
・紐付けエラー\n
・想定外エラー\n
・Conductor廃止\n
・operation廃止";
$ary[307008] = "スケジュール設定";
$ary[307009] = "スケジュール";
$ary[307010] = "次回実行日付";
$ary[307011] = "開始日付";
$ary[307012] = "終了日付";
$ary[307013] = "周期";
$ary[307014] = "間隔";
$ary[307015] = "週番号";
$ary[307016] = "曜日";
$ary[307017] = "日";
$ary[307018] = "時間";
$ary[307019] = "作業停止期間";
$ary[307020] = "開始";
$ary[307021] = "終了";
$ary[307022] = "Conductor名称";
$ary[307023] = "[元データ]・Conductor一覧";
$ary[307024] = "オペレーション名";
$ary[307025] = "[元データ]投入オペレーション一覧";
$ary[307026] = "自動入力";
$ary[308000] = "Conductorクラスに紐付されたNodeを閲覧出来ます。";
$ary[308001] = "Node class id";
$ary[308002] = "Conductor紐付Node一覧";
$ary[308003] = "Node name";
$ary[308004] = "Node type id";
$ary[308005] = "Orchestrator id";
$ary[308006] = "Pattern id";
$ary[308007] = "Conductor class no";
$ary[308008] = "Conductor call class no";
$ary[308009] = "Operation no idbh";
$ary[308010] = "Skip flag";
$ary[308100] = "Nodeクラスに紐付されたTerminalを閲覧出来ます。";
$ary[308101] = "Terminal class id";
$ary[308102] = "Node紐付Terminal一覧";
$ary[308104] = "Terminal type id";
$ary[308105] = "Terminal name";
$ary[308106] = "Node class no";
$ary[308107] = "Conductor class no";
$ary[308108] = "Conductor node name";
$ary[308109] = "Conditional id";
$ary[308110] = "Case no";
$ary[308200] = "Conductorインスタンスを閲覧出来ます。";
$ary[308201] = "Conductor instance id";
$ary[308202] = "Conductorインスタンス一覧";
$ary[308203] = "I Conductor class no";
$ary[308204] = "Operation no uapk";
$ary[308205] = "Status id";
$ary[308206] = "Execution user";
$ary[308207] = "Abort execution flg";
$ary[308208] = "Conductor ncall flg";
$ary[308209] = "Conductor caller no";
$ary[308210] = "Time book";
$ary[308211] = "Time start";
$ary[308212] = "Time end";
$ary[308300] = "Nodeインスタンスを閲覧出来ます。";
$ary[308301] = "Node instance id";
$ary[308302] = "Nodeインスタンス一覧";
$ary[308303] = "I node class no";
$ary[309001] = "Conductorを実行できます。<BR>・即時実行<BR>・予約実行<BR>が可能です。<BR>実行時にはConductorクラスIDとオペレーションIDを選択して下さい。";
$ary[309002] = "Conductor[フィルタ]";
$ary[309003] = "Conductor[一覧]";
$ary[309004] = "Conductor実行";
$ary[309005] = "ConductorクラスID";
$ary[309006] = "Conductor名称";
$ary[309007] = "新規";
$ary[309008] = "保存";
$ary[309009] = "読込";
$ary[309010] = "取り消し";
$ary[309011] = "やり直し";
$ary[309012] = "ノード削除";
$ary[309013] = "全体表示";
$ary[309014] = "表示リセット";
$ary[309015] = "フルスクリーン";
$ary[309016] = "フルスクリーン解除";
$ary[309017] = "ログ";
$ary[309018] = "登録";
$ary[309019] = "編集";
$ary[309020] = "流用新規";
$ary[309021] = "更新";
$ary[309022] = "再読込";
$ary[309023] = "キャンセル";
$ary[309024] = "実行";
$ary[309025] = "予約取消";
$ary[309026] = "緊急停止";
$ary[310001] = "シートタイプ";
$ary[309027] = "Conductor名称";
$ary[309028] = "投入データ一式(zip)";
$ary[309029] = "結果データ一式（zip）";
$ary[309030] = "download(.zip)";
$ary[309031] = "投入データ一式(zip)";
$ary[309032] = "結果データ一式（zip）";
$ary[309033] = "download(.zip)";
?>