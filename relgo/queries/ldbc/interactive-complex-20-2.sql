select p1.p_personid, p2.p_personid from person p1, knows k, person p2 where p1.p_personid = k.k_person1id and p2.p_personid = k.k_person2id;
