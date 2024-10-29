CREATE DATABASE OutOfSchoolChildrenTracking;
USE OutOfSchoolChildrenTracking;

-- guardian table
CREATE TABLE Guardians (
    guardian_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    contact_info VARCHAR(255),
    occupation VARCHAR(50),
    income_level VARCHAR(50),
    reason_for_loan TEXT
);

-- school table
CREATE TABLE Schools (
    school_id INT AUTO_INCREMENT PRIMARY KEY,
    school_name VARCHAR(100),
    location VARCHAR(255),
    capacity INT,
    comissioning_date DATE
    status ENUM('Active', 'Inactive')
);

-- class table
CREATE TABLE Class (
    class_id INT AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(100),
    school_id INT,
    comissioning_date DATE
    FOREIGN KEY (school_id) REFERENCES Schools(school_id)
);

-- children table
CREATE TABLE Children (
    child_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    gender ENUM('Male', 'Female'),
    address VARCHAR(255),
    enrollment_status BOOLEAN,
    guardian_id INT,
    school_id INT,
    class_id INT,
    FOREIGN KEY (guardian_id) REFERENCES Guardians(guardian_id),
    FOREIGN KEY (school_id) REFERENCES Schools(school_id),
    FOREIGN KEY (class_id) REFERENCES Class(class_id)
);

-- teacher's table
CREATE TABLE Teachers (
	teacher_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    `subject` VARCHAR(50),
    experience INT,
    training_status BOOLEAN,
    class_id INT,
    school_id INT,
    FOREIGN KEY (class_id) REFERENCES Class(class_id),
    FOREIGN KEY (school_id) REFERENCES Schools(school_id)
);


-- loans table
CREATE TABLE Loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    amount DECIMAL(10, 2),
    loan_date DATE,
    due_date DATE,
    status ENUM('Pending', 'Approved', 'Disbursed', 'Repaid'),
	guardian_id INT,
    FOREIGN KEY (guardian_id) REFERENCES Guardians(guardian_id)
);

-- scholarship table
CREATE TABLE Scholarships (
    scholarship_id INT AUTO_INCREMENT PRIMARY KEY,
    child_id INT,
    amount DECIMAL(10, 2),
    award_date DATE,
    FOREIGN KEY (child_id) REFERENCES Children(child_id)
);

-- donations table
CREATE TABLE Donations (
    donation_id INT AUTO_INCREMENT PRIMARY KEY,
    donor_name VARCHAR(100),
    amount DECIMAL(10, 2),
    donation_date DATE,
    purpose ENUM('School Fees', 'Supplies', 'Living Expenses')
);
