drop table oa_docdept;
drop table oa_doc;
drop table oa_attinfo;
drop table oa_attendtime;
drop table oa_alarm;
drop table oa_message;
drop table oa_sharefile;
drop table oa_sharetype;
drop table oa_transfile;
drop table oa_user;
drop table oa_role;
drop table oa_group;
drop table oa_dept;
create table oa_dept(
	dept_number varchar2(32) primary key,
	dept_name varchar2(50) not null,
	dept_info varchar2(1000) default '');
/* [����] ���ű�ţ��������ƣ����ż�� */
insert into oa_dept values(
	'10000','�ܾ�����',
	'�������˾���ش�ҵ��'
);
insert into oa_dept values(
	'10001','�г���',
	'�г�����Ϊʵ����ҵ�ľ�ӪĿ���ƶ����ԵĲ��ţ������۲�����ʵ���Բ�����ִ�����ۼƻ��������ҵ��ӪĿ��Ĳ��š���ˣ�����֮����ָ���뱻ָ�������Ժ�ִ�С�Э���ͽ����Ĺ�ϵ��Ŀǰ�ڶ�����ҵ��г�����Ӫ��ϵͳ�еĵ�λҪ�������۲��ĵ�λ�����������С��ҵ����������Ϊ������ҵ�����۲�����������λ���г����Դ��ڴ�����λ�����Ӳ��˶����۵�ָ�����ã���Ϊ��ҵ�������۲���һЩ�����Ժ������ԵĹ�����'
);
insert into oa_dept values(
	'10002','������',
	'�о�����Ƽ���չ�ĺ��ս�ԺͿƼ��ٽ�������ᷢչ�ķ��롢���ߡ����棻�о��Ƽ��ٽ�������ᷢչ���ش����⣻�о�ȷ���Ƽ���չ���ش󲼾ֺ����������ƶ����ҿƼ�������ϵ���裬��߹��ҿƼ����������� ��֯����ȫ�����ÿ�ѧ������չ���г��ڹ滮����ȼƻ����о�����Ƽ����Ƹĸ�ķ��롢���ߺʹ�ʩ���ƶ�������Ӧ��������г����úͿƼ�����չ���ɵĿƼ��������ƺͿƼ����»���'
);
insert into oa_dept values(
	'10003','���ز�',
	'���ز�����һ�׺���Ĺ���ģʽ��ÿ���й̶�������ʱ�䣬�ܽ����ܵĹ��������������ܹ������������������������⣬����������ǻۣ���ɫ����ɹ����������ڲ�������ȷ�ķֹ���������ȷ���ӵ���������ʱ����ҷֹ������������ŶӾ��񣬼��������˹���Ч�ʡ�'
);
insert into oa_dept values(
	'10004','����',
	'��Ҫְ�����ڱ�����һ��������Ŀ���£������ʲ��Ĺ���(Ͷ��)���ʱ�����ͨ(����)�;�Ӫ���ֽ�����(Ӫ���ʽ�)���Լ��������Ĺ���'
);
insert into oa_dept values(
	'10005','���ڲ�',
	'�����ϼ�ָʾ��������Ժʵ�ʣ��ƶ�����ƹ�������ƶȺ�ѧ�ڹ����ƻ�����������֯ʵʩ�������ʵִ�������'
);
create table oa_group(
	group_number varchar2(32) primary key,
	dept_number varchar2(32) not null,
	group_name varchar2(50) not null,
	group_info varchar2(500),
	constraint fk_group_dept foreign key(dept_number) references oa_dept(dept_number)
);
/* [��] ���ţ��������ű�ţ������ƣ�����*/
insert into oa_group values(
	'20000','10000','�ܾ���칫��',
	'������Ӫ����ͨ������������Ĳ�Ʒ���г����������� '
);
insert into oa_group values(
	'20001','10001','�г����칫��',
	'������Ӫ����ͨ������������Ĳ�Ʒ���г����������� '
);
insert into oa_group values(
	'20002','10001','�г���ְ��',
	'������Ӫ����ͨ'
);
insert into oa_group values(
	'20003','10002','�������칫��',
	'������֯������Ա����רҵ����֪ʶ���¹��ռ�����ѧϰ������������弼��ˮƽ�� '
);
insert into oa_group values(
	'20004','10002','������',
	'������Ŀ�Ŀ���'
);
insert into oa_group values(
	'20005','10002','������',
	'�������Ŀ���в���'
);
insert into oa_group values(
	'20006','10002','ά����',
	'�������Ŀ����ά��'
);
insert into oa_group values(
	'20007','10003','���ز��칫��',
	'���ż������д�����'
);
insert into oa_group values(
	'20008','10003','���ز�ְ��',
	'�������д�����'
);
insert into oa_group values(
	'20009','10004','���񲿰칫��',
	'�����ʼ���'
);
insert into oa_group values(
	'20010','10004','����ְ��',
	'�����ʼ��㣬���Ź���'
);
insert into oa_group values(
	'20011','10005','���ڲ��칫��',
	'����˾�ĺ��ڹ���'
);
insert into oa_group values(
	'20012','10005','���ڲ�ְ��',
	'������ڹ���'
);
create table oa_role(
	role_number varchar2(32) primary key,
	group_number varchar2(32) not null,
	role_name varchar2(50) not null,
	role_right number(1) not null,
	constraint fk_role_group foreign key(group_number) references oa_group(group_number)
);

