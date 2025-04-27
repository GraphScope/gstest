SELECT p1.p_personid, p2.p_personid
FROM person p1, knows k, person p2
WHERE p1.p_personid = k.k_person1id
AND k.k_person2id = p2.p_personid
AND k.k_creationdate > :startDate
AND k.k_creationdate < :endDate;
