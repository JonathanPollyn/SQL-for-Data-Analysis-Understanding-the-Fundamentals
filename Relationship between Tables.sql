USE PollynzDataTech
GO

SELECT
    fk.name AS [FK Name],
    tp.name AS [Parent table],
    cp.name AS [Parent Column Name], 
    tr.name AS [Refrenced table],
    cr.name AS [Reference Column Name]
FROM sys.foreign_keys AS fk
INNER JOIN sys.tables AS tp 
ON fk.parent_object_id = tp.object_id
INNER JOIN sys.tables AS tr 
ON fk.referenced_object_id = tr.object_id
INNER JOIN sys.foreign_key_columns AS fkc 
ON fkc.constraint_object_id = fk.object_id
INNER JOIN sys.columns AS cp 
ON fkc.parent_column_id = cp.column_id 
AND fkc.parent_object_id = cp.object_id
INNER JOIN sys.columns AS cr 
ON fkc.referenced_column_id = cr.column_id 
AND fkc.referenced_object_id = cr.object_id
where  tr.name like '%Patient%'
--ORDER BY
--   tp.name, cp.column_id


