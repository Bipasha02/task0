CREATE TABLE FeeHead (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    amount DECIMAL(10, 2),
    frequency_months INT
);

CREATE TABLE Due (
    id INT PRIMARY KEY,
    fee_head_id INT,
    due_date DATE,
    FOREIGN KEY (fee_head_id) REFERENCES FeeHead(id)
);

CREATE TABLE Installment (
    id INT PRIMARY KEY,
    due_id INT,
    installment_date DATE,
    FOREIGN KEY (due_id) REFERENCES Due(id)
);

CREATE TABLE Payment (
    id INT PRIMARY KEY,
    amount DECIMAL(10, 2),
    payment_date DATE
);

CREATE TABLE Invoice (
    id INT PRIMARY KEY,
    student_id INT,
    total_amount DECIMAL(10, 2),
    payment_status VARCHAR(255),
    FOREIGN KEY (student_id) REFERENCES Student(id)
);

CREATE TABLE Transaction (
    id INT PRIMARY KEY,
    invoice_id INT,
    payment_id INT,
    FOREIGN KEY (invoice_id) REFERENCES Invoice(id),
    FOREIGN KEY (payment_id) REFERENCES Payment(id)
);
