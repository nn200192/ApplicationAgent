#collect_date_time=$(date --date="5 days ago" "+%F-%H:%M:%S")
#collect_date=$(date --date="5 days ago" "+%F")
#mkdir ~/node4_$collect_date
#mkdir ~/node4_$collect_date/graphs
#mkdir ~/node4_$collect_date/Rscripts
#mkdir ~/node4_$collect_date/csv
#mkdir ~/node4_$collect_date/maps_logs
#mkdir ~/node4_$collect_date/logs


#scp 192.168.1.150:~/$collect_date*maps.log ~/node4_$collect_date/maps_logs
#scp 192.168.1.150:~/$collect_date*[0-9].log ~/node4_$collect_date/logs

collect_date="2022-01-31"
python3 provenance.py ~/node4_$collect_date

for f in /root/node4_$collect_date/csv/plot*.csv
do
  echo "LOAD DATA LOCAL INFILE '$f'" > load_logs.sql
  echo "INTO TABLE flow" >> load_logs.sql
  echo "FIELDS TERMINATED BY ','" >> load_logs.sql
  echo -n "OPTIONALLY ENCLOSED BY '" >> load_logs.sql
  echo -n "\\" >> load_logs.sql
  echo -n "\"" >> load_logs.sql
  echo "'" >> load_logs.sql
  echo "LINES TERMINATED BY '\r\n'" >> load_logs.sql
  echo "IGNORE 1 ROWS;" >> load_logs.sql
  mysql -uroot -p1234 provenance < load_logs.sql
done

for f in /root/node4_$collect_date/csv/map*.csv
do
  echo "LOAD DATA LOCAL INFILE '$f'" > load_maps.sql
  echo "INTO TABLE maps" >> load_maps.sql
  echo "FIELDS TERMINATED BY ','" >> load_maps.sql
  echo -n "OPTIONALLY ENCLOSED BY '" >> load_maps.sql
  echo -n "\\" >> load_maps.sql
  echo -n "\"" >> load_maps.sql
  echo "'" >> load_maps.sql
  echo "LINES TERMINATED BY '\n'" >> load_maps.sql
  echo "IGNORE 1 ROWS;" >> load_maps.sql
  mysql -uroot -p1234 provenance < load_maps.sql
done
