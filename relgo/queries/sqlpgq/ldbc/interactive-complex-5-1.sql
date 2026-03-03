SELECT g.f_title
FROM GRAPH_TABLE (graph
  MATCH
  (p1:person)-[k1:knows]-(p2:person)-[fp:forum_person]->(f:forum)-[:containerof_post]->(p:post), (p)-[:post_hascreator]->(p2)
  WHERE p1.p_personid = $personId
    AND fp.fp_joindate >= $minDate
  COLUMNS (
    f.f_title AS f_title
  )
) g;

