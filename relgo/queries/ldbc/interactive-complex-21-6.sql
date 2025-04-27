SELECT p1.p_personid, p2.p_personid, p3.p_personid, p4.p_personid
FROM person p1, person p2, person p3, person p4, knows k12, knows k13, knows k14, knows k23, knows k24, knows k34
WHERE p1.p_personid = k12.k_person1id
AND p2.p_personid = k12.k_person2id
AND p1.p_personid = k13.k_person1id
AND p3.p_personid = k13.k_person2id
AND p1.p_personid = k14.k_person1id
AND p4.p_personid = k14.k_person2id
AND p2.p_personid = k23.k_person1id
AND p3.p_personid = k23.k_person2id
AND p2.p_personid = k24.k_person1id
AND p4.p_personid = k24.k_person2id
AND p3.p_personid = k34.k_person1id
AND p4.p_personid = k34.k_person2id;
