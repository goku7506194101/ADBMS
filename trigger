CREATE TABLE employee2(
  emp_id NUMBER PRIMARY KEY,
  emp_name VARCHAR2(50),
  department VARCHAR2(30),
  salary NUMBER(10, 2)
);

desc employee2;

SELECT *FROM employee2;

INSERT INTO employee2 VALUES(101, 'Ravijeet Sharma', 'IT', 50000);
INSERT INTO employee2 VALUES(102, 'Ananya Mehra', 'HR', 42000);
INSERT INTO employee2 VALUES(103, 'Vikram Singh', 'Finance', 15000);
INSERT INTO employee2 VALUES(104, 'Sneha Kapoor', 'Marketing', 28000);
INSERT INTO employee2 VALUES(105, 'Arjun Verma', 'IT', 20000);

SELECT *FROM employee2;

CREATE OR REPLACE TRIGGER trg_salary_check
BEFORE INSERT OR UPDATE ON employee2
FOR EACH ROW
BEGIN
  IF :NEW.salary<10000 THEN
     RAISE_APPLICATION_ERROR(-20001, 'Salary must be at least 10,000');
  END IF;
END;

INSERT INTO employee2 VALUES(106, 'Vinay Singh', 'Sales', 8000);

CREATE OR REPLACE TRIGGER trg_after_insert_employee2
AFTER INSERT ON employee2
FOR EACH ROW
BEGIN
  DBMS_OUTPUT.PUT_LINE(
    'EmpID: ' || :NEW.emp_id || 
    '  Name: ' || :NEW.emp_name || 
    '  Dept: ' || :NEW.department || 
    '  Salary: ' || :NEW.salary
  );
END;

INSERT INTO employee2 VALUES(107, 'Meera Shah', 'Finance', 32000);
