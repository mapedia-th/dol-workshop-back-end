SELECT name,lat,long,ST_x(geom),St_y(geom)
FROM bokdin
WHERE ST_Equals(geom, ST_AsEWKB(ST_GeomFromText('POINT(100.50219261863144 13.753901673257841)',4326)));


SELECT a.amphoe_t,  p.prov_nam_t
FROM amphoe as a, province as p
WHERE ST_Contains(p.geom, a.geom) 


SELECT d.center_nam,i.r4000
FROM dol_office as d,index_4000_z48 as i
WHERE ST_Intersects(d.geom, i.geom) 

SELECT amphoe_t
FROM amphoe e
WHERE ST_DWithin(e.geom,(SELECT geom FROM dol_office WHERE id = 1),0.1);


SELECT ST_Overlaps(a,b) As a_overlap_b, ST_Intersects(a, b) As a_intersects_b, ST_Contains(b, a) As b_contains_a
FROM (SELECT 
    ST_Polygon(ST_GeomFromText('LINESTRING(1 1,3 1,3 3,1 1)'), 4326)  As a,
    ST_Polygon(ST_GeomFromText('LINESTRING(1 1,3 1,3 3,1 1)'), 4326)  As b)
    As foo;
    -- INTERSECT is TRUE, OVERLAP is FALSE because B equals A

    SELECT ST_Overlaps(a,b) As a_overlap_b, ST_Intersects(a, b) As a_intersects_b, ST_Contains(b, a) As b_contains_a
FROM (SELECT 
    ST_Polygon(ST_GeomFromText('LINESTRING(1 1,3 1,3 3,1 1)'), 4326)  As a,
    ST_Polygon(ST_GeomFromText('LINESTRING(1 1,4 1,4 4,1 1)'), 4326)  As b)
    As foo;
    -- INTERSECT is TRUE, OVERLAP is FALSE because B contains A

    SELECT ST_Overlaps(a,b) As a_overlap_b, ST_Intersects(a, b) As a_intersects_b, ST_Contains(b, a) As b_contains_a
FROM (SELECT 
    ST_Polygon(ST_GeomFromText('LINESTRING(0 0,2 0,2 2,0 0)'), 4326)  As a,
    ST_Polygon(ST_GeomFromText('LINESTRING(1 1,3 1,3 3,1 1)'), 4326)  As b)
    As foo;
    -- INTERSECT is TRUE, OVERLAP is TRUE because not all of A intersects B and not all of B intersects A



SELECT center_nam, ST_Buffer(geom, 0.1) AS geom_buffer ,geom 
FROM dol_office WHERE id = 1