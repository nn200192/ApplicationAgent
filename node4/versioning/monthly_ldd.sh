input="lib_insert_input.csv"
> lib_insert_out.log
while read -r line
do
        echo "Executable" >> lib_insert_out.log
        echo "$line" >> lib_insert_out.log
        ldd $line >> lib_insert_out.log
done < "$input"
