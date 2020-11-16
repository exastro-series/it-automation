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
//////////////////////////////////////////////////////////////////////
//
//  【処理概要】
//    ・Ansibleインターフェース情報 
//
//////////////////////////////////////////////////////////////////////
$tmpFx = function (&$aryVariant=array(),&$arySetting=array()){
    global $g;

    $arrayWebSetting = array();
    $arrayWebSetting['page_info'] = $g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-1202020");
/*
Ansibleインターフェース情報
*/
    $tmpAry = array(
        'TT_SYS_01_JNL_SEQ_ID'=>'JOURNAL_SEQ_NO',
        'TT_SYS_02_JNL_TIME_ID'=>'JOURNAL_REG_DATETIME',
        'TT_SYS_03_JNL_CLASS_ID'=>'JOURNAL_ACTION_CLASS',
        'TT_SYS_04_NOTE_ID'=>'NOTE',
        'TT_SYS_04_DISUSE_FLAG_ID'=>'DISUSE_FLAG',
        'TT_SYS_05_LUP_TIME_ID'=>'LAST_UPDATE_TIMESTAMP',
        'TT_SYS_06_LUP_USER_ID'=>'LAST_UPDATE_USER',
        'TT_SYS_NDB_ROW_EDIT_BY_FILE_ID'=>'ROW_EDIT_BY_FILE',
        'TT_SYS_NDB_UPDATE_ID'=>'WEB_BUTTON_UPDATE',
        'TT_SYS_NDB_LUP_TIME_ID'=>'UPD_UPDATE_TIMESTAMP'
    );

    $table = new TableControlAgent('B_ANSIBLE_IF_INFO','ANSIBLE_IF_INFO_ID', $g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-1202030"), 'B_ANSIBLE_IF_INFO_JNL', $tmpAry);
    $tmpAryColumn = $table->getColumns();
    $tmpAryColumn['ANSIBLE_IF_INFO_ID']->setSequenceID('B_ANSIBLE_IF_INFO_RIC');
    $tmpAryColumn['JOURNAL_SEQ_NO']->setSequenceID('B_ANSIBLE_IF_INFO_JSQ');
    unset($tmpAryColumn);

    // QMファイル名プレフィックス
    $table->setDBMainTableLabel($g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-1202040"));
    // エクセルのシート名
    $table->getFormatter('excel')->setGeneValue('sheetNameForEditByFile',$g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-1202050"));

    $table->setAccessAuth(true);    // データごとのRBAC設定


    //--------------------------------------------------------------
    //----実行区分 
    //--------------------------------------------------------------
    $c = new IDColumn('ANSIBLE_EXEC_MODE',$g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-1203065"),'B_ANSIBLE_EXEC_MODE','ID','NAME','', array('OrderByThirdColumn'=>'ID'));
    $c->setDescription($g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-1203066"));
    $c->setRequired(true);
    $table->addColumn($c);
    //実行区分----

    //--------------------------------------------------------------
    //----Ansible情報
    //--------------------------------------------------------------
    $acg = new ColumnGroup($g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-9010000004"));

        //----ホスト名
        $objVldt = new SingleTextValidator(1,128,false);
        $c = new TextColumn('ANSIBLE_HOSTNAME',$g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-1203030"));
        $c->setDescription($g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-1203040"));//エクセル・ヘッダでの説明
        $c->setValidator($objVldt);
        $c->setRequired(true);//登録/更新時には、入力必須
        $acg->addColumn($c);
        //ホスト名----

        //----プロトコル
        $objVldt = new SingleTextValidator(1,8,false);
        $c = new TextColumn('ANSIBLE_PROTOCOL',$g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-1203010"));
        $c->setDescription($g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-1203020"));//エクセル・ヘッダでの説明
        $c->setValidator($objVldt);
        $c->setRequired(true);//登録/更新時には、入力必須
        $acg->addColumn($c);
        //プロトコル----

        //----ポート
        $c = new NumColumn('ANSIBLE_PORT',$g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-1203050"));
        $c->setDescription($g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-1203060"));//エクセル・ヘッダでの説明
        $c->setSubtotalFlag(false);
        $c->setValidator(new IntNumValidator(null,null));
        $c->setRequired(true);//登録/更新時には、入力必須
        $acg->addColumn($c);
        //ポート----

        //----ansible-playbook実行ユーザー
        $objVldt = new SingleTextValidator(0,64,false);
        $c = new TextColumn('ANSIBLE_EXEC_USER',$g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-1204017"));
        $c->setDescription($g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-1204018"));
        $c->setValidator($objVldt);
        $c->setRequired(false);
        $acg->addColumn($c);
        //ansible-playbook実行ユーザー----

        //----認証キー Key
        $objVldt = new SingleTextValidator(0,64,false);
        $c = new TextColumn('ANSIBLE_ACCESS_KEY_ID',$g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-1203070"));
        $c->setDescription($g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-1203080"));//エクセル・ヘッダでの説明
        $c->setValidator($objVldt);
        $c->setRequired(true);
        $acg->addColumn($c);
        //認証キー Key----

        //----認証キー Value
        $objVldt = new SingleTextValidator(0,64,false);
        $c = new PasswordColumn('ANSIBLE_SECRET_ACCESS_KEY',$g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-1203090"));
        $c->setDescription($g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-1204010"));//エクセル・ヘッダでの説明
        $c->setValidator($objVldt);
        $c->setRequired(true);
        $c->setUpdateRequireExcept(1);//1は空白の場合は維持、それ以外はNULL扱いで更新
        $c->setEncodeFunctionName("ky_encrypt");
        $acg->addColumn($c);
        //認証キー Value----

    $table->addColumn($acg);
    //Ansible情報----


    //--------------------------------------------------------------
    //----Ansible Tower情報
    //--------------------------------------------------------------
    $tcg = new ColumnGroup($g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-9010000005"));

        //----Ansible Tower ホスト一覧
        $strTextBody= $g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-9010000019");
        $c = new LinkButtonColumn( 'TowerHostList', $strTextBody, $strTextBody, 'TowerHostList', array() );
        $c->setDescription($g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-9010000020"));//エクセル・ヘッダでの説明
        $c->setDBColumn(false);
	$tcg -> addColumn($c);
        //Ansible Tower ホスト一覧----

        //----代表ホスト名
        $objVldt = new SingleTextValidator(0,128,false);
	$c = new IDColumn('ANSTWR_HOST_ID',$g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-1203041"),'B_ANS_TWR_HOST','ANSTWR_HOST_ID','ANSTWR_HOSTNAME','');
        $c->setDescription($g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-1203042"));//エクセル・ヘッダでの説明
        $c->setValidator($objVldt);
        $c->setRequired(false);//必須チャックはDB登録前処理で実施
	$tcg -> addColumn($c);
        //代表ホスト名----

        //----プロトコル
        $objVldt = new SingleTextValidator(0,8,false);
        $c = new TextColumn('ANSTWR_PROTOCOL',$g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-1203010"));
        $c->setDescription($g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-1203021"));//エクセル・ヘッダでの説明
        $c->setValidator($objVldt);
        $c->setRequired(false);//必須チャックはDB登録前処理で実施
	$tcg -> addColumn($c);
        //プロトコル----

        //----ポート
        $c = new NumColumn('ANSTWR_PORT',$g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-1203050"));
        $c->setDescription($g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-1203061"));//エクセル・ヘッダでの説明
        $c->setSubtotalFlag(false);
        $c->setValidator(new IntNumValidator(null,null));
        $c->setRequired(false);//必須チャックはDB登録前処理で実施
	$tcg -> addColumn($c);
        //ポート----

        //----組織
	$c = new IDColumn('ANSTWR_ORGANIZATION',$g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-9010000002"),'B_ANS_TWR_ORGANIZATION','ORGANIZATION_NAME','ORGANIZATION_NAME','');
	$c -> setDescription($g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-9010000003")); // エクセル・ヘッダでの説明
        $c -> setRequired(false); //必須チャックはDB登録前処理で実施
	$tcg->addColumn($c);
        //組織----

	//----接続トークン
	$objVldt = new SingleTextValidator(0,256,false);
	$c = new PasswordColumn('ANSTWR_AUTH_TOKEN',$g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-9010000000"));
	$c -> setDescription($g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-9010000001")); // エクセル・ヘッダでの説明
	$c -> setValidator($objVldt);
        $c -> setRequired(false);  //必須チャックはDB登録前処理で実施
	$c -> setUpdateRequireExcept(1); // 1は空白の場合は維持、それ以外はNULL扱いで更新
    	$c -> setEncodeFunctionName("ky_encrypt");
	$tcg->addColumn($c);
	//接続トークン----

	//----実行時データ削除
	$c = new IDColumn('ANSTWR_DEL_RUNTIME_DATA',$g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-907390509"),'B_ANS_TWER_RUNDATA_DEL_FLAG','FLAG_ID','FLAG_NAME','');
	$c -> setDescription($g['objMTS']->getSomeMessage('ITAANSIBLEH-MNU-907350509'));//エクセル・ヘッダでの説明
        $c -> setRequired(false);
	$tcg -> addColumn($c);
	//実行時データ削除----



    $table -> addColumn($tcg);
    //Ansible Tower情報----

    //--------------------------------------------------------------
    //----データリレイストレージパス(ITA)
    //--------------------------------------------------------------
    $objVldt = new SingleTextValidator(1,256,false);
    $c = new TextColumn('ANSIBLE_STORAGE_PATH_LNX',$g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-1202060"));
    $c->setDescription($g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-1202070"));//エクセル・ヘッダでの説明
    $c->setValidator($objVldt);
    $c->setRequired(true);//登録/更新時には、入力必須
    $table->addColumn($c);
    //データリレイストレージパス(ITA)----

    //--------------------------------------------------------------
    //----データリレイストレージパス(Ansible/Tower)
    //--------------------------------------------------------------
    $objVldt = new SingleTextValidator(1,256,false);
    $c = new TextColumn('ANSIBLE_STORAGE_PATH_ANS',$g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-1202080"));
    $c->setDescription($g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-1202090"));//エクセル・ヘッダでの説明
    $c->setValidator($objVldt);
    $c->setRequired(true);//登録/更新時には、入力必須
    $table->addColumn($c);
    //データリレイストレージパス(Ansible/Tower)----

    //--------------------------------------------------------------
    //----Symphonyデータリレイストレージパス(Ansible/Tower)
    //--------------------------------------------------------------
    $objVldt = new SingleTextValidator(1,256,false);
    $c = new TextColumn('SYMPHONY_STORAGE_PATH_ANS',$g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-1202095"));
    $c->setDescription($g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-1202096"));//エクセル・ヘッダでの説明
    $c->setValidator($objVldt);
    $c->setRequired(true);//登録/更新時には、入力必須
    $table->addColumn($c);
    //Symphonyデータリレイストレージパス(Ansible/Tower)----
    
    //--------------------------------------------------------------
    //----conductorデータリレイストレージパス(Ansible/Tower)
    //--------------------------------------------------------------
    $objVldt = new SingleTextValidator(1,256,false);
    $c = new TextColumn('CONDUCTOR_STORAGE_PATH_ANS',$g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-1202097"));
    $c->setDescription($g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-1202098"));//エクセル・ヘッダでの説明
    $c->setValidator($objVldt);
    $c->setRequired(true);//登録/更新時には、入力必須
    $table->addColumn($c);
    //conductorデータリレイストレージパス(Ansible/Tower)----
    
    //--------------------------------------------------------------
    //----Ansible-Playbook実行時のオプションパラメータ
    //--------------------------------------------------------------
    $objVldt = new SingleTextValidator(0,512,false);
    $c = new TextColumn('ANSIBLE_EXEC_OPTIONS',$g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-1204015"));
    $c->setDescription($g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-1204016"));
    $c->setValidator($objVldt);
    $c->setRequired(false);
    $table->addColumn($c);
    //Ansible-Playbook実行時のオプションパラメータ----

    //--------------------------------------------------------------
    //----パラメータシートの具体値がNULLでも代入値管理に登録するかのフラグ
    //--------------------------------------------------------------
    $c = new IDColumn('NULL_DATA_HANDLING_FLG',$g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-6000000"),'B_VALID_INVALID_MASTER','FLAG_ID','FLAG_NAME','', array('OrderByThirdColumn'=>'FLAG_ID'));
    $c->setDescription($g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-6000002"));
    $c->setRequired(true);
    $table->addColumn($c);
    //パラメータシートの具体値がNULLでも代入値管理に登録するかのフラグ----

    //--------------------------------------------------------------
    //----並列実行数
    //--------------------------------------------------------------
    $c = new NumColumn('ANSIBLE_NUM_PARALLEL_EXEC',$g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-1204035"));
    $c->setDescription($g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-1204036"));//エクセル・ヘッダでの説明
    $c->setSubtotalFlag(false);
    $c->setValidator(new IntNumValidator(1,1000));
    $c->setRequired(true);//登録/更新時には、入力必須
    $table->addColumn($c);
    //並列実行数----

    //--------------------------------------------------------------
    //----状態監視周期(単位ミリ秒)
    //--------------------------------------------------------------
    $c = new NumColumn('ANSIBLE_REFRESH_INTERVAL',$g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-1204020"));
    $c->setDescription($g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-1204030"));//エクセル・ヘッダでの説明
    $c->setSubtotalFlag(false);
    $c->setValidator(new IntNumValidator(1000,null));
    $c->setRequired(true);//登録/更新時には、入力必須
    $table->addColumn($c);
    //状態監視周期(単位ミリ秒)----

    //--------------------------------------------------------------
    //----進行状態表示行数
    //--------------------------------------------------------------
    $c = new NumColumn('ANSIBLE_TAILLOG_LINES',$g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-1204040"));
    $c->setDescription($g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-1204050"));//エクセル・ヘッダでの説明
    $c->setSubtotalFlag(false);
    $c->setValidator(new IntNumValidator(null,null));
    $c->setRequired(true);//登録/更新時には、入力必須
    $table->addColumn($c);
    //進行状態表示行数----

    $table->fixColumn();

    //----組み合わせバリデータ----
    $tmpAryColumn = $table->getColumns();
    $objLU4UColumn = $tmpAryColumn[$table->getRequiredUpdateDate4UColumnID()];

    $objFunction = function($objClientValidator, $value, $strNumberForRI, $arrayRegData, $arrayVariant){

        global $g;
        global $root_dir_path;
        $retBool = true;
        $retStrBody = '';

        $strModeId = "";
        $modeValue_sub = "";

        require_once ($root_dir_path . '/libs/backyardlibs/ansible_driver/ky_ansible_common_setenv.php' );

        if(array_key_exists("TCA_PRESERVED", $arrayVariant)){
            if(array_key_exists("TCA_ACTION", $arrayVariant["TCA_PRESERVED"])){
                $aryTcaAction = $arrayVariant["TCA_PRESERVED"]["TCA_ACTION"];
                $strModeId = $aryTcaAction["ACTION_MODE"];
            }
        }

        if($strModeId == "DTUP_singleRecDelete"){
            //----更新前のレコードから、各カラムの値を取得
            $strMode        = isset($arrayVariant['edit_target_row']['ANSIBLE_EXEC_MODE'])?
                                    $arrayVariant['edit_target_row']['ANSIBLE_EXEC_MODE']:null;
            $strTwrHostID   = isset($arrayVariant['edit_target_row']['ANSTWR_HOST_ID'])?
                                    $arrayVariant['edit_target_row']['ANSTWR_HOST_ID']:null;
            $strTwrProtocol = isset($arrayVariant['edit_target_row']['ANSTWR_PROTOCOL'])?
                                    $arrayVariant['edit_target_row']['ANSTWR_PROTOCOL']:null;
            $strTwrPort     = isset($arrayVariant['edit_target_row']['ANSTWR_PORT'])?
                                    $arrayVariant['edit_target_row']['ANSTWR_PORT']:null;
            $strOrgName     = isset($arrayVariant['edit_target_row']['ANSTWR_ORGANIZATION'])?
                                    $arrayVariant['edit_target_row']['ANSTWR_ORGANIZATION']:null;
            $strToken       = isset($arrayVariant['edit_target_row']['ANSTWR_AUTH_TOKEN'])?
                                    $arrayVariant['edit_target_row']['ANSTWR_AUTH_TOKEN']:null;
            $modeValue_sub = $arrayVariant["TCA_PRESERVED"]["TCA_ACTION"]["ACTION_SUB_MODE"];//['mode_sub'];("on"/"off")
            $PkeyID = $strNumberForRI;
            //更新前のレコードから、各カラムの値を取得----
        }else if( $strModeId == "DTUP_singleRecUpdate" || $strModeId == "DTUP_singleRecRegister" ){
            $strMode        = array_key_exists('ANSIBLE_EXEC_MODE',$arrayRegData)?
                                 $arrayRegData['ANSIBLE_EXEC_MODE']:null;
            $strTwrHostID   = array_key_exists('ANSTWR_HOST_ID',$arrayRegData)?
                                 $arrayRegData['ANSTWR_HOST_ID']:null;
            $strTwrProtocol = array_key_exists('ANSTWR_PROTOCOL',$arrayRegData)?
                                 $arrayRegData['ANSTWR_PROTOCOL']:null;
            $strTwrPort     = array_key_exists('ANSTWR_PORT',$arrayRegData)?
                                 $arrayRegData['ANSTWR_PORT']:null;
            $strOrgName     = array_key_exists('ANSTWR_ORGANIZATION',$arrayRegData)?
                                 $arrayRegData['ANSTWR_ORGANIZATION']:null;
            // PasswordColumn
            $strToken       = isset($arrayVariant['edit_target_row']['ANSTWR_AUTH_TOKEN'])?
                                    $arrayVariant['edit_target_row']['ANSTWR_AUTH_TOKEN']:null;
            if(strlen($strToken)==0) {
                $strToken = array_key_exists('ANSTWR_AUTH_TOKEN',$arrayRegData)?
                               $arrayRegData['ANSTWR_AUTH_TOKEN']:null;
            }
        }

        switch($strModeId) {
        case "DTUP_singleRecDelete":
            break;
        case "DTUP_singleRecUpdate":
        case "DTUP_singleRecRegister":
            $retStrBody = "";
            $ary   = array();
            $ary[] = array("VALUE"=>$strTwrHostID  ,"MSG_CODE"=>"ITAANSIBLEH-MNU-1203030");
            $ary[] = array("VALUE"=>$strTwrProtocol,"MSG_CODE"=>"ITAANSIBLEH-MNU-1203010");
            $ary[] = array("VALUE"=>$strTwrPort,    "MSG_CODE"=>"ITAANSIBLEH-MNU-1203050");
            $ary[] = array("VALUE"=>$strOrgName,    "MSG_CODE"=>"ITAANSIBLEH-MNU-9010000002");
            $ary[] = array("VALUE"=>$strToken,      "MSG_CODE"=>"ITAANSIBLEH-MNU-9010000000");
            // 実行エンジンがTowerの場合の、Ansible Towerインターフェースの必須入力チェック
            if($strMode == DF_EXEC_MODE_TOWER) {
                foreach($ary as $values) {
                    if(trim(strlen($values['VALUE'])) == 0) {
                        $msg1 = $g['objMTS']->getSomeMessage($values['MSG_CODE']);
                        if(strlen($retStrBody) != 0) $retStrBody .= "\n";
                        $retStrBody .= $g['objMTS']->getSomeMessage("ITAANSIBLEH-MNU-9010000018",array($msg1));
                    }
                }
            }
            if(strlen($retStrBody) != 0) {
                $retBool = false;
            }
            break;
        }
        if($retBool===false){
            $objClientValidator->setValidRule($retStrBody);
        }
        return $retBool;
    };

    $objVarVali = new VariableValidator();
    $objVarVali->setErrShowPrefix(false);
    $objVarVali->setFunctionForIsValid($objFunction);
    $objVarVali->setVariantForIsValid(array());

    $objLU4UColumn->addValidator($objVarVali);
    //組み合わせバリデータ----

    $table->setGeneObject('webSetting', $arrayWebSetting);

    $tmpAryColumn = $table->getColumns();
    $tmpAryColumn['ROW_EDIT_BY_FILE']->setResultCount(
        array(
         'update'  =>array('name'=>$g['objMTS']->getSomeMessage("ITAWDCH-STD-12203"), 'ct'=>0),
         'error'   =>array('name'=>$g['objMTS']->getSomeMessage("ITAWDCH-STD-12206"), 'ct'=>0)
        )
    );
    $tmpAryColumn['ROW_EDIT_BY_FILE']->setCommandArrayForEdit(
        array(
            2=>$g['objMTS']->getSomeMessage("ITAWDCH-STD-12203")
        )
    );
    //廃止・復活ボタンを隠す
    $outputType = new OutputType(new TabHFmt(), new DelTabBFmt());
    $tmpAryColumn['DISUSE_FLAG']->setOutputType("print_table", $outputType);

    return $table;
};
loadTableFunctionAdd($tmpFx,__FILE__);
unset($tmpFx);
?>
