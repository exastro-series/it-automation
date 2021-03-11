-- *****************************************************************************
-- *** ***** CreateParameterMenu Tables                                      ***
-- *****************************************************************************
-- -------------------------
-- パラメータシート作成情報
-- -------------------------
CREATE TABLE F_CREATE_MENU_INFO
(
CREATE_MENU_ID                      INT                             , -- 識別シーケンス項番
MENU_NAME                           VARCHAR (256)                    ,
PURPOSE                             INT                             ,
TARGET                              INT                             ,
VERTICAL                            INT                             ,
MENUGROUP_FOR_INPUT                 INT                             ,
MENUGROUP_FOR_SUBST                 INT                             ,
MENUGROUP_FOR_VIEW                  INT                             ,
DISP_SEQ                            INT                             ,
DESCRIPTION                         VARCHAR (1024)                  ,
ACCESS_AUTH                         TEXT                            ,
NOTE                                VARCHAR  (4000)                 , -- 備考
DISUSE_FLAG                         VARCHAR  (1)                    , -- 廃止フラグ
LAST_UPDATE_TIMESTAMP               DATETIME(6)                     , -- 最終更新日時
LAST_UPDATE_USER                    INT                             , -- 最終更新ユーザ
PRIMARY KEY (CREATE_MENU_ID)
)ENGINE = InnoDB, CHARSET = utf8, COLLATE = utf8_bin, ROW_FORMAT=COMPRESSED ,KEY_BLOCK_SIZE=8;

CREATE TABLE F_CREATE_MENU_INFO_JNL
(
JOURNAL_SEQ_NO                      INT                             , -- 履歴用シーケンス
JOURNAL_REG_DATETIME                DATETIME(6)                     , -- 履歴用変更日時
JOURNAL_ACTION_CLASS                VARCHAR (8)                     , -- 履歴用変更種別

CREATE_MENU_ID                      INT                             , -- 識別シーケンス項番
MENU_NAME                           VARCHAR (256)                    ,
PURPOSE                             INT                             ,
TARGET                              INT                             ,
VERTICAL                            INT                             ,
MENUGROUP_FOR_INPUT                 INT                             ,
MENUGROUP_FOR_SUBST                 INT                             ,
MENUGROUP_FOR_VIEW                  INT                             ,
DISP_SEQ                            INT                             ,
DESCRIPTION                         VARCHAR (1024)                  ,
ACCESS_AUTH                         TEXT                            ,
NOTE                                VARCHAR  (4000)                 , -- 備考
DISUSE_FLAG                         VARCHAR  (1)                    , -- 廃止フラグ
LAST_UPDATE_TIMESTAMP               DATETIME(6)                     , -- 最終更新日時
LAST_UPDATE_USER                    INT                             , -- 最終更新ユーザ
PRIMARY KEY (JOURNAL_SEQ_NO)
)ENGINE = InnoDB, CHARSET = utf8, COLLATE = utf8_bin, ROW_FORMAT=COMPRESSED ,KEY_BLOCK_SIZE=8;

-- -------------------------
-- パラメータシート項目作成情報
-- -------------------------
CREATE TABLE F_CREATE_ITEM_INFO
(
CREATE_ITEM_ID                      INT                             , -- 識別シーケンス項番
CREATE_MENU_ID                      INT                             ,
ITEM_NAME                           VARCHAR (256)                   ,
DISP_SEQ                            INT                             ,
REQUIRED                            INT                             ,
UNIQUED                             INT                             ,
COL_GROUP_ID                        INT                             ,
INPUT_METHOD_ID                     INT                             ,
MAX_LENGTH                          INT                             ,
MULTI_MAX_LENGTH                    INT                             ,
PREG_MATCH                          TEXT                            ,
MULTI_PREG_MATCH                    TEXT                            ,
OTHER_MENU_LINK_ID                  INT                             ,
INT_MAX                             INT                             ,
INT_MIN                             INT                             ,
FLOAT_MAX                           DOUBLE                          ,
FLOAT_MIN                           DOUBLE                          ,
FLOAT_DIGIT                         INT                             ,
PW_MAX_LENGTH                       INT                             ,
UPLOAD_MAX_SIZE                     LONG                            ,
LINK_LENGTH                         INT                             ,
REFERENCE_ITEM                      TEXT                            ,
DESCRIPTION                         VARCHAR (1024)                  ,
ACCESS_AUTH                         TEXT                            ,
NOTE                                VARCHAR  (4000)                 , -- 備考
DISUSE_FLAG                         VARCHAR  (1)                    , -- 廃止フラグ
LAST_UPDATE_TIMESTAMP               DATETIME(6)                     , -- 最終更新日時
LAST_UPDATE_USER                    INT                             , -- 最終更新ユーザ
PRIMARY KEY (CREATE_ITEM_ID)
)ENGINE = InnoDB, CHARSET = utf8, COLLATE = utf8_bin, ROW_FORMAT=COMPRESSED ,KEY_BLOCK_SIZE=8;

CREATE TABLE F_CREATE_ITEM_INFO_JNL
(
JOURNAL_SEQ_NO                      INT                             , -- 履歴用シーケンス
JOURNAL_REG_DATETIME                DATETIME(6)                     , -- 履歴用変更日時
JOURNAL_ACTION_CLASS                VARCHAR  (8)                    , -- 履歴用変更種別

CREATE_ITEM_ID                      INT                             , -- 識別シーケンス項番
CREATE_MENU_ID                      INT                             ,
ITEM_NAME                           VARCHAR (256)                   ,
DISP_SEQ                            INT                             ,
REQUIRED                            INT                             ,
UNIQUED                             INT                             ,
COL_GROUP_ID                        INT                             ,
INPUT_METHOD_ID                     INT                             ,
MAX_LENGTH                          INT                             ,
MULTI_MAX_LENGTH                    INT                             ,
PREG_MATCH                          TEXT                            ,
MULTI_PREG_MATCH                    TEXT                            ,
OTHER_MENU_LINK_ID                  INT                             ,
INT_MAX                             INT                             ,
INT_MIN                             INT                             ,
FLOAT_MAX                           DOUBLE                          ,
FLOAT_MIN                           DOUBLE                          ,
FLOAT_DIGIT                         INT                             ,
PW_MAX_LENGTH                       INT                             ,
UPLOAD_MAX_SIZE                     LONG                            ,
LINK_LENGTH                         INT                             ,
REFERENCE_ITEM                      TEXT                            ,
DESCRIPTION                         VARCHAR (1024)                  ,
ACCESS_AUTH                         TEXT                            ,
NOTE                                VARCHAR  (4000)                 , -- 備考
DISUSE_FLAG                         VARCHAR  (1)                    , -- 廃止フラグ
LAST_UPDATE_TIMESTAMP               DATETIME(6)                     , -- 最終更新日時
LAST_UPDATE_USER                    INT                             , -- 最終更新ユーザ
PRIMARY KEY(JOURNAL_SEQ_NO)
)ENGINE = InnoDB, CHARSET = utf8, COLLATE = utf8_bin, ROW_FORMAT=COMPRESSED ,KEY_BLOCK_SIZE=8;

-- -------------------------
-- パラメータシート・テーブル紐付
-- -------------------------
CREATE TABLE F_MENU_TABLE_LINK
(
MENU_TABLE_LINK_ID                  INT                             , -- 識別シーケンス項番
MENU_ID                             INT                             ,
TABLE_NAME                          VARCHAR (64)                    ,
KEY_COL_NAME                        VARCHAR (64)                    ,
TABLE_NAME_JNL                      VARCHAR (64)                    ,
ACCESS_AUTH                         TEXT                            ,
NOTE                                VARCHAR  (4000)                 , -- 備考
DISUSE_FLAG                         VARCHAR  (1)                    , -- 廃止フラグ
LAST_UPDATE_TIMESTAMP               DATETIME(6)                     , -- 最終更新日時
LAST_UPDATE_USER                    INT                             , -- 最終更新ユーザ

PRIMARY KEY (MENU_TABLE_LINK_ID)
)ENGINE = InnoDB, CHARSET = utf8, COLLATE = utf8_bin, ROW_FORMAT=COMPRESSED ,KEY_BLOCK_SIZE=8;

CREATE TABLE F_MENU_TABLE_LINK_JNL
(
JOURNAL_SEQ_NO                      INT                             , -- 履歴用シーケンス
JOURNAL_REG_DATETIME                DATETIME(6)                     , -- 履歴用変更日時
JOURNAL_ACTION_CLASS                VARCHAR  (8)                    , -- 履歴用変更種別

MENU_TABLE_LINK_ID                  INT                             , -- 識別シーケンス項番
MENU_ID                             INT                             ,
TABLE_NAME                          VARCHAR (64)                    ,
KEY_COL_NAME                        VARCHAR (64)                    ,
TABLE_NAME_JNL                      VARCHAR (64)                    ,
ACCESS_AUTH                         TEXT                            ,
NOTE                                VARCHAR  (4000)                 , -- 備考
DISUSE_FLAG                         VARCHAR  (1)                    , -- 廃止フラグ
LAST_UPDATE_TIMESTAMP               DATETIME(6)                     , -- 最終更新日時
LAST_UPDATE_USER                    INT                             , -- 最終更新ユーザ
PRIMARY KEY(JOURNAL_SEQ_NO)
)ENGINE = InnoDB, CHARSET = utf8, COLLATE = utf8_bin, ROW_FORMAT=COMPRESSED ,KEY_BLOCK_SIZE=8;

-- -------------------------
-- パラメータシート作成管理
-- -------------------------
CREATE TABLE F_CREATE_MENU_STATUS
(
MM_STATUS_ID                        INT                             , -- 識別シーケンス項番

CREATE_MENU_ID                      INT                             ,
STATUS_ID                           INT                             ,
MENU_CREATE_TYPE_ID                 INT                             ,
FILE_NAME                           VARCHAR (64)                    ,
ACCESS_AUTH                         TEXT                            ,
NOTE                                VARCHAR  (4000)                 , -- 備考
DISUSE_FLAG                         VARCHAR  (1)                    , -- 廃止フラグ
LAST_UPDATE_TIMESTAMP               DATETIME(6)                     , -- 最終更新日時
LAST_UPDATE_USER                    INT                             , -- 最終更新ユーザ
PRIMARY KEY (MM_STATUS_ID)
)ENGINE = InnoDB, CHARSET = utf8, COLLATE = utf8_bin, ROW_FORMAT=COMPRESSED ,KEY_BLOCK_SIZE=8;

CREATE TABLE F_CREATE_MENU_STATUS_JNL
(
JOURNAL_SEQ_NO                      INT                             , -- 履歴用シーケンス
JOURNAL_REG_DATETIME                DATETIME(6)                     , -- 履歴用変更日時
JOURNAL_ACTION_CLASS                VARCHAR  (8)                    , -- 履歴用変更種別

MM_STATUS_ID                        INT                             , -- 識別シーケンス項番
CREATE_MENU_ID                      INT                             ,
STATUS_ID                           INT                             ,
MENU_CREATE_TYPE_ID                 INT                             ,
FILE_NAME                           VARCHAR (64)                    ,
ACCESS_AUTH                         TEXT                            ,
NOTE                                VARCHAR  (4000)                 , -- 備考
DISUSE_FLAG                         VARCHAR  (1)                    , -- 廃止フラグ
LAST_UPDATE_TIMESTAMP               DATETIME(6)                     , -- 最終更新日時
LAST_UPDATE_USER                    INT                             , -- 最終更新ユーザ
PRIMARY KEY(JOURNAL_SEQ_NO)
)ENGINE = InnoDB, CHARSET = utf8, COLLATE = utf8_bin, ROW_FORMAT=COMPRESSED ,KEY_BLOCK_SIZE=8;

-- -------------------------
-- メニュー作成ステータスマスタ
-- -------------------------
CREATE TABLE F_CM_STATUS_MASTER
(
STATUS_ID                           INT                             , -- 識別シーケンス項番
STATUS_NAME                         VARCHAR (64)                    ,
ACCESS_AUTH                         TEXT                            ,
NOTE                                VARCHAR  (4000)                 , -- 備考
DISUSE_FLAG                         VARCHAR  (1)                    , -- 廃止フラグ
LAST_UPDATE_TIMESTAMP               DATETIME(6)                     , -- 最終更新日時
LAST_UPDATE_USER                    INT                             , -- 最終更新ユーザ
PRIMARY KEY (STATUS_ID)
)ENGINE = InnoDB, CHARSET = utf8, COLLATE = utf8_bin, ROW_FORMAT=COMPRESSED ,KEY_BLOCK_SIZE=8;

CREATE TABLE F_CM_STATUS_MASTER_JNL
(
JOURNAL_SEQ_NO                      INT                             , -- 履歴用シーケンス
JOURNAL_REG_DATETIME                DATETIME(6)                     , -- 履歴用変更日時
JOURNAL_ACTION_CLASS                VARCHAR  (8)                    , -- 履歴用変更種別

STATUS_ID                           INT                             , -- 識別シーケンス項番
STATUS_NAME                         VARCHAR (64)                    ,
ACCESS_AUTH                         TEXT                            ,
NOTE                                VARCHAR  (4000)                 , -- 備考
DISUSE_FLAG                         VARCHAR  (1)                    , -- 廃止フラグ
LAST_UPDATE_TIMESTAMP               DATETIME(6)                     , -- 最終更新日時
LAST_UPDATE_USER                    INT                             , -- 最終更新ユーザ
PRIMARY KEY(JOURNAL_SEQ_NO)
)ENGINE = InnoDB, CHARSET = utf8, COLLATE = utf8_bin, ROW_FORMAT=COMPRESSED ,KEY_BLOCK_SIZE=8;

-- -------------------------
-- 用途マスタ
-- -------------------------
CREATE TABLE F_PARAM_PURPOSE
(
PURPOSE_ID                          INT                             , -- 識別シーケンス項番
PURPOSE_NAME                        VARCHAR (64)                    ,
ACCESS_AUTH                         TEXT                            ,
NOTE                                VARCHAR  (4000)                 , -- 備考
DISUSE_FLAG                         VARCHAR  (1)                    , -- 廃止フラグ
LAST_UPDATE_TIMESTAMP               DATETIME(6)                     , -- 最終更新日時
LAST_UPDATE_USER                    INT                             , -- 最終更新ユーザ
PRIMARY KEY (PURPOSE_ID)
)ENGINE = InnoDB, CHARSET = utf8, COLLATE = utf8_bin, ROW_FORMAT=COMPRESSED ,KEY_BLOCK_SIZE=8;

CREATE TABLE F_PARAM_PURPOSE_JNL
(
JOURNAL_SEQ_NO                      INT                             , -- 履歴用シーケンス
JOURNAL_REG_DATETIME                DATETIME(6)                     , -- 履歴用変更日時
JOURNAL_ACTION_CLASS                VARCHAR  (8)                    , -- 履歴用変更種別

PURPOSE_ID                          INT                             , -- 識別シーケンス項番
PURPOSE_NAME                        VARCHAR (64)                    ,
ACCESS_AUTH                         TEXT                            ,
NOTE                                VARCHAR  (4000)                 , -- 備考
DISUSE_FLAG                         VARCHAR  (1)                    , -- 廃止フラグ
LAST_UPDATE_TIMESTAMP               DATETIME(6)                     , -- 最終更新日時
LAST_UPDATE_USER                    INT                             , -- 最終更新ユーザ
PRIMARY KEY(JOURNAL_SEQ_NO)
)ENGINE = InnoDB, CHARSET = utf8, COLLATE = utf8_bin, ROW_FORMAT=COMPRESSED ,KEY_BLOCK_SIZE=8;

-- -------------------------
-- 他メニュー連携
-- -------------------------
CREATE TABLE F_OTHER_MENU_LINK
(
LINK_ID                             INT                             , -- 識別シーケンス項番
MENU_ID                             INT                             ,
COLUMN_DISP_NAME                    VARCHAR (4096)                   ,
TABLE_NAME                          VARCHAR (64)                    ,
PRI_NAME                            VARCHAR (64)                    ,
COLUMN_NAME                         VARCHAR (64)                    ,
COLUMN_TYPE                         INT                             ,
ACCESS_AUTH                         TEXT                            ,
NOTE                                VARCHAR  (4000)                 , -- 備考
DISUSE_FLAG                         VARCHAR  (1)                    , -- 廃止フラグ
LAST_UPDATE_TIMESTAMP               DATETIME(6)                     , -- 最終更新日時
LAST_UPDATE_USER                    INT                             , -- 最終更新ユーザ
PRIMARY KEY (LINK_ID)
)ENGINE = InnoDB, CHARSET = utf8, COLLATE = utf8_bin, ROW_FORMAT=COMPRESSED ,KEY_BLOCK_SIZE=8;

CREATE TABLE F_OTHER_MENU_LINK_JNL
(
JOURNAL_SEQ_NO                      INT                             , -- 履歴用シーケンス
JOURNAL_REG_DATETIME                DATETIME(6)                     , -- 履歴用変更日時
JOURNAL_ACTION_CLASS                VARCHAR  (8)                    , -- 履歴用変更種別

LINK_ID                             INT                             , -- 識別シーケンス項番
MENU_ID                             INT                             ,
COLUMN_DISP_NAME                    VARCHAR (4096)                   ,
TABLE_NAME                          VARCHAR (64)                    ,
PRI_NAME                            VARCHAR (64)                    ,
COLUMN_NAME                         VARCHAR (64)                    ,
COLUMN_TYPE                         INT                             ,
ACCESS_AUTH                         TEXT                            ,
NOTE                                VARCHAR  (4000)                 , -- 備考
DISUSE_FLAG                         VARCHAR  (1)                    , -- 廃止フラグ
LAST_UPDATE_TIMESTAMP               DATETIME(6)                     , -- 最終更新日時
LAST_UPDATE_USER                    INT                             , -- 最終更新ユーザ
PRIMARY KEY(JOURNAL_SEQ_NO)
)ENGINE = InnoDB, CHARSET = utf8, COLLATE = utf8_bin, ROW_FORMAT=COMPRESSED ,KEY_BLOCK_SIZE=8;

-- -------------------------
-- 入力方式マスタ
-- -------------------------
CREATE TABLE F_INPUT_METHOD
(
INPUT_METHOD_ID                     INT                             , -- 識別シーケンス項番
INPUT_METHOD_NAME                   VARCHAR  (256)                  ,
ACCESS_AUTH                         TEXT                            ,
NOTE                                VARCHAR  (4000)                 , -- 備考
DISUSE_FLAG                         VARCHAR  (1)                    , -- 廃止フラグ
LAST_UPDATE_TIMESTAMP               DATETIME(6)                     , -- 最終更新日時
LAST_UPDATE_USER                    INT                             , -- 最終更新ユーザ
PRIMARY KEY (INPUT_METHOD_ID)
)ENGINE = InnoDB, CHARSET = utf8, COLLATE = utf8_bin, ROW_FORMAT=COMPRESSED ,KEY_BLOCK_SIZE=8;

CREATE TABLE F_INPUT_METHOD_JNL
(
JOURNAL_SEQ_NO                      INT                             , -- 履歴用シーケンス
JOURNAL_REG_DATETIME                DATETIME(6)                     , -- 履歴用変更日時
JOURNAL_ACTION_CLASS                VARCHAR  (8)                    , -- 履歴用変更種別

INPUT_METHOD_ID                     INT                             , -- 識別シーケンス項番
INPUT_METHOD_NAME                   VARCHAR  (256)                  ,
ACCESS_AUTH                         TEXT                            ,
NOTE                                VARCHAR  (4000)                 , -- 備考
DISUSE_FLAG                         VARCHAR  (1)                    , -- 廃止フラグ
LAST_UPDATE_TIMESTAMP               DATETIME(6)                     , -- 最終更新日時
LAST_UPDATE_USER                    INT                             , -- 最終更新ユーザ
PRIMARY KEY(JOURNAL_SEQ_NO)
)ENGINE = InnoDB, CHARSET = utf8, COLLATE = utf8_bin, ROW_FORMAT=COMPRESSED ,KEY_BLOCK_SIZE=8;

-- -------------------------
-- カラムグループ管理
-- -------------------------
CREATE TABLE F_COLUMN_GROUP
(
COL_GROUP_ID                        INT                             , -- 識別シーケンス項番
PA_COL_GROUP_ID                     INT                             ,
FULL_COL_GROUP_NAME                 VARCHAR  (4096)                 ,
COL_GROUP_NAME                      VARCHAR  (256)                  ,
DISP_SEQ                            INT                             ,
ACCESS_AUTH                         TEXT                            ,
NOTE                                VARCHAR  (4000)                 , -- 備考
DISUSE_FLAG                         VARCHAR  (1)                    , -- 廃止フラグ
LAST_UPDATE_TIMESTAMP               DATETIME(6)                     , -- 最終更新日時
LAST_UPDATE_USER                    INT                             , -- 最終更新ユーザ
PRIMARY KEY (COL_GROUP_ID)
)ENGINE = InnoDB, CHARSET = utf8, COLLATE = utf8_bin, ROW_FORMAT=COMPRESSED ,KEY_BLOCK_SIZE=8;

CREATE TABLE F_COLUMN_GROUP_JNL
(
JOURNAL_SEQ_NO                      INT                             , -- 履歴用シーケンス
JOURNAL_REG_DATETIME                DATETIME(6)                     , -- 履歴用変更日時
JOURNAL_ACTION_CLASS                VARCHAR  (8)                    , -- 履歴用変更種別

COL_GROUP_ID                        INT                             , -- 識別シーケンス項番
PA_COL_GROUP_ID                     INT                             ,
FULL_COL_GROUP_NAME                 VARCHAR  (4096)                 ,
COL_GROUP_NAME                      VARCHAR  (256)                  ,
DISP_SEQ                            INT                             ,
ACCESS_AUTH                         TEXT                            ,
NOTE                                VARCHAR  (4000)                 , -- 備考
DISUSE_FLAG                         VARCHAR  (1)                    , -- 廃止フラグ
LAST_UPDATE_TIMESTAMP               DATETIME(6)                     , -- 最終更新日時
LAST_UPDATE_USER                    INT                             , -- 最終更新ユーザ
PRIMARY KEY(JOURNAL_SEQ_NO)
)ENGINE = InnoDB, CHARSET = utf8, COLLATE = utf8_bin, ROW_FORMAT=COMPRESSED ,KEY_BLOCK_SIZE=8;

-- -------------------------
-- パラメータシート(縦)作成情報
-- -------------------------
CREATE TABLE F_CONVERT_PARAM_INFO
(
CONVERT_PARAM_ID                    INT                             , -- 識別シーケンス項番
CREATE_ITEM_ID                      INT                             ,
COL_CNT                             INT                             ,
REPEAT_CNT                          INT                             ,
ACCESS_AUTH                         TEXT                            ,
NOTE                                VARCHAR  (4000)                 , -- 備考
DISUSE_FLAG                         VARCHAR  (1)                    , -- 廃止フラグ
LAST_UPDATE_TIMESTAMP               DATETIME(6)                     , -- 最終更新日時
LAST_UPDATE_USER                    INT                             , -- 最終更新ユーザ
PRIMARY KEY (CONVERT_PARAM_ID)
)ENGINE = InnoDB, CHARSET = utf8, COLLATE = utf8_bin, ROW_FORMAT=COMPRESSED ,KEY_BLOCK_SIZE=8;

