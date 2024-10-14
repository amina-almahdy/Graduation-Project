-- Create Dimension Tables

CREATE TABLE Loan_grade_Dim (
    grade_id INT PRIMARY KEY,
    grade VARCHAR(50) NOT NULL,
	startDate Date Default getdate(),
	endDate Date,
	iscurrent int
);

CREATE TABLE verification_status_Dim (
    verification_status_ID INT PRIMARY KEY,
    verification_status VARCHAR(50) NOT NULL,
	startDate Date Default getdate(),
	endDate Date,
	iscurrent int
);

CREATE TABLE Loan_status_Dim (
    loan_status_id INT PRIMARY KEY,
    Loan_Status VARCHAR(50) NOT NULL,
	startDate Date Default getdate(),
	endDate Date,
	iscurrent int
);

CREATE TABLE Loan_purpose_Dim (
    purpose_id INT PRIMARY KEY,
    purpose VARCHAR(100) NOT NULL,
	startDate Date Default getdate(),
	endDate Date,
	iscurrent int
);

CREATE TABLE Initial_List_Dim (
    initial_List_Status_id INT PRIMARY KEY,
    initial_list_status VARCHAR(50) NOT NULL,
	startDate Date Default getdate(),
	endDate Date,
	iscurrent int
);

CREATE TABLE Application_Type_Dim (
    application_type_id INT PRIMARY KEY,
    application_type VARCHAR(50) NOT NULL,
	startDate Date Default getdate(),
	endDate Date,
	iscurrent int
);


CREATE TABLE Borrower_Dim (
	borrower_id int primary key,
	emp_title varchar(200) ,
	emp_length varchar(20) ,
	annual_inc int ,
	address text,
	home_id int ,
    home_ownership VARCHAR(50),
    credit_history_id INT,
    open_cc int ,
    pub_rec int ,
    revol_bal int ,
	revol_util float ,
	total_acc int ,
	mort_acc int ,
	pub_rec_bankruptcies int ,
	startDate Date Default getdate(),
	endDate Date,
	iscurrent int
);

-- Create Fact Table

CREATE TABLE Loan_Fact (
	loan_id int primary key ,
	loan_amnt int ,
	term int,
	int_rate float ,
	installment decimal(7,2) ,
	origination_Date int,
	principal_balance float,
	principal_paid float,
	interest_paid float,
	Late_fees_paid int,
	Last_Payment_date int,
	Next_Payment_date int,
	Days_Past_Due int,
	initial_list_status_id int,
	application_type_id int,
	borrower_id int ,
	status_id int,
	verification_status_ID int,
	purpose_id int ,
	grade_id int,
    FOREIGN KEY (grade_id) REFERENCES Loan_grade_Dim(grade_id),
    FOREIGN KEY (verification_status_ID) REFERENCES verification_status_Dim(verification_status_ID),
    FOREIGN KEY (borrower_id) REFERENCES Borrower_Dim(borrower_id),
    FOREIGN KEY (status_id) REFERENCES Loan_status_Dim(loan_status_id),
    FOREIGN KEY (purpose_id) REFERENCES Loan_purpose_Dim(purpose_id),
    FOREIGN KEY (initial_list_status_id) REFERENCES Initial_List_Dim(initial_List_Status_id),
    FOREIGN KEY (application_type_id) REFERENCES Application_Type_Dim(application_type_id),
);