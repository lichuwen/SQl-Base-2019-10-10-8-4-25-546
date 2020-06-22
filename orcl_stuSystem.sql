create table student(
    id varchar2(4) not null primary key,
    name varchar2(5) not null,
    age number(3) not null,
    sex varchar2(4) not null);

insert into student(id,name,age,sex) values('001','张三',18,'男');
insert into student(id,name,age,sex) values('002','李四',20,'女');

create table subject(
    id varchar2(5) not null primary key,
    subject varchar2(10) not null,
    teacher varchar2(10) not null,
    description varchar2(50));

insert into subject(id,subject,teacher,description) values('1001','语文','王老师','本次考试比较简单');
insert into subject(id,subject,teacher,description) values('1002','数学','刘老师','本次考试比较难');

create table score(
    id number PRIMARY KEY,
    student_id char(5) not null,
    subject_id char(5) not null,
    score number(5,2));

 CREATE SEQUENCE emp_sequence  
 INCREMENT BY 1   -- 每次加几个    
     START WITH 1     -- 从1开始计数    
     NOMAXVALUE       -- 不设置最大值    
     NOCYCLE          -- 一直累加，不循环    
     CACHE 10;

--DROP SEQUENCE emp_sequence --删除徐列
--DROP TRIGGER trigger_name; --删除触发器
--触发器
CREATE TRIGGER emp_tri BEFORE  
insert ON  score FOR EACH ROW  
begin  
select emp_sequence.nextval into:New.id from dual;  
end;
/ --用于退出触发器

insert into score(student_id,subject_id,score) values('001','1001',80);
insert into score(student_id,subject_id,score) values('002','1002',60);
insert into score(student_id,subject_id,score) values('001','1001',70);
insert into score(student_id,subject_id,score) values('002','1002',60.5);
