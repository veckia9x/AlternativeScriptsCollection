#!/bin/bash
#xxxxxxxxxxxxxxx del_listed_files_script xxxxxxxxxxxxxxxx

cd /home/container

# Please create a file named rmlist.txt and feed it with
# the full path to each file you wish to delete.

if [[ $RCSVAR == 'true' ]]; then
	for i in $(cat rmlist.txt); do
		rm -f $i
	done
else
	echo rmlist.txt file is missing, please check on file manager root directory.
fi

# Wrote_by_Veckia_(Alpha#9751_at_discord)
#xxxxxxxxxxxxxxx del_listed_files_script xxxxxxxxxxxxxxxx