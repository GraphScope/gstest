SELECT g.p_personid, g.p_firstname, g.p_lastname
FROM GRAPH_TABLE (graph
  MATCH
  (p1:person)-[:knows]-(f:person)<-[:comment_hascreator]-(c:comment)-[:comment_replyof_post]->(:post)-[:post_tag]->(t:tag)-[:tag_hastype]->(tc1:tagclass)-[:issubclassof]->(tc2:tagclass)
  WHERE p1.p_personid = $personId 
  AND tc2.tc_name = $tagClassName 
  COLUMNS (
    f.p_personid AS p_personid, 
    f.p_firstname AS p_firstname, 
    f.p_lastname AS p_lastname
  )
) g;
