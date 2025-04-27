SELECT g.p2_id, g.p2_firstname, g.p2_lastname, g.c_messageid, g.c_content, g.c_creationdate
FROM GRAPH_TABLE (graph
  MATCH
    (p1:person)-[:knows]-(p2:person)<-[:comment_hascreator]-(c:comment)
  WHERE p1.p_personid = $personId
    AND c.m_creationdate < $maxDate
  COLUMNS (
    p2.p_personid as p2_id, 
    p2.p_firstname as p2_firstname, 
    p2.p_lastname as p2_lastname,
    c.m_messageid as c_messageid,
    c.m_content as c_content,
    c.m_creationdate as c_creationdate
  )
) g;
