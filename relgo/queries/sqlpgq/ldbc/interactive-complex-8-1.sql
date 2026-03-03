SELECT g.p_personid, g.p_firstname, g.p_lastname, g.m_creationdate, g.m_messageid, g.m_content
FROM GRAPH_TABLE (graph
  MATCH
  (p2:person)<-[:comment_hascreator]-(c:comment)-[:comment_replyof_post]->(ps:post)-[:post_hascreator]->(p1:person)
  WHERE p1.p_personid = $personId
  COLUMNS (
    p2.p_personid AS p_personid, 
    p2.p_firstname AS p_firstname, 
    p2.p_lastname AS p_lastname, 
    c.m_creationdate AS m_creationdate, 
    c.m_messageid AS m_messageid, 
    c.m_content AS m_content
  )
) g;
