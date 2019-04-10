
# the -5 below is number of days ago.

x=`find ../../storage/ -mtime -1 -type f -printf "%T@ %Tc %p\n" | sort -n`.split(/\n/)

x.each_with_index do |line, i|
 full_rel_name = line.split(/\s+/)[-1]
 new_name = sprintf("IMG_LOG_%04d", i) + ".jpg"
 system("cp #{full_rel_name} #{new_name}")
end

