#!/usr/bin/env bash

# File to store student records
student_file="students-list_0524.txt"
feedback="feedback.txt"
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

    echo "$email,$age,$student_id,$course" >> students-list_0524.txt

    # Print success messages
    echo -e "\033[1;33mStudent has been successfully created.\033[0m"
    echo
    echo "Welcome to ALU!"

}
# Function to view all students
view_students() {
    if [[ -f $student_file ]]; then
        echo "List of all students:"
        cat $student_file
    else
        echo "No student records found."
    fi
}

# Function to delete a student by ID
delete_student() {
    while true; do
            read -p "Enter student ID to delete(or 'q' to quit): " student_id

       if [ "$student_id" = "q" ]; then
            echo "Returning to the main menu."
            break
        elif grep -q "^.*,.*,${student_id}$" $student_file ; then
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
#for storing the feedback give

feedback() {
    echo "give feedback to help us know what to collect:"
    read -p "give feedback to help us know what to collect:" message

    echo "$message" >> $feedback
    echo "Thank you for your feedback, Take care"
    exit
}

# Main menu loop
while true; do
       echo
        echo -e "\033[1;35mWELCOME TO ALU  STUDENT PORTAL PAGE\033[0m"
        echo "----------------------------------------"
	echo "----------------------------------------"
        echo "Main Menu:"
    echo -e "\033[1;34m1. Create Student Record\033[0m"
    echo -e "\033[1;34m2. View All Students\033[0m"
    echo -e "\033[1;34m3. Delete Student\033[0m"
    echo -e "\033[1;34m4. Update Student Record\033[0m"
    echo -e "\033[1;34m5. Provide your feedback\033[0m"
    echo -e "\033[1;34m6. Exit\033[0m"
    # Add two lines of spacing
    echo
    echo "********************************************"
    echo "********************************************"
    echo "Choose an option (1-6):"


    read -p "Enter your choice: " choice


    case "$choice" in
        1) create_student_record ;;
        2) view_all_students ;;
        3) delete_student ;;
        4) update_student_record ;;
        5) feedback ;;
        6) exit ;;
        *) echo "Invalid choice. Please try again." ;;
    esac
done

