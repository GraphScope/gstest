SELECT g.p_personid, g.p_firstname, g.p_lastname, g.o_name, g.pc_workfrom
FROM GRAPH_TABLE (graph
  MATCH
  (p1:person)-[:knows]-(:person)-[:knows]-(p2:person)-[pc:person_company]->(o:organisation)-[:org_islocatedin]->(pl:place)
  WHERE p1.p_personid = $personId 
  AND pc.pc_workfrom < $workFromYear 
  AND pl.pl_name = $countryName
  COLUMNS (
    p2.p_personid AS p_personid, 
    p2.p_firstname AS p_firstname, 
    p2.p_lastname AS p_lastname, 
    o.o_name AS o_name, 
    pc.pc_workfrom AS pc_workfrom
  )
) g;
