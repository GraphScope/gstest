SELECT g.p2_id, g.p2_firstname, g.p2_lastname
FROM GRAPH_TABLE (graph
  MATCH
    (p1:person)-[k1:knows]-(p2:person)<-[:comment_hascreator]-(m1:comment)-[:comment_islocatedin]->(pl1:place),
    (p2)<-[:comment_hascreator]-(m2:comment)-[:comment_islocatedin]->(pl2:place)
  WHERE p1.p_personid = $personId
    AND m1.m_creationdate >= $startDate
    AND m1.m_creationdate < $durationDays
    AND m2.m_creationdate >= $startDate
    AND m2.m_creationdate < $durationDays
    AND pl1.pl_name = $countryXName 
    AND pl2.pl_name = $countryYName
  COLUMNS (
    p2.p_personid as p2_id, 
    p2.p_firstname as p2_firstname, 
    p2.p_lastname as p2_lastname
  )
) g;
