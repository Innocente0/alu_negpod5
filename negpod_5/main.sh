#!/bin/bash

# Function to create a new student record
create_student_record() {
    echo "Enter student email:"
    read email
    echo "Enter student age:"
    read age
    echo "Enter student ID:"
    read id
    
    # Save student record to file
    echo "$email $age $id" >> students-list_1023.txt
    echo "Student record created successfully."
}

# Function to view all student records
view_student_records() {
    echo "Student records:"
    cat students-list_1023.txt
}

# Function to delete a student record by ID
delete_student_record() {
    echo "Enter student ID to delete:"
    read id
    
    # Use sed to remove the line containing the specified student ID
    sed -i "/$id/d" students-list_1023.txt
    echo "Student record deleted successfully."
}

# Function to update a student record by ID
update_student_record() {
    echo "Enter student ID to update:"
    read id
    echo "Enter new student email:"
    read new_email
    echo "Enter new student age:"
    read new_age
    
    # Use sed to replace the line containing the specified student ID with the updated information
    sed -i "s/^$id .*/$new_email $new_age $id/" students-list_1023.txt
    echo "Student record updated successfully."
}

# Main menu
while true; do
    echo "1. Create student record"
    echo "2. View all student records"
    echo "3. Delete student record"
    echo "4. Update student record"
    echo "5. Exit"
    read -p "Enter your choice: " choice

    case $choice in
        1) create_student_record ;;
        2) view_student_records ;;
        3) delete_student_record ;;
        4) update_student_record ;;
        5) echo "Exiting program. Goodbye!"; exit ;;
        *) echo "Invalid choice. Please enter a number between 1 and 5." ;;
    esac
done

