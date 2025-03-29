CREATE TABLE Student
(
    std_id VARCHAR(10) NOT NULL,
    std_Fname VARCHAR(20),
    std_Lname VARCHAR(20),
    std_email VARCHAR(50) UNIQUE,
    std_phone VARCHAR(15),
    std_address VARCHAR(100),
    std_NIC VARCHAR (15),
    std_DOB DATE,
    
    std_password VARCHAR(20),
    

    CONSTRAINT PK_Student PRIMARY KEY (std_id),
    CONSTRAINT CH_StudentID CHECK (std_id LIKE 'ST_____')

);

CREATE TABLE Staff
(
    stf_id VARCHAR (10) NOT NULL,
    stf_date DATE,
    stf_Fname VARCHAR(20),
    stf_Lname VARCHAR(20),
    stf_email VARCHAR(50) UNIQUE,
    stf_phone VARCHAR(15),
    stf_address VARCHAR(100),
    stf_NIC VARCHAR (15),
    stf_DOB DATE,
    stf_salary FLOAT,
    stf_hireDate DATE,

    stf_password VARCHAR(20),

    CONSTRAINT PK_Staff PRIMARY KEY (stf_id),
    CONSTRAINT CH_Staff CHECK (stf_id LIKE 'TC_____' OR stf_id LIKE 'AD_____' OR stf_id LIKE 'CM_____' OR stf_id LIKE 'FM_____')

);

CREATE TABLE Teacher 
(
    tc_id VARCHAR(10) NOT NULL,
    tc_experience INT,
    tc_specialization VARCHAR(20),
    tc_designation VARCHAR(20),

    CONSTRAINT PK_Teacher PRIMARY KEY (tc_id),
    CONSTRAINT FK_Teacher FOREIGN KEY (tc_id) REFERENCES Staff(stf_id),
    CONSTRAINT CH_Teacher CHECK (tc_id LIKE 'TC_____')


);

CREATE TABLE Admin
(
    ad_id VARCHAR(10) NOT NULL,
    ad_systemAccess INT,
    ad_designation VARCHAR(20),

    CONSTRAINT PK_Admin PRIMARY KEY (ad_id),
    CONSTRAINT FK_Admin FOREIGN KEY (ad_id) REFERENCES Staff(stf_id),
    CONSTRAINT CH_Admin CHECK (ad_id LIKE 'AD_____')

);

CREATE TABLE CR_Manager
(
    cm_id VARCHAR(10) NOT NULL,
    cm_role VARCHAR(30),
    

    CONSTRAINT PK_CR_Manager PRIMARY KEY (cm_id),
    CONSTRAINT FK_CR_Manager FOREIGN KEY (cm_id) REFERENCES Staff(stf_id),
    CONSTRAINT CH_CR_Manager CHECK (cm_id LIKE 'CM_____')

);

CREATE TABLE Finance_Manager
(
    fm_id VARCHAR(10) NOT NULL,
    fm_role VARCHAR(30),
    fm_budgetAllocationRights INT,

    CONSTRAINT PK_Finance_Manager PRIMARY KEY (fm_id),
    CONSTRAINT FK_Finance_Manager FOREIGN KEY (fm_id) REFERENCES Staff(stf_id),
    CONSTRAINT CH_Finance_Manager CHECK (fm_id LIKE 'FM_____')

);

CREATE TABLE Subject 
(
    sub_id VARCHAR(10) NOT NULL,
    sub_name VARCHAR(20),
    sub_description VARCHAR(100),
    sub_credits INT,

    CONSTRAINT PK_Subject PRIMARY KEY (sub_id),
    CONSTRAINT CH_Subject CHECK (sub_id LIKE '______')

);

