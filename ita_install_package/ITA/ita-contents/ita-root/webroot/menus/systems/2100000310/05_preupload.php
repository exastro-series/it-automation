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

    $tmpAry=explode('ita-root', dirname(__FILE__));$root_dir_path=$tmpAry[0].'ita-root';unset($tmpAry);
    //-- サイト個別PHP要素、ここから--

    $filepath = $root_dir_path.'/temp/data_download/';
    $filename = "";
    $inOrOut = "";

    if(!file_exists($filepath)){
     //存在しないときの処理
        mkdir($filepath, 0777);
    }

    $symphonyId = str_pad($_GET['symphony_instance_id'],10,0,STR_PAD_LEFT);
    
    if(array_key_exists("mode",$_GET)===true){
        if($_GET['mode']=="in"){
            $filename = "InputData_Symphony_".$symphonyId.".zip";
            $inOrOut = 'FILE_INPUT';
        }else{
            $filename = "ResultData_Symphony_".$symphonyId.".zip";
            $inOrOut = 'FILE_RESULT';
        }
    }

    $selectDB = array("C_ANSIBLE_LNS_EXE_INS_MNG"
                     ,"C_ANSIBLE_LRL_EXE_INS_MNG"
                     ,"C_ANSIBLE_PNS_EXE_INS_MNG"
                     ,"C_TERRAFORM_EXE_INS_MNG");

    $legacyDir = $root_dir_path."/uploadfiles/2100020113/".$inOrOut."/";
    $roleDir =  $root_dir_path."/uploadfiles/2100020314/".$inOrOut."/";
    $pioneerDir = $root_dir_path."/uploadfiles/2100020213/".$inOrOut."/";
    $terraformDir = $root_dir_path."/uploadfiles/2100080011/".$inOrOut."/";


    //-- サイト個別PHP要素、ここまで--
    require_once ( $root_dir_path . "/libs/webcommonlibs/table_control_agent/web_parts_for_template_05_preupload.php");
    //-- サイト個別PHP要素、ここから--
    require_once ( $root_dir_path . "/libs/webcommonlibs/table_control_agent/web_parts_for_template_02_access.php");


    if(array_key_exists("mode",$_GET)===true && array_key_exists("symphony_instance_id",$_GET)===true){
        $zip = new ZipArchive();
        $count = 0;

        // Zipファイルオープン
        $zip->open($filepath.$filename, ZipArchive::CREATE | ZipArchive::OVERWRITE);

        // 処理制限時間を外す
        set_time_limit(0);


        foreach($selectDB as $DBname){
            $list = [];

            $sql = "SELECT EXECUTION_NO, {$inOrOut} ,PATTERN_ID
                    FROM {$DBname}
                    WHERE SYMPHONY_INSTANCE_NO = :SYM_NO ";
            
            //Bindしたいものがあれば配列に入れる。
            $tmpAryBind = array('SYM_NO' => $_GET['symphony_instance_id']);

            //関数呼び出し
            $retArray = singleSQLExecuteAgent($sql, $tmpAryBind,  __FUNCTION__);
            //返り値チェック
            if($retArray[0] === true){
                //$listに結果を入れる場合
                $list = array();
                $objQuery =& $retArray[1];
                while($row = $objQuery->resultFetch() ){
                    array_push($list, $row);
                }
            }

            if(!empty($list)){
                switch($DBname){
                    case "C_ANSIBLE_LNS_EXE_INS_MNG":
                        $callDir = $legacyDir;
                    break;
                    case "C_ANSIBLE_LRL_EXE_INS_MNG":
                        $callDir = $roleDir;
                    break;
                    case "C_ANSIBLE_PNS_EXE_INS_MNG":
                        $callDir = $pioneerDir;
                    break;
                    case "C_TERRAFORM_EXE_INS_MNG":
                        $callDir = $terraformDir;
                    break;
                }
                foreach($list as $dllist){
                    $selectZip = $callDir.str_pad($dllist['EXECUTION_NO'],10,0,STR_PAD_LEFT)."/".$dllist[$inOrOut];
                    $empDir = str_pad($dllist['PATTERN_ID'],10,0,STR_PAD_LEFT);
                    $zip->addEmptyDir($empDir);
                    $zip->addFile($selectZip,$empDir."/".$dllist[$inOrOut]);
                }

            }
        }

        $zip->close();

        // 上記で作ったZIPをダウンロードします。
        header("Content-Type: application/zip");
        header("Content-Transfer-Encoding: Binary");
        header("Content-Disposition: attachment; filename=\"".basename($filepath.$filename)."\"");
        // ファイルを出力する前に、バッファの内容をクリア（ファイルの破損防止）
        ob_end_clean();
        readfile($filepath.$filename);  
        //DL後ZIPファイル削除
        unlink($filepath.$filename); 

    }

    //-- サイト個別PHP要素、ここまで-- 
    noRetFileWithColumnAccessAgent($objDefaultTable);
    //-- サイト個別PHP要素、ここから--
    //-- サイト個別PHP要素、ここまで--

    // ----アクセスログ出力
    web_log($g['objMTS']->getSomeMessage("ITAWDCH-STD-603"));
    // アクセスログ出力----
?>
