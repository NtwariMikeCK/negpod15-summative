#!/usr/bin/env bash

directory_name="negpod_15-q1"
#create the directory if it doesn't exist
<<<<<<< HEAD
if [! -d "$directory_name"]; then 
=======
if [! -d "$directory_name"];
then 
>>>>>>> ffdcd5d0297e98150aeb8a0590e79ccf625c2232
	mkdir "$directory_name"
fi

mv main.sh "$directory_name/"
mv students-list_0524.txt "$directory_name/"
mv select-emails.sh "$directory_name/"
mv student-emails.txt "$directory_name/"
mv feedback.txt "$directory_name/"

echo "Files moved to $directory_name."
