collect_date_time=$(date --date="1 days ago" "+%F-%H:%M:%S")
collect_date=$(date --date="1 days ago" "+%F")
mkdir ~/node5_$collect_date
mkdir ~/node5_$collect_date/graphs
mkdir ~/node5_$collect_date/Rscripts
mkdir ~/node5_$collect_date/csv
mkdir ~/node5_$collect_date/maps_logs
mkdir ~/node5_$collect_date/logs


scp 192.168.1.160:~/$collect_date*maps.log ~/node5_$collect_date/maps_logs
scp 192.168.1.160:~/$collect_date*[0-9].log ~/node5_$collect_date/logs


python3 provenance.py ~/node5_$collect_date


for f in /root/node5_$collect_date/csv/plot*.csv
do
  echo "LOAD DATA LOCAL INFILE '$f'" > load_logs.sql
  echo "INTO TABLE flow" >> load_logs.sql
  echo "FIELDS TERMINATED BY ','" >> load_logs.sql
  echo "ENCLOSED BY '\"'" >> load_logs.sql
  echo "LINES TERMINATED BY '\n'" >> load_logs.sql
  echo "IGNORE 1 ROWS;" >> load_logs.sql
  mysql -uroot -p1234 provenance < load_logs.sql
done


for f in /root/node5_$collect_date/csv/map*.csv
do
  echo "LOAD DATA LOCAL INFILE '$f'" > load_maps.sql
  echo "INTO TABLE maps" >> load_maps.sql
  echo "FIELDS TERMINATED BY ','" >> load_maps.sql
  echo "ENCLOSED BY '\"'" >> load_logs.sql
  echo "LINES TERMINATED BY '\n'" >> load_maps.sql
  echo "IGNORE 1 ROWS;" >> load_logs.sql
  mysql -uroot -p1234 provenance < load_maps.sql
done
