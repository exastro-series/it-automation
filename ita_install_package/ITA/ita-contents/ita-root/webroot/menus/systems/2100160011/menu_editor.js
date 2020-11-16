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


// モード判定用
let menuEditorMode = '';

// 読み込み対象ID
let menuEditorTargetID = '';

// 各種リスト用配列
let menuEditorArray = {};

// テキストの無害化
const textEntities = function( text ) {
    const entities = [
      ['&', 'amp'],
      ['\"', 'quot'],
      ['\'', 'apos'],
      ['<', 'lt'],
      ['>', 'gt'],
    ];
    for ( var i = 0; i < entities.length; i++ ) {
      text = text.replace( new RegExp( entities[i][0], 'g'), '&' + entities[i][1] + ';' );
    }
    text = text.replace(/^\s+|\s+$/g, '');
    text = text.replace(/\r?\n/g, '<br>');
    return text;
};

// ログ表示
let menuEditorLogNumber = 1;
const menuEditorLog = {
  // log type : debug, log, notice, warning, error
  'set': function( type, content ) {
  $('.editor-tab-menu-list-item[data-tab="menu-editor-log"]').click();
  if ( type === undefined || type === '' ) type = 'log';
  
  const $menuEditorLog = $('.editor-log'),
        $menuEditorLogTable = $menuEditorLog.find('tbody');
        
  let logRowHTML = ''
    + '<tr class="editor-log-row ' + type + '">'
      + '<th class="editor-log-number">' + ( menuEditorLogNumber++ ) +'</th><td class="editor-log-content">';
  if ( type !== 'log') logRowHTML += '<span class="logLevel">' + textEntities( type.toLocaleUpperCase() ) + '</span>'
  
  logRowHTML += content + '</td></tr>';

  $menuEditorLogTable.append( logRowHTML );

  // 一番下までスクロール
  const scrollTop = $menuEditorLog.get(0).scrollHeight - $menuEditorLog.get(0).clientHeight;   
  $menuEditorLog.animate({ scrollTop : scrollTop }, 200 );

  },
  'clear': function() {
    menuEditorLogNumber = 1;
    $('.editor-log').find('tbody').empty();
  }
};

////////////////////////////////////////////////////////////////////////////////////////////////////
//
//   モーダル
// 
////////////////////////////////////////////////////////////////////////////////////////////////////

// モーダルを開く
function itaModalOpen( headerTitle, bodyFunc, modalType ) {
    
    if ( typeof bodyFunc !== 'function' ) return false;

    // 初期値
    if ( headerTitle === undefined ) headerTitle = 'Undefined title';
    if ( modalType === undefined ) modalType = 'default';

    const $window = $( window ),
          $body = $('body'),
          $container = $('.wholecontainer');
    
    let footerHTML1;
    
    if ( modalType === 'help' ) {
      footerHTML = ''
      + '<div class="editor-modal-footer">'
        + '<ul class="editor-modal-footer-menu">'
          + '<li class="editor-modal-footer-menu-item"><button class="editor-modal-footer-menu-button negative" data-button-type="close">' + getSomeMessage("ITAWDCC92003") + '</li>'
        + '</ul>'
      + '</div>'
    } else {
      footerHTML = ''
      + '<div class="editor-modal-footer">'
        + '<ul class="editor-modal-footer-menu">'
          + '<li class="editor-modal-footer-menu-item"><button class="editor-modal-footer-menu-button positive" data-button-type="ok">' + getSomeMessage("ITAWDCC92001") + '</li>'
          + '<li class="editor-modal-footer-menu-item"><button class="editor-modal-footer-menu-button negative" data-button-type="cancel">' + getSomeMessage("ITAWDCC92002") + '</li>'
        + '</ul>'
      + '</div>'
    }
    
    
    let modalHTML = ''
      + '<div id="editor-modal" class="' + modalType + '">'
        + '<div class="editor-modal-container">'
          + '<div class="editor-modal-header">'
            + '<span class="editor-modal-title">' + headerTitle + '</span>'
            + '<button class="editor-modal-header-close"></button>'
          + '</div>'
          + '<div class="editor-modal-body">'
            + '<div class="editor-modal-loading"></div>'
          + '</div>'
          + footerHTML
        + '</div>'
      + '</div>';

    const $editorModal = $( modalHTML ),
          $firstFocus = $editorModal.find('.editor-modal-header-close'),
          $lastFocus = $editorModal.find('.editor-modal-footer-menu-button[data-button-type="cancel"]');

    $body.append( $editorModal );
    $container.css('filter','blur(2px)');
    $firstFocus.focus();
    
    $window.on('keydown.modal', function( e ) {
      
      switch ( e.keyCode ) {
        case 9: // Tabでの移動をモーダル内に制限する
          {
            const $focusElement = $( document.activeElement );
            if ( $focusElement.is( $firstFocus ) && e.shiftKey ) {
              e.preventDefault();
              $lastFocus.focus();
            } else if ( $focusElement.is( $lastFocus ) && !e.shiftKey ) {
              e.preventDefault();
              $firstFocus.focus();
            }
          }
          break;
        case 27: // Escでモーダルを閉じる
          itaModalClose();
          break;
      }
    });

    $firstFocus.on('click', function() {
      itaModalClose();
    });
    if ( modalType === 'help' ) {
      $editorModal.find('.editor-modal-footer-menu-button[data-button-type="close"]').on('click', itaModalClose );
    }
    
    bodyFunc();

}

// モーダルを閉じる
function itaModalClose() {

  const $window = $( window ),
        $container = $('.wholecontainer'),
        $editorModal = $('#editor-modal');
  
  if ( $editorModal.length ) {
    $window.off('keyup.modal');
    $editorModal.remove();
    $container.css('filter','blur(0)');
  }

}

// モーダルエラー表示
function itaModalError( message ) {

  const $modalBody = $('.editor-modal-body');
  
  $modalBody.html('<div class="editor-modal-error"><p>' + message + '</p></div>');

}

////////////////////////////////////////////////////////////////////////////////////////////////////
//
//   タブ切替初期設定
// 
////////////////////////////////////////////////////////////////////////////////////////////////////

function itaTabMenu() {

  $('.editor-tab').each( function() {
  
    const $tab = $( this ),
          $tabItem = $tab.find('.editor-tab-menu-list-item'),
          $tabBody = $tab.find('.editor-tab-body');

    $tabItem.eq(0).addClass('selected');
    $tabBody.eq(0).addClass('selected');
    
    $tabItem.on('click', function() {
      const $clickTab = $( this ),
            $openTab = $('#' + $clickTab.attr('data-tab') );
            
      $tab.find('.selected').removeClass('selected');
      $clickTab.add( $openTab ).addClass('selected');
    });
    
  });

}

const menuEditor = function() {

'use strict';

// jQueryオブジェキャッシュ
const $window = $( window ),
      $html = $('html'),
      $body = $('body'),
      $menuEditor = $('#menu-editor'),
      $menuEditWindow = $('#menu-editor-edit'),
      $menuTable = $menuEditor.find('.menu-table'),
      $property = $('#property');

// タブ
itaTabMenu();

// 読み込み完了
$menuEditor.removeClass('load-editor');

// テキスト
const languageText = {
'0000':[getSomeMessage("ITACREPAR_1202"),''],
'0001':[getSomeMessage("ITACREPAR_1203"),''],
'0002':[getSomeMessage("ITACREPAR_1204"),''],
'0003':[getSomeMessage("ITACREPAR_1205"),''],
'0004':[getSomeMessage("ITACREPAR_1206"),''],
'0005':[getSomeMessage("ITACREPAR_1207"),''],
'0006':[getSomeMessage("ITACREPAR_1208"),''],
'0007':[getSomeMessage("ITACREPAR_1209"),''],
'0008':[getSomeMessage("ITACREPAR_1210"),''],
'0009':[getSomeMessage("ITACREPAR_1211"),''],
'0010':[getSomeMessage("ITACREPAR_1212"),''],
'0011':[getSomeMessage("ITACREPAR_1213"),''],
'0012':[getSomeMessage("ITACREPAR_1214"),''],
'0013':[getSomeMessage("ITACREPAR_1215"),''],
'0014':[getSomeMessage("ITACREPAR_1216"),''],
'0015':[getSomeMessage("ITACREPAR_1217"),''],
'0016':[getSomeMessage("ITACREPAR_1218"),''],
'0017':[getSomeMessage("ITACREPAR_1219"),''],
'0018':[getSomeMessage("ITACREPAR_1220"),''],
'0019':[getSomeMessage("ITACREPAR_1221"),''],
'0020':[getSomeMessage("ITACREPAR_1222"),''],
'0021':[getSomeMessage("ITACREPAR_1223"),''],
'0022':[getSomeMessage("ITACREPAR_1224"),''],
'0023':[getSomeMessage("ITACREPAR_1225"),''],
'0024':[getSomeMessage("ITACREPAR_1226"),''],
'0025':[getSomeMessage("ITACREPAR_1227"),''],
'0026':[getSomeMessage("ITACREPAR_1228"),''],
'0027':[getSomeMessage("ITACREPAR_1229"),''],
'0028':[getSomeMessage("ITACREPAR_1230"),''],
'0029':[getSomeMessage("ITACREPAR_1231"),''],
'0030':[getSomeMessage("ITACREPAR_1232"),''],
'0031':[getSomeMessage("ITACREPAR_1233"),''],
'0032':[getSomeMessage("ITACREPAR_1234"),''],
'0033':[getSomeMessage("ITACREPAR_1235"),''],
'0034':[getSomeMessage("ITACREPAR_1238"),''],
'0035':[getSomeMessage("ITACREPAR_1239"),''],
'0036':[getSomeMessage("ITACREPAR_1240"),''],
'0037':[getSomeMessage("ITACREPAR_1241"),''],
'0038':[getSomeMessage("ITACREPAR_1242"),''],
'0039':[getSomeMessage("ITACREPAR_1243"),''],
'0040':[getSomeMessage("ITACREPAR_1244"),''],
'0041':[getSomeMessage("ITACREPAR_1245"),''],
'0042':[getSomeMessage("ITACREPAR_1246"),'']
}
// テキスト呼び出し用
const textCode = function( code ) {
  return languageText[code][0];
};

// 項目別ダミーテキスト（value:[ja,en,type]）
const selectDummyText = {
  '0' : ['','',''],
  '1' : [getSomeMessage("ITACREPAR_1204"),'','string'],
  '2' : [getSomeMessage("ITACREPAR_1205") +'<br>' + getSomeMessage("ITACREPAR_1205"),'','string'],
  '3' : ['0','0','number'],
  '4' : ['0.0','0.0','number'],
  '5' : ['2020/01/01 00:00','2020/01/01 00:00','string'],
  '6' : ['2020/01/01','2020/01/01','string'],
  '7' : ['','','select'],
<<<<<<< HEAD
  '8' : [getSomeMessage("ITACREPAR_1237"),'','string']
=======
  '8' : [getSomeMessage("ITACREPAR_1237"),'','string'],
  '9' : [getSomeMessage("ITACREPAR_1247"),'','string'],
  '10' : [getSomeMessage("ITACREPAR_1248"),'','string']
>>>>>>> upstream/v1.6.0
};

const titleHeight = 32;

// 各種IDから名称を返す
const listIdName = function( type, id ) {
  let list,idKey,nameKey,name;
  if ( type === 'input') {
    list = menuEditorArray.selectInputMethod;
    idKey = 'INPUT_METHOD_ID';
    nameKey = 'INPUT_METHOD_NAME';
  } else if ( type === 'pulldown') {
    list = menuEditorArray.selectPulldownList;
    idKey = 'LINK_ID';
    nameKey = 'LINK_PULLDOWN';
  } else if ( type === 'target') {
    list = menuEditorArray.selectParamTarget;
    idKey = 'TARGET_ID';
    nameKey = 'TARGET_NAME';
  } else if ( type === 'use') {
    list = menuEditorArray.selectParamPurpose;
    idKey = 'PURPOSE_ID';
    nameKey = 'PURPOSE_NAME';
  } else if ( type === 'group') {
    list = menuEditorArray.selectMenuGroupList;
    idKey = 'MENU_GROUP_ID';
    nameKey = 'MENU_GROUP_NAME';
  } else if ( type === 'role') {
    list = menuEditorArray.roleList;
    idKey = 'ROLE_ID';
    nameKey = 'ROLE_NAME';
  }
  
  const listLength = list.length;
  for ( let i = 0; i < listLength; i++ ) {
    if ( Number( list[i][idKey] ) === Number( id ) ) {
      name = list[i][nameKey];
      return name;
    }
  }
  return null;  
};

let modeDisabled = '';
if ( menuEditorMode === 'view') modeDisabled = ' disabled';

// HTML
const columnHeaderHTML = ''
  + '<div class="menu-column-move"></div>'
  + '<div class="menu-column-title on-hover">'
    + '<input class="menu-column-title-input" type="text" value=""'+modeDisabled+'>'
    + '<span class="menu-column-title-dummy"></span>'
  + '</div>'
  + '<div class="menu-column-function">'
    + '<div class="menu-column-delete on-hover"></div>'
    + '<div class="menu-column-copy on-hover"></div>'
  + '</div>';

const columnEmptyHTML = ''
  + '<div class="column-empty"><p>Empty</p></div>';

const columnGroupHTML = ''
  + '<div class="menu-column-group" data-group-id="">'
    + '<div class="menu-column-group-header">'
      + columnHeaderHTML
    + '</div>'
    + '<div class="menu-column-group-body">'
    + '</div>'
  + '</div>';
  
const columnRepeatHTML = ''
  + '<div class="menu-column-repeat">'
    + '<div class="menu-column-repeat-header">'
      + '<div class="menu-column-move"></div>'
      + '<div class="menu-column-repeat-number on-hover">REPEAT : <input class="menu-column-repeat-number-input" data-min="1" data-max="99" value="2" type="number"'+modeDisabled+'></div>'
    + '</div>'
    + '<div class="menu-column-repeat-body">'
    + '</div>'
    + '<div class="menu-column-repeat-footer">'
      + '<div class="menu-column-function">'
        + '<div class="menu-column-delete"></div>'
      + '</div>'
    + '</div>'
  + '</div>';

// 入力方式 select
const selectInputMethodData = menuEditorArray.selectInputMethod,
      selectInputMethodDataLength = selectInputMethodData.length;
let inputMethodHTML = '';
for ( let i = 0; i < selectInputMethodDataLength ; i++ ) {
  inputMethodHTML += '<option value="' + selectInputMethodData[i].INPUT_METHOD_ID + '">' + selectInputMethodData[i].INPUT_METHOD_NAME + '</option>';
}

// プルダウン選択 select
const selectPulldownListData = menuEditorArray.selectPulldownList,
      selectPulldownListDataLength = selectPulldownListData.length;
let selectPulldownListHTML = '';
for ( let i = 0; i < selectPulldownListDataLength ; i++ ) {
  selectPulldownListHTML += '<option value="' + selectPulldownListData[i].LINK_ID + '">' + selectPulldownListData[i].LINK_PULLDOWN + '</option>';
}

// 作成対象 select
if ( menuEditorMode !== 'view') {
    const selectParamTargetData = menuEditorArray.selectParamTarget,
          selectParamTargetDataLength = selectParamTargetData.length;
    let selectParamTargetHTML = '';
    for ( let i = 0; i < selectParamTargetDataLength ; i++ ) {
      selectParamTargetHTML += '<option value="' + selectParamTargetData[i].TARGET_ID + '">' + selectParamTargetData[i].TARGET_NAME + '</option>';
    }
    $('#create-menu-type').html( selectParamTargetHTML );
}

const columnHTML = ''
  + '<div class="menu-column" data-rowpan="1" data-item-id="" style="min-width: 180px">'
    + '<div class="menu-column-header">'
      + columnHeaderHTML
    + '</div>'
    + '<div class="menu-column-body">'
      + '<div class="menu-column-type">'
        + '<select class="menu-column-type-select"'+modeDisabled+'>' + inputMethodHTML + '</select>'
      + '</div>'
      + '<div class="menu-column-config">'
        + '<table class="menu-column-config-table" date-select-value="1">'
          + '<tr class="multiple single link">'
            + '<th>' + textCode('0011') + '<span class="input_required">*</span></th>'
            + '<td><input class="config-number max-byte" type="number" data-min="2" data-max="8192" value=""'+modeDisabled+'></td>'
          + '</tr>'
          + '<tr class="multiple single">'
            + '<th>' + textCode('0012') + '</th>'
            + '<td><input class="config-text regex" type="text" value=""'+modeDisabled+'></td>'
          + '</tr>'
          + '<tr class="number-int">'
            + '<th>' + textCode('0013') + '</th>'
            + '<td><input class="config-number int-min-number" data-min="-2147483648" data-max="2147483647" type="number" value=""'+modeDisabled+'></td>'
          + '</tr>'
          + '<tr class="number-int">'
            + '<th>' + textCode('0014') + '</th>'
            + '<td><input class="config-number int-max-number" data-min="-2147483648" data-max="2147483647"  type="number" value=""'+modeDisabled+'></td>'
          + '</tr>'
          + '<tr class="number-float">'
            + '<th>' + textCode('0013') + '</th>'
            + '<td><input class="config-number float-min-number" data-min="-99999999999999" data-max="99999999999999"  type="number" value=""'+modeDisabled+'></td>'
          + '</tr>'
          + '<tr class="number-float">'
            + '<th>' + textCode('0014') + '</th>'
            + '<td><input class="config-number float-max-number" data-min="-99999999999999" data-max="99999999999999"  type="number" value=""'+modeDisabled+'></td>'
          + '</tr>'
          + '<tr class="number-float">'
            + '<th>' + textCode('0015') + '</th>'
            + '<td><input class="config-number digit-number" data-min="1" data-max="14" type="number" value=""'+modeDisabled+'></td>'
          + '</tr>'
          + '<tr class="select">'
            + '<th>' + textCode('0016') + '<span class="input_required">*</span></th>'
            + '<td>'
              + '<select class="config-select pulldown-select"'+modeDisabled+'>' + selectPulldownListHTML + '</select>'
            + '</td>'
          + '</tr>'
          + '<tr class="password">'
            + '<th>' + textCode('0011') + '<span class="input_required">*</span></th>'
            + '<td><input class="config-number password-max-byte" type="number" data-min="1" data-max="8192" value=""'+modeDisabled+'></td>'
          + '</tr>'
<<<<<<< HEAD
=======
          + '<tr class="file">'
            + '<th>' + textCode('0042') + '<span class="input_required">*</span></th>'
            + '<td><input class="config-number file-max-size" data-min="1" data-max="4294967296"  type="number" value=""'+modeDisabled+'></td>'
          + '</tr>'
>>>>>>> upstream/v1.6.0
          + '<tr class="all">'
            + '<td colspan="2">'
              + '<label class="required-label on-hover"><input class="config-checkbox required" type="checkbox"'+modeDisabled+'><span></span>' + textCode('0017') + '</label>'
              + '<label class="unique-label on-hover"><input class="config-checkbox unique" type="checkbox"'+modeDisabled+'><span></span>' + textCode('0018') + '</label>'
            + '</td>'
          + '</tr>'
          + '<tr class="all">'
            + '<td colspan="2"><div class="config-textarea-wrapper"><textarea class="config-textarea explanation"'+modeDisabled+'></textarea><span>' + textCode('0019') + '</span></div></td>'
          + '</tr>'
          + '<tr class="all">'
            + '<td colspan="2"><div class="config-textarea-wrapper"><textarea class="config-textarea note"'+modeDisabled+'></textarea><span>' + textCode('0020') + '</span></div></td>'
          + '</tr>'
        + '</table>'
      + '</div>'
    + '</div>'
    + '<div class="column-resize"></div>'
  + '</div>';




// カウンター
let itemCounter = 1,
    groupCounter = 1,
    repeatCounter = 1;

// Hover
const hoverElements = '.on-hover';
$menuTable.on({
  'mouseenter' : function() {
    if ( menuEditorMode !== 'view') $( this ).addClass('hover');
  },
  'mouseleave' : function() {
    if ( menuEditorMode !== 'view') $( this ).removeClass('hover');
  }
}, hoverElements );

const modeChange = function( mode ) {
  if ( mode !== undefined ) {
    $body.attr('data-mode', mode );
    $menuTable.addClass('hover-disabled');
  } else {
    $body.attr('data-mode', '' );
    $menuTable.removeClass('hover-disabled');
  }
}
const mode = {
  blockResize : function() { modeChange('blockResize'); },
  columnResize : function() { modeChange('columnResize'); },
  columnMove : function() { modeChange('columnMove'); },
  clear : function() { modeChange(); }
};
    
////////////////////////////////////////////////////////////////////////////////////////////////////
//
//   取り消し、やり直し
// 
////////////////////////////////////////////////////////////////////////////////////////////////////

const $undoButton = $('#button-undo'),
      $redoButton = $('#button-redo'),
      maxHistroy = 10; // 最大履歴数

let workHistory = [''],
    workCounter = 0;

// 取り消し、やり直しボタンチェック
const historyButtonCheck = function() {
    if ( workHistory[ workCounter - 1 ] !== undefined ) {
      $undoButton.prop('disabled', false );
    } else {
      $undoButton.prop('disabled', true );
    }
    if ( workHistory[ workCounter + 1 ] !== undefined ) {
      $redoButton.prop('disabled', false );
    } else {
      $redoButton.prop('disabled', true );
    }
};

// 履歴管理
const history = {
  'add' : function() {
    workCounter++;
    const $clone = $menuTable.clone();
    $clone.find('.hover').removeClass('hover');
    workHistory[ workCounter ] = $clone.html();

    // 履歴追加後の履歴を削除する
    if ( workHistory[ workCounter + 1 ] !== undefined ) {
      workHistory.length = workCounter + 1;
    } 
    // 最大履歴数を超えた場合最初の履歴を削除する
    if ( workHistory.length > maxHistroy ) {
      workHistory.shift();
      workCounter--;
    }
    
    historyButtonCheck();
  },
  'undo' : function() {
    workCounter--;
    $menuTable.html( workHistory[ workCounter ] );
    historyButtonCheck();
    previewTable();
  },
  'redo' : function() {
    workCounter++;
    $menuTable.html( workHistory[ workCounter ] );
    historyButtonCheck();
    previewTable();
  },
  'clear' : function() {
    workCounter = 0;
    workHistory = [];
    workHistory[ workCounter ] = $menuTable.html();
    historyButtonCheck();
  }
};

////////////////////////////////////////////////////////////////////////////////////////////////////
//
//   列の追加
// 
////////////////////////////////////////////////////////////////////////////////////////////////////

const addColumn = function( $target, type, number, loadData, previewFlag, emptyFlag ) {

  if ( loadData === undefined ) loadData = false;
  if ( previewFlag === undefined ) previewFlag = true;
  if ( emptyFlag === undefined ) emptyFlag = true;

  let html = '',
      id = '',
      title = '',
      name;
  
  switch( type ) {
    case 'item':
      html = columnHTML;
      name = loadData['ITEM_NAME'];
      id = 'i' + number;
      title = textCode('0000');
      break;
    case 'group':
      html = columnGroupHTML;
      name = loadData['COL_GROUP_NAME']
      id = 'g' + number;
      title = textCode('0001');
      break;
    case 'repeat':
      html = columnRepeatHTML;
      id = 'r' + number;
      break;
  }

  const $addColumn = $( html ),
        $addColumnInput = $addColumn.find('.menu-column-title-input');
  
  $target.append( $addColumn );

  
  $addColumn.attr('id', id );

  if ( type !== 'item' && emptyFlag === true ) {
    $addColumn.find('.menu-column-group-body, .menu-column-repeat-body').html( columnEmptyHTML );
  }
  
  if ( loadData === false ) {
    // 自動付加する名前が被ってないかチェックする
    const checkName = function( name ) {
      let nameList = [];
      $menuEditor.find('.menu-column-title-input').each( function( i ){
        nameList[ i ] = $( this ).val();
      });
      const condition = true;
      while( condition ) {
        if ( nameList.indexOf( name ) !== -1 ) {
          number++;
          name = title + ' ' + number;
        } else {
          return name;
        }
      }
    }
    $addColumnInput.val( checkName( title + ' ' + number ) );
  } else {
    $addColumnInput.val( name );
  }
  
  titleInputChange( $addColumnInput );
  columnHeightUpdate();
  
  if ( previewFlag === true ) {
    history.add();
    previewTable();
  }
  
  // 追加した項目に合わせスクロールさせる
  const editorWindowWidth = $menuEditWindow.outerWidth(),
        tableWidth = $menuEditWindow.find('.menu-table-wrapper').width()
  if ( editorWindowWidth < tableWidth ) {
    $menuEditWindow.children().stop(0,0).animate({'scrollLeft': tableWidth - editorWindowWidth }, 200 );
  }
  
  emptyCheck();

};

////////////////////////////////////////////////////////////////////////////////////////////////////
//
//   メニュー
// 
////////////////////////////////////////////////////////////////////////////////////////////////////

$menuEditor.find('.menu-editor-menu-button').on('click', function() {
  const $button = $( this ),
        buttonType = $button.attr('data-menu-button');
  switch ( buttonType ) {
    case 'newColumn':
      addColumn( $menuTable, 'item', itemCounter++ );
      break;
    case 'newColumnGroup':
      addColumn( $menuTable, 'group', groupCounter++ );
      break;
    case 'newColumnRepeat':
      if ( $menuTable.find('.menu-column-repeat').length !== 0 ) return false;
      $button.prop('disabled', true );
      addColumn( $menuTable, 'repeat', repeatCounter );
      break;
    case 'undo':
      history.undo();
      break;
    case 'redo':
      history.redo();
      break;
    case 'registration':
      if ( !window.confirm(getSomeMessage("ITACREPAR_1201") ) ) return false;
      createRegistrationData('registration');
      break;
    case 'update':
      if ( !window.confirm(getSomeMessage("ITACREPAR_1201") ) ) return false;
      createRegistrationData('update');
      break;
    case 'edit':
    case 'reload':
      // 編集モードで開きなおす
      location.href = '/default/menu/01_browse.php?no=2100160011&create_menu_id=' + menuEditorTargetID + '&mode=edit';
      break;
    case 'diversion':
      // 流用新規モードで開きなおす
      location.href = '/default/menu/01_browse.php?no=2100160011&create_menu_id=' + menuEditorTargetID + '&mode=diversion';
      break;
    case 'cancel':
      // 閲覧モードで開きなおす
      location.href = '/default/menu/01_browse.php?no=2100160011&create_menu_id=' + menuEditorTargetID;
      break;
  }
});

////////////////////////////////////////////////////////////////////////////////////////////////////
//
//   タイトル入力幅調整
// 
////////////////////////////////////////////////////////////////////////////////////////////////////

const titleInputChange = function( $input ) {
  const inputValue = $input.val();
  $input.next().text( inputValue );
  const inputWidth = $input.next().outerWidth() + 6;
  $input.attr('value', inputValue ).css('width', inputWidth );
};
$('.menu-column-title-input').each( function(){
  titleInputChange( $(this) );
});
$menuEditor.on({
  'input' : function () {
    if ( $( this ).is('.menu-column-title-input') ) {
      titleInputChange( $( this ) );
    }
  },
  'change' : function() {
    if ( $( this ).is('.menu-column-title-input') ) {
      history.add();
      previewTable();
    }
  },
  'focus' : function() {
    // $(this).focus().select(); Edge対応版
    $( this ).click( function(){
      $( this ).select();
    });
  },
  'blur' : function() {
    getSelection().removeAllRanges();
  },
  'mousedown' : function( e ) {
    e.stopPropagation();
  }
}, '.menu-column-title-input, .menu-column-repeat-number-input');

// input欄外でも選択可能にする
$menuEditor.on({
  'mousedown' : function() {
    if ( menuEditorMode !== 'view') {
      const $input = $( this );
      setTimeout( function(){
        $input.find('.menu-column-title-input, .menu-column-repeat-number-input').focus().select();
      }, 1 );
    }
  }
}, '.menu-column-title, .menu-column-repeat-number');

$menuEditor.on({
  'focus' : function() {
    $( this ).addClass('text-in');
  },
  'blur' : function() {
    if ( $( this ).val() === '' ) {
      $( this ).removeClass('text-in');
    }
  }
}, '.config-textarea');

////////////////////////////////////////////////////////////////////////////////////////////////////
//
//   設定内容をHTMLに反映させる（履歴HTML用）
// 
////////////////////////////////////////////////////////////////////////////////////////////////////

$menuEditor.on('change', '.config-text', function() {
  $( this ).attr('value', $( this ).val() );
  previewTable();
  history.add();
});
$menuEditor.on('change', '.config-number, .menu-column-repeat-number-input', function() {
  const $input = $( this ),
        min = Number( $input.attr('data-min') ),
        max = Number( $input.attr('data-max') );
  let value = $input.val();
  
  if ( min !== undefined && value < min ) value = min;
  if ( max !== undefined && value > max ) value = max;
  
  $input.val( value ).attr('value', value );
  
  previewTable();
  history.add();
});
$menuEditor.on('change', '.config-textarea', function() {
  $( this ).text( $( this ).val() );
  previewTable();
  history.add();
});
$menuEditor.on('change', '.config-checkbox', function() {
  $( this ).attr('checked', $( this ).prop('checked') );
  previewTable();
  history.add();
});
$menuEditor.on('change', '.config-select', function() {
  const $select = $( this ),
        value = $select.val();
  // selectedを削除してからだと画面に反映されない？
  $select.find('option[value="' + value + '"]').attr('selected', 'selected');
  $select.find('option').not('[value="' + value + '"]').attr('selected', false);
  previewTable();
  history.add();
});

////////////////////////////////////////////////////////////////////////////////////////////////////
//
//   項目の種類によって入力項目を切り替える
// 
////////////////////////////////////////////////////////////////////////////////////////////////////

$menuEditor.on('change', '.menu-column-type-select', function() {
  const $select = $( this ),
        $config = $select.closest('.menu-column-type')
          .next('.menu-column-config').find('.menu-column-config-table'),
        value = $select.val();
  $config.attr('date-select-value', value );
  $select.find('option[value="' + value + '"]').attr('selected', true);
  $select.find('option').not('[value="' + value + '"]').attr('selected', false);
  previewTable();
  history.add();
});

////////////////////////////////////////////////////////////////////////////////////////////////////
//
//   項目、グループの移動
// 
////////////////////////////////////////////////////////////////////////////////////////////////////

$menuEditor.on('mousedown', '.menu-column-move', function( e ){

  // 左クリックチェック
  if (e.which !== 1 ) return false;
  
  // 選択を解除しておく
  getSelection().removeAllRanges();
  
  mode.columnMove();
  
  const $column = $( this ).closest('.menu-column, .menu-column-group, .menu-column-repeat'),
        $columnClone = $column.clone( false ),
        $targetArea = $('.menu-column, .menu-column-group-header, .menu-column-repeat-header, .menu-column-repeat-footer, .column-empty'),
        scrollTop = $window.scrollTop(),
        scrollLeft = $window.scrollLeft(),
        knobWidth = $( this ).outerWidth(),
        knobHeight = $( this ).outerHeight(),
        mousedownPositionX = e.pageX,
        mousedownPositionY = e.pageY,
        editorX = $menuEditor.offset().left,
        editorWidth = $menuEditWindow.outerWidth();
  
  // 何を移動するか
  const moveColumnType = $column.attr('class');
  $menuTable.attr('data-move-type', moveColumnType );
        
  // スクロール可能か調べる
  const $scrollArea = $menuEditWindow.find('.menu-editor-block-inner'),
        scrollWidth = $scrollArea.get(0).scrollWidth + 2,
        scrollAreaWidth = $scrollArea.outerWidth(),
        scrollFlag = ( scrollWidth > scrollAreaWidth ) ? true : false,
        scrollSpeed = 40;
        
  let scrollTimer = false;

  const scrollMove = function( direction ) {
    if ( scrollTimer === false ) {
      scrollTimer = setInterval( function() {
        const scrollLeft = $scrollArea.scrollLeft();
        let scrollWidth = ( direction === 'right' ) ? scrollSpeed : -scrollSpeed;
        $scrollArea.stop(0,0).animate({ scrollLeft : scrollLeft + scrollWidth }, 40, 'linear' );
      }, 40 );
    }
  };
  
  let $hoverTarget = null,
      hoverTargetWidth, hoverTargetLeft,
      moveX, moveY;
  
  $column.addClass('move-wait');
  
  // 移動用ダミーオブジェ追加
  $menuEditor.append( $columnClone );
  $columnClone.addClass('move').css({
    'left' : ( mousedownPositionX - scrollLeft - knobWidth / 2 ) + 'px',
    'top' : ( mousedownPositionY - scrollTop - knobHeight / 2 ) + 'px'
  });
  
  // ターゲットの左か右かチェックする
  const leftRightCheck = function( mouseX ) {
    if ( $hoverTarget !== null ) {
      if ( $hoverTarget.parent().is('.menu-column-repeat') ) {
        // リピート
        const $repeatColumn = $hoverTarget.parent('.menu-column-repeat');
        if ( $hoverTarget.is('.menu-column-repeat-header')
             && !$repeatColumn.prev().is( $column ) ) {
          $repeatColumn.addClass('left');
        } else if ( $hoverTarget.is('.menu-column-repeat-footer')
             && !$repeatColumn.next().is( $column ) ) {
          $repeatColumn.addClass('right');
        }
      } else if ( $hoverTarget.is('.column-empty') ) {
        // 空エリアの場合何もしない
        return false;
      } else {
        // その他
        const mousePositionX = mouseX - hoverTargetLeft;
        if ( hoverTargetWidth / 2 > mousePositionX ) {
          $hoverTarget.removeClass('right');
          if ( !$hoverTarget.prev().is( $column ) ) {
            $hoverTarget.addClass('left');
          }
        } else {
          $hoverTarget.removeClass('left');
          if ( !$hoverTarget.next().is( $column ) ) {
            $hoverTarget.addClass('right');
          }
        }
      }
    }
  }
  
  // どこの上にいるか
  $targetArea.on({
    'mouseenter.columnMove' : function( e ){
      e.stopPropagation();
      // 対象情報
      $hoverTarget = $( this );
      hoverTargetWidth = $hoverTarget.outerWidth();
      hoverTargetLeft = scrollLeft + $hoverTarget.offset().left;
      // 対象が自分以外かどうか
      if ( !$hoverTarget.is( $column ) ) {
        if ( $hoverTarget.is('.menu-column-group-header') ) {
          $hoverTarget = $hoverTarget.closest('.menu-column-group');
        }
        $hoverTarget.addClass('hover');
        $hoverTarget.parents('.menu-column-group, .menu-column-repeat-body').eq(0).addClass('hover-parent');
      } else {
        $hoverTarget = null;
      }
      
      leftRightCheck( e.pageX );
    },
    'mouseleave.columnMove' : function(){
      $hoverTarget = null;
      $menuTable.find('.hover, .hover-parent, .left, .right').removeClass('hover hover-parent left right');
    }
  });
  
  let moveTime = '';
  
  $window.on({
    'mousemove.columnMove' : function( e ) {
      // 仮移動
      if ( moveTime === '') {
        moveX = e.pageX - mousedownPositionX;
        moveY = e.pageY - mousedownPositionY;
        $columnClone.css('transform', 'translate(' + moveX + 'px,' + moveY + 'px)');
        leftRightCheck( e.pageX );
      
        // 枠の外に移動
        if ( scrollFlag === true ) {
          if ( editorX > e.pageX ) {
            scrollMove('left');
          } else if ( editorX + editorWidth < e.pageX ) {
            scrollMove('right');
          } else if ( scrollTimer ){
            clearInterval( scrollTimer );
            scrollTimer = false;
          }
        }

        moveTime = setTimeout( function() {
          moveTime = '';
        }, 16.667 );
      }
    },
    'mouseup.columnMove' : function() {
      // 対象があれば移動する
      if ( $hoverTarget !== null ) {
        // 移動した際にグループの中身が空になるか判定
        const $parentGroup = $column.parent().closest('.menu-column-group, .menu-column-repeat');
        let emptyFlag = false;
        if ( $parentGroup.length && $column.siblings().length === 0 ) {
          emptyFlag = true;
        }
        // 移動する or 空のグループに追加
        if ( $hoverTarget.is('.column-empty') ) {
          $hoverTarget.closest('.menu-column-group-body, .menu-column-repeat-body').html('').append( $column );
        } else {
          // 右か左か
          if ( $hoverTarget.parent().is('.menu-column-repeat') ) {
            $hoverTarget = $hoverTarget.closest('.menu-column-repeat');
          }
          if ( $hoverTarget.is('.left') ) {
            $column.insertBefore( $hoverTarget );
          } else if ( $hoverTarget.is('.right') ) {
            $column.insertAfter( $hoverTarget );
          }
        }
        // グループが空ならEmpty追加
        if ( emptyFlag === true ) {
          $parentGroup.find('.menu-column-group-body, .menu-column-repeat-body').html( columnEmptyHTML );
        }
        // 高さ更新
        columnHeightUpdate();
      }
      $column.removeClass('move-wait');
      $columnClone.remove();
      $menuTable.find('.hover, .hover-parent, .left, .right').removeClass('hover hover-parent left right');
      $menuTable.removeAttr('data-move-type', moveColumnType );
      $window.off('mousemove.columnMove mouseup.columnMove');
      $targetArea.off('mouseenter.columnMove mouseleave.columnMove');
      clearInterval( scrollTimer );
      mode.clear();
      // 移動した場合のみ履歴追加
      if ( $hoverTarget !== null ) {
        history.add();
      }
      previewTable();
    }
  });
  
});

////////////////////////////////////////////////////////////////////////////////////////////////////
//
//   項目、グループの削除
// 
////////////////////////////////////////////////////////////////////////////////////////////////////

// 項目が空かチェックする
const emptyCheck = function() {
  const itemLength = $menuTable.find('.menu-column, .menu-column-group, .menu-column-repeat').length;
  if ( itemLength === 0 ) {
    $menuTable.html('<div class="no-set column-empty"><p>Empty</p></div>');
  } else {
    $menuTable.find('.no-set').remove();
  }
};
// リピートがあるかチェックする
const repeatCheck = function() {
  const $repeatButton = $('.menu-editor-menu-button[data-menu-button="newColumnRepeat"]'),
        type = $('#create-menu-type').val();
  // パラメータシートかつ、縦メニュー利用有無チェック
  if ( ( type === '1' || type === '3' ) && $('#create-menu-use-vertical').prop('checked') ) {
    if ( $menuTable.find('.menu-column-repeat').length === 0 ) {
      $repeatButton.prop('disabled', false );
    } else {
      $repeatButton.prop('disabled', true );
    }
  } else {
    $repeatButton.prop('disabled', true );
  }
};

$menuEditor.on('click', '.menu-column-delete', function(){
  const $column = $( this ).closest('.menu-column, .menu-column-group, .menu-column-repeat');
  // 親列グループが空になる場合
  const $parentGroup = $column.parent().closest('.menu-column-group, .menu-column-repeat');
  if ( $parentGroup.length && $column.siblings().length === 0 ) {
    $parentGroup.find('.menu-column-group-body, .menu-column-repeat-body').html( columnEmptyHTML );
  }
  $column.remove();
  
  if ( $menuEditor.find('.menu-column, .menu-column-group, .menu-column-repeat').length ) {
    // 高さ更新
    columnHeightUpdate();
  }
  history.add();
  emptyCheck();
  repeatCheck();
  previewTable();
});

////////////////////////////////////////////////////////////////////////////////////////////////////
//
//   項目、グループの複製
// 
////////////////////////////////////////////////////////////////////////////////////////////////////

$menuEditor.on('click', '.menu-column-copy', function(){
  const $column = $( this ).closest('.menu-column, .menu-column-group');
  
  // リピートを含む要素はコピーできないようにする
  if ( $column.find('.menu-column-repeat').length ) {
    alert(textCode('0035'));
    return false;
  }
  
  const $clone = $column.clone();
  
  // クローン追加
  $column.after( $clone );
  
  // 追加を待つ
  $clone.ready( function() {
    $clone.find('.hover').removeClass('hover');
    
    // IDをプラス
    /*
    $clone.find('.menu-column-repeat').each( function() {
      const r = repeatCounter++;
      $( this ).attr('id', 'r' + r );
    });
    */
    // IDをプラス・名前にコピー番号を追加
    $clone.find('.menu-column-title-input').each( function() {
      const $input = $( this ),
            title = $input.val(),
            $eachColumn = $input.closest('.menu-column, .menu-column-group');
      
      if ( $eachColumn.is('.menu-column') ) {
        const i = itemCounter++;
        $input.val( title + '(' + i + ')' );
        $eachColumn.attr({
          'id': 'i' + i,
          'data-item-id': ''
        });
      } else if ( $eachColumn.is('.menu-column-group') ) {
        const g = groupCounter++;
        $input.val( title + '(' + g + ')' );
        $eachColumn.attr({
          'id': 'g' + g,
          'data-group-id': ''
        });
      }
      $input.attr('value', $input.val() );
      titleInputChange( $input );
    });

    history.add();
    previewTable();
  });
});

////////////////////////////////////////////////////////////////////////////////////////////////////
//
//   行数を調べる
// 
////////////////////////////////////////////////////////////////////////////////////////////////////

const rowNumberCheck = function(){
  let maxLevel = 1;
  $menuTable.find('.menu-column, .column-empty').each( function(){
    const $column = $( this ),
          columnLevel = $column.parents('.menu-column-group').length + 1;
    if ( maxLevel < columnLevel ) maxLevel = columnLevel;
  });
  return maxLevel;
};

////////////////////////////////////////////////////////////////////////////////////////////////////
//
//   列の高さ更新
// 
////////////////////////////////////////////////////////////////////////////////////////////////////

const columnHeightUpdate = function(){

  const maxLevel = rowNumberCheck();
  
  // 列の高さ調整
  $menuTable.find('.menu-column').each( function(){
    const $column = $( this ),
          columnLevel = $column.parents('.menu-column-group').length,
          rowspan = maxLevel - columnLevel;
    $column.attr('data-rowpan', rowspan );
    $column.find('.menu-column-header').css('height', titleHeight * rowspan );
  });
};

////////////////////////////////////////////////////////////////////////////////////////////////////
//
//   リピート数変更
// 
////////////////////////////////////////////////////////////////////////////////////////////////////

$menuTable.on({
  'click' : function() {
    $( this ).addClass()
  }
}, '.menu-column-repeat-number');

////////////////////////////////////////////////////////////////////////////////////////////////////
//
//   プレビュー
// 
////////////////////////////////////////////////////////////////////////////////////////////////////

// プレビュー用HTML
const sortMark = '<span class="sortMarkWrap"><span class="sortNotSelected"></span></span>',
      tHeadHeaderLeftHTML = ''
        + '<th rowspan="{{rowspan}}" class="thSticky left"><span class="generalBold">No</span>' + sortMark + '</th>',
      tHeadParameterHeaderLeftHTML = ''
        + '<th rowspan="{{rowspan}}"><span class="generalBold">' + textCode('0021') + '</span>' + sortMark + '</th>'
        + '<th colspan="4"><span class="generalBold">' + textCode('0022') + '</span></th>'
        + '<th colspan="{{colspan}}"><span class="generalBold">' + textCode('0023') + '</span></th>',
      tHeadOperationrHeaderLeftHTML = ''
        + '<th colspan="4"><span class="generalBold">' + textCode('0022') + '</span></th>'
        + '<th colspan="{{colspan}}"><span class="generalBold">' + textCode('0023') + '</span></th>',  
      tHeadParameterOpeHeaderLeftHTML = ''
        + '<th rowspan="{{rowspan}}"><span class="generalBold">' + textCode('0024') + '</span>' + sortMark + '</th>'
        + '<th rowspan="{{rowspan}}"><span class="generalBold">' + textCode('0025') + '</span>' + sortMark + '</th>'
        + '<th rowspan="{{rowspan}}"><span class="generalBold">' + textCode('0026') + '</span>' + sortMark + '</th>'
        + '<th rowspan="{{rowspan}}"><span class="generalBold">' + textCode('0027') + '</span>' + sortMark + '</th>',
      tHeadHeaderRightHTML = ''
        + '<th rowspan="{{rowspan}}" class="sortTriggerInTbl" ><span class="generalBold">' + textCode('0028') + '</span>' + sortMark + '</th>'
        + '<th rowspan="{{rowspan}}" class="sortTriggerInTbl thSticky right" ><span class="generalBold">' + textCode('0029') + '</span>' + sortMark + '</th>'
        + '<th rowspan="{{rowspan}}" class="sortTriggerInTbl thSticky right"><span class="generalBold">' + textCode('0030') + '</span>' + sortMark + '</th>',
      tBodyHeaderLeftHTML = ''
        + '<td class="likeHeader number">{{id}}</td>',
      tBodyParameterHeaderLeftHTML = ''
        + '<td>192.168.0.1</td>'
        + '<td>' + textCode('0031') + '</td>'
        + '<td>2020/01/01 00:00</td>'
        + '<td>2020/01/01 00:00</td>'
        + '<td></td>',
      tBodyOperationHeaderLeftHTML = ''
        + '<td>' + textCode('0031') + '</td>'
        + '<td>2020/01/01 00:00</td>'
        + '<td>2020/01/01 00:00</td>'
        + '<td></td>',
      tBodyHeaderRightHTML = ''
        + '<td></td>'
        + '<td class="likeHeader">2020/01/01 00:00:00</td>'
        + '<td class="likeHeader">' + textCode('0032') + '</td>';

// リピートを含めた子の列数を返す
const childColumnCount = function( $column ) {
  let counter = $column.find('.menu-column, .column-empty').length;
  $column.find('.menu-column-repeat').each( function() {
    const columnLength = $( this ).find('.menu-column, .column-empty').length;
    if ( columnLength !== 0 ) {
      counter = counter + ( columnLength * ( Number( $( this ).find('.menu-column-repeat-number-input').val() ) - 1 ) );
    }
  });
  return counter;
}

// プレビューを表示する
const previewTable = function(){
  
  let tableArray = [],
      tbodyArray = [],
      tableHTML = '',
      tbodyNumber = 3,
      maxLevel = rowNumberCheck();
  
  // パラメータシート or データシート
<<<<<<< HEAD
  const previewType = Number( $('#create-menu-type').val() );
=======
  const previewType = Number( $property.attr('data-menu-type') );
>>>>>>> upstream/v1.6.0
    
  // エディタ要素をTableに変換
  const tableAnalysis = function( $cols, repeatCount ) {

    // 自分の階層を調べる
    const currentFloor = $cols.children().parents('.menu-column-group').length;
    // 配列がUndefinedなら初期化
    if ( tableArray[ currentFloor ] === undefined ) tableArray[ currentFloor ] = [];
    // 子セルを調べる
    $cols.children().each( function(){
        const $column = $( this );

        if ( $column.is('.menu-column') ) {
          // 項目ここから
            // Head
            const rowspan = $column.attr('data-rowpan');
            let itemHTML = '<th rowspan="' + rowspan + '" class="sortTriggerInTbl">'
                           + textEntities( $column.find('.menu-column-title-input').val() );
            if ( repeatCount > 1 ) {
              itemHTML += '[' + repeatCount + ']';
            }
            itemHTML += sortMark + '</th>';
            tableArray[ currentFloor ].push( itemHTML );
            // Body
            const selectTypeValue = $column.find('.menu-column-type-select').val();
<<<<<<< HEAD
            let dummyText = selectDummyText[ selectTypeValue ][ languageCode ],
=======
            let dummyText = selectDummyText[ selectTypeValue ][ 0 ],
>>>>>>> upstream/v1.6.0
                dummyType = selectDummyText[ selectTypeValue ][ 2 ];
            if ( dummyType === 'select' ) {
              dummyText = $column.find('.config-select').find('option:selected').text();
            }
            tbodyArray.push('<td class="' + dummyType + '">' + dummyText + '</td>');
          // Item end
        } else if ( $column.is('.menu-column-repeat') ) {
          // リピート
            const repeatNumber = $column.find('.menu-column-repeat-number-input').val();
            if ( $column.find('.menu-column, .menu-column-group').length ) {
                for ( let i = 1; i <= repeatNumber; i++ ) {
                  repeatCount = i;
                  tableAnalysis( $column.children('.menu-column-repeat-body'), repeatCount );
                }
                repeatCount = 0;
            } else {
                const rowspan = maxLevel - currentFloor;
                for ( let i = 1; i <= repeatNumber; i++ ) {
                  tableArray[ currentFloor ].push('<th class="empty" rowspan="' + rowspan + '">Empty</th>');
                  tbodyArray.push('<td class="empty">Empty</td>');
                }
            }
          // Repeat end
        } else if ( $column.is('.menu-column-group') ) {
          // グループ
            const colspan = childColumnCount( $column ),
                  groupTitle = textEntities( $column.find('.menu-column-title-input').eq(0).val() ),
                  regexTitle = new RegExp( '<th colspan=".+">' + groupTitle + '<\/th>'),
                  tableArrayLength = tableArray[ currentFloor ].length - 1;
            let groupHTML = '<th colspan="' + colspan + '">' + groupTitle + '</th>';
            if ( repeatCount > 1 && tableArray[ currentFloor ][ tableArrayLength ].match( regexTitle ) ) {
              tableArray[ currentFloor ][ tableArrayLength ] = '<th colspan="' + ( colspan * repeatCount ) + '">' + groupTitle + '</th>';
            } else {
              tableArray[ currentFloor ].push( groupHTML );
            }
            tableAnalysis( $column.children('.menu-column-group-body'), repeatCount );
          // Group end
        } else if ( $column.is('.column-empty') ) {
          // 空
            const rowspan = maxLevel - currentFloor;
            tableArray[ currentFloor ].push('<th class="empty" rowspan="' + rowspan + '">Empty</th>');
            tbodyArray.push('<td>Empty</td>');
          // Empty end
        }

    });
    
  };

  // 解析スタート
  tableAnalysis ( $menuTable, 0 );
  
  // thead HTMLを生成
  const itemLength = childColumnCount( $menuTable );
  
  if ( previewType === 1 || previewType === 3 ) {
    maxLevel++;
    tableArray.unshift('');
  }   
  const tableArrayLength = tableArray.length;
  for ( let i = 0; i < tableArrayLength; i++ ) {
    tableHTML += '<tr class="defaultExplainRow">';
    if ( i === 0 ) {
      tableHTML += tHeadHeaderLeftHTML.replace(/{{rowspan}}/g, maxLevel );
      if ( previewType === 1 ) {
        tableHTML += tHeadParameterHeaderLeftHTML
          .replace(/{{rowspan}}/g, maxLevel )
          .replace(/{{colspan}}/g, itemLength );
      }
      if ( previewType === 3 ) {
        tableHTML += tHeadOperationrHeaderLeftHTML
          .replace(/{{rowspan}}/g, maxLevel )
          .replace(/{{colspan}}/g, itemLength );
      }
    }
    if ( i === 1 && previewType === 1 || i === 1 && previewType === 3 ) {
      tableHTML += tHeadParameterOpeHeaderLeftHTML.replace(/{{rowspan}}/g, maxLevel - 1 );
    }
    tableHTML += tableArray[i];
    if ( i === 0 ) {
      tableHTML += tHeadHeaderRightHTML.replace(/{{rowspan}}/g, maxLevel );
    }
  }
  
  for ( let i = 1; i <= tbodyNumber; i++ ) {
    tableHTML += '<tr>' + tBodyHeaderLeftHTML.replace('{{id}}', i );
    if ( previewType === 1 ) {
      tableHTML += tBodyParameterHeaderLeftHTML;
    }
    if ( previewType === 3 ) {
      tableHTML += tBodyOperationHeaderLeftHTML;
    }
    tableHTML += tbodyArray.join() + tBodyHeaderRightHTML + '</tr>';
  }
  
  // プレビュー更新
  $('#menu-editor-preview').find('tbody').html( tableHTML );
  
}; 

////////////////////////////////////////////////////////////////////////////////////////////////////
//
//   パネル関連
// 
////////////////////////////////////////////////////////////////////////////////////////////////////

// 作成対象セレクト
let beforeSelectType = '1';
$('#create-menu-type').on('change', function(){
  const $select = $( this ),
        menuType = $select.val();
  // データタイプに変更した場合、リピートをチェックする
  if ( menuType === '2') {
    const repeatFlag = repeatRemoveConfirm();
    if ( repeatFlag === true ) {
      history.clear();
    } else if ( repeatFlag === false) {
      // 選択を戻す
      $select.val( beforeSelectType );
      return false; 
    }    
  }
  beforeSelectType = menuType;
  $property.attr('data-menu-type', menuType );
  repeatCheck();
  previewTable();
});

// 縦メニュー利用有無チェックボックス
$('#create-menu-use-vertical').on('change', function(){
  const $checkBox = $( this );
  if ( !$checkBox.prop('checked') ) {
    const repeatFlag = repeatRemoveConfirm();
    if ( repeatFlag === true ) {
      history.clear();
    } else if ( repeatFlag === false ) {
      // チェックしなおす
      $checkBox.prop('checked', true );
      return false;
    }
  }
  repeatCheck();
});

// リピートを解除するか確認する
const repeatRemoveConfirm = function() {
    // リピートを使用しているか？
    const $repeat = $menuEditor.find('.menu-column-repeat').eq(0);
    if ( $repeat.length ) {
      if ( confirm( textCode('0034')) ) {
        // リピートが空か？
        if ( $repeat.children('.menu-column-repeat-body').children('.column-empty').length ) {
          $repeat.remove();
        } else {
          // 中身をリピートと入れ替える
          $repeat.replaceWith( $repeat.children('.menu-column-repeat-body').html() );
        }
        emptyCheck();
        previewTable();
        return true;
      } else {
        return false;
      }
    } else {
      return undefined;
    }
};

////////////////////////////////////////////////////////////////////////////////////////////////////
//
//   項目横幅変更
// 
////////////////////////////////////////////////////////////////////////////////////////////////////

const $columnResizeLine = $('#column-resize'),
      defMinWidth = 180;
$menuEditor.on('mousedown', '.column-resize', function( e ) {
  
  // 左クリックチェック
  if ( e.which !== 1 ) return false;
  
  mode.columnResize();
  
  const $column = $( this ).closest('.menu-column'),
        width = $column.outerWidth(),
        positionX = $column.offset().left - $menuEditor.offset().left - 1,
        mouseDownX = e.pageX;
        
  let minWidth;
  
  $columnResizeLine.show().css({
    'left' : positionX,
    'width' : width
  });
  
  $window.on({
    'mousemove.columnResize' : function( e ) {
      const moveX = e.pageX - mouseDownX;
      minWidth = width + moveX;
      if ( defMinWidth > minWidth ) minWidth = defMinWidth;
      $columnResizeLine.show().css({
        'width' : minWidth
      });
    },
    'mouseup.columnResize' : function() {
      $window.off('mouseup.columnResize mousemove.columnResize');
      mode.clear();
      $columnResizeLine.hide();
      $column.css('min-width', minWidth );
      // サイズが変わったら履歴追加
      if ( width !== $column.outerWidth() ) {
        history.add();
      }
    }
  });

});


////////////////////////////////////////////////////////////////////////////////////////////////////
//
//   エディタウィンドウリサイズ
// 
////////////////////////////////////////////////////////////////////////////////////////////////////

$('#menu-editor-row-resize').on('mousedown', function( e ){

  // 全ての選択を解除する
  getSelection().removeAllRanges();
  mode.blockResize();

  const $resizeBar = $( this ),
        $resizeBlock = $menuEditor.find('.menu-editor-block'),
        $section1 = $resizeBlock.eq(0),
        $section2 = $resizeBlock.eq(1),
        initialPoint = e.clientY,
        minHeight = 64;

  let movePoint = 0,
      newSection1Height = 0;
      
  // 高さを一旦固定値に
  $resizeBlock.each( function(){
    $( this ).css('height', $( this ).outerHeight() );
  });

  const initialSection1Height = newSection1Height = $section1.outerHeight(),
        initialHeight = initialSection1Height + $section2.outerHeight(),
        maxHeight = initialHeight - minHeight;

  $window.on({
    'mousemove.sizeChange' : function( e ){

      movePoint = e.clientY - initialPoint;
      
      newSection1Height = initialSection1Height + movePoint;
      
      if ( newSection1Height < minHeight ) {
        newSection1Height = minHeight;
        movePoint = minHeight - initialSection1Height;
      } else if ( newSection1Height > maxHeight ) {
        newSection1Height = maxHeight;
        movePoint = maxHeight - initialSection1Height;
      }
      
      $section1.css('height', newSection1Height );
      $section2.css('height', initialHeight - newSection1Height );
      $resizeBar.css('transform','translateY(' + movePoint + 'px)');
      
    },

    'mouseup.sizeChange' : function(){
      $window.off('mousemove.sizeChange mouseup.sizeChange');
      mode.clear();

      // 高さを割合に戻す
      const section1Ratio = newSection1Height / initialHeight * 100;
      $section1.css('height', section1Ratio + '%' );
      $section2.css('height', ( 100 - section1Ratio ) + '%' );
      $resizeBar.css({
        'transform' : 'translateY(0)',
        'top' : section1Ratio + '%'
      });

    }
  });   

});

////////////////////////////////////////////////////////////////////////////////////////////////////
//
//  メニューグループ選択
// 
////////////////////////////////////////////////////////////////////////////////////////////////////

const menuGroupBody = function() {

  const menuGroupData = menuEditorArray.selectMenuGroupList,
        menuListRowLength = menuGroupData.length,
        menuGroupType = ['for-input','for-substitution','for-reference'],
        menuGroupAbbreviation = [textCode('0036'),textCode('0037'),textCode('0038')],
        menuGroupTypeLength = menuGroupType.length;

  let html = ''
  + '<div id="menu-group-list" class="modal-table-wrap">'
    + '<table class="modal-table">'
      + '<thead>'
        + '<tr>';

  // header Radio
  for ( let i = 0; i < menuGroupTypeLength; i++ ) {
    html += '<th class="radio ' + menuGroupType[i] + '" checked>' + menuGroupAbbreviation[i] + '</th>' 
  }
  // header Title
  html += '<th class="id">ID</th>'
        + '<th class="name">' + textCode('0039') + '</th>';

  html += '</tr></thead><tbody><tr>';

  // Unselected Radio
  for ( let i = 0; i < menuGroupTypeLength; i++ ) {
    const radioID = 'radio-' + menuGroupType[i] + '-0';
    html += ''
    + '<th class="radio ' + menuGroupType[i] + '">'
      + '<span class="menu-group-radio">'
        + '<input type="radio" class="select-menu radio-number-0" id="' + radioID + '" name="' + menuGroupType[i] + '" value="unselected" data-name="unselected" checked>' 
        + '<label class="select-menu-label" for="' + radioID + '"></label>'
      + '</span>'
    + '</th>' 
  }

  html += '<td class="unselected" >-</td>'
        + '<td class="unselected" >Unselected</td></tr>';

  // body List
  for ( let i = 0; i < menuListRowLength; i++ ) {
    html += '<tr>';
    // body Radio
    for ( let j = 0; j < menuGroupTypeLength; j++ ) {
      const radioClass = 'select-menu radio-number-' + menuGroupData[i]['MENU_GROUP_ID'],
            radioID = 'radio-' + menuGroupType[j] + '-' + menuGroupData[i]['MENU_GROUP_ID'];
      html += ''
      + '<th class="radio ' + menuGroupType[j] + '">'
        + '<span class="menu-group-radio">'
          + '<input type="radio" class="' + radioClass +'" id="' + radioID + '" name="' + menuGroupType[j] + '" value="' + menuGroupData[i]['MENU_GROUP_ID'] + '" data-name="' + menuGroupData[i]['MENU_GROUP_NAME'] + '">'
          + '<label class="select-menu-label" for="' + radioID + '"></label>'
        + '</span>'
      + '</th>' 
    }
    // Menu group Data
    html += '<td class="id">' + menuGroupData[i]['MENU_GROUP_ID'] + '</td>'
          + '<td class="name">' + textEntities( menuGroupData[i]['MENU_GROUP_NAME'] ) + '</td>';

    html += '</tr>';      
  }

  html += '</tbody></table></div>'

  // モーダルにBodyをセット
  const $modalBody = $('.editor-modal-body');
  $modalBody.html( html ).on('change', '.select-menu', function(){
    const $input = $( this ),
          menuID = $input.attr('value'),
          neme = $input.attr('name'),
          checkClass = 'checked-row checked-' + neme;
    $('.checked-' + neme ).removeClass( checkClass )
      .find('.select-menu').prop('disabled', false );

    if ( menuID !== 'unselected' ) {
      $('.radio-number-' + menuID ).closest('tr').addClass( checkClass )
        .find('.select-menu').not(':checked').prop('disabled', true );
    }
  });

  // 選択状態をRadioボタンに反映する
  $('#menu-group').find('.property-span:visible').each( function(){
    const $item = $( this ),
          type = $item.attr('id').replace('create-menu-',''),
          id = $item.attr('data-id');
    if ( id !== '' ) {
      $modalBody.find('input[name="' + type + '"]').filter('[value="' + id + '"]').prop('checked', true).change();
    }
  });    

  // 決定・取り消しボタン
  const $modalButton = $('.editor-modal-footer-menu-button');
  $modalButton.on('click', function() {
    const $button = $( this ),
          type = $button.attr('data-button-type');
    switch( type ) {
      case 'ok':
        // チェック状態を対象メニューグループ選択に反映する
        $('.select-menu:checked').each( function() {
          const $checked = $( this ),
                checkedType = $checked.attr('name');
          let checkedID = $checked.val(),
              checkedName = $checked.attr('data-name');
          if ( checkedID === 'unselected'){
            checkedID = checkedName = ''
          }
          $('#create-menu-' + $checked.attr('name') ).text( checkedName ).attr({
            'data-id' :  checkedID,
            'data-value' : checkedName
          });
          // 縦メニュー値があるか確認
          if ( checkedType === 'vertical' ) {
            if ( checkedID !== '') {
              $property.attr('data-vertical-menu', true );
            } else {
              $property.attr('data-vertical-menu', false );
            }
          }
        });
        itaModalClose();
        break;
      case 'cancel':
        itaModalClose();
        break;
    }
  });

};

// 対象メニューグループ モーダルを開く
const $menuGroupSlectButton = $('#create-menu-group-select');
$menuGroupSlectButton.on('click', function() {
  let type;
  // パラメータシートorデータシート
  if ( $('#create-menu-type').val() === '1' || $('#create-menu-type').val() === '3' ) {
    type = 'parameter-sheet';
  } else {
    type = 'data-sheet';
  }
  itaModalOpen( textCode('0033'), menuGroupBody, type );
});

// 縦メニューヘルプ
const verticalMenuHelp = function() {
  const $modalBody = $('.editor-modal-body');
  $modalBody.html( $('#vertical-menu-description').html() );
};
$('#vertical-menu-help').on('click', function() {
  itaModalOpen( textCode('0040'), verticalMenuHelp, 'help');
});

// カンマ区切りロールIDリストからロールNAMEリストを返す
const getRoleListIdToName = function( roleListText ) {
  if ( roleListText !== undefined ) {
    const roleList = roleListText.split(','),
          roleListLength = roleList.length,
          roleNameList = new Array;

    for ( let i = 0; i < roleListLength; i++ ) {
      const roleName = listIdName('role', roleList[i]);
      if ( roleName !== undefined ) {
        roleNameList.push( roleName );
      }
    }

    return roleNameList.join(', ');
  }
};
// ロールセレクト
const modalRoleList = function() {
  const $input = $('#permission-role-name-list');
  const initRoleList = ( $input.attr('data-role-id') === undefined )? '': $input.attr('data-role-id');
  // 決定時の処理    
  const okEvent = function( newRoleList ) {
    $input.text(　getRoleListIdToName( newRoleList ) ).attr('data-role-id', newRoleList );
    itaModalClose();
  };
  // キャンセル時の処理    
  const cancelEvent = function( newRoleList ) {
    itaModalClose();
  };
  
  setRoleSelectModalBody( menuEditorArray.roleList, initRoleList, okEvent, cancelEvent );
  
};
// ロールセレクトモーダルを開く
const $roleSlectButton = $('#permission-role-select');
$roleSlectButton.on('click', function() {
  itaModalOpen('Permission role select', modalRoleList, 'role');
});

////////////////////////////////////////////////////////////////////////////////////////////////////
//
//  登録情報作成
// 
////////////////////////////////////////////////////////////////////////////////////////////////////
const createRegistrationData = function( type ){

  // Emptyが一つでもある場合は終了
  if ( $menuTable.find('.column-empty').length ) {
    alert('Empty error.');
    return false;
  }

  let createMenuJSON = {
    'menu' : {},
    'group' : {},
    'item' : {},
    'repeat' : {}
  };
  
  // Order用カウンター
  let itemCount = 0;
  
  // メニュー作成情報
  createMenuJSON['menu'] = getPanelParameter();
  if ( menuEditorMode === 'edit' ) {
    createMenuJSON['menu']['LAST_UPDATE_TIMESTAMP'] = menuEditorArray.selectMenuInfo['menu']['LAST_UPDATE_TIMESTAMP'];
  }
  
  // CREATE_ITEM_IDからKEYを返す
  const CREATE_ITEM_ID_to_KEY = function( itemID ) {
    for ( let key in menuEditorArray.selectMenuInfo['item'] ) {
      if ( menuEditorArray.selectMenuInfo['item'][ key ]['CREATE_ITEM_ID'] === itemID ) {
        return menuEditorArray.selectMenuInfo['item'][ key ]['ITEM_NAME'];
      }
    }
  }
  // リピート項目チェック（名前からCREATE_ITEM_IDとLAST_UPDATE_TIMESTAMPを返す）
  const repeatItemCheckID = function( itemName ) {
    for ( let key in menuEditorArray.selectMenuInfo['item'] ) {
      if ( menuEditorArray.selectMenuInfo['item'][ key ]['ITEM_NAME'] === itemName ) {
        // リピートで作成された項目かチェック
        if ( menuEditorArray.selectMenuInfo['item'][ key ]['REPEAT_ITEM'] === true ) {
          return [
            menuEditorArray.selectMenuInfo['item'][ key ]['CREATE_ITEM_ID'],
            menuEditorArray.selectMenuInfo['item'][ key ]['LAST_UPDATE_TIMESTAMP']
          ];
        }
      }
    }
    // 見つからない場合はnullを返す
    return [ null, null ];
  }
  // COL_GROUP_IDからKEYを返す
  const COL_GROUP_ID_to_KEY = function( groupID ) {
    for ( let key in menuEditorArray.selectMenuInfo['group'] ) {
      if ( menuEditorArray.selectMenuInfo['group'][ key ]['COL_GROUP_ID'] === groupID ) {
        return menuEditorArray.selectMenuInfo['group'][ key ]['COL_GROUP_NAME'];
      }
    }
  }
  // リピート項目チェック（名前からCREATE_ITEM_IDとLAST_UPDATE_TIMESTAMPを返す）
  const repeatGroupCheckID = function( groupName ) {
    for ( let key in menuEditorArray.selectMenuInfo['group'] ) {
      if ( menuEditorArray.selectMenuInfo['group'][ key ]['COL_GROUP_NAME'] === groupName ) {
        // リピートで作成された項目かチェック
        if ( menuEditorArray.selectMenuInfo['group'][ key ]['REPEAT_GROUP'] === true ) {
          return menuEditorArray.selectMenuInfo['group'][ key ]['COL_GROUP_ID'];
        }
      }
    }
    // 見つからない場合はnullを返す
    return [ null, null ];
  }
  
  const tableAnalysis = function( $cols, repeatCount ) {
    
    // 子セルを調べる
    $cols.children().each( function(){
      const $column = $( this );
      
      if ( $column.is('.menu-column') ) {
          // 項目ここから
            const order = itemCount++,
                  selectTypeValue = $column.find('.menu-column-type-select').val();
            let key = $column.attr('id'),
                repeatFlag = false,
                CREATE_ITEM_ID = $column.attr('data-item-id'),
                LAST_UPDATE_TIMESTAMP = null;

            if ( CREATE_ITEM_ID === '') CREATE_ITEM_ID = null;
            if ( menuEditorMode === 'edit' ) {
              if ( menuEditorArray.selectMenuInfo['item'][key] ) {
                LAST_UPDATE_TIMESTAMP = menuEditorArray.selectMenuInfo['item'][key]['LAST_UPDATE_TIMESTAMP'];
              }
            }
            // 項目名
            let itemName = $column.find('.menu-column-title-input').val();
            if ( repeatCount > 1 ) {
              itemName += '[' + repeatCount + ']';
              repeatFlag = true;
              key = key + '[' + repeatCount + ']';

              // 更新時のリピート項目チェック
              if ( menuEditorMode === 'edit' ) {
                const originalBeforeName = CREATE_ITEM_ID_to_KEY( CREATE_ITEM_ID ),
                      repeatItemData = repeatItemCheckID( originalBeforeName + '[' + repeatCount + ']');
                CREATE_ITEM_ID = repeatItemData[0];
                LAST_UPDATE_TIMESTAMP = repeatItemData[1];
              }

            }
            // 親カラムグループ
            let parents = '',
                parentArray = [];
            $column.parents('.menu-column-group').each( function() {
              parentArray.unshift( $( this ).find('.menu-column-title-input').val() );
            });
            parents = parentArray.join('/');
            // JSONデータ
            createMenuJSON['item'][key] = {
              'CREATE_ITEM_ID' : CREATE_ITEM_ID,
              'MENU_NAME' : createMenuJSON['menu']['MENU_NAME'],
              'ITEM_NAME' : itemName,
              'DISP_SEQ' : order,
              'REQUIRED' : $column.find('.required').prop('checked'),
              'UNIQUED' : $column.find('.unique').prop('checked'),
              'COL_GROUP_ID' : parents,
              'INPUT_METHOD_ID' : selectTypeValue,
              'DESCRIPTION' : $column.find('.explanation').val(),
              'NOTE' : $column.find('.note').val(),
              'REPEAT_ITEM' : repeatFlag,
              'MIN_WIDTH' : $column.css('min-width'),
              'LAST_UPDATE_TIMESTAMP' : LAST_UPDATE_TIMESTAMP
            }
            // 項目タイプ
            switch ( selectTypeValue ) {
              case '1':
                createMenuJSON['item'][key]['MAX_LENGTH'] = $column.find('.max-byte').val();
                createMenuJSON['item'][key]['PREG_MATCH'] = $column.find('.regex').val();
                break;
              case '2':
                createMenuJSON['item'][key]['MULTI_MAX_LENGTH'] = $column.find('.max-byte').val();
                createMenuJSON['item'][key]['MULTI_PREG_MATCH'] = $column.find('.regex').val();
                break;
              case '3':
                createMenuJSON['item'][key]['INT_MIN'] = $column.find('.int-min-number').val();
                createMenuJSON['item'][key]['INT_MAX'] = $column.find('.int-max-number').val();
                break;
              case '4':
                createMenuJSON['item'][key]['FLOAT_MIN'] = $column.find('.float-min-number').val();
                createMenuJSON['item'][key]['FLOAT_MAX'] = $column.find('.float-max-number').val();
<<<<<<< HEAD
                createMenuJSON['item'][key]['FLOAT_DIGIT'] = $column.find('.digit').val();
=======
                createMenuJSON['item'][key]['FLOAT_DIGIT'] = $column.find('.digit-number').val();
>>>>>>> upstream/v1.6.0
                break;
              case '7':
                createMenuJSON['item'][key]['OTHER_MENU_LINK_ID'] = $column.find('.pulldown-select').val();
                break;
              case '8':
                createMenuJSON['item'][key]['PW_MAX_LENGTH'] = $column.find('.password-max-byte').val();
                break;
<<<<<<< HEAD
=======
              case '9':
                createMenuJSON['item'][key]['UPLOAD_MAX_SIZE'] = $column.find('.file-max-size').val();
                break;
              case '10':
                createMenuJSON['item'][key]['LINK_LENGTH'] = $column.find('.max-byte').val();
                break;
>>>>>>> upstream/v1.6.0
            }
          // Item end
        } else if ( $column.is('.menu-column-repeat') ) {
          // リピート
            const repeatNumber = $column.find('.menu-column-repeat-number-input').val();
            if ( $column.find('.menu-column, .menu-column-group').length ) {
                // リピートの回数繰り返す
                for ( let i = 1; i <= repeatNumber; i++ ) {
                  repeatCount = i;
                  tableAnalysis( $column.children('.menu-column-repeat-body'), repeatCount );
                }
                repeatCount = 0;
                // リピート内項目リスト
                let columns = [];
                $column.children('.menu-column-repeat-body').children().each( function() {
                  columns.push( $( this ).attr('id') );
                });
                // リピートJSON
                createMenuJSON['repeat']['r1'] = {
                  'COLUMNS' : columns,
                  'REPEAT_CNT' : repeatNumber
                }
                if ( menuEditorMode === 'edit' ) {
                  if ( menuEditorArray.selectMenuInfo['repeat']['r1'] && menuEditorArray.selectMenuInfo['repeat']['r1']['LAST_UPDATE_TIMESTAMP'] ) {
                    createMenuJSON['repeat']['LAST_UPDATE_TIMESTAMP'] = menuEditorArray.selectMenuInfo['repeat']['r1']['LAST_UPDATE_TIMESTAMP'];
                  }
                }
            }
          // Repeat end
        } else if ( $column.is('.menu-column-group') ) {
          // グループ
            let groupID = $column.attr('data-group-id'),
                groupName = $column.find('.menu-column-title-input').val(),
                key = $column.attr('id'),
                parents = '',
                parentArray = [],
                columns = [],
                repeatFlag = false;
             // グループ名
            if ( repeatCount > 1 ) {
              groupName += '[' + repeatCount + ']';
              repeatFlag = true;
              key = key + '[' + repeatCount + ']';

              // 更新時のリピート項目チェック
              if ( menuEditorMode === 'edit' ) {
                const originalBeforeName = COL_GROUP_ID_to_KEY( groupID ),
                      repeatGroupID = repeatGroupCheckID( originalBeforeName + '[' + repeatCount + ']');
                groupID = repeatGroupID;
              }

            }
            // 親グループ
            $column.parents('.menu-column-group').each( function() {
              parentArray.unshift( $( this ).find('.menu-column-title-input').val() );
            });
            parents = parentArray.join('/');
            // グループ内項目リスト
            $column.children('.menu-column-group-body').children().each( function() {
              columns.push( $( this ).attr('id') );
            });
            // グループJSON
            createMenuJSON['group'][key] = {
              'COL_GROUP_ID' : groupID,
              'COL_GROUP_NAME' : groupName,
              'PARENT' : parents,
              'COLUMNS' : columns,
              'REPEAT_GROUP' : repeatFlag,
            }
            tableAnalysis( $column.children('.menu-column-group-body'), repeatCount );
          // Group end
        }     

    });

  };
    
  // トップ階層のカラム情報
  let topColumns = [];
  $menuTable.children().each( function() {
    topColumns.push( $( this ).attr('id') );
  });
  createMenuJSON['menu']['columns'] = topColumns;

  // 解析スタート
  tableAnalysis ( $menuTable, 0 );
  
  // JSON変換
  const menuData = JSON.stringify( createMenuJSON );

  if ( type === 'registration' ) {
    registerTable(menuData);
  } else if ( type === 'update' ) {
    updateTable(menuData);
  }

};

////////////////////////////////////////////////////////////////////////////////////////////////////
//
//   再表示
// 
////////////////////////////////////////////////////////////////////////////////////////////////////

const loadMenu = function() {
    
    const loadJSON = menuEditorArray.selectMenuInfo;
<<<<<<< HEAD
    
    // メニュー名、表示順序、説明、備考は、流用新規時に空白にする
=======
    // 流用新規時に引き継がない項目
>>>>>>> upstream/v1.6.0
    if ( menuEditorMode === 'diversion' ){
      loadJSON['menu']['CREATE_MENU_ID'] = null;
      loadJSON['menu']['MENU_NAME'] = null;
      loadJSON['menu']['DISP_SEQ'] = null;
      loadJSON['menu']['LAST_UPDATE_TIMESTAMP'] = null;
      loadJSON['menu']['LAST_UPDATE_TIMESTAMP_FOR_DISPLAY'] = null;
      loadJSON['menu']['LAST_UPDATE_USER'] = null;
      loadJSON['menu']['DESCRIPTION'] = null;
      loadJSON['menu']['NOTE'] = null;
    }

    // パネル情報表示
    setPanelParameter( loadJSON );
    
    // エディタクリア
    $menuTable.html('');
    
    // エディタ表示
    const recursionMenuTable = function( $target, column ) {
      
      let columns = ('columns' in column )? 'columns' : 'COLUMNS';
      
      const length = column[ columns ].length;

      for ( let i = 0; i < length; i++ ) {

        const id = column[ columns ][i],
              type = id.substr(0,1),
              number = id.substr(1);

        if ( type === 'g' ) {
          // グループ
          addColumn( $target, 'group', number, loadJSON['group'][id], false, false );
          const groupData = loadJSON['group'][id],
                $group = $('#' + id );
          
          $group.attr('data-group-id', groupData['COL_GROUP_ID'] );
          
          recursionMenuTable( $group.children('.menu-column-group-body'), groupData );
          
        } else if ( type === 'r' ) {
          // リピート
          addColumn( $target, 'repeat', number, loadJSON['repeat'][id], false, false );
          const repeatData = loadJSON['repeat'][id],
                $repeat = $('#' + id );
          
          $repeat.find('.menu-column-repeat-number-input').val( repeatData['REPEAT_CNT'] ).change();
          
          recursionMenuTable( $repeat.children('.menu-column-repeat-body'), repeatData );
          
        } else {
          // 項目
          addColumn( $target, 'item', number, loadJSON['item'][id], false );
          const itemData = loadJSON['item'][id],
                $item = $('#' + id );        

          $item.css('min-width', itemData['min-width'] );

          $item.attr('data-item-id', itemData['CREATE_ITEM_ID'] );
          $item.find('.menu-column-type-select').val( itemData['INPUT_METHOD_ID'] ).change();
          $item.find('.required').prop('checked', itemData['REQUIRED'] ).change();
          $item.find('.unique').prop('checked', itemData['UNIQUED'] ).change();
          
          let descriptionText = itemData['DESCRIPTION'] === null ? '' : itemData['DESCRIPTION'];
          let noteText = itemData['NOTE'] === null ? '' : itemData['NOTE'];
          
          $item.find('.explanation').val( descriptionText ).change();
          if ( descriptionText !== '' ) $item.find('.explanation').addClass('text-in');
          $item.find('.note').val( noteText ).change();
          if ( noteText !== '' ) $item.find('.note').addClass('text-in');

          switch ( itemData['INPUT_METHOD_ID'] ) {
            case '1':
              $item.find('.max-byte').val( itemData['MAX_LENGTH'] ).change();
              $item.find('.regex').val( itemData['PREG_MATCH'] ).change();
              break;
            case '2':
              $item.find('.max-byte').val( itemData['MULTI_MAX_LENGTH'] ).change();
              $item.find('.regex').val( itemData['MULTI_PREG_MATCH'] ).change();
              break;
            case '3':
              $item.find('.int-min-number').val( itemData['INT_MIN'] ).change();
              $item.find('.int-max-number').val( itemData['INT_MAX'] ).change();
              break;
            case '4':
              $item.find('.float-min-number').val( itemData['FLOAT_MIN'] ).change();
              $item.find('.float-max-number').val( itemData['FLOAT_MAX'] ).change();
              $item.find('.digit-number').val( itemData['FLOAT_DIGIT'] ).change();
              break;
            case '7':
              $item.find('.pulldown-select').val( itemData['OTHER_MENU_LINK_ID'] ).change();
              break;
            case '8':
              $item.find('.password-max-byte').val( itemData['PW_MAX_LENGTH'] ).change();
              break;
<<<<<<< HEAD
=======
            case '9':
              $item.find('.file-max-size').val( itemData['UPLOAD_MAX_SIZE'] ).change();
              break;
            case '10':
              $item.find('.max-byte').val( itemData['LINK_LENGTH'] ).change();
              break;
>>>>>>> upstream/v1.6.0
          }
        }

      }
    };
    recursionMenuTable( $menuTable, loadJSON['menu'] );

    history.clear();
    emptyCheck();
    previewTable();

};

////////////////////////////////////////////////////////////////////////////////////////////////////
//
//   メニューデータ取得・セット
// 
////////////////////////////////////////////////////////////////////////////////////////////////////

const getPanelParameter = function() {
// 入力値を取得する
    const parameterArray = {};
    
    parameterArray['CREATE_MENU_ID'] = $('#create-menu-id').attr('data-value'); // 項番
    parameterArray['MENU_NAME'] = $('#create-menu-name').val(); // メニュー名
    parameterArray['TARGET'] = $('#create-menu-type').val(); // 作成対象
    parameterArray['DISP_SEQ'] = $('#create-menu-order').val(); // 表示順序
    parameterArray['LAST_UPDATE_TIMESTAMP_FOR_DISPLAY'] = $('#create-menu-last-modified').attr('data-value'); // 最終更新日時
    parameterArray['LAST_UPDATE_USER'] = $('#create-last-update-user').attr('data-value'); // 最終更新者
    parameterArray['DESCRIPTION'] = $('#create-menu-explanation').val(); // 説明
    parameterArray['ACCESS_AUTH'] = $('#permission-role-name-list').attr('data-role-id'); // ロール
    parameterArray['NOTE'] = $('#create-menu-note').val(); // 備考
    
    // 作成対象別項目
    const type = parameterArray['TARGET'];
    if ( type === '1' || type === '3') {
      // パラメータシート
        if ( type === '1' ) {
          // ホストグループ利用有無
          const hostgroup = $('#create-menu-use-host-group').prop('checked');
          if ( hostgroup ) {
            parameterArray['PURPOSE'] = menuEditorArray.selectParamPurpose[1]['PURPOSE_ID'];
          } else {
            parameterArray['PURPOSE'] = menuEditorArray.selectParamPurpose[0]['PURPOSE_ID'];
          }
        } else {
          parameterArray['PURPOSE'] = null;
        }
        // 縦メニュー利用有無
        const vertical = $('#create-menu-use-vertical').prop('checked');
        if ( vertical ) {
          parameterArray['VERTICAL'] = '1';
        } else {
          parameterArray['VERTICAL'] = null;
        }
        parameterArray['MENUGROUP_FOR_INPUT'] = $('#create-menu-for-input').attr('data-id'); // 入力用
        parameterArray['MENUGROUP_FOR_SUBST'] = $('#create-menu-for-substitution').attr('data-id'); // 代入値
        parameterArray['MENUGROUP_FOR_VIEW'] = $('#create-menu-for-reference').attr('data-id'); // 参照用
    } else if ( type === '2') {
      // データシート
        parameterArray['PURPOSE'] = null;
        parameterArray['MENUGROUP_FOR_INPUT'] = $('#create-menu-for-input').attr('data-id'); // 入力用
    }
    // undefined, ''をnullに
    for ( let key in parameterArray ) {
      if ( parameterArray[key] === undefined || parameterArray[key] === '') {
        parameterArray[key] = null;
      }
    }
    parameterArray['number-item'] = itemCounter;
    parameterArray['number-group'] = groupCounter;
    
    return parameterArray;
};

const setPanelParameter = function( setData ) {
  // nullを空白に
  for ( let key in setData['menu'] ) {
    if ( setData['menu'][key] === null ) {
      setData['menu'][key] = '';
    }
  }
  // パネルに値をセットする
    const type = setData['menu']['TARGET'];
    $property.attr('data-menu-type', type );  
    
    if ( menuEditorMode !== 'diversion' ){
      // 項番
      $('#create-menu-id')
        .attr('data-value', setData['menu']['CREATE_MENU_ID'] )
        .text( setData['menu']['CREATE_MENU_ID'] );
      // 最終更新日時
      $('#create-menu-last-modified')
        .attr('data-value', setData['menu']['LAST_UPDATE_TIMESTAMP_FOR_DISPLAY'] )
        .text( setData['menu']['LAST_UPDATE_TIMESTAMP_FOR_DISPLAY'] );
      // 最終更新者
      $('#create-last-update-user')
        .attr('data-value', setData['menu']['LAST_UPDATE_USER'] )
        .text( setData['menu']['LAST_UPDATE_USER'] );
      // ロール
      const roleList = ( setData['menu']['ACCESS_AUTH'] === undefined )? '': setData['menu']['ACCESS_AUTH'];
      $('#permission-role-name-list')
        .attr('data-role-id', roleList )
        .text( getRoleListIdToName( roleList ) );
    }
    
    // エディットモード別
    if ( menuEditorMode === 'view') {
      $('#create-menu-name').text( setData['menu']['MENU_NAME'] ); // メニュー名
      $('#create-menu-type').text( listIdName('target', setData['menu']['TARGET'] )); // 作成対象
      $('#create-menu-order').text( setData['menu']['DISP_SEQ'] ); // 表示順序
      $('#create-menu-explanation').text( setData['menu']['DESCRIPTION'] );  // 説明
      $('#create-menu-note').text( setData['menu']['NOTE'] ); // 備考
    } else {
      $('#create-menu-name').val( setData['menu']['MENU_NAME'] ); // メニュー名
      $('#create-menu-type').val( setData['menu']['TARGET'] ); // 作成対象
      $('#create-menu-order').val( setData['menu']['DISP_SEQ'] ); // 表示順序
      $('#create-menu-explanation').val( setData['menu']['DESCRIPTION'] );  // 説明
      $('#create-menu-note').val( setData['menu']['NOTE'] ); // 備考
    } 
  
    // 作成対象項目別
    if ( type === '1' || type === '3') {
      // パラメータシート
        if ( type === '1') {
          // ホストグループ利用有無
          if ( setData['menu']['PURPOSE'] === '2' ) {
            if ( menuEditorMode === 'view') {
              $('#create-menu-use-host-group').text(textCode('0041'));
            } else {
              $('#create-menu-use-host-group').prop('checked', true );
            }
          }
        }
        // 縦メニュー利用有無
        if ( setData['menu']['VERTICAL'] === '1') {
          if ( menuEditorMode === 'view') {
            $('#create-menu-use-vertical').text(textCode('0041'));
          } else {
            $('#create-menu-use-vertical').prop('checked', true );
          }
        }
        // 入力用
        $('#create-menu-for-input')
          .attr('data-id', setData['menu']['MENUGROUP_FOR_INPUT'] )
          .text( listIdName( 'group', setData['menu']['MENUGROUP_FOR_INPUT'] ));
        // 代入値自動登録用
        $('#create-menu-for-substitution')
          .attr('data-id', setData['menu']['MENUGROUP_FOR_SUBST'] )
          .text( listIdName( 'group', setData['menu']['MENUGROUP_FOR_SUBST'] ));
        // 参照用
        $('#create-menu-for-reference')
          .attr('data-id', setData['menu']['MENUGROUP_FOR_VIEW'] )
          .text( listIdName( 'group', setData['menu']['MENUGROUP_FOR_VIEW'] ));
    } else if ( type === '2') {
      // データシート
        // 入力用
        $('#create-menu-for-input')
          .attr('data-id', setData['menu']['MENUGROUP_FOR_INPUT'] )
          .text( listIdName( 'group', setData['menu']['MENUGROUP_FOR_INPUT'] ));
    }

    itemCounter = setData['menu']['number-item'] + 1;
    groupCounter = setData['menu']['number-group'] + 1;
    repeatCounter = 1;
};

////////////////////////////////////////////////////////////////////////////////////////////////////
//
//   初期表示
// 
////////////////////////////////////////////////////////////////////////////////////////////////////

// メニューグループ初期値
const initialMenuGroup = function() {

  const forInputID = '2100011610', // 入力用
        forSubstitutionID = '2100011611', // 代入値自動登録用
        forReference = '2100011612', // 参照用
        forInputName = listIdName( 'group', forInputID ),
        forSubstitutionName = listIdName( 'group', forSubstitutionID ),
        forReferenceName = listIdName( 'group', forReference );
  
  // 入力用
  if ( forInputName !== null ) {
    $('#create-menu-for-input')
      .attr('data-id', forInputID )
      .text( forInputName );
  }
  // 代入値自動登録用
  if ( forSubstitutionName !== null ) {
    $('#create-menu-for-substitution')
      .attr('data-id', forSubstitutionID )
      .text( forSubstitutionName );
  }
  // 参照用
  if ( forReferenceName !== null ) {
    $('#create-menu-for-reference')
      .attr('data-id', forReference )
      .text( forReferenceName );
  }
  // ACCESS_AUTHの初期値を入れる
  if ( menuEditorArray.roleList !== undefined ) {
    const roleDefault = new Array,
          roleLength = menuEditorArray.roleList.length;
    for ( let i = 0; i < roleLength; i++ ) {
      if ( menuEditorArray.roleList[i]['DEFAULT'] === 'checked') {
        roleDefault.push( menuEditorArray.roleList[i]['ROLE_ID'] );
      } 
    }
    const newRoleList = roleDefault.join(',');
    $('#permission-role-name-list').text(　getRoleListIdToName( newRoleList ) ).attr('data-role-id', newRoleList );
  }
};


if ( menuEditorMode === 'new' ) {
  initialMenuGroup();
  addColumn( $menuTable, 'item', itemCounter++ );
} else {
  loadMenu();
}
repeatCheck();
history.clear();

};