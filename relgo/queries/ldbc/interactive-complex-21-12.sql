SELECT p1.p_personid, p2.p_personid
FROM person p1, person p2, post pt, forum f, knows k, likes_post lp
WHERE p1.p_personid = k.k_person1id
AND k.k_person2id = p2.p_personid
AND p2.p_personid = lp.l_personid
AND lp.l_messageid = pt.m_messageid
AND pt.m_ps_forumid = f.f_forumid
AND f.f_moderatorid = p1.p_personid;
