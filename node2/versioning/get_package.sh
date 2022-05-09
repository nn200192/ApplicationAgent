mysql -uroot -p1234 provenance -N -e "select Package from linking where App='$1' and Library='$2' and Date in (SELECT max(Date) from linking)"
