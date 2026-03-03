SELECT g.t_name
FROM GRAPH_TABLE (graph
  MATCH
  (p1:person)-[:knows]-(p2:person)<-[:post_hascreator]-(m:post)-[:post_tag]->(t1:tag), (m)-[:post_tag]->(t2:tag)
  WHERE p1.p_personid = $personId
  AND t1.t_name = $tagName
  AND t2.t_name <> $tagName
  COLUMNS (
    t2.t_name as t_name
  )
) g;

