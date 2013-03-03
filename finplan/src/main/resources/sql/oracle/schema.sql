drop table t_task;
drop table t_user;
drop table t_ba_code;

create table t_task (
	id number(19,0),
	title varchar2(128) not null,
	description varchar2(255),
	user_id bigint not null,
    primary key (id)
);

create table t_user (
	id number(19,0),
	login_name varchar2(64) not null unique,
	name varchar2(64) not null,
	password varchar2(255) not null,
	salt varchar2(64) not null,
	roles varchar2(255) not null,
	regiser_date date not null,
	primary key (id)
);

CREATE TABLE T_BA_CODE
(
  CODE_ID                number(19,0)     
  CODE_CATEGORY          NVARCHAR2(128)         NOT NULL,
  CODE                   NVARCHAR2(50)          NOT NULL,
  LOWERED_CODE_CATEGORY  NVARCHAR2(128)         NOT NULL,
  LOWERED_CODE           NVARCHAR2(50)          NOT NULL,
  CODE_DESC              NVARCHAR2(256),
  CODE_REMARKS           NVARCHAR2(256),
  EFFECTIVE_START_DATE   DATE                   NOT NULL,
  EFFECTIVE_END_DATE     DATE                   NOT NULL,
  CODE_SEQ               NUMBER(9),
  IS_DELETED             VARCHAR2(50 BYTE)      DEFAULT '0'                   NOT NULL,
  VERSION_NO             NUMBER(9)              DEFAULT 1                     NOT NULL,
  TRANSACTION_ID         NVARCHAR2(50)          DEFAULT '1'                   NOT NULL,
  CREATED_BY             NVARCHAR2(256)         DEFAULT 'SYSTEM'              NOT NULL,
  CREATED_TIME           TIMESTAMP(6)           DEFAULT  SYSDATE              NOT NULL,
  LAST_UPDATED_BY        NVARCHAR2(256)         DEFAULT 'SYSTEM'              NOT NULL,
  LAST_UPDATED_TIME      TIMESTAMP(6)           DEFAULT  SYSDATE              NOT NULL,
  primary key (CODE_ID)
);

DROP TABLE T_BIZ_BUDGET CASCADE CONSTRAINTS;
DROP TABLE T_BIZ_GOAL CASCADE CONSTRAINTS;
DROP TABLE T_BIZ_RESOURCE CASCADE CONSTRAINTS;

CREATE TABLE T_BIZ_BUDGET
(
	BIZ_BUDGET_ID          LONG NOT NULL,
	BIZ_BUDGET_TYPE        CHAR(1) NOT NULL,
	BIZ_BUDGET_CATE        NVARCHAR2(50) NOT NULL,
	BIZ_BUDGET_SUB_CATE    NVARCHAR2(50) NOT NULL,
	BIZ_BUDGET_TARGET_AMT  NUMBER(16,2) NOT NULL,
	BIZ_BUDGET_ACTUAL_AMT  NUMBER(16,2) NOT NULL,
	BIZ_BUDGET_YEAR        CHAR(4) NOT NULL,
	BIZ_BUDGET_MONTH       CHAR(4) NOT NULL,
	TRANSACTION_ID         NVARCHAR2(50) NOT NULL,
	VERSION_NO             NUMBER(9) NOT NULL,
	PRIMARY KEY (BIZ_BUDGET_ID)
);


CREATE TABLE T_BIZ_GOAL
(
	BIZ_GOAL_ID             LONG NOT NULL,
	BIZ_GOAL_TYPE           CHAR(1) NOT NULL,
	BIZ_GOAL_NEED_TYPE      CHAR(1) NOT NULL,
	BIZ_GOAL_CATEGORY       VARCHAR2(50) NOT NULL,
	BIZ_GOAL_EXPENSE_PRICE  NUMBER(16,2) NOT NULL,
	BIZ_GOAL_INFLATION      NUMBER(3,2),
	BIZ_GOAL_EXPENSE_DESC   NVARCHAR2(300),
	BIZ_GOAL_EFF_DATE       DATE NOT NULL,
	TRANSACTION_ID          NVARCHAR2(50) NOT NULL,
	VERSION_NO              NUMBER(9) NOT NULL,
	PRIMARY KEY (BIZ_GOAL_ID)
);


CREATE TABLE T_BIZ_RESOURCE
(
	BIZ_RESOURCE_ID       LONG NOT NULL,
	BIZ_RESOURCE_TYPE     CHAR(1) NOT NULL,
	BIZ_RESOURCE_CATE     NVARCHAR2(50) NOT NULL,
	BIZ_RESOURCE_AMT      NUMBER(16,2) NOT NULL,
	BIZ_RESOURCE_REMARKS  NVARCHAR2(255),
	TRANSACTION_ID        NVARCHAR2(50) NOT NULL,
	VERSION_NO            NUMBER(9) NOT NULL,
	PRIMARY KEY (BIZ_RESOURCE_ID)
);

create sequence t_seq_task start with 100 increment by 20;
create sequence t_seq_user start with 100 increment by 20;
create sequence t_seq_ba_code start with 100 increment by 20;
create sequence t_seq_biz_budget start with 100 increment by 20;
create sequence t_seq_biz_goal start with 100 increment by 20;
create sequence t_seq_biz_resource start with 100 increment by 20;