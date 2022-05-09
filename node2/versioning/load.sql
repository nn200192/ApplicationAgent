LOAD DATA LOCAL INFILE '/root/versioning/insert_library_versioning.csv'
INTO TABLE linking
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '\"'
LINES TERMINATED BY '\r\n';
