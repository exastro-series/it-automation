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
$tmpFx = function (&$aryVariant=array(),&$arySetting=array()){
    global $g;

    $arrayWebSetting = array();
    $arrayWebSetting['page_info'] = $g['objMTS']->getSomeMessage('ITABASEH-MNU-900008');

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

    $table = new TableControlAgent('B_DP_STATUS','TASK_ID', $g['objMTS']->getSomeMessage('ITABASEH-MNU-900013'), 'B_DP_STATUS_JNL', $tmpAry);
    $tmpAryColumn = $table->getColumns();
    $tmpAryColumn['TASK_ID']->setSequenceID('B_DP_STATUS_RIC');
    $tmpAryColumn['JOURNAL_SEQ_NO']->setSequenceID('B_DP_STATUS_JSQ');
    unset($tmpAryColumn);

    // QMファイル名プレフィックス
    $table->setDBMainTableLabel($g['objMTS']->getSomeMessage('ITABASEH-MNU-900008'));
    // エクセルのシート名
    $table->getFormatter('excel')->setGeneValue('sheetNameForEditByFile', $g['objMTS']->getSomeMessage('ITABASEH-MNU-900008'));

    $table->setAccessAuth(false);    // データごとのRBAC設定

    // 逆順
    $table->setDBSortKey(array("TASK_ID" => "DESC"));

    $c = new IDColumn('TASK_STATUS',$g['objMTS']->getSomeMessage('ITABASEH-MNU-900014'),'B_DP_STATUS_MASTER','TASK_ID','TASK_STATUS','');
    $c->setDescription($g['objMTS']->getSomeMessage('ITABASEH-MNU-900016'));//エクセル・ヘッダでの説明
    $c->setRequired(true);//登録/更新時には、入力必須
    $objOT = new TraceOutputType(new ReqTabHFmt(), new TextTabBFmt());
    $objOT->setFirstSearchValueOwnerColumnID('TASK_STATUS');
    $aryTraceQuery = array(array('TRACE_TARGET_TABLE'=>'B_DP_STATUS_MASTER_JNL',
    	    'TTT_SEARCH_KEY_COLUMN_ID'=>'TASK_ID',
        	'TTT_GET_TARGET_COLUMN_ID'=>'TASK_STATUS',
	        'TTT_JOURNAL_SEQ_NO'=>'JOURNAL_SEQ_NO',
    	    'TTT_TIMESTAMP_COLUMN_ID'=>'LAST_UPDATE_TIMESTAMP',
	        'TTT_DISUSE_FLAG_COLUMN_ID'=>'DISUSE_FLAG'
	    )
    );
    $objOT->setTraceQuery($aryTraceQuery);
    $c1->setOutputType('print_journal_table',$objOT);
    $table->addColumn($c);

    // 処理種別
    $c = new IDColumn('DP_TYPE',$g['objMTS']->getSomeMessage('ITABASEH-MNU-900022'),'B_DP_TYPE','ROW_ID','DP_TYPE','');
    $c->setDescription($g['objMTS']->getSomeMessage('ITABASEH-MNU-900023'));//エクセル・ヘッダでの説明
    $c->setRequired(true);//登録/更新時には、入力必須
    $objOT = new TraceOutputType(new ReqTabHFmt(), new TextTabBFmt());
    $objOT->setFirstSearchValueOwnerColumnID('DP_TYPE');
    $aryTraceQuery = array(array('TRACE_TARGET_TABLE'=>'B_DP_TYPE_JNL',
	    'TTT_SEARCH_KEY_COLUMN_ID'=>'ROW_ID',
    	'TTT_GET_TARGET_COLUMN_ID'=>'DP_TYPE',
	    'TTT_JOURNAL_SEQ_NO'=>'JOURNAL_SEQ_NO',
    	'TTT_TIMESTAMP_COLUMN_ID'=>'LAST_UPDATE_TIMESTAMP',
    	'TTT_DISUSE_FLAG_COLUMN_ID'=>'DISUSE_FLAG'
	    )
    );
    $objOT->setTraceQuery($aryTraceQuery);
    $c1->setOutputType('print_journal_table',$objOT);
    $table->addColumn($c);

    // モード
    $c = new IDColumn('DP_MODE',$g['objMTS']->getSomeMessage('ITABASEH-MNU-900025'),'B_DP_MODE','ROW_ID','DP_MODE','');
    $c->setDescription($g['objMTS']->getSomeMessage('ITABASEH-MNU-900031'));//エクセル・ヘッダでの説明
    $objOT = new TraceOutputType(new ReqTabHFmt(), new TextTabBFmt());
    $objOT->setFirstSearchValueOwnerColumnID('DP_MODE');
    $aryTraceQuery = array(array('TRACE_TARGET_TABLE'=>'B_DP_MODE_JNL',
	        'TTT_SEARCH_KEY_COLUMN_ID'=>'ROW_ID',
    	    'TTT_GET_TARGET_COLUMN_ID'=>'DP_MODE',
        	'TTT_JOURNAL_SEQ_NO'=>'JOURNAL_SEQ_NO',
    	    'TTT_TIMESTAMP_COLUMN_ID'=>'LAST_UPDATE_TIMESTAMP',
    	    'TTT_DISUSE_FLAG_COLUMN_ID'=>'DISUSE_FLAG'
	    )
    );
    $objOT->setTraceQuery($aryTraceQuery);
    $c1->setOutputType('print_journal_table',$objOT);
    $table->addColumn($c);

    // 廃止情報
    $c = new IDColumn('ABOLISHED_TYPE',$g['objMTS']->getSomeMessage('ITABASEH-MNU-900028'),'B_DP_ABOLISHED_TYPE','ROW_ID','ABOLISHED_TYPE','');
    $c->setDescription($g['objMTS']->getSomeMessage('ITABASEH-MNU-900032'));//エクセル・ヘッダでの説明
    $objOT = new TraceOutputType(new ReqTabHFmt(), new TextTabBFmt());
    $objOT->setFirstSearchValueOwnerColumnID('ABOLISHED_TYPE');
    $aryTraceQuery = array(array('TRACE_TARGET_TABLE'=>'B_DP_ABOLISHED_TYPE_JNL',
	        'TTT_SEARCH_KEY_COLUMN_ID'=>'ROW_ID',
    	    'TTT_GET_TARGET_COLUMN_ID'=>'ABOLISHED_TYPE',
    	    'TTT_JOURNAL_SEQ_NO'=>'JOURNAL_SEQ_NO',
    	    'TTT_TIMESTAMP_COLUMN_ID'=>'LAST_UPDATE_TIMESTAMP',
    	    'TTT_DISUSE_FLAG_COLUMN_ID'=>'DISUSE_FLAG'
    	)
    );
    $objOT->setTraceQuery($aryTraceQuery);
    $c1->setOutputType('print_journal_table',$objOT);
    $table->addColumn($c);

    // 指定時刻
    $c = new DateTimeColumn('SPECIFIED_TIMESTAMP', $g['objMTS']->getSomeMessage("ITABASEH-MNU-900033"),'TIMESTAMP','TIMESTAMP',false);
    $c->setDescription($g['objMTS']->getSomeMessage("ITABASEH-MNU-900034"));
    $table->addColumn($c);

    //ファイル名
    $c = new FileUploadColumn('FILE_NAME',$g['objMTS']->getSomeMessage("ITABASEH-MNU-900015"));
    $filePath = "";
    $arrayReqInfo = requestTypeAnalyze();
    if( $arrayReqInfo[0] == "web" ){
        $filePath = "uploadfiles/{$g['page_dir']}";
    }
    $c->setNRPathAnyToBranchPerFUC($filePath);
    $c->setDescription($g['objMTS']->getSomeMessage("ITABASEH-MNU-900017"));//エクセル・ヘッダでの説明
    $c->setMaxFileSize(4*1024*1024*1024);//単位はバイト
    $c->setAllowSendFromFile(false);//エクセル/CSVからのアップロードを禁止する。
    $c->setFileHideMode(true);
    $c->setWkPkSprintFormat(false);//メニューNo直下の実行No桁埋め無効
    $c->setAllowUploadColmnSendRestApi(true);   //REST APIからのアップロード可否。FileUploadColumnのみ有効(default:false)
    $c->setRequired(false);//登録/更新時には、入力必須
    $table->addColumn($c);

    // 実行ユーザ
    $c = new IDColumn('EXECUTE_USER',$g['objMTS']->getSomeMessage('ITABASEH-MNU-900035'),'A_ACCOUNT_LIST','USER_ID','USERNAME','');
    $c->setDescription($g['objMTS']->getSomeMessage('ITABASEH-MNU-900036'));//エクセル・ヘッダでの説明
    $objOT = new TraceOutputType(new ReqTabHFmt(), new TextTabBFmt());
    $objOT->setFirstSearchValueOwnerColumnID('EXECUTE_USER');
    $aryTraceQuery = array(array('TRACE_TARGET_TABLE'=>'A_ACCOUNT_LIST_JNL',
	        'TTT_SEARCH_KEY_COLUMN_ID'=>'USER_ID',
	        'TTT_GET_TARGET_COLUMN_ID'=>'USERNAME',
	        'TTT_JOURNAL_SEQ_NO'=>'JOURNAL_SEQ_NO',
    	    'TTT_TIMESTAMP_COLUMN_ID'=>'LAST_UPDATE_TIMESTAMP',
    	    'TTT_DISUSE_FLAG_COLUMN_ID'=>'DISUSE_FLAG'
    	)
    );
    $objOT->setTraceQuery($aryTraceQuery);
    $c1->setOutputType('print_journal_table',$objOT);
    $table->addColumn($c);

    //実行ユーザの値が$g['login_id']か空欄と一致するレコードのみを表示させる
    $dispRestrictColumn = array();
    $dispRestrictColumn['EXECUTE_USER'] = array($g['login_id'], ""); //ログインユーザIDおよび空欄(null)のみ表示する
    $table->setDispRestrictValue($dispRestrictColumn);

    $table->fixColumn();

    $tmpAryColumn = $table->getColumns();
    $tmpAryColumn['NOTE']->getOutputType('filter_table')->setVisible(false);
    $tmpAryColumn['NOTE']->getOutputType('print_table')->setVisible(false);
    $tmpAryColumn['NOTE']->getOutputType('excel')->setVisible(false);

    $table->getFormatter('print_table')->setGeneValue("linkExcelHidden",true);//Excel出力廃止

    $table->setGeneObject('webSetting', $arrayWebSetting);
    return $table;
};
loadTableFunctionAdd($tmpFx,__FILE__);
unset($tmpFx);
?>