CREATE TABLE F_CONVERT_PARAM_INFO_JNL
(
JOURNAL_SEQ_NO                      INT                             , -- 履歴用シーケンス
JOURNAL_REG_DATETIME                DATETIME(6)                     , -- 履歴用変更日時
JOURNAL_ACTION_CLASS                VARCHAR  (8)                    , -- 履歴用変更種別

CONVERT_PARAM_ID                    INT                             , -- 識別シーケンス項番
CREATE_ITEM_ID                      INT                             ,
COL_CNT                             INT                             ,
REPEAT_CNT                          INT                             ,
ACCESS_AUTH                         TEXT                            ,
NOTE                                VARCHAR  (4000)                 , -- 備考
DISUSE_FLAG                         VARCHAR  (1)                    , -- 廃止フラグ
LAST_UPDATE_TIMESTAMP               DATETIME(6)                     , -- 最終更新日時
LAST_UPDATE_USER                    INT                             , -- 最終更新ユーザ
PRIMARY KEY (JOURNAL_SEQ_NO)
)ENGINE = InnoDB, CHARSET = utf8, COLLATE = utf8_bin, ROW_FORMAT=COMPRESSED ,KEY_BLOCK_SIZE=8;

-- -------------------------
-- パラメータシート縦横変換管理
-- -------------------------
CREATE TABLE F_COL_TO_ROW_MNG (
ROW_ID                        INT               ,
FROM_MENU_ID                  INT               ,
TO_MENU_ID                    INT               ,
PURPOSE                       INT               ,
START_COL_NAME                VARCHAR  (64)     ,
COL_CNT                       INT               ,
REPEAT_CNT                    INT               ,
CHANGED_FLG                   VARCHAR  (1)      ,
ACCESS_AUTH                  TEXT               ,
NOTE                          VARCHAR  (4000)   ,
DISUSE_FLAG                   VARCHAR  (1)      ,
LAST_UPDATE_TIMESTAMP         DATETIME(6)       ,
LAST_UPDATE_USER              INT               ,
PRIMARY KEY (ROW_ID)
)ENGINE = InnoDB, CHARSET = utf8, COLLATE = utf8_bin, ROW_FORMAT=COMPRESSED ,KEY_BLOCK_SIZE=8;

CREATE TABLE F_COL_TO_ROW_MNG_JNL (
JOURNAL_SEQ_NO                INT               ,
JOURNAL_REG_DATETIME          DATETIME(6)       ,
JOURNAL_ACTION_CLASS          VARCHAR  (8)      ,
ROW_ID                        INT               ,
FROM_MENU_ID                  INT               ,
TO_MENU_ID                    INT               ,
PURPOSE                       INT               ,
START_COL_NAME                VARCHAR  (64)     ,
COL_CNT                       INT               ,
REPEAT_CNT                    INT               ,
CHANGED_FLG                   VARCHAR  (1)      ,
ACCESS_AUTH                  TEXT               ,
NOTE                          VARCHAR  (4000)   ,
DISUSE_FLAG                   VARCHAR  (1)      ,
LAST_UPDATE_TIMESTAMP         DATETIME(6)       ,
LAST_UPDATE_USER              INT               ,
PRIMARY KEY (JOURNAL_SEQ_NO)
)ENGINE = InnoDB, CHARSET = utf8, COLLATE = utf8_bin, ROW_FORMAT=COMPRESSED ,KEY_BLOCK_SIZE=8;

-- -------------------------
-- 参照項目情報
-- -------------------------
CREATE TABLE F_MENU_REFERENCE_ITEM
(
ITEM_ID                             INT                               , -- 識別シーケンス項番
LINK_ID                             INT                               ,
DISP_SEQ                            INT                               ,
TABLE_NAME                          VARCHAR  (64)                     ,
PRI_NAME                            VARCHAR  (64)                     ,
COLUMN_NAME                         VARCHAR  (64)                     ,
ITEM_NAME                           VARCHAR  (64)                     ,
COL_GROUP_NAME                      TEXT                              ,
DESCRIPTION                         TEXT                              ,
INPUT_METHOD_ID                     INT                               ,
SENSITIVE_FLAG                      VARCHAR  (1)                      ,
MASTER_COL_FLAG                     VARCHAR  (1)                      ,
ACCESS_AUTH                         TEXT                              ,
NOTE                                VARCHAR  (4000)                   , -- 備考
DISUSE_FLAG                         VARCHAR  (1)                      , -- 廃止フラグ
LAST_UPDATE_TIMESTAMP               DATETIME(6)                       , -- 最終更新日時
LAST_UPDATE_USER                    INT                               , -- 最終更新ユーザ
PRIMARY KEY (ITEM_ID)
)ENGINE = InnoDB, CHARSET = utf8, COLLATE = utf8_bin, ROW_FORMAT=COMPRESSED ,KEY_BLOCK_SIZE=8;

CREATE TABLE F_MENU_REFERENCE_ITEM_JNL
(
JOURNAL_SEQ_NO                      INT                               , -- 履歴用シーケンス
JOURNAL_REG_DATETIME                DATETIME(6)                       , -- 履歴用変更日時
JOURNAL_ACTION_CLASS                VARCHAR  (8)                      , -- 履歴用変更種別

ITEM_ID                             INT                               , -- 識別シーケンス項番
LINK_ID                             INT                               ,
DISP_SEQ                            INT                               ,
TABLE_NAME                          VARCHAR  (64)                     ,
PRI_NAME                            VARCHAR  (64)                     ,
COLUMN_NAME                         VARCHAR  (64)                     ,
ITEM_NAME                           VARCHAR  (64)                     ,
COL_GROUP_NAME                      TEXT                              ,
DESCRIPTION                         TEXT                              ,
INPUT_METHOD_ID                     INT                               ,
SENSITIVE_FLAG                      VARCHAR  (1)                      ,
MASTER_COL_FLAG                     VARCHAR  (1)                      ,
ACCESS_AUTH                         TEXT                              ,
NOTE                                VARCHAR  (4000)                  , -- 備考
DISUSE_FLAG                         VARCHAR  (1)                     , -- 廃止フラグ
LAST_UPDATE_TIMESTAMP               DATETIME(6)                       , -- 最終更新日時
LAST_UPDATE_USER                    INT                               , -- 最終更新ユーザ
PRIMARY KEY(JOURNAL_SEQ_NO)
)ENGINE = InnoDB, CHARSET = utf8, COLLATE = utf8_bin, ROW_FORMAT=COMPRESSED ,KEY_BLOCK_SIZE=8;



-- *****************************************************************************
-- *** ***** Views                                                           ***
-- *****************************************************************************

-- -------------------------
-- 必須マスタ
-- -------------------------
CREATE OR REPLACE VIEW G_REQUIRED_MASTER AS
SELECT 1      AS REQUIRED_ID            ,
       '●'   AS REQUIRED_NAME          ,
       ''     AS ACCESS_AUTH            ,
       '0'    AS DISUSE_FLAG            ,
       NOW(6) AS LAST_UPDATE_TIMESTAMP  ,
       1      AS LAST_UPDATE_USER
;

-- -------------------------
-- 他メニュー連携
-- -------------------------
CREATE VIEW G_OTHER_MENU_LINK AS 
SELECT TAB_A.LINK_ID                       ,
       TAB_C.MENU_GROUP_ID                 ,
       TAB_C.MENU_GROUP_NAME               ,
       TAB_A.MENU_ID                       ,
       TAB_A.MENU_ID MENU_ID_CLONE         ,
       TAB_B.MENU_NAME                     ,
       TAB_A.COLUMN_DISP_NAME              ,
       CONCAT(TAB_C.MENU_GROUP_NAME,':',TAB_B.MENU_NAME,':',TAB_A.COLUMN_DISP_NAME) LINK_PULLDOWN,
       TAB_A.TABLE_NAME                    ,
       TAB_A.PRI_NAME                      ,
       TAB_A.COLUMN_NAME                   ,
       TAB_A.COLUMN_TYPE                   ,
       TAB_A.ACCESS_AUTH                   ,
       TAB_A.NOTE                          ,
       TAB_A.DISUSE_FLAG                   ,
       TAB_A.LAST_UPDATE_TIMESTAMP         ,
       TAB_A.LAST_UPDATE_USER              ,
       TAB_B.ACCESS_AUTH AS ACCESS_AUTH_01 ,
       TAB_C.ACCESS_AUTH AS ACCESS_AUTH_02
FROM F_OTHER_MENU_LINK TAB_A
LEFT JOIN A_MENU_LIST TAB_B ON (TAB_A.MENU_ID = TAB_B.MENU_ID)
LEFT JOIN A_MENU_GROUP_LIST TAB_C ON (TAB_B.MENU_GROUP_ID = TAB_C.MENU_GROUP_ID)
WHERE TAB_B.DISUSE_FLAG='0' AND TAB_C.DISUSE_FLAG='0'
;

CREATE VIEW G_OTHER_MENU_LINK_JNL AS 
SELECT TAB_A.JOURNAL_SEQ_NO                ,
       TAB_A.JOURNAL_REG_DATETIME          ,
       TAB_A.JOURNAL_ACTION_CLASS          ,
       TAB_A.LINK_ID                       ,
       TAB_C.MENU_GROUP_ID                 ,
       TAB_C.MENU_GROUP_NAME               ,
       TAB_A.MENU_ID                       ,
       TAB_A.MENU_ID MENU_ID_CLONE         ,
       TAB_B.MENU_NAME                     ,
       TAB_A.COLUMN_DISP_NAME              ,
       CONCAT(TAB_C.MENU_GROUP_NAME,':',TAB_B.MENU_NAME,':',TAB_A.COLUMN_DISP_NAME) LINK_PULLDOWN,
       TAB_A.TABLE_NAME                    ,
       TAB_A.PRI_NAME                      ,
       TAB_A.COLUMN_NAME                   ,
       TAB_A.COLUMN_TYPE                   ,
       TAB_A.ACCESS_AUTH                   ,
       TAB_A.NOTE                          ,
       TAB_A.DISUSE_FLAG                   ,
       TAB_A.LAST_UPDATE_TIMESTAMP         ,
       TAB_A.LAST_UPDATE_USER              ,
       TAB_B.ACCESS_AUTH AS ACCESS_AUTH_01 ,
       TAB_C.ACCESS_AUTH AS ACCESS_AUTH_02
FROM F_OTHER_MENU_LINK_JNL TAB_A
LEFT JOIN A_MENU_LIST TAB_B ON (TAB_A.MENU_ID = TAB_B.MENU_ID)
LEFT JOIN A_MENU_GROUP_LIST TAB_C ON (TAB_B.MENU_GROUP_ID = TAB_C.MENU_GROUP_ID)
WHERE TAB_B.DISUSE_FLAG='0' AND TAB_C.DISUSE_FLAG='0'
;