CREATE TABLE Teacher_Subject
(
    tc_id VARCHAR(10) NOT NULL,
    sub_id VARCHAR(10) NOT NULL,

    CONSTRAINT PK_Teacher_Subject PRIMARY KEY (tc_id, sub_id),
    CONSTRAINT FK_Teacher_Subject_Teacher FOREIGN KEY (tc_id) REFERENCES Teacher(tc_id),
    CONSTRAINT FK_Teacher_Subject_Subject FOREIGN KEY (sub_id) REFERENCES Subject(sub_id),

    CONSTRAINT CH_Teacher_Subject CHECK (tc_id LIKE 'TC_____' AND sub_id LIKE '______')

);

CREATE TABLE Std_Subject
(
    std_id VARCHAR(10) NOT NULL,
    sub_id VARCHAR(10) NOT NULL,

    CONSTRAINT PK_Std_Subject PRIMARY KEY (std_id, sub_id),
    CONSTRAINT FK1_Std_Subject FOREIGN KEY (std_id) REFERENCES Student(std_id),
    CONSTRAINT FK2_Std_Subject FOREIGN KEY (sub_id) REFERENCES Subject(sub_id),

    CONSTRAINT CH_Std_Subject CHECK (std_id LIKE 'ST_____' AND sub_id LIKE '______')

);

CREATE TABLE Std_Result
(
    std_id VARCHAR(10) NOT NULL,
    sub_id VARCHAR(10) NOT NULL,
    marks INT,
    grade VARCHAR(2), /*calculate the grade based on the marks Call function or a trigger*/
    res_date DATE,

    CONSTRAINT PK_Result PRIMARY KEY (std_id, sub_id),
    CONSTRAINT FK_Result_Student FOREIGN KEY (std_id) REFERENCES Student(std_id),
    CONSTRAINT FK_Result_Subject FOREIGN KEY (sub_id) REFERENCES Subject(sub_id),

    CONSTRAINT CH_Result CHECK (std_id LIKE 'ST_____' AND sub_id LIKE '______')

);

/*Once the Finance manager verifies the tamporary payments, this data shiuld be removed using a trigger*/
CREATE TABLE Temp_Payments
(
    payment_id INT NOT NULL,
    std_id VARCHAR(10) NOT NULL,
    amount FLOAT,
    payment_date DATE,
    payment_method VARCHAR(20),

    CONSTRAINT PK_Temp_Payments PRIMARY KEY (payment_id),
    CONSTRAINT FK_Temp_Payments FOREIGN KEY (std_id) REFERENCES Student(std_id),
    CONSTRAINT CH_Temp_Payments CHECK (std_id LIKE 'ST_____' AND  payment_method IN ('Credit Card', 'Debit Card', 'Bank Transfer') )



);

/*can use a check box to mark attendance*/
CREATE TABLE Attendance
(
    att_id INT NOT NULL,
    tc_id VARCHAR(10) NOT NULL,
    std_id VARCHAR(10) NOT NULL,
    sub_id VARCHAR(10) NOT NULL,
    att_date DATE,
    status VARCHAR(10),

    CONSTRAINT PK_Attendance PRIMARY KEY (att_id, std_id, sub_id, att_date),
    CONSTRAINT FK_Attendance_Teacher FOREIGN KEY (tc_id) REFERENCES Teacher(tc_id),
    CONSTRAINT FK_Attendance_Student FOREIGN KEY (std_id) REFERENCES Student(std_id),
    CONSTRAINT FK_Attendance_Subject FOREIGN KEY (sub_id) REFERENCES Subject(sub_id),

    CONSTRAINT CH_Attendance_Status CHECK (status IN ('Present', 'Absent')),
    CONSTRAINT CH_Attendance_Std_Sub CHECK (std_id LIKE 'ST_____' AND sub_id LIKE '______')
);

CREATE TABLE Notice
(
    notice_id INT NOT NULL,
    t_id VARCHAR(10) NOT NULL,
    notice_title VARCHAR(50),
    notice_description VARCHAR(1000),
    notice_date DATE,
    notice_type VARCHAR(20),

    CONSTRAINT PK_Notice PRIMARY KEY (notice_id),
    CONSTRAINT CH_Notice CHECK (notice_type IN ('General', 'Urgent')),
    CONSTRAINT FK_Notice FOREIGN KEY (t_id) REFERENCES Teacher(tc_id),
    CONSTRAINT CH_Notice_Std CHECK (t_id LIKE 'TC_____')
);

