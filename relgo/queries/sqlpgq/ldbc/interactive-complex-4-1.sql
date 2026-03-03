SELECT g.t_name
FROM GRAPH_TABLE (graph
  MATCH
    (:person)-[k1:knows]-(p1:person)-[k2:knows]-(p2:person)<-[:post_hascreator]-(ps:post)-[:post_tag]->(t:tag)
  WHERE p1.p_personid = $personId
    AND ps.m_creationdate >= $startDate 
    AND ps.m_creationdate < $durationDays
  COLUMNS (
    t.t_name as t_name
  )
) g;