-- -------------------------
-- パラメータシート項目作成情報
-- -------------------------
CREATE VIEW G_CREATE_ITEM_INFO AS 
SELECT TAB_A.CREATE_ITEM_ID,
       TAB_A.CREATE_MENU_ID,
       TAB_A.ITEM_NAME,
       TAB_A.DISP_SEQ,
       TAB_A.REQUIRED,
       TAB_A.UNIQUED,
       TAB_A.COL_GROUP_ID,
       TAB_A.INPUT_METHOD_ID,
       TAB_A.MAX_LENGTH,
       TAB_A.MULTI_MAX_LENGTH,
       TAB_A.PREG_MATCH,
       TAB_A.MULTI_PREG_MATCH,
       TAB_A.OTHER_MENU_LINK_ID,
       TAB_A.INT_MAX,
       TAB_A.INT_MIN,
       TAB_A.FLOAT_MAX,
       TAB_A.FLOAT_MIN,
       TAB_A.FLOAT_DIGIT,
       TAB_A.PW_MAX_LENGTH,
       TAB_A.UPLOAD_MAX_SIZE,
       TAB_A.LINK_LENGTH,
       TAB_A.REFERENCE_ITEM,
       TAB_A.DESCRIPTION,
       TAB_C.FULL_COL_GROUP_NAME,
       CASE
           WHEN TAB_C.FULL_COL_GROUP_NAME IS NULL THEN CONCAT(TAB_B.MENU_NAME,':',TAB_A.ITEM_NAME)
           ELSE CONCAT(TAB_B.MENU_NAME,':',TAB_C.FULL_COL_GROUP_NAME,'/',TAB_A.ITEM_NAME)
       END LINK_PULLDOWN,
       TAB_A.ACCESS_AUTH,
       TAB_A.NOTE,
       TAB_A.DISUSE_FLAG,
       TAB_A.LAST_UPDATE_TIMESTAMP,
       TAB_A.LAST_UPDATE_USER,
       TAB_B.ACCESS_AUTH AS ACCESS_AUTH_01,
       TAB_C.ACCESS_AUTH AS ACCESS_AUTH_02
FROM F_CREATE_ITEM_INFO TAB_A
LEFT JOIN F_CREATE_MENU_INFO TAB_B ON (TAB_A.CREATE_MENU_ID = TAB_B.CREATE_MENU_ID)
LEFT JOIN F_COLUMN_GROUP TAB_C ON (TAB_A.COL_GROUP_ID = TAB_C.COL_GROUP_ID)
WHERE TAB_B.VERTICAL != ""
;

CREATE VIEW G_CREATE_ITEM_INFO_JNL AS 
SELECT TAB_A.JOURNAL_SEQ_NO,
       TAB_A.JOURNAL_REG_DATETIME,
       TAB_A.JOURNAL_ACTION_CLASS,
       TAB_A.CREATE_ITEM_ID,
       TAB_A.CREATE_MENU_ID,
       TAB_A.ITEM_NAME,
       TAB_A.DISP_SEQ,
       TAB_A.REQUIRED,
       TAB_A.UNIQUED,
       TAB_A.COL_GROUP_ID,
       TAB_A.INPUT_METHOD_ID,
       TAB_A.MAX_LENGTH,
       TAB_A.MULTI_MAX_LENGTH,
       TAB_A.PREG_MATCH,
       TAB_A.MULTI_PREG_MATCH,
       TAB_A.OTHER_MENU_LINK_ID,
       TAB_A.INT_MAX,
       TAB_A.INT_MIN,
       TAB_A.FLOAT_MAX,
       TAB_A.FLOAT_MIN,
       TAB_A.FLOAT_DIGIT,
       TAB_A.PW_MAX_LENGTH,
       TAB_A.UPLOAD_MAX_SIZE,
       TAB_A.LINK_LENGTH,
       TAB_A.REFERENCE_ITEM,
       TAB_A.DESCRIPTION,
       CASE
           WHEN TAB_C.FULL_COL_GROUP_NAME IS NULL THEN CONCAT(TAB_B.MENU_NAME,':',TAB_A.ITEM_NAME)
           ELSE CONCAT(TAB_B.MENU_NAME,':',TAB_C.FULL_COL_GROUP_NAME,'/',TAB_A.ITEM_NAME)
       END LINK_PULLDOWN,
       TAB_A.ACCESS_AUTH,
       TAB_A.NOTE,
       TAB_A.DISUSE_FLAG,
       TAB_A.LAST_UPDATE_TIMESTAMP,
       TAB_A.LAST_UPDATE_USER,
       TAB_B.ACCESS_AUTH AS ACCESS_AUTH_01,
       TAB_C.ACCESS_AUTH AS ACCESS_AUTH_02
FROM F_CREATE_ITEM_INFO_JNL TAB_A
LEFT JOIN F_CREATE_MENU_INFO TAB_B ON (TAB_A.CREATE_MENU_ID = TAB_B.CREATE_MENU_ID)
LEFT JOIN F_COLUMN_GROUP TAB_C ON (TAB_A.COL_GROUP_ID = TAB_C.COL_GROUP_ID)
WHERE TAB_B.VERTICAL != ""
;


-- -------------------------
-- 参照項目情報（メニュー作成用）
-- -------------------------
CREATE VIEW G_CREATE_REFERENCE_ITEM AS 
SELECT TAB_A.CREATE_ITEM_ID ITEM_ID               ,
       TAB_C.LINK_ID LINK_ID                      ,
       TAB_A.DISP_SEQ DISP_SEQ                    ,
       TAB_C.TABLE_NAME TABLE_NAME                ,
       TAB_C.PRI_NAME PRI_NAME                    ,
       CONCAT('KY_AUTO_COL_', lpad(TAB_A.CREATE_ITEM_ID, 4, '0')) COLUMN_NAME,
       TAB_A.ITEM_NAME ITEM_NAME                  ,
       TAB_D.FULL_COL_GROUP_NAME COL_GROUP_NAME   ,
       TAB_A.DESCRIPTION DESCRIPTION              ,
       TAB_A.INPUT_METHOD_ID INPUT_METHOD_ID      ,
       CASE WHEN TAB_A.INPUT_METHOD_ID = 8 THEN 2 ELSE 1 END AS SENSITIVE_FLAG,
       CASE WHEN CONCAT('KY_AUTO_COL_', lpad(TAB_A.CREATE_ITEM_ID, 4, '0')) = TAB_C.COLUMN_NAME THEN 1 ELSE '' END AS MASTER_COL_FLAG,
       TAB_A.ACCESS_AUTH                          ,
       TAB_A.NOTE                                 ,
       TAB_A.DISUSE_FLAG                          ,
       TAB_A.LAST_UPDATE_TIMESTAMP                ,
       TAB_A.LAST_UPDATE_USER                     ,
       TAB_B.ACCESS_AUTH AS ACCESS_AUTH_01        ,
       TAB_C.ACCESS_AUTH AS ACCESS_AUTH_02        ,
       TAB_D.ACCESS_AUTH AS ACCESS_AUTH_03 
FROM F_CREATE_ITEM_INFO TAB_A
LEFT JOIN F_CREATE_MENU_INFO TAB_B ON (TAB_A.CREATE_MENU_ID = TAB_B.CREATE_MENU_ID)
LEFT JOIN G_OTHER_MENU_LINK TAB_C ON (TAB_B.MENU_NAME = TAB_C.MENU_NAME)
LEFT JOIN F_COLUMN_GROUP TAB_D ON (TAB_A.COL_GROUP_ID = TAB_D.COL_GROUP_ID)
WHERE NOT TAB_A.INPUT_METHOD_ID = 7 AND TAB_B.DISUSE_FLAG='0' AND TAB_C.DISUSE_FLAG='0'
;


CREATE VIEW G_CREATE_REFERENCE_ITEM_JNL AS 
SELECT TAB_A.JOURNAL_SEQ_NO                       ,
       TAB_A.JOURNAL_REG_DATETIME                 ,
       TAB_A.JOURNAL_ACTION_CLASS                 ,
       TAB_A.CREATE_ITEM_ID ITEM_ID               ,
       TAB_C.LINK_ID LINK_ID                      ,
       TAB_A.DISP_SEQ DISP_SEQ                    ,
       TAB_C.TABLE_NAME TABLE_NAME                ,
       TAB_C.PRI_NAME PRI_NAME                    ,
       CONCAT('KY_AUTO_COL_', lpad(TAB_A.CREATE_ITEM_ID, 4, '0')) COLUMN_NAME,
       TAB_A.ITEM_NAME ITEM_NAME                  ,
       TAB_D.FULL_COL_GROUP_NAME COL_GROUP_NAME   ,
       TAB_A.DESCRIPTION DESCRIPTION              ,
       TAB_A.INPUT_METHOD_ID INPUT_METHOD_ID      ,
       CASE WHEN TAB_A.INPUT_METHOD_ID = 8 THEN 2 ELSE 1 END AS SENSITIVE_FLAG,
       CASE WHEN CONCAT('KY_AUTO_COL_', lpad(TAB_A.CREATE_ITEM_ID, 4, '0')) = TAB_C.COLUMN_NAME THEN 1 ELSE '' END AS MASTER_COL_FLAG,
       TAB_A.ACCESS_AUTH                          ,
       TAB_A.NOTE                                 ,
       TAB_A.DISUSE_FLAG                          ,
       TAB_A.LAST_UPDATE_TIMESTAMP                ,
       TAB_A.LAST_UPDATE_USER                     ,
       TAB_B.ACCESS_AUTH AS ACCESS_AUTH_01        ,
       TAB_C.ACCESS_AUTH AS ACCESS_AUTH_02        ,
       TAB_D.ACCESS_AUTH AS ACCESS_AUTH_03 
FROM F_CREATE_ITEM_INFO_JNL TAB_A
LEFT JOIN F_CREATE_MENU_INFO TAB_B ON (TAB_A.CREATE_MENU_ID = TAB_B.CREATE_MENU_ID)
LEFT JOIN G_OTHER_MENU_LINK TAB_C ON (TAB_B.MENU_NAME = TAB_C.MENU_NAME)
LEFT JOIN F_COLUMN_GROUP TAB_D ON (TAB_A.COL_GROUP_ID = TAB_D.COL_GROUP_ID)
WHERE NOT TAB_A.INPUT_METHOD_ID = 7 AND TAB_B.DISUSE_FLAG='0' AND TAB_C.DISUSE_FLAG='0'
;

-- -------------------------
-- 参照項目情報（既存メニュー/作成メニュー結合）
-- -------------------------
CREATE VIEW G_MENU_REFERENCE_ITEM AS 
SELECT TAB_A.ITEM_ID  ITEM_ID                            ,
       TAB_A.LINK_ID  LINK_ID                            ,
       TAB_A.DISP_SEQ DISP_SEQ                           ,
       TAB_A.TABLE_NAME TABLE_NAME                       ,
       TAB_A.PRI_NAME PRI_NAME                           ,
       TAB_A.COLUMN_NAME COLUMN_NAME                     ,
       TAB_A.ITEM_NAME ITEM_NAME                         ,
       TAB_A.COL_GROUP_NAME COL_GROUP_NAME               ,
       TAB_A.DESCRIPTION DESCRIPTION                     ,
       TAB_A.INPUT_METHOD_ID INPUT_METHOD_ID             ,
       TAB_A.SENSITIVE_FLAG SENSITIVE_FLAG               ,
       TAB_A.MASTER_COL_FLAG MASTER_COL_FLAG             ,
       TAB_A.ACCESS_AUTH ACCESS_AUTH                     ,
       TAB_A.NOTE NOTE                                   ,
       TAB_A.DISUSE_FLAG DISUSE_FLAG                     ,
       TAB_A.LAST_UPDATE_TIMESTAMP LAST_UPDATE_TIMESTAMP ,
       TAB_A.LAST_UPDATE_USER LAST_UPDATE_USER
