#!/bin/bash
for f in /root/node4_2022-01-31/csv/*.csv
do
  echo "LOAD DATA LOCAL INFILE '$f'" > load_logs.sql
  echo "INTO TABLE flow" >> load_logs.sql
  echo "FIELDS TERMINATED BY ','" >> load_logs.sql
  echo "ENCLOSED BY '\"'" >> load_logs.sql
  echo "LINES TERMINATED BY '\n'" >> load_logs.sql
  echo "IGNORE 1 ROWS;" >> load_logs.sql
  mysql -uroot -p1234 provenance < load_logs.sql
done