/*[ְλ��Ȩ��] ְλ��ţ��������ţ�ְλ���ƣ�ְλȨ��*/

insert into oa_role values(
	'30000','20000','�ܾ���',3
);
insert into oa_role values(
	'300001','20000','�ܾ�������',1
);
insert into oa_role values(
	'30001','20001','�г�������',2
);
insert into oa_role values(
	'30002','20001','��ְͨ��',1
);
insert into oa_role values(
	'30003','20002','��ְͨ��',1
);
insert into oa_role values(
	'30004','20003','����������',2
);
insert into oa_role values(
	'30005','20003','��ְͨ��',1
);
insert into oa_role values(
	'30006','20004','�鳤',1
);
insert into oa_role values(
	'30007','20004','��ְͨ��',1
);
insert into oa_role values(
	'30008','20005','�鳤',1
);
insert into oa_role values(
	'30009','20005','��ְͨ��',1
);
insert into oa_role values(
	'30010','20006','�鳤',1
);
insert into oa_role values(
	'30011','20006','��ְͨ��',1
);

insert into oa_role values(
	'30012','20007','���ز�����',2
);
insert into oa_role values(
	'30013','20007','��ְͨ��',1
);
insert into oa_role values(
	'30014','20008','��ְͨ��',1
);
insert into oa_role values(
	'30015','20009','���񲿾���',2
);
insert into oa_role values(
	'30016','20009','��ְͨ��',1
);
insert into oa_role values(
	'30018','20010','��ְͨ��',1
);
insert into oa_role values(
	'30019','20011','���ڲ�����',2
);
insert into oa_role values(
	'30020','20011','��ְͨ��',1
);
insert into oa_role values(
	'30021','20012','��ְͨ��',1
);
create table oa_user(
	user_number varchar2(32) primary key,
	user_name varchar2(20) not null,
	user_pwd varchar2(20) not null,
	user_realname varchar2(50) not null,
	user_gender char(2) check(user_gender='��' or user_gender='Ů'),
	user_birth date,
	dept_number varchar2(32) not null,
	group_number varchar2(32) not null,
	user_email varchar2(50),
	user_phone varchar2(20),
	role_number varchar2(32) not null,
	user_jianli varchar2(4000) default '',
	user_imgpath varchar2(100),
	user_salary number(7,2),
	constraint fk_user_dept foreign key(dept_number) references oa_dept(dept_number),
	constraint fk_user_group foreign key(group_number) references oa_group(group_number),
	constraint fk_user_role foreign key(role_number) references oa_role(role_number)
);
/*���û����û���ţ��û����ƣ��û����룬�����������Ա����գ��������ű�ţ��������ţ��û�����
   �û��绰��ְλ��ţ��û�������ͷ�����ƣ�����н��*/
 insert into oa_user values(
 	'200801','cgq','cgq','����','��',to_date('1986-10-19','YYYY-MM-DD'),'10000',
 	'20000','zhangliang@163.com','03158071479','30000',
 	'��ҵ��ӱ�����ѧ���������ѧ�뼼��ѧԺ�������ѧ�뼼��ѧԺ�������ѧ�뼼��ѧԺ',
 	'default.png',3000
 );
 insert into oa_user values(
 	'200802','zxm','zxm','����','��',to_date('1986-11-19','YYYY-MM-DD'),'10001',
 	'20001','zhangmin111@163.com','03258071479','30001',
 	'��ҵ��ӱ�����ѧ���������ѧ�뼼��ѧԺ�������ѧ�뼼��ѧԺ�������ѧ�뼼��ѧԺ',
 	'default.png',2500
 );
 insert into oa_user values(
 	'200803','wyy','wyy','����','��',to_date('1986-12-19','YYYY-MM-DD'),'10001',
 	'20001','wangliang123@163.com','03158071479','30001',
 	'��ҵ��ӱ�����ѧ���������ѧ�뼼��ѧԺ�������ѧ�뼼��ѧԺ�������ѧ�뼼��ѧԺ',
 	'default.png',2800
 );
 create table oa_transfile(
 	transfile_number varchar2(32) primary key,
 	transfile_name varchar2(100) not null,
 	transfile_realname varchar2(50) not null,
 	transfile_fromuser varchar2(32) not null,
 	transfile_touser varchar2(32) not null,
 	transfile_time date default sysdate not null,
 	transfile_info varchar2(100) not null,
 	transfile_type varchar2(50),
 	constraint fk_transfile_user foreign key(transfile_fromuser) references oa_user(user_number)
 );
 /*���ļ����䡿�ļ���ţ��ļ����֣��ļ�ԭʼ���֣������ߣ������ߣ�����ʱ�䣬�ļ���飬��������*/

