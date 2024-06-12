#!/usr/bin/env bash

# File to store student records
student_file="students-list_0524.txt"

# Function to create a student record
create_student_record() {
    # Validate email (must end with ".com")
    while true; do
        read -p "Enter student email: " email
        if [[ "$email" =~ ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$ ]]; then
            break
        else
            echo "Invalid email format. Please enter a valid email ending with '.com'."
        fi
    done

    # Validate age (positive counting numbers or natural numbers )
    while true; do
        read -p "Enter student age: " age
        if [[ "$age" =~ ^[1-9][0-9]*$ ]]; then
            break
        else
            echo "Invalid age. Please enter a positive counting number (1 or greater)."
        fi
    done

    read -p "Enter student ID: " student_id
    read -p "Course of interest at ALU: " course

    echo "$email,$age,$student_id,$course" >> students-list_1023.txt

    # Print success messages
    echo -e "\033[1;33mStudent has been successfully created.\033[0m"
    echo
    echo "Welcome to ALU!"

}

# Function to view all students
view_all_students() {
    cat students-list_1023.txt
}

# Function to delete a student by ID
delete_student() {
    while true; do
            read -p "Enter student ID to delete(or 'q' to quit): " student_id

       if [ "$student_id" = "q" ]; then
            echo "Returning to the main menu."
            break
        elif grep -q "^.*,.*,${student_id}$"temp-emails.txt; then
            # Ask for confirmation
            read -p "Are you sure you want to delete student with ID $student_id? (yes/no): " confirm
            if [ "$confirm" = "yes" ]; then
                # Remove the corresponding student record from the file
                sed -i "/^.*,.*,${student_id}$/d" students-list_1023.txt
                echo "Student with ID $student_id has been successfully deleted."
            else
                echo "Deletion canceled. Returning to the main menu."
            fi
            break
        else
            echo "Invalid student ID. Please enter a valid ID."
        fi
    done
}
>>>>>>> 0d28ae8be6a0fe5e60f35eac3e201d808d491748