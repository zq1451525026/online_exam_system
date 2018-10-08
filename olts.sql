--创建表空间, 最好创建到oracle安装的目录下，避免不小删除了。
create tablespace lqolts
datafile 'D:\oracle\datafiles\lq_olts.dbf'
size 50M
autoextend on;


/*
创建用户并为用户分配表空间
新创建的用户开始是没有登录到Oracle的权限，要用系统管理员sys给lqolts授权
*/
create user olts
identified by olts
default tablespace lqolts;

grant connect,resource to olts;
--grant create table,create any view,create procedure to lqolts;

--修改用户密码
--alter user lqolts identified by olts;

--删除用户, cascade级联删除该用户创建的数据库对象
--drop user olts cascade;

-------------------------------------------------------------------------------------

--创建用户表 序列
--drop sequence olts_users_seq;
create sequence olts_users_seq
start with 1;

--用户表
select * from olts_users;
create table olts_users(
  id integer not null primary key,
  stu_no char(18),					 --学号
  id_card_no char(18) not null unique, --身份证号
  user_name varchar(20) not null,  --用户名
  pass_word varchar2(10) not null, --密码
  mobile varchar2(11), 			--手机
  home_tel varchar(12),			--家庭电话
  home_addr varchar(50), 			--家庭地址
  sch_addr varchar(50), 			--学校地址
  qq char(15),
  email varchar2(50),
  user_type number(2), 			--用户类型（1.老师， 9.管理员，学生为空）
  gender varchar2(5),            	--性别
  birthday date,                  --出生日期
  nation_place varchar2(20),      --籍贯
  marjor varchar2(30),            --专业
  edu_Background varchar2(20),  	--最高学历
  graduate_School varchar2(20)	--毕业院校
)

/*
insert into olts_users(id,stu_no,id_card_no,user_name,pass_word,user_type)
       values(olts_users_seq.nextval,'999999999999999999','460200197801151393','james','james',1);
insert into olts_users(id,stu_no,id_card_no,user_name,pass_word)
       values(olts_users_seq.nextval,'111111111111111111','460200197801151394','student','student');
commit;
*/



--drop sequence course_seq;
create sequence course_seq
start with 1;

--课程分类
create table courses(
  id integer not null primary key,
  course_name varchar2(20) not null
)
insert into courses values(course_seq.nextval,'JavaSE');
insert into courses values(course_seq.nextval,'HTML');
insert into courses values(course_seq.nextval,'Javascript');
insert into courses values(course_seq.nextval,'CSS');
insert into courses values(course_seq.nextval,'Oracle');
insert into courses values(course_seq.nextval,'JDBC');
insert into courses values(course_seq.nextval,'JSP');
insert into courses values(course_seq.nextval,'Servlet');
insert into courses values(course_seq.nextval,'JUnit');
insert into courses values(course_seq.nextval,'Struts 1/2');
insert into courses values(course_seq.nextval,'Hibernate');
insert into courses values(course_seq.nextval,'ibatis/MyBatis');
insert into courses values(course_seq.nextval,'Spring');
insert into courses values(course_seq.nextval,'Spring MVC');
insert into courses values(course_seq.nextval,'jQuery');
insert into courses values(course_seq.nextval,'easyui');
insert into courses values(course_seq.nextval,'AJAX');
insert into courses values(course_seq.nextval,'Android');
insert into courses values(course_seq.nextval,'WebService');
insert into courses values(course_seq.nextval,'XML');
insert into courses values(course_seq.nextval,'UML');
insert into courses values(course_seq.nextval,'Ant');
insert into courses values(course_seq.nextval,'log4j');
insert into courses values(course_seq.nextval,'Lunix/Unix');
commit;
--select * from courses;

--drop sequence tech_category_seq;
create sequence tech_category_seq
start with 1;

--drop table tech_category cascade constraints;
--知识点分类表
create table tech_category(
  id integer not null primary key,
  tech_ctgr varchar2(100) not null,
  course_id references courses(id)
)

insert into tech_category values(tech_category_seq.nextval,'数据类型',1);
insert into tech_category values(tech_category_seq.nextval,'变量、数据类型、运算符',1);
insert into tech_category values(tech_category_seq.nextval,'条件结构、循环结构、switch',1);
insert into tech_category values(tech_category_seq.nextval,'数组',1);
insert into tech_category values(tech_category_seq.nextval,'构造函数',1);
insert into tech_category values(tech_category_seq.nextval,'方法',1);
insert into tech_category values(tech_category_seq.nextval,'访问修饰符',1);
insert into tech_category values(tech_category_seq.nextval,'static、关键字',1);
insert into tech_category values(tech_category_seq.nextval,'类和对象、包',1);
insert into tech_category values(tech_category_seq.nextval,'继承、抽象类、多态',1);
insert into tech_category values(tech_category_seq.nextval,'接口',1);
insert into tech_category values(tech_category_seq.nextval,'异常',1);
insert into tech_category values(tech_category_seq.nextval,'java.lang包',1);
insert into tech_category values(tech_category_seq.nextval,'java.util包',1);
insert into tech_category values(tech_category_seq.nextval,'java.io包',1);
insert into tech_category values(tech_category_seq.nextval,'内部类',1);
insert into tech_category values(tech_category_seq.nextval,'多线程',1);
insert into tech_category values(tech_category_seq.nextval,'Socket',1);
insert into tech_category values(tech_category_seq.nextval,'AWT/SWING',1);
commit;


--创建 试题表(单选题，多选,判断题) 序列
create sequence smd_questions_seq
start with 1;

--drop table smd_questions;
--试题表(s:单选题，m:多选, d:判断题)
create table smd_questions(
  id integer not null primary key,  --主键
  question varchar2(2000) not null,  --题干
  correct VARCHAR2(5) not null,  --考题答案
  question_type integer not null check(question_type in(1,2,3)), --考题类型：1.单选  2.多选  3.判断
  tech_cate_id references tech_category(id), --考题知识点分类
  descrpt varchar(100),  --考题说明信息
  pubdate date default sysdate --出题时间
  --code_body  VARCHAR2(1000)
)

select * from OLTS_USERS;
INSERT INTO EXAMINATION(exam_no,user_id,exam_date) VALUES('GS18100401',1,NULL );
COMMIT;
INSERT INTO smd_questions VALUES (smd_questions_seq,'下列解锁hr账户的命令正确的是（ ）','B',1,1,null,sysdate);
INSERT INTO smd_options VALUES (sys_guid(),
                                'A、update user hr account unlock;',
                                'B、alter user hr account unlock;',
                                'C、alter user hr unlock;',
                                'D、update user hr unlock',NULL ,1);

COMMIT;
INSERT INTO fsp_questions VALUES (11,'.什么是视图？视图可以DML操作吗 ？','答案',5,5,sysdate,NULL);

INSERT INTO smd_questions VALUES (2,'.下列SQL语句正确的是?（ ）','AB',2,2,null,sysdate);
INSERT INTO smd_options VALUES (sys_guid(),
                                'A、describle view_name;',
                                'B、describle table_name;',
                                'C、describle column_name;',
                                'D、describle sequence_name;',NULL ,2);

COMMIT;
CREATE TABLE pd_options(
  id VARCHAR2(32) NOT NULL PRIMARY KEY ,--uuid,系统函数生成：sys_guid()
  option_T VARCHAR2(32),
  option_F VARCHAR2(32),
  question_id unique references smd_questions(id) --外键，判断题
)

INSERT INTO smd_questions VALUES (3,'.中国特色社会主义进入新时代，我国社会主要矛盾已经转化为人民日益增长的美好生活需要和不平衡不充分的发展之间的矛盾?','T',3,3,null,sysdate);
INSERT INTO pd_options VALUES (sys_guid(),'正确','错误',3);

INSERT INTO fsp_questions VALUES (12,'.编写一个函数用来实现输入任意字符串,实现对该字符串的反转,' ||
                                     '并返回反转后的字符串(不要使用开发语言现有的反转方法).例如:输入:ABCD123 返回值为:321DCBA',
                                  '答案',6,6,sysdate,NULL);




--drop table smd_options;
--单选题选项表
create table smd_options(
  id varchar2(32) not null primary key, --uuid,系统函数生成：sys_guid()
  option_A varchar(200) not null,
  option_B varchar(200) not null,
  option_C varchar(200) not null,
  option_D varchar(200) not null,
  option_E varchar(200),
  question_id unique references smd_questions(id) --外键，单选题,多选题
)


--drop sequence fsp_questions_seq;
create sequence fsp_questions_seq
start with 1;

--drop table fsp_questions;
--试题表(简答题，编程题)
create table fsp_questions(
  id integer not null primary key,  	--主键
  question varchar2(3000) not null,  --题干
  std_answer clob, 	--标准答案
  question_type integer not null check(question_type in(4,5,6)), --考题类型：4.填空  5.简答   6.编程题
  tech_cate_id references tech_category(id),--考题知识点分类
  pubdate date default sysdate, 	--出题时间
  descrpt varchar(500)  			--考题说明信息
)


--drop table examination;
--考卷表
create table examination(
  exam_no varchar(20) not null primary key, --考试编号系统生成（考点简称+YYYYMMDD+班级号）
  user_id references olts_users(id),        --出题老师的编号
  exam_date date, --考试时间
  single_id varchar2(500),           --所有单选题答题的题号，逗号分隔 1,2,5,9,
  multiple_id varchar2(500),         --所有多选题答题的题号，逗号分隔
  true_false_id varchar2(500),       --所有判断题答题的题号，逗号分隔
  --以下几题为主观题，不能系统打分
  fill_in_gaps_id varchar2(100),   --所有填空题答题的题号，逗号分隔
  simple_anwser_id varchar2(100),  --所有简答题答题的题号，逗号分隔
  program_id varchar2(100),        --所有编程题答题的题号，逗号分隔
  descrpt varchar(100),
  valid_flag integer --试卷有效状态标识：1有效，0/空无效
)


--学生答题表 序列
create sequence fsp_answer_seq
start with 1;

--drop table fsp_answer;
--(填空题，简答题，编程题)学生答题表
create table fsp_answer(
  id integer not null primary key,
  answer clob,  --答案
  fsp_id not null references fsp_questions(id), 		--填空题，简答题，编程题的题号
  exam_no not null references examination(exam_no), 	--考试编号
  user_id not null references olts_users(id)          --用户编号
)


--drop sequence olts_score_seq;
--创建成绩表 序列
create sequence olts_score_seq
start with 1;

--drop table olts_score;
--成绩表
create table olts_score(
  id integer not null primary key,
  score number(4,1), --（单选+多选+判断）的分数
  fsp_score NUMBER(4,1), --主观题（简答、编程）的分数
  test_date date default sysdate,--考试时间
  descrpt varchar(50), --说明信息
  user_id not null references olts_users(id), --学生ID
  exam_no not null references examination(exam_no) --考试编号

)