create table oa_sharetype(
	type_number varchar2(32) primary key,
	type_name varchar2(20) not null
);
/*���������͡����ͱ�ţ���������*/
insert into oa_sharetype values('40001','��ҵ�ĵ�');
insert into oa_sharetype values('40002','ͼƬ��Դ');
insert into oa_sharetype values('40004','������Դ');
insert into oa_sharetype values('40003','�ı���Դ');
insert into oa_sharetype values('40005','ͼƬ��Դ1');
insert into oa_sharetype values('40006','������Դ1');
insert into oa_sharetype values('40007','�ı���Դ1');
create table oa_sharefile(
 	share_number varchar2(32) primary key,
 	share_name varchar2(100) not null,
 	share_realname varchar2(50) not null,
 	share_fromuser varchar2(32) not null,
 	share_time date default sysdate not null,
 	share_title varchar2(50) not null,
	share_info varchar2(200) not null,
	share_size number(8,2) not null,
 	share_filetype varchar2(50) not null,
	share_type varchar2(32) not null,
 	constraint fk_share_user foreign key(share_fromuser) references oa_user(user_number),
	constraint fk_share_type foreign key(share_type) references oa_sharetype(type_number)
 );
/*�������ļ����ļ���ţ��ļ����֣��ļ�ԭʼ���֣������߱�ţ�����ʱ�䣬�ļ����⣬�ļ���Ϣ���ļ���С���ļ��������ͣ����ı��ļ���ͼƬ�ȣ����ļ�����*/
create table oa_message(
	message_number varchar2(32) primary key,
	message_fromuser varchar2(32) not null,
	message_touser varchar2(32) not null,
	message_info varchar2(100) not null,
	message_content varchar2(4000) not null,
	message_time date default sysdate not null,
	constraint fk_message_user foreign key(message_fromuser) references oa_user(user_number),
	constraint fk_message_user1 foreign key(message_touser) references oa_user(user_number)
);
/* ��Ϣ��ţ���Ϣ�����ߣ���Ϣ�����ߣ���Ϣ���⣬��Ϣ���ݣ�����ʱ��*/

create table oa_alarm(
	alarm_number varchar2(32) primary key,
	alarm_fromuser varchar2(32),
	alarm_dept varchar2(32),
	alarm_title varchar2(100),
	alarm_detail varchar2(2000),
	alarm_time date,
	alarm_state number(1) default 0,
	constraint fk_alarm_user foreign key(alarm_fromuser) references oa_user(user_number),
	constraint fk_alarm_dept foreign key(alarm_dept) references oa_dept(dept_number)
);
/* ������ţ������ߣ����ţ����⣬��ϸ��Ϣ��ʱ�䣬״̬��0��ʾû���Ķ���1��ʾ�Ѿ����Ķ���*/



create table oa_attendtime(
	att_starthour number(2) primary key,
	att_startmin number(2),
	att_endhour number(2),
	att_endmin number(2)
);
/* �ϰ��Сʱ���ϰ�ķ��ӣ��°��Сʱ���°�ķ��� */

insert into oa_attendtime values(8,30,17,30);

create table oa_attinfo(
	att_user varchar2(32),
	att_time date default sysdate,
	att_startstate number(1) default 0,
	att_starttime varchar2(10) default 'ȱ��',
	att_startip varchar2(15) default '������',
	att_endstate number(1) default 0,
	att_endtime varchar2(10) default 'ȱ��',
	att_endip varchar2(15) default '������',
	constraint attinfo primary key(att_user,att_time)
);
/* Ա����ţ��������ڣ��ϰ࿼��״̬0:ȱ�ڣ�1���ٵ���2���������ϰ࿼��ʱ�䣬�ϰ࿼��ip���°࿼��״̬���°࿼��ʱ�䣬�°࿼��ip */


create table oa_doc(
	doc_num number(5) primary key,
	doc_from varchar2(32),
	doc_title varchar2(100),
	doc_content varchar2(2000),
	doc_type number(1),
	doc_time date,
	doc_state number(1) default(0),
	constraint fk_doc_user foreign key(doc_from) references oa_user(user_number)
);
/* �����ţ����뷢���ߣ��������⣬�������ݣ���������1��һ������2����������������״̬0�������У�1���ɹ�2��ʧ�ܣ� */
create table oa_docdept(
	dept_num varchar2(32),
	doc_num number(5),
	doc_type number(1),
	dept_state number(1),
	constraint docdept primary key(dept_num,doc_num),
	constraint fk_docdept_doc foreign key(doc_num) references oa_doc(doc_num)
);

/* �������ű�ţ������ţ����������׶�1��һ����������2�������������ţ�����״̬0��δ����1��ͬ��2������ */











 