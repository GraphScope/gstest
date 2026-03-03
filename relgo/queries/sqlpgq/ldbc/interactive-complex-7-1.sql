SELECT g.p_personid, g.p_firstname, g.p_lastname, g.m_content
FROM GRAPH_TABLE (graph
  MATCH
  (p2:person)-[:likes_comment]->(c:comment)-[:comment_hascreator]->(p1:person), (p1)-[:knows]-(p2)
  WHERE p1.p_personid = $personId
  COLUMNS (
    p2.p_personid AS p_personid, 
    p2.p_firstname AS p_firstname, 
    p2.p_lastname AS p_lastname, 
    c.m_content AS m_content
  )
) g;
