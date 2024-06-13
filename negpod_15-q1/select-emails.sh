#!/usr/bin/env bash

# Extract student emails from students-list_0524.txt
awk -F',' '{print $1}' students-list_0524.txt > student-emails.txt

# Read emails from temp file and display them in the temp-emails.txt
cat temp-emails.txt
# OR save them to student-emails.txt:
# cat temp-emails.txt > student-emails.txt

