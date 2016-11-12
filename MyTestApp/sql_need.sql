CREATE DATABASE APP_TEST
CHARACTER SET 'utf8'
COLLATE 'utf8_general_ci';
use APP_TEST;

/*==============================================================*/
/* Table: User                                             */
/*==============================================================*/
CREATE TABLE IF NOT EXISTS User
(
  uid                          varchar(11) NOT NULL,
	uname                        varchar(20) NOT NULL,
	register_date                datetime,
	last_active                  datetime,
	PRIMARY KEY (uid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*==============================================================*/
/* Table: Relation                                             */
/*==============================================================*/
CREATE TABLE IF NOT EXISTS Relation(
	uid                          varchar(11) NOT NULL,
	relation_id                  blob NOT NULL,
	band_id                      blob NULL,
	PRIMARY KEY (uid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*==============================================================*/
/* Table: Message                                             */
/*==============================================================*/
CREATE TABLE IF NOT EXISTS Message(
	uid                          varchar(11) NOT NULL,
	m_id                         varchar(11) NOT NULL,
	msg                          varchar(255) NOT NULL,
	m_type                       int NOT NULL,
	m_pic                        blob NULL,
	relatemsg_id                 varchar(11) NULL,
	PRIMARY KEY (m_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