FROM  F_MENU_REFERENCE_ITEM TAB_A
WHERE TAB_A.DISUSE_FLAG = '0'
UNION ALL
SELECT TAB_B.ITEM_ID  ITEM_ID                            ,
       TAB_B.LINK_ID  LINK_ID                            ,
       TAB_B.DISP_SEQ DISP_SEQ                           ,
       TAB_B.TABLE_NAME TABLE_NAME                       ,
       TAB_B.PRI_NAME PRI_NAME                           ,
       TAB_B.COLUMN_NAME COLUMN_NAME                     ,
       TAB_B.ITEM_NAME ITEM_NAME                         ,
       TAB_B.COL_GROUP_NAME COL_GROUP_NAME               ,
       TAB_B.DESCRIPTION DESCRIPTION                     ,
       TAB_B.INPUT_METHOD_ID INPUT_METHOD_ID             ,
       TAB_B.SENSITIVE_FLAG SENSITIVE_FLAG               ,
       TAB_B.MASTER_COL_FLAG MASTER_COL_FLAG             ,
       TAB_B.ACCESS_AUTH ACCESS_AUTH                     ,
       TAB_B.NOTE NOTE                                   ,
       TAB_B.DISUSE_FLAG DISUSE_FLAG                     ,
       TAB_B.LAST_UPDATE_TIMESTAMP LAST_UPDATE_TIMESTAMP ,
       TAB_B.LAST_UPDATE_USER LAST_UPDATE_USER
FROM G_CREATE_REFERENCE_ITEM TAB_B
WHERE TAB_B.DISUSE_FLAG = '0'
;


CREATE VIEW G_MENU_REFERENCE_ITEM_JNL AS 
SELECT TAB_A.JOURNAL_SEQ_NO                              ,
       TAB_A.JOURNAL_REG_DATETIME                        ,
       TAB_A.JOURNAL_ACTION_CLASS                        ,
       TAB_A.ITEM_ID  ITEM_ID                            ,
       TAB_A.LINK_ID  LINK_ID                            ,
       TAB_A.DISP_SEQ DISP_SEQ                           ,
       TAB_A.TABLE_NAME TABLE_NAME                       ,
       TAB_A.PRI_NAME PRI_NAME                           ,
       TAB_A.COLUMN_NAME COLUMN_NAME                     ,
       TAB_A.ITEM_NAME ITEM_NAME                         ,
       TAB_A.COL_GROUP_NAME COL_GROUP_NAME               ,
       TAB_A.DESCRIPTION DESCRIPTION                     ,
       TAB_A.INPUT_METHOD_ID INPUT_METHOD_ID             ,
       TAB_A.SENSITIVE_FLAG SENSITIVE_FLAG               ,
       TAB_A.MASTER_COL_FLAG MASTER_COL_FLAG             ,
       TAB_A.ACCESS_AUTH ACCESS_AUTH                     ,
       TAB_A.NOTE NOTE                                   ,
       TAB_A.DISUSE_FLAG DISUSE_FLAG                     ,
       TAB_A.LAST_UPDATE_TIMESTAMP LAST_UPDATE_TIMESTAMP ,
       TAB_A.LAST_UPDATE_USER LAST_UPDATE_USER
FROM  F_MENU_REFERENCE_ITEM_JNL TAB_A
WHERE TAB_A.DISUSE_FLAG = '0'
UNION ALL
SELECT TAB_B.JOURNAL_SEQ_NO                              ,
       TAB_B.JOURNAL_REG_DATETIME                        ,
       TAB_B.JOURNAL_ACTION_CLASS                        ,
       TAB_B.ITEM_ID  ITEM_ID                            ,
       TAB_B.LINK_ID  LINK_ID                            ,
       TAB_B.DISP_SEQ DISP_SEQ                           ,
       TAB_B.TABLE_NAME TABLE_NAME                       ,
       TAB_B.PRI_NAME PRI_NAME                           ,
       TAB_B.COLUMN_NAME COLUMN_NAME                     ,
       TAB_B.ITEM_NAME ITEM_NAME                         ,
       TAB_B.COL_GROUP_NAME COL_GROUP_NAME               ,
       TAB_B.DESCRIPTION DESCRIPTION                     ,
       TAB_B.INPUT_METHOD_ID INPUT_METHOD_ID             ,
       TAB_B.SENSITIVE_FLAG SENSITIVE_FLAG               ,
       TAB_B.MASTER_COL_FLAG MASTER_COL_FLAG             ,
       TAB_B.ACCESS_AUTH ACCESS_AUTH                     ,
       TAB_B.NOTE NOTE                                   ,
       TAB_B.DISUSE_FLAG DISUSE_FLAG                     ,
       TAB_B.LAST_UPDATE_TIMESTAMP LAST_UPDATE_TIMESTAMP ,
       TAB_B.LAST_UPDATE_USER LAST_UPDATE_USER
