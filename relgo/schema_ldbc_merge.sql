drop table if exists forum_person;
drop table if exists forum_tag;
drop table if exists person_email;
drop table if exists person_tag;
drop table if exists person_language;
drop table if exists person_university;
drop table if exists person_company;
drop table if exists post_tag;
drop table if exists comment_tag;
drop table if exists organisation;
drop table if exists knows;
drop table if exists likes_comment;
drop table if exists likes_post;
drop table if exists comment;
drop table if exists post;
drop table if exists tag;
drop table if exists tagclass;
drop table if exists message;
drop table if exists forum;
drop table if exists person;
drop table if exists place;
drop table if exists comment_hascreator;
drop table if exists comment_islocatedin;
drop table if exists comment_replyof_comment;
drop table if exists comment_replyof_post;
drop table if exists containerof_post;
drop table if exists has_moderator;
drop table if exists person_islocatedin;
drop table if exists post_hascreator;
drop table if exists post_islocatedin;
drop table if exists org_islocatedin;
drop table if exists ispartof;
drop table if exists tag_hastype;
drop table if exists issubclassof;

create table person (
   p_personid bigint not null PRIMARY KEY,
   p_firstname varchar not null,
   p_lastname varchar not null,
   p_gender varchar not null,
   p_birthday varchar not null,
   p_creationdate bigint not null,
   p_locationip varchar not null,
   p_browserused varchar not null
);

create table post (
    m_messageid bigint not null,
    m_ps_imagefile varchar,
    m_creationdate bigint not null,
    m_locationip varchar not null,
    m_browserused varchar not null,
    m_ps_language varchar,
    m_content text,
    m_length int not null
);

create table post_hascreator (
   phc_messageid bigint not null,
   phc_personid bigint not null
);


create table post_islocatedin (
   pi_messageid bigint not null,
   pi_placeid bigint not null
);

create table comment (
    m_messageid bigint not null,
    m_creationdate bigint not null,
    m_locationip varchar not null,
    m_browserused varchar not null,
    m_content text,
    m_length int not null,
);

create table comment_hascreator (
   chc_messageid bigint not null,
   chc_personid bigint not null
);

create table comment_islocatedin (
   ci_messageid bigint not null,
   ci_placeid bigint not null
);

create table comment_replyof_comment (
   crc_message1id bigint not null,
   crc_message2id bigint not null
);

create table comment_replyof_post (
   crp_message1id bigint not null,
   crp_message2id bigint not null
);

create table forum (
   f_forumid bigint not null PRIMARY KEY,
   f_title varchar not null,
   f_creationdate bigint not null,
);

create table containerof_post (
   co_forumid bigint not null,
   co_messageid bigint not null
);

create table has_moderator (
   hmod_forumid bigint not null,
   hmod_personid bigint not null
);

create table forum_person (
   fp_forumid bigint not null,
   fp_personid bigint not null,
   fp_joindate bigint not null
);

create table forum_tag (
   ft_forumid bigint not null,
   ft_tagid bigint not null
);

create table organisation (
   o_organisationid bigint not null,
   o_type varchar not null,
   o_name varchar not null,
   o_url varchar not null,
);

create table org_islocatedin (
   oi_organisationid bigint not null,
   oi_placeid bigint not null
);

create table studyat (
   sa_personid bigint not null,
   sa_organisationid bigint not null,
   sa_classyear bigint not null
);


create table person_email (
   pe_personid bigint not null,
   pe_email varchar not null
);


create table person_tag (
   pt_personid bigint not null,
   pt_tagid bigint not null
);

create table knows (
   k_person1id bigint not null,
   k_person2id bigint not null,
   k_creationdate bigint not null,
   FOREIGN KEY (k_person1id) REFERENCES person(p_personid),
   FOREIGN KEY (k_person2id) REFERENCES person(p_personid)
);

create table likes_comment (
   l_personid bigint not null,
   l_messageid bigint not null,
   l_creationdate bigint not null
);

create table likes_post (
   l_personid bigint not null,
   l_messageid bigint not null,
   l_creationdate bigint not null
);

create table person_language (
   plang_personid bigint not null,
   plang_language varchar not null
);

create table person_university (
   pu_personid bigint not null,
   pu_organisationid bigint not null,
   pu_classyear int not null
);

create table person_company (
   pc_personid bigint not null,
   pc_organisationid bigint not null,
   pc_workfrom int not null
);

create table place (
   pl_placeid bigint not null,
   pl_name varchar not null,
   pl_url varchar not null,
   pl_type varchar not null,
);

create table ispartof (
   ipo_place1id bigint not null,
   ipo_place2id bigint not null
);

create table post_tag (
   mt_messageid bigint not null,
   mt_tagid bigint not null
);

create table comment_tag (
   mt_messageid bigint not null,
   mt_tagid bigint not null
);

create table tagclass (
   tc_tagclassid bigint not null,
   tc_name varchar not null,
   tc_url varchar not null
);

create table tag (
   t_tagid bigint not null,
   t_name varchar not null,
   t_url varchar not null,
);

create table tag_hastype (
   tht_tagid bigint not null,
   tht_tagclassid bigint not null
);

create table issubclassof (
   isc_tagclass1id bigint not null,
   isc_tagclass2id bigint not null
);

create table person_islocatedin (
   pi_personid bigint not null,
   pi_placeid bigint not null
);