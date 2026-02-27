--write a SQL query that lists the names of the songs that feature other artists
slect name
from songs
where name like '%feat.%';
