#! /usr/bin/bash
echo "pawel"
echo $MARIADB_ROOT_PASSWORD

mysql --user="root" --password=$MARIADB_ROOT_PASSWORD --database="photoprism" --execute="update albums a 
inner join photos p on a.album_path=p.photo_path 
inner join files f on p.id=f.photo_id
set thumb=convert(f.file_hash, char(200)),thumb_src='manual', album_order='name'
where convert(album_type, char(100))='folder' 
and convert(p.photo_name, char(200)) like '%Cover%';"
