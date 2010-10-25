TRUNCATE TABLE new_featured_pages;
ALTER TABLE new_featured_pages DISABLE KEYS;

CALL dropindex('new_featured_pages', 'featured_index');

LOAD DATA LOCAL INFILE '/mnt/featured_pages.txt'
INTO TABLE new_featured_pages
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
(page_id);

create index featured_index on new_featured_pages (page_id);

ALTER TABLE new_featured_pages ENABLE KEYS;