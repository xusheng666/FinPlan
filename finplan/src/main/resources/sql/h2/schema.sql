drop table if exists t_task;
drop table if exists t_user;
drop table if exists t_ba_code;
DROP TABLE if exists t_biz_budget;
DROP TABLE if exists t_biz_goal;
DROP TABLE if exists t_biz_resource;

create table t_task (
	id bigint generated by default as identity,
	title varchar(128) not null,
	description varchar(255),
	user_id bigint not null,
    primary key (id)
);

create table t_user (
	id bigint generated by default as identity,
	login_name varchar(64) not null unique,
	name varchar(64) not null,
	password varchar(255) not null,
	salt varchar(64) not null,
	roles varchar(255) not null,
	register_date timestamp not null,
	primary key (id)
);

create table t_ba_code
(
  id                bigint generated by default as identity,
  code_category          varchar(128)         not null,
  code                   varchar(50)          not null,
  code_desc              varchar(256),
  code_remarks           varchar(256),
  effective_start_date   date,
  effective_end_date     date,
  code_seq               int,
  primary key (id)
);

create table t_biz_budget
(
	id          bigint generated by default as identity,
	biz_budget_type        char(1) not null,
	biz_budget_cate        varchar(50) not null,
	biz_budget_sub_cate    varchar(50) not null,
	biz_budget_target_amt  decimal(16,2) not null,
	biz_budget_actual_amt  decimal(16,2) not null,
	biz_budget_year        char(4) not null,
	biz_budget_month       char(4) not null,
	transaction_id         varchar(50) not null,
	version_no             int not null,
	primary key (id)
);


create table t_biz_goal
(
	id             bigint generated by default as identity,
	biz_goal_type           char(1) not null,
	biz_goal_need_type      char(1) not null,
	biz_goal_category       varchar(50) not null,
	biz_goal_expense_price  decimal(16,2) not null,
	biz_goal_inflation      decimal(3,2),
	biz_goal_expense_desc   varchar(300),
	biz_goal_eff_date       date not null,
	transaction_id          varchar(50) not null,
	version_no              int not null,
	primary key (id)
);


create table t_biz_resource
(
	id       bigint generated by default as identity,
	biz_resource_type     char(1) not null,
	biz_resource_cate     varchar(50) not null,
	biz_resource_amt      decimal(16,2) not null,
	biz_resource_remarks  varchar(255),
	transaction_id        varchar(50) not null,
	version_no            int not null,
	primary key (id)
);
