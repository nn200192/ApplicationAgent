input="lib_update_out_3.log"

> annual_os_packages.log
while read -r line
do
        if [[ $line == Executable* ]]; then
                echo $line >> annual_os_packages.log
        else
                rpm -qf $line >> annual_os_packages.log
        fi
done < "$input"
