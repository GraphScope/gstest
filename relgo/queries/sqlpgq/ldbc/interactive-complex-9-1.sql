SELECT g.p_firstname, g.p_lastname, g.m_creationdate
FROM GRAPH_TABLE (graph
  MATCH
  (p1:person)-[:knows]-(p2:person)<-[:comment_hascreator]-(c:comment)
  WHERE p1.p_personid = $personId
  AND c.m_creationdate < $maxDate
  COLUMNS (
    p2.p_firstname AS p_firstname, 
    p2.p_lastname AS p_lastname, 
    c.m_creationdate AS m_creationdate
  )
) g;