FROM G_CREATE_REFERENCE_ITEM_JNL TAB_B
WHERE TAB_B.DISUSE_FLAG = '0'
;INSERT INTO A_SEQUENCE (NAME,VALUE,MENU_ID,DISP_SEQ,NOTE,LAST_UPDATE_TIMESTAMP) VALUES('F_CREATE_MENU_INFO_RIC',1,'2100160001',2100610001,NULL,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'));

INSERT INTO A_SEQUENCE (NAME,VALUE,MENU_ID,DISP_SEQ,NOTE,LAST_UPDATE_TIMESTAMP) VALUES('F_CREATE_MENU_INFO_JSQ',1,'2100160001',2100610002,'履歴テーブル用',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'));

INSERT INTO A_SEQUENCE (NAME,VALUE,MENU_ID,DISP_SEQ,NOTE,LAST_UPDATE_TIMESTAMP) VALUES('F_CREATE_ITEM_INFO_RIC',1,'2100160002',2100610003,NULL,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'));

INSERT INTO A_SEQUENCE (NAME,VALUE,MENU_ID,DISP_SEQ,NOTE,LAST_UPDATE_TIMESTAMP) VALUES('F_CREATE_ITEM_INFO_JSQ',1,'2100160002',2100610004,'履歴テーブル用',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'));

INSERT INTO A_SEQUENCE (NAME,VALUE,MENU_ID,DISP_SEQ,NOTE,LAST_UPDATE_TIMESTAMP) VALUES('F_MENU_TABLE_LINK_RIC',1,'2100160005',2100610005,NULL,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'));

INSERT INTO A_SEQUENCE (NAME,VALUE,MENU_ID,DISP_SEQ,NOTE,LAST_UPDATE_TIMESTAMP) VALUES('F_MENU_TABLE_LINK_JSQ',1,'2100160005',2100610006,'履歴テーブル用',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'));

INSERT INTO A_SEQUENCE (NAME,VALUE,MENU_ID,DISP_SEQ,NOTE,LAST_UPDATE_TIMESTAMP) VALUES('F_CREATE_MENU_STATUS_RIC',1,'2100160004',2100610007,NULL,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'));

INSERT INTO A_SEQUENCE (NAME,VALUE,MENU_ID,DISP_SEQ,NOTE,LAST_UPDATE_TIMESTAMP) VALUES('F_CREATE_MENU_STATUS_JSQ',1,'2100160004',2100610008,'履歴テーブル用',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'));

INSERT INTO A_SEQUENCE (NAME,VALUE,MENU_ID,DISP_SEQ,NOTE,LAST_UPDATE_TIMESTAMP) VALUES('F_OTHER_MENU_LINK_RIC',1,'2100160007',2100610009,NULL,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'));

INSERT INTO A_SEQUENCE (NAME,VALUE,MENU_ID,DISP_SEQ,NOTE,LAST_UPDATE_TIMESTAMP) VALUES('F_OTHER_MENU_LINK_JSQ',1,'2100160007',2100610010,'履歴テーブル用',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'));

INSERT INTO A_SEQUENCE (NAME,VALUE,MENU_ID,DISP_SEQ,NOTE,LAST_UPDATE_TIMESTAMP) VALUES('F_COLUMN_GROUP_RIC',1,'2100160008',2100610011,NULL,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'));

INSERT INTO A_SEQUENCE (NAME,VALUE,MENU_ID,DISP_SEQ,NOTE,LAST_UPDATE_TIMESTAMP) VALUES('F_COLUMN_GROUP_JSQ',1,'2100160008',2100610012,'履歴テーブル用',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'));

INSERT INTO A_SEQUENCE (NAME,VALUE,MENU_ID,DISP_SEQ,NOTE,LAST_UPDATE_TIMESTAMP) VALUES('F_CONVERT_PARAM_INFO_RIC',1,'2100160009',2100610013,NULL,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'));

INSERT INTO A_SEQUENCE (NAME,VALUE,MENU_ID,DISP_SEQ,NOTE,LAST_UPDATE_TIMESTAMP) VALUES('F_CONVERT_PARAM_INFO_JSQ',1,'2100160009',2100610014,'履歴テーブル用',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'));

INSERT INTO A_SEQUENCE (NAME,VALUE,MENU_ID,DISP_SEQ,NOTE,LAST_UPDATE_TIMESTAMP) VALUES('F_COL_TO_ROW_MNG_RIC',1,'2100160010',2100610015,NULL,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'));

INSERT INTO A_SEQUENCE (NAME,VALUE,MENU_ID,DISP_SEQ,NOTE,LAST_UPDATE_TIMESTAMP) VALUES('F_COL_TO_ROW_MNG_JSQ',1,'2100160010',2100610016,'履歴テーブル用',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'));

INSERT INTO A_SEQUENCE (NAME,VALUE,MENU_ID,DISP_SEQ,NOTE,LAST_UPDATE_TIMESTAMP) VALUES('F_CM_STATUS_MASTER_RIC',5,NULL,2100690001,NULL,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'));

INSERT INTO A_SEQUENCE (NAME,VALUE,MENU_ID,DISP_SEQ,NOTE,LAST_UPDATE_TIMESTAMP) VALUES('F_CM_STATUS_MASTER_JSQ',5,NULL,2100690002,'履歴テーブル用',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'));

INSERT INTO A_SEQUENCE (NAME,VALUE,MENU_ID,DISP_SEQ,NOTE,LAST_UPDATE_TIMESTAMP) VALUES('F_PARAM_PURPOSE_RIC',3,NULL,2100690003,NULL,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'));

INSERT INTO A_SEQUENCE (NAME,VALUE,MENU_ID,DISP_SEQ,NOTE,LAST_UPDATE_TIMESTAMP) VALUES('F_PARAM_PURPOSE_JSQ',3,NULL,2100690004,'履歴テーブル用',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'));

INSERT INTO A_SEQUENCE (NAME,VALUE,MENU_ID,DISP_SEQ,NOTE,LAST_UPDATE_TIMESTAMP) VALUES('F_INPUT_METHOD_RIC',3,NULL,2100690005,NULL,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'));

INSERT INTO A_SEQUENCE (NAME,VALUE,MENU_ID,DISP_SEQ,NOTE,LAST_UPDATE_TIMESTAMP) VALUES('F_INPUT_METHOD_JSQ',3,NULL,2100690006,'履歴テーブル用',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'));


INSERT INTO A_MENU_GROUP_LIST (MENU_GROUP_ID,MENU_GROUP_NAME,MENU_GROUP_ICON,DISP_SEQ,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2100011601,'メニュー作成','sheet.png',51,'メニュー作成','0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_MENU_GROUP_LIST_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,MENU_GROUP_ID,MENU_GROUP_NAME,MENU_GROUP_ICON,DISP_SEQ,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(-160001,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',2100011601,'メニュー作成','sheet.png',51,'メニュー作成','0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_MENU_GROUP_LIST (MENU_GROUP_ID,MENU_GROUP_NAME,MENU_GROUP_ICON,DISP_SEQ,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2100011609,'縦メニューホスト分解用中間シート',NULL,59,'縦メニューホスト分解','0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_MENU_GROUP_LIST_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,MENU_GROUP_ID,MENU_GROUP_NAME,MENU_GROUP_ICON,DISP_SEQ,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(-160009,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',2100011609,'縦メニューホスト分解用中間シート',NULL,59,'縦メニューホスト分解','0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_MENU_GROUP_LIST (MENU_GROUP_ID,MENU_GROUP_NAME,MENU_GROUP_ICON,DISP_SEQ,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2100011610,'入力用','for-input.png',52,'メニュー作成','0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_MENU_GROUP_LIST_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,MENU_GROUP_ID,MENU_GROUP_NAME,MENU_GROUP_ICON,DISP_SEQ,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(-160010,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',2100011610,'入力用','for-input.png',52,'メニュー作成','0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_MENU_GROUP_LIST (MENU_GROUP_ID,MENU_GROUP_NAME,MENU_GROUP_ICON,DISP_SEQ,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2100011611,'代入値自動登録用','for-subst.png',53,'メニュー作成','0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_MENU_GROUP_LIST_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,MENU_GROUP_ID,MENU_GROUP_NAME,MENU_GROUP_ICON,DISP_SEQ,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(-160011,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',2100011611,'代入値自動登録用','for-subst.png',53,'メニュー作成','0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_MENU_GROUP_LIST (MENU_GROUP_ID,MENU_GROUP_NAME,MENU_GROUP_ICON,DISP_SEQ,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2100011612,'参照用','for-view.png',54,'メニュー作成','0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_MENU_GROUP_LIST_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,MENU_GROUP_ID,MENU_GROUP_NAME,MENU_GROUP_ICON,DISP_SEQ,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(-160012,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',2100011612,'参照用','for-view.png',54,'メニュー作成','0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_MENU_GROUP_LIST (MENU_GROUP_ID,MENU_GROUP_NAME,MENU_GROUP_ICON,DISP_SEQ,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2100011613,'縦横変換用中間シート',NULL,58,'メニュー作成','0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_MENU_GROUP_LIST_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,MENU_GROUP_ID,MENU_GROUP_NAME,MENU_GROUP_ICON,DISP_SEQ,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(-160013,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',2100011613,'縦横変換用中間シート',NULL,58,'メニュー作成','0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);

INSERT INTO A_MENU_LIST (MENU_ID,MENU_GROUP_ID,MENU_NAME,WEB_PRINT_LIMIT,WEB_PRINT_CONFIRM,XLS_PRINT_LIMIT,LOGIN_NECESSITY,SERVICE_STATUS,AUTOFILTER_FLG,INITIAL_FILTER_FLG,DISP_SEQ,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2100160001,2100011601,'メニュー定義一覧',NULL,NULL,NULL,1,0,1,2,2,'create_menu_info','0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_MENU_LIST_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,MENU_ID,MENU_GROUP_ID,MENU_NAME,WEB_PRINT_LIMIT,WEB_PRINT_CONFIRM,XLS_PRINT_LIMIT,LOGIN_NECESSITY,SERVICE_STATUS,AUTOFILTER_FLG,INITIAL_FILTER_FLG,DISP_SEQ,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(-160001,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',2100160001,2100011601,'メニュー定義一覧',NULL,NULL,NULL,1,0,1,2,2,'create_menu_info','0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_MENU_LIST (MENU_ID,MENU_GROUP_ID,MENU_NAME,WEB_PRINT_LIMIT,WEB_PRINT_CONFIRM,XLS_PRINT_LIMIT,LOGIN_NECESSITY,SERVICE_STATUS,AUTOFILTER_FLG,INITIAL_FILTER_FLG,DISP_SEQ,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2100160002,2100011601,'メニュー項目作成情報',NULL,NULL,NULL,1,0,1,2,4,'create_item_info','0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_MENU_LIST_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,MENU_ID,MENU_GROUP_ID,MENU_NAME,WEB_PRINT_LIMIT,WEB_PRINT_CONFIRM,XLS_PRINT_LIMIT,LOGIN_NECESSITY,SERVICE_STATUS,AUTOFILTER_FLG,INITIAL_FILTER_FLG,DISP_SEQ,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(-160002,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',2100160002,2100011601,'メニュー項目作成情報',NULL,NULL,NULL,1,0,1,2,4,'create_item_info','0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_MENU_LIST (MENU_ID,MENU_GROUP_ID,MENU_NAME,WEB_PRINT_LIMIT,WEB_PRINT_CONFIRM,XLS_PRINT_LIMIT,LOGIN_NECESSITY,SERVICE_STATUS,AUTOFILTER_FLG,INITIAL_FILTER_FLG,DISP_SEQ,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2100160003,2100011601,'メニュー作成実行',NULL,NULL,NULL,1,0,2,2,6,'create_menu','0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_MENU_LIST_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,MENU_ID,MENU_GROUP_ID,MENU_NAME,WEB_PRINT_LIMIT,WEB_PRINT_CONFIRM,XLS_PRINT_LIMIT,LOGIN_NECESSITY,SERVICE_STATUS,AUTOFILTER_FLG,INITIAL_FILTER_FLG,DISP_SEQ,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(-160003,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',2100160003,2100011601,'メニュー作成実行',NULL,NULL,NULL,1,0,2,2,6,'create_menu','0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_MENU_LIST (MENU_ID,MENU_GROUP_ID,MENU_NAME,WEB_PRINT_LIMIT,WEB_PRINT_CONFIRM,XLS_PRINT_LIMIT,LOGIN_NECESSITY,SERVICE_STATUS,AUTOFILTER_FLG,INITIAL_FILTER_FLG,DISP_SEQ,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2100160004,2100011601,'メニュー作成履歴',NULL,NULL,NULL,1,0,1,2,7,'create_menu_status','0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_MENU_LIST_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,MENU_ID,MENU_GROUP_ID,MENU_NAME,WEB_PRINT_LIMIT,WEB_PRINT_CONFIRM,XLS_PRINT_LIMIT,LOGIN_NECESSITY,SERVICE_STATUS,AUTOFILTER_FLG,INITIAL_FILTER_FLG,DISP_SEQ,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(-160004,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',2100160004,2100011601,'メニュー作成履歴',NULL,NULL,NULL,1,0,1,2,7,'create_menu_status','0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_MENU_LIST (MENU_ID,MENU_GROUP_ID,MENU_NAME,WEB_PRINT_LIMIT,WEB_PRINT_CONFIRM,XLS_PRINT_LIMIT,LOGIN_NECESSITY,SERVICE_STATUS,AUTOFILTER_FLG,INITIAL_FILTER_FLG,DISP_SEQ,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2100160005,2100011601,'メニュー・テーブル紐付',NULL,NULL,NULL,1,0,1,2,101,'menu_table_link','0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_MENU_LIST_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,MENU_ID,MENU_GROUP_ID,MENU_NAME,WEB_PRINT_LIMIT,WEB_PRINT_CONFIRM,XLS_PRINT_LIMIT,LOGIN_NECESSITY,SERVICE_STATUS,AUTOFILTER_FLG,INITIAL_FILTER_FLG,DISP_SEQ,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(-160005,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',2100160005,2100011601,'メニュー・テーブル紐付',NULL,NULL,NULL,1,0,1,2,101,'menu_table_link','0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_MENU_LIST (MENU_ID,MENU_GROUP_ID,MENU_NAME,WEB_PRINT_LIMIT,WEB_PRINT_CONFIRM,XLS_PRINT_LIMIT,LOGIN_NECESSITY,SERVICE_STATUS,AUTOFILTER_FLG,INITIAL_FILTER_FLG,DISP_SEQ,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2100160007,2100011601,'他メニュー連携',NULL,NULL,NULL,1,0,1,2,103,NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_MENU_LIST_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,MENU_ID,MENU_GROUP_ID,MENU_NAME,WEB_PRINT_LIMIT,WEB_PRINT_CONFIRM,XLS_PRINT_LIMIT,LOGIN_NECESSITY,SERVICE_STATUS,AUTOFILTER_FLG,INITIAL_FILTER_FLG,DISP_SEQ,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(-160007,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',2100160007,2100011601,'他メニュー連携',NULL,NULL,NULL,1,0,1,2,103,NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_MENU_LIST (MENU_ID,MENU_GROUP_ID,MENU_NAME,WEB_PRINT_LIMIT,WEB_PRINT_CONFIRM,XLS_PRINT_LIMIT,LOGIN_NECESSITY,SERVICE_STATUS,AUTOFILTER_FLG,INITIAL_FILTER_FLG,DISP_SEQ,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2100160008,2100011601,'カラムグループ管理',NULL,NULL,NULL,1,0,1,2,3,NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_MENU_LIST_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,MENU_ID,MENU_GROUP_ID,MENU_NAME,WEB_PRINT_LIMIT,WEB_PRINT_CONFIRM,XLS_PRINT_LIMIT,LOGIN_NECESSITY,SERVICE_STATUS,AUTOFILTER_FLG,INITIAL_FILTER_FLG,DISP_SEQ,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(-160008,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',2100160008,2100011601,'カラムグループ管理',NULL,NULL,NULL,1,0,1,2,3,NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_MENU_LIST (MENU_ID,MENU_GROUP_ID,MENU_NAME,WEB_PRINT_LIMIT,WEB_PRINT_CONFIRM,XLS_PRINT_LIMIT,LOGIN_NECESSITY,SERVICE_STATUS,AUTOFILTER_FLG,INITIAL_FILTER_FLG,DISP_SEQ,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2100160009,2100011601,'メニュー(縦)作成情報',NULL,NULL,NULL,1,0,1,2,5,NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_MENU_LIST_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,MENU_ID,MENU_GROUP_ID,MENU_NAME,WEB_PRINT_LIMIT,WEB_PRINT_CONFIRM,XLS_PRINT_LIMIT,LOGIN_NECESSITY,SERVICE_STATUS,AUTOFILTER_FLG,INITIAL_FILTER_FLG,DISP_SEQ,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(-160009,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',2100160009,2100011601,'メニュー(縦)作成情報',NULL,NULL,NULL,1,0,1,2,5,NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_MENU_LIST (MENU_ID,MENU_GROUP_ID,MENU_NAME,WEB_PRINT_LIMIT,WEB_PRINT_CONFIRM,XLS_PRINT_LIMIT,LOGIN_NECESSITY,SERVICE_STATUS,AUTOFILTER_FLG,INITIAL_FILTER_FLG,DISP_SEQ,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2100160010,2100011601,'メニュー縦横変換管理',NULL,NULL,NULL,1,0,1,2,104,NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_MENU_LIST_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,MENU_ID,MENU_GROUP_ID,MENU_NAME,WEB_PRINT_LIMIT,WEB_PRINT_CONFIRM,XLS_PRINT_LIMIT,LOGIN_NECESSITY,SERVICE_STATUS,AUTOFILTER_FLG,INITIAL_FILTER_FLG,DISP_SEQ,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(-160010,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',2100160010,2100011601,'メニュー縦横変換管理',NULL,NULL,NULL,1,0,1,2,104,NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_MENU_LIST (MENU_ID,MENU_GROUP_ID,MENU_NAME,WEB_PRINT_LIMIT,WEB_PRINT_CONFIRM,XLS_PRINT_LIMIT,LOGIN_NECESSITY,SERVICE_STATUS,AUTOFILTER_FLG,INITIAL_FILTER_FLG,DISP_SEQ,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2100160011,2100011601,'メニュー定義/作成',NULL,NULL,NULL,1,0,1,2,1,NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_MENU_LIST_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,MENU_ID,MENU_GROUP_ID,MENU_NAME,WEB_PRINT_LIMIT,WEB_PRINT_CONFIRM,XLS_PRINT_LIMIT,LOGIN_NECESSITY,SERVICE_STATUS,AUTOFILTER_FLG,INITIAL_FILTER_FLG,DISP_SEQ,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(-160011,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',2100160011,2100011601,'メニュー定義/作成',NULL,NULL,NULL,1,0,1,2,1,NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_MENU_LIST (MENU_ID,MENU_GROUP_ID,MENU_NAME,WEB_PRINT_LIMIT,WEB_PRINT_CONFIRM,XLS_PRINT_LIMIT,LOGIN_NECESSITY,SERVICE_STATUS,AUTOFILTER_FLG,INITIAL_FILTER_FLG,DISP_SEQ,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2100160012,2100011601,'参照項目情報',NULL,NULL,NULL,1,0,1,2,105,NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_MENU_LIST_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,MENU_ID,MENU_GROUP_ID,MENU_NAME,WEB_PRINT_LIMIT,WEB_PRINT_CONFIRM,XLS_PRINT_LIMIT,LOGIN_NECESSITY,SERVICE_STATUS,AUTOFILTER_FLG,INITIAL_FILTER_FLG,DISP_SEQ,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(-160012,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',2100160012,2100011601,'参照項目情報',NULL,NULL,NULL,1,0,1,2,105,NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);

INSERT INTO A_ACCOUNT_LIST (USER_ID,USERNAME,PASSWORD,USERNAME_JP,MAIL_ADDRESS,AUTH_TYPE,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(-101601,'m01','5ebbc37e034d6874a2af59eb04beaa52','メニュー作成機能','sample@xxx.bbb.ccc',NULL,NULL,'H',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_ACCOUNT_LIST_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,USER_ID,USERNAME,PASSWORD,USERNAME_JP,MAIL_ADDRESS,AUTH_TYPE,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(-101601,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',-101601,'m01','5ebbc37e034d6874a2af59eb04beaa52','メニュー作成機能','sample@xxx.bbb.ccc',NULL,NULL,'H',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_ACCOUNT_LIST (USER_ID,USERNAME,PASSWORD,USERNAME_JP,MAIL_ADDRESS,AUTH_TYPE,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(-101603,'m03','5ebbc37e034d6874a2af59eb04beaa52','他メニュー連携メニュー更新機能','sample@xxx.bbb.ccc',NULL,NULL,'H',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_ACCOUNT_LIST_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,USER_ID,USERNAME,PASSWORD,USERNAME_JP,MAIL_ADDRESS,AUTH_TYPE,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(-101603,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',-101603,'m03','5ebbc37e034d6874a2af59eb04beaa52','他メニュー連携メニュー更新機能','sample@xxx.bbb.ccc',NULL,NULL,'H',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_ACCOUNT_LIST (USER_ID,USERNAME,PASSWORD,USERNAME_JP,MAIL_ADDRESS,AUTH_TYPE,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(-101604,'m04','5ebbc37e034d6874a2af59eb04beaa52','メニュー縦横変換機能','sample@xxx.bbb.ccc',NULL,NULL,'H',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_ACCOUNT_LIST_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,USER_ID,USERNAME,PASSWORD,USERNAME_JP,MAIL_ADDRESS,AUTH_TYPE,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(-101604,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',-101604,'m04','5ebbc37e034d6874a2af59eb04beaa52','メニュー縦横変換機能','sample@xxx.bbb.ccc',NULL,NULL,'H',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);

INSERT INTO A_ROLE_MENU_LINK_LIST (LINK_ID,ROLE_ID,MENU_ID,PRIVILEGE,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2100160001,1,2100160001,1,'システム管理者','0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_ROLE_MENU_LINK_LIST_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,LINK_ID,ROLE_ID,MENU_ID,PRIVILEGE,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(-160001,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',2100160001,1,2100160001,1,'システム管理者','0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_ROLE_MENU_LINK_LIST (LINK_ID,ROLE_ID,MENU_ID,PRIVILEGE,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2100160002,1,2100160002,1,'システム管理者','1',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_ROLE_MENU_LINK_LIST_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,LINK_ID,ROLE_ID,MENU_ID,PRIVILEGE,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(-160002,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',2100160002,1,2100160002,1,'システム管理者','1',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_ROLE_MENU_LINK_LIST (LINK_ID,ROLE_ID,MENU_ID,PRIVILEGE,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2100160003,1,2100160003,2,'システム管理者','1',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_ROLE_MENU_LINK_LIST_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,LINK_ID,ROLE_ID,MENU_ID,PRIVILEGE,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(-160003,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',2100160003,1,2100160003,2,'システム管理者','1',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_ROLE_MENU_LINK_LIST (LINK_ID,ROLE_ID,MENU_ID,PRIVILEGE,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2100160004,1,2100160004,2,'システム管理者','0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_ROLE_MENU_LINK_LIST_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,LINK_ID,ROLE_ID,MENU_ID,PRIVILEGE,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(-160004,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',2100160004,1,2100160004,2,'システム管理者','0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_ROLE_MENU_LINK_LIST (LINK_ID,ROLE_ID,MENU_ID,PRIVILEGE,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2100160005,1,2100160005,2,'システム管理者','1',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_ROLE_MENU_LINK_LIST_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,LINK_ID,ROLE_ID,MENU_ID,PRIVILEGE,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(-160005,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',2100160005,1,2100160005,2,'システム管理者','1',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_ROLE_MENU_LINK_LIST (LINK_ID,ROLE_ID,MENU_ID,PRIVILEGE,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2100160007,1,2100160007,2,'システム管理者','1',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_ROLE_MENU_LINK_LIST_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,LINK_ID,ROLE_ID,MENU_ID,PRIVILEGE,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(-160007,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',2100160007,1,2100160007,2,'システム管理者','1',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_ROLE_MENU_LINK_LIST (LINK_ID,ROLE_ID,MENU_ID,PRIVILEGE,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2100160008,1,2100160008,1,'システム管理者','1',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_ROLE_MENU_LINK_LIST_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,LINK_ID,ROLE_ID,MENU_ID,PRIVILEGE,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(-160008,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',2100160008,1,2100160008,1,'システム管理者','1',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_ROLE_MENU_LINK_LIST (LINK_ID,ROLE_ID,MENU_ID,PRIVILEGE,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2100160009,1,2100160009,1,'システム管理者','1',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_ROLE_MENU_LINK_LIST_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,LINK_ID,ROLE_ID,MENU_ID,PRIVILEGE,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(-160009,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',2100160009,1,2100160009,1,'システム管理者','1',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_ROLE_MENU_LINK_LIST (LINK_ID,ROLE_ID,MENU_ID,PRIVILEGE,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2100160010,1,2100160010,2,'システム管理者','1',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_ROLE_MENU_LINK_LIST_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,LINK_ID,ROLE_ID,MENU_ID,PRIVILEGE,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(-160010,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',2100160010,1,2100160010,2,'システム管理者','1',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_ROLE_MENU_LINK_LIST (LINK_ID,ROLE_ID,MENU_ID,PRIVILEGE,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2100160011,1,2100160011,1,'システム管理者','0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_ROLE_MENU_LINK_LIST_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,LINK_ID,ROLE_ID,MENU_ID,PRIVILEGE,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(-160011,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',2100160011,1,2100160011,1,'システム管理者','0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_ROLE_MENU_LINK_LIST (LINK_ID,ROLE_ID,MENU_ID,PRIVILEGE,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2100160012,1,2100160012,2,'システム管理者','1',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO A_ROLE_MENU_LINK_LIST_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,LINK_ID,ROLE_ID,MENU_ID,PRIVILEGE,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(-160012,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',2100160012,1,2100160012,2,'システム管理者','1',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);

INSERT INTO F_CM_STATUS_MASTER (STATUS_ID,STATUS_NAME,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(1,'未実行',NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_CM_STATUS_MASTER_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,STATUS_ID,STATUS_NAME,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(1,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',1,'未実行',NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_CM_STATUS_MASTER (STATUS_ID,STATUS_NAME,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2,'実行中',NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_CM_STATUS_MASTER_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,STATUS_ID,STATUS_NAME,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',2,'実行中',NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_CM_STATUS_MASTER (STATUS_ID,STATUS_NAME,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(3,'完了',NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_CM_STATUS_MASTER_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,STATUS_ID,STATUS_NAME,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(3,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',3,'完了',NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_CM_STATUS_MASTER (STATUS_ID,STATUS_NAME,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(4,'完了(異常)',NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_CM_STATUS_MASTER_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,STATUS_ID,STATUS_NAME,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(4,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',4,'完了(異常)',NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);

INSERT INTO F_PARAM_PURPOSE (PURPOSE_ID,PURPOSE_NAME,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(1,'ホスト用',NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_PARAM_PURPOSE_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,PURPOSE_ID,PURPOSE_NAME,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(1,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',1,'ホスト用',NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_PARAM_PURPOSE (PURPOSE_ID,PURPOSE_NAME,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2,'ホストグループ用',NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_PARAM_PURPOSE_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,PURPOSE_ID,PURPOSE_NAME,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',2,'ホストグループ用',NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);

INSERT INTO F_INPUT_METHOD (INPUT_METHOD_ID,INPUT_METHOD_NAME,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(1,'文字列(単一行)',NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_INPUT_METHOD_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,INPUT_METHOD_ID,INPUT_METHOD_NAME,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(1,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',1,'文字列(単一行)',NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_INPUT_METHOD (INPUT_METHOD_ID,INPUT_METHOD_NAME,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2,'文字列(複数行)',NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_INPUT_METHOD_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,INPUT_METHOD_ID,INPUT_METHOD_NAME,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',2,'文字列(複数行)',NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_INPUT_METHOD (INPUT_METHOD_ID,INPUT_METHOD_NAME,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(3,'整数',NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_INPUT_METHOD_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,INPUT_METHOD_ID,INPUT_METHOD_NAME,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(3,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',3,'整数',NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_INPUT_METHOD (INPUT_METHOD_ID,INPUT_METHOD_NAME,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(4,'小数',NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_INPUT_METHOD_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,INPUT_METHOD_ID,INPUT_METHOD_NAME,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(4,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',4,'小数',NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_INPUT_METHOD (INPUT_METHOD_ID,INPUT_METHOD_NAME,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(5,'日時',NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_INPUT_METHOD_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,INPUT_METHOD_ID,INPUT_METHOD_NAME,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(5,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',5,'日時',NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_INPUT_METHOD (INPUT_METHOD_ID,INPUT_METHOD_NAME,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(6,'日付',NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_INPUT_METHOD_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,INPUT_METHOD_ID,INPUT_METHOD_NAME,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(6,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',6,'日付',NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_INPUT_METHOD (INPUT_METHOD_ID,INPUT_METHOD_NAME,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(7,'プルダウン選択',NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_INPUT_METHOD_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,INPUT_METHOD_ID,INPUT_METHOD_NAME,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(7,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',7,'プルダウン選択',NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_INPUT_METHOD (INPUT_METHOD_ID,INPUT_METHOD_NAME,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(8,'パスワード',NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_INPUT_METHOD_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,INPUT_METHOD_ID,INPUT_METHOD_NAME,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(8,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',8,'パスワード',NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_INPUT_METHOD (INPUT_METHOD_ID,INPUT_METHOD_NAME,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(9,'ファイルアップロード',NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_INPUT_METHOD_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,INPUT_METHOD_ID,INPUT_METHOD_NAME,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(9,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',9,'ファイルアップロード',NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_INPUT_METHOD (INPUT_METHOD_ID,INPUT_METHOD_NAME,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(10,'リンク',NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_INPUT_METHOD_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,INPUT_METHOD_ID,INPUT_METHOD_NAME,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(10,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',10,'リンク',NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);

INSERT INTO F_OTHER_MENU_LINK (LINK_ID,MENU_ID,COLUMN_DISP_NAME,TABLE_NAME,PRI_NAME,COLUMN_NAME,COLUMN_TYPE,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2000000001,2100000303,'ホスト名','C_STM_LIST','SYSTEM_ID','HOSTNAME',1,NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_OTHER_MENU_LINK_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,LINK_ID,MENU_ID,COLUMN_DISP_NAME,TABLE_NAME,PRI_NAME,COLUMN_NAME,COLUMN_TYPE,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2000000001,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',2000000001,2100000303,'ホスト名','C_STM_LIST','SYSTEM_ID','HOSTNAME',1,NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_OTHER_MENU_LINK (LINK_ID,MENU_ID,COLUMN_DISP_NAME,TABLE_NAME,PRI_NAME,COLUMN_NAME,COLUMN_TYPE,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2000000002,2100000303,'IPアドレス','C_STM_LIST','SYSTEM_ID','IP_ADDRESS',1,NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_OTHER_MENU_LINK_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,LINK_ID,MENU_ID,COLUMN_DISP_NAME,TABLE_NAME,PRI_NAME,COLUMN_NAME,COLUMN_TYPE,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2000000002,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',2000000002,2100000303,'IPアドレス','C_STM_LIST','SYSTEM_ID','IP_ADDRESS',1,NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_OTHER_MENU_LINK (LINK_ID,MENU_ID,COLUMN_DISP_NAME,TABLE_NAME,PRI_NAME,COLUMN_NAME,COLUMN_TYPE,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2000000005,2100000205,'メニュー名称','D_MENU_LIST','MENU_ID','MENU_PULLDOWN',1,NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_OTHER_MENU_LINK_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,LINK_ID,MENU_ID,COLUMN_DISP_NAME,TABLE_NAME,PRI_NAME,COLUMN_NAME,COLUMN_TYPE,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2000000005,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',2000000005,2100000205,'メニュー名称','D_MENU_LIST','MENU_ID','MENU_PULLDOWN',1,NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_OTHER_MENU_LINK (LINK_ID,MENU_ID,COLUMN_DISP_NAME,TABLE_NAME,PRI_NAME,COLUMN_NAME,COLUMN_TYPE,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2000000006,2100000208,'ログインID','A_ACCOUNT_LIST','USER_ID','USERNAME',1,NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_OTHER_MENU_LINK_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,LINK_ID,MENU_ID,COLUMN_DISP_NAME,TABLE_NAME,PRI_NAME,COLUMN_NAME,COLUMN_TYPE,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2000000006,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',2000000006,2100000208,'ログインID','A_ACCOUNT_LIST','USER_ID','USERNAME',1,NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_OTHER_MENU_LINK (LINK_ID,MENU_ID,COLUMN_DISP_NAME,TABLE_NAME,PRI_NAME,COLUMN_NAME,COLUMN_TYPE,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2000000007,2100000304,'オペレーション名','C_OPERATION_LIST','OPERATION_NO_UAPK','OPERATION_NAME',1,NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_OTHER_MENU_LINK_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,LINK_ID,MENU_ID,COLUMN_DISP_NAME,TABLE_NAME,PRI_NAME,COLUMN_NAME,COLUMN_TYPE,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2000000007,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',2000000007,2100000304,'オペレーション名','C_OPERATION_LIST','OPERATION_NO_UAPK','OPERATION_NAME',1,NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_OTHER_MENU_LINK (LINK_ID,MENU_ID,COLUMN_DISP_NAME,TABLE_NAME,PRI_NAME,COLUMN_NAME,COLUMN_TYPE,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2000000008,2100000305,'Movement名','C_PATTERN_PER_ORCH','PATTERN_ID','PATTERN_NAME',1,NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_OTHER_MENU_LINK_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,LINK_ID,MENU_ID,COLUMN_DISP_NAME,TABLE_NAME,PRI_NAME,COLUMN_NAME,COLUMN_TYPE,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2000000008,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',2000000008,2100000305,'Movement名','C_PATTERN_PER_ORCH','PATTERN_ID','PATTERN_NAME',1,NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_OTHER_MENU_LINK (LINK_ID,MENU_ID,COLUMN_DISP_NAME,TABLE_NAME,PRI_NAME,COLUMN_NAME,COLUMN_TYPE,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2000000009,2100000307,'Symphony名称','C_SYMPHONY_CLASS_MNG','SYMPHONY_CLASS_NO','SYMPHONY_NAME',1,NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_OTHER_MENU_LINK_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,LINK_ID,MENU_ID,COLUMN_DISP_NAME,TABLE_NAME,PRI_NAME,COLUMN_NAME,COLUMN_TYPE,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2000000009,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',2000000009,2100000307,'Symphony名称','C_SYMPHONY_CLASS_MNG','SYMPHONY_CLASS_NO','SYMPHONY_NAME',1,NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_OTHER_MENU_LINK (LINK_ID,MENU_ID,COLUMN_DISP_NAME,TABLE_NAME,PRI_NAME,COLUMN_NAME,COLUMN_TYPE,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2000000010,2100180002,'Conductor名称','C_CONDUCTOR_EDIT_CLASS_MNG','CONDUCTOR_CLASS_NO','CONDUCTOR_NAME',1,NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_OTHER_MENU_LINK_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,LINK_ID,MENU_ID,COLUMN_DISP_NAME,TABLE_NAME,PRI_NAME,COLUMN_NAME,COLUMN_TYPE,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2000000010,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',2000000010,2100180002,'Conductor名称','C_CONDUCTOR_EDIT_CLASS_MNG','CONDUCTOR_CLASS_NO','CONDUCTOR_NAME',1,NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);

INSERT INTO F_MENU_REFERENCE_ITEM (ITEM_ID,LINK_ID,DISP_SEQ,TABLE_NAME,PRI_NAME,COLUMN_NAME,ITEM_NAME,COL_GROUP_NAME,DESCRIPTION,INPUT_METHOD_ID,SENSITIVE_FLAG,MASTER_COL_FLAG,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2000000001,2000000005,0,'A_MENU_LIST','MENU_ID','MENU_ID','メニューID',NULL,NULL,1,1,NULL,NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_MENU_REFERENCE_ITEM_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,ITEM_ID,LINK_ID,DISP_SEQ,TABLE_NAME,PRI_NAME,COLUMN_NAME,ITEM_NAME,COL_GROUP_NAME,DESCRIPTION,INPUT_METHOD_ID,SENSITIVE_FLAG,MASTER_COL_FLAG,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2000000001,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',2000000001,2000000005,0,'A_MENU_LIST','MENU_ID','MENU_ID','メニューID',NULL,NULL,1,1,NULL,NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_MENU_REFERENCE_ITEM (ITEM_ID,LINK_ID,DISP_SEQ,TABLE_NAME,PRI_NAME,COLUMN_NAME,ITEM_NAME,COL_GROUP_NAME,DESCRIPTION,INPUT_METHOD_ID,SENSITIVE_FLAG,MASTER_COL_FLAG,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2000000003,2000000006,0,'A_ACCOUNT_LIST','USER_ID','MAIL_ADDRESS','メールアドレス',NULL,NULL,1,1,NULL,NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_MENU_REFERENCE_ITEM_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,ITEM_ID,LINK_ID,DISP_SEQ,TABLE_NAME,PRI_NAME,COLUMN_NAME,ITEM_NAME,COL_GROUP_NAME,DESCRIPTION,INPUT_METHOD_ID,SENSITIVE_FLAG,MASTER_COL_FLAG,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2000000003,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',2000000003,2000000006,0,'A_ACCOUNT_LIST','USER_ID','MAIL_ADDRESS','メールアドレス',NULL,NULL,1,1,NULL,NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_MENU_REFERENCE_ITEM (ITEM_ID,LINK_ID,DISP_SEQ,TABLE_NAME,PRI_NAME,COLUMN_NAME,ITEM_NAME,COL_GROUP_NAME,DESCRIPTION,INPUT_METHOD_ID,SENSITIVE_FLAG,MASTER_COL_FLAG,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2000000004,2000000001,0,'C_STM_LIST','SYSTEM_ID','IP_ADDRESS','IPアドレス',NULL,NULL,1,1,NULL,NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_MENU_REFERENCE_ITEM_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,ITEM_ID,LINK_ID,DISP_SEQ,TABLE_NAME,PRI_NAME,COLUMN_NAME,ITEM_NAME,COL_GROUP_NAME,DESCRIPTION,INPUT_METHOD_ID,SENSITIVE_FLAG,MASTER_COL_FLAG,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2000000004,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',2000000004,2000000001,0,'C_STM_LIST','SYSTEM_ID','IP_ADDRESS','IPアドレス',NULL,NULL,1,1,NULL,NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_MENU_REFERENCE_ITEM (ITEM_ID,LINK_ID,DISP_SEQ,TABLE_NAME,PRI_NAME,COLUMN_NAME,ITEM_NAME,COL_GROUP_NAME,DESCRIPTION,INPUT_METHOD_ID,SENSITIVE_FLAG,MASTER_COL_FLAG,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2000000005,2000000001,1,'C_STM_LIST','SYSTEM_ID','LOGIN_USER','ログインユーザID',NULL,NULL,1,1,NULL,NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_MENU_REFERENCE_ITEM_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,ITEM_ID,LINK_ID,DISP_SEQ,TABLE_NAME,PRI_NAME,COLUMN_NAME,ITEM_NAME,COL_GROUP_NAME,DESCRIPTION,INPUT_METHOD_ID,SENSITIVE_FLAG,MASTER_COL_FLAG,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2000000005,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',2000000005,2000000001,1,'C_STM_LIST','SYSTEM_ID','LOGIN_USER','ログインユーザID',NULL,NULL,1,1,NULL,NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_MENU_REFERENCE_ITEM (ITEM_ID,LINK_ID,DISP_SEQ,TABLE_NAME,PRI_NAME,COLUMN_NAME,ITEM_NAME,COL_GROUP_NAME,DESCRIPTION,INPUT_METHOD_ID,SENSITIVE_FLAG,MASTER_COL_FLAG,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2000000006,2000000001,2,'C_STM_LIST','SYSTEM_ID','LOGIN_PW','ログインパスワード',NULL,NULL,8,2,NULL,NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);
INSERT INTO F_MENU_REFERENCE_ITEM_JNL (JOURNAL_SEQ_NO,JOURNAL_REG_DATETIME,JOURNAL_ACTION_CLASS,ITEM_ID,LINK_ID,DISP_SEQ,TABLE_NAME,PRI_NAME,COLUMN_NAME,ITEM_NAME,COL_GROUP_NAME,DESCRIPTION,INPUT_METHOD_ID,SENSITIVE_FLAG,MASTER_COL_FLAG,NOTE,DISUSE_FLAG,LAST_UPDATE_TIMESTAMP,LAST_UPDATE_USER) VALUES(2000000006,STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),'INSERT',2000000006,2000000001,2,'C_STM_LIST','SYSTEM_ID','LOGIN_PW','ログインパスワード',NULL,NULL,8,2,NULL,NULL,'0',STR_TO_DATE('2015/04/01 10:00:00.000000','%Y/%m/%d %H:%i:%s.%f'),1);


COMMIT;
