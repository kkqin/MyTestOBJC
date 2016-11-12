create database exam_bank
CHARACTER SET 'utf8'
COLLATE 'utf8_general_ci';

use exam_bank;

drop table if exists Admin;

drop table if exists Article;

drop table if exists Choice;

drop table if exists ChoiceQuestion;

drop table if exists Completion;

drop table if exists Course;

drop table if exists ExaminationPaper;

drop table if exists LeaveMessages;

drop table if exists QuestionType;

drop table if exists Test;

drop table if exists Translation;

drop table if exists USER;

/*==============================================================*/
/* Table: Admin                                                 */
/*==============================================================*/
create table Admin
(
   a_ID                 varchar(20) not null,
   a_Name               varchar(20),
   a_Pwd                varchar(100),
   a_Permission         int,
   a_RegDate            datetime,
   primary key (a_ID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*==============================================================*/
/* Table: Article                                               */
/*==============================================================*/
create table Article
(
   a_No                 varchar(20) not null,
   qt_No                varchar(20),
   ep_No                varchar(20),
   a_Content            varchar(1000),
   a_Ans                varchar(1000),
   primary key (a_No)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*==============================================================*/
/* Table: Choice                                                */
/*==============================================================*/
create table Choice
(
   choice_No            varchar(20) not null,
   qt_No                varchar(20),
   ep_No                varchar(20),
   choice_Title         varchar(1000),
   choice_Content       varchar(2000),
   primary key (choice_No)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*==============================================================*/
/* Table: ChoiceQuestion                                        */
/*==============================================================*/
create table ChoiceQuestion
(
   co_No                varchar(20) not null,
   choice_No            varchar(20),
   co_HadAns            int,
   co_Right             int,
   co_Ans               varchar(1000),
   co_AnsType           int,
   co_A                 varchar(1000),
   co_B                 varchar(1000),
   co_C                 varchar(1000),
   co_D                 varchar(1000),
   co_E                 varchar(1000),
   co_F                 varchar(1000),
   co_G                 varchar(1000),
   co_H                 varchar(1000),
   co_I                 varchar(1000),
   co_J                 varchar(1000),
   primary key (co_No)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*==============================================================*/
/* Table: Completion                                            */
/*==============================================================*/
create table Completion
(
   cp_No                varchar(20) not null,
   qt_No                varchar(20),
   ep_No                varchar(20),
   cp_Content           varchar(1000),
   cp_Ans               varchar(3000),
   cp_HadAns            int,
   cp_Right             int,
   primary key (cp_No)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*==============================================================*/
/* Table: Course                                                */
/*==============================================================*/
create table Course
(
   c_No                 varchar(20) not null,
   c_Name               varchar(50),
   c_Introduction       varchar(400),
   c_AppdendTime        datetime,
   primary key (c_No)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*==============================================================*/
/* Table: ExaminationPaper                                      */
/*==============================================================*/
create table ExaminationPaper
(
   ep_No                varchar(20) not null,
   c_No                 varchar(20),
   ep_Name              varchar(50),
   ep_ModifyTime        datetime,
   ep_AppdendTime       datetime,
   ep_Type              int,
   primary key (ep_No)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*==============================================================*/
/* Table: LeaveMessages                                         */
/*==============================================================*/
create table LeaveMessages
(
   lm_No                int not null,
   u_ID                 varchar(20),
   lm_Message           varchar(400),
   lm_Type              int,
   lm_AppendTime        datetime,
   primary key (lm_No)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*==============================================================*/
/* Table: QuestionType                                          */
/*==============================================================*/
create table QuestionType
(
   qt_No                varchar(20) not null,
   c_No                 varchar(20),
   qt_Type              varchar(50),
   qt_Directions        varchar(1000),
   qt_ChoiceNum         int,
   qt_AnsNum            int,
   qt_AnsScore          float,
   primary key (qt_No)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*==============================================================*/
/* Table: Test                                                  */
/*==============================================================*/
create table Test
(
   u_ID                 varchar(20) not null,
   ep_No                varchar(20) not null,
   record               varchar(1000),
   ans                  varchar(5000),
   final_TimeSlot       float,
   submit_Time          datetime,
   score                float,
   primary key (u_ID, ep_No)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*==============================================================*/
/* Table: Translation                                           */
/*==============================================================*/
create table Translation
(
   t_No                 varchar(20) not null,
   ep_No                varchar(20),
   qt_No                varchar(20),
   t_Content            varchar(1000),
   t_Ans                varchar(1000),
   primary key (t_No)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*==============================================================*/
/* Table: USER                                                  */
/*==============================================================*/
create table USER
(
   u_ID                 varchar(20) not null,
   u_Email              varchar(30),
   u_Pwd                varchar(100),
   u_Name               varchar(20),
   u_RegDate            datetime,
   u_IndeviResume       varchar(200),
   u_Sex                int,
   u_PhoneNo            char(13),
   u_Type               int,
   primary key (u_ID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

alter table Article add constraint FK_article_part_exam foreign key (ep_No)
      references ExaminationPaper (ep_No) on delete restrict on update restrict;

alter table Article add constraint FK_article_part_questionType foreign key (qt_No)
      references QuestionType (qt_No) on delete restrict on update restrict;

alter table Choice add constraint FK_choice_part_questionType foreign key (qt_No)
      references QuestionType (qt_No) on delete restrict on update restrict;

alter table Choice add constraint FK_choice_part_exam foreign key (ep_No)
      references ExaminationPaper (ep_No) on delete restrict on update restrict;

alter table ChoiceQuestion add constraint FK_choiceQue_part_choice foreign key (choice_No)
      references Choice (choice_No) on delete restrict on update restrict;

alter table Completion add constraint FK_completion_part_questionType foreign key (qt_No)
      references QuestionType (qt_No) on delete restrict on update restrict;

alter table Completion add constraint FK_completion_part_exam foreign key (ep_No)
      references ExaminationPaper (ep_No) on delete restrict on update restrict;

alter table ExaminationPaper add constraint FK_exam_part_course foreign key (c_No)
      references Course (c_No) on delete restrict on update restrict;

alter table LeaveMessages add constraint FK_leaveMess_part_u_ID foreign key (u_ID)
      references USER (u_ID) on delete restrict on update restrict;

alter table QuestionType add constraint FK_questionType_part_course foreign key (c_No)
      references Course (c_No) on delete restrict on update restrict;

alter table Test add constraint FK_Test foreign key (ep_No)
      references ExaminationPaper (ep_No) on delete restrict on update restrict;

alter table Test add constraint FK_Test2 foreign key (u_ID)
      references USER (u_ID) on delete restrict on update restrict;

alter table Translation add constraint FK_Translation_part_exam foreign key (ep_No)
      references ExaminationPaper (ep_No) on delete restrict on update restrict;

alter table Translation add constraint FK_translation_part_questionType foreign key (qt_No)
      references QuestionType (qt_No) on delete restrict on update restrict;
