SELECT g.p2_id, g.p2_lastname, g.p2_birthday, g.p2_creationdate, g.p2_gender, g.p2_browserused, g.p2_locationip, g.pl_name
FROM GRAPH_TABLE (graph
  MATCH
    (p1:person)-[:knows]-(:person)-[:knows]-(:person)-[:knows]-(p2:person)-[:person_islocatedin]->(pl:place)
  WHERE p1.p_personid = $personId
    AND p2.p_firstname = $firstName
  COLUMNS (
    p2.p_personid as p2_id, 
    p2.p_lastname as p2_lastname, 
    p2.p_birthday as p2_birthday,
    p2.p_creationdate as p2_creationdate,
    p2.p_gender as p2_gender,
    p2.p_browserused as p2_browserused,
    p2.p_locationip as p2_locationip,
    pl.pl_name as pl_name
  )
) g;
