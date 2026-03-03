SELECT p.p_personid 
FROM person p, post pt, forum f, forum_person fp, likes_post lp
WHERE p.p_personid = fp.fp_personid
AND fp.fp_forumid = f.f_forumid
AND p.p_personid = lp.l_personid
AND pt.m_messageid = lp.l_messageid
AND pt.m_ps_forumid = f.f_forumid
AND p.p_personid = :personId;