CREATE TABLE Resource
(
    res_id INT NOT NULL,
    res_name VARCHAR(50),
    quantityInHand INT,
    res_description VARCHAR(100),
    res_type VARCHAR(20),
    res_date DATE,
    res_status VARCHAR(20),

    CONSTRAINT PK_Resource PRIMARY KEY (res_id),
    CONSTRAINT CH_Resource CHECK (res_type IN ('textbook', 'stationery', 'uniform', 'electronics', 'MathTools', 'other')),
    CONSTRAINT CH_Resource_Status CHECK (res_status IN ('Available', 'Not Available'))
);

CREATE TABLE Resource_Release
(
    release_id INT NOT NULL,
    cm_id VARCHAR(10) NOT NULL,
    res_id INT NOT NULL,
    recipient_id VARCHAR(10) NOT NULL, /* Can be std_id or stf_id */
    release_date DATE,

    CONSTRAINT PK_Resource_Release PRIMARY KEY (release_id),
    CONSTRAINT FK_Resource_Release_CM FOREIGN KEY (cm_id) REFERENCES CR_Manager(cm_id),
    CONSTRAINT FK_Resource_Release_Resource FOREIGN KEY (res_id) REFERENCES Resource(res_id),
    CONSTRAINT CH_Resource_Release_Recipient CHECK (recipient_id LIKE 'ST_____' OR recipient_id LIKE 'AD_____' OR recipient_id LIKE 'TC_____' OR recipient_id LIKE 'FM_____' OR recipient_id LIKE 'CM_____')
);

CREATE TABLE Syllabus
(
    syllabus_id INT NOT NULL,
    sub_id VARCHAR(10) NOT NULL,
    cm_id VARCHAR(10) NOT NULL,
    syllabus_description VARCHAR(1000),
    syllabus_date DATE,
    syllabus_objectives VARCHAR(500),
    syllabus_duration INT,
    syllabus_file VARCHAR(100), /*This should be the link to the cloud servide */
    syllabus_approval VARCHAR(20), 

    CONSTRAINT PK_Syllabus PRIMARY KEY (syllabus_id),
    CONSTRAINT FK_Syllabus_Subject FOREIGN KEY (sub_id) REFERENCES Subject(sub_id),
    CONSTRAINT FK_Syllabus_CM FOREIGN KEY (cm_id) REFERENCES CR_Manager(cm_id),
    CONSTRAINT CH_Syllabus CHECK (sub_id LIKE '______'),
    CONSTRAINT CH_Syllabus_Approval CHECK (syllabus_approval IN ('Pending', 'Approved', 'Rejected'))
);


/*Once the finance manager retreives payement infor from the temporary table, if validated temporary table's row should be removed and stored in the permanant table)*/
/*This should be done using a trigger OR anything*/
CREATE TABLE Permanant_Payment
(
    payment_id INT NOT NULL,
    std_id VARCHAR(10) NOT NULL,
    fm_id VARCHAR(10) NOT NULL,
    amount FLOAT,
    payment_date DATE,
    payment_method VARCHAR(20),

    CONSTRAINT PK_Permanant_Payment PRIMARY KEY (payment_id),
    CONSTRAINT FK_Permanant_Payment_Student FOREIGN KEY (std_id) REFERENCES Student(std_id),
    CONSTRAINT FK_Permanant_Payment_FinanceManager FOREIGN KEY (fm_id) REFERENCES Finance_Manager(fm_id),
    
    
    CONSTRAINT CH_Permanant_Payment_StdId CHECK (std_id LIKE 'ST_____'),
    CONSTRAINT CH_Permanant_Payment_Method CHECK (payment_method IN ('Credit Card', 'Debit Card', 'Bank Transfer'))

);



