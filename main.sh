#!/usr/bin/env bash












# Function to view all students
view_stdents() {
    if [[ -f $student_file ]]; then
        echo "List of all students:"
        cat $student_file
    else
        echo "No student records found."
    fi
}
