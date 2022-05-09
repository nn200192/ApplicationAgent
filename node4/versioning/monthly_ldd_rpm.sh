input="lib_insert_out_3.log"

> monthly_os_packages.log
while read -r line
do
	if [[ $line == Executable* ]]; then
		echo $line >> monthly_os_packages.log
	else 
		rpm -qf $line >> monthly_os_packages.log 
	fi
done < "$input"
