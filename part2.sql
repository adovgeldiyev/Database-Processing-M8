DROP TABLE STUDENT CASCADE CONSTRAINTS;
CREATE TABLE STUDENT(
	ID		CHAR(3),
	Name		VARCHAR2(20),
	Midterm	NUMBER(3,0) 	CHECK (Midterm>=0 AND Midterm<=100),
	Final		NUMBER(3,0)	CHECK (Final>=0 AND Final<=100),
	Homework	NUMBER(3,0)	CHECK (Homework>=0 AND Homework<=100),
	PRIMARY KEY (ID)
);
INSERT INTO STUDENT VALUES ( '445', 'Seinfeld', 85, 90, 99 );
INSERT INTO STUDENT VALUES ( '909', 'Costanza', 74, 72, 86 );
INSERT INTO STUDENT VALUES ( '123', 'Benes', 93, 89, 91 );
INSERT INTO STUDENT VALUES ( '111', 'Kramer', 99, 91, 93 );
INSERT INTO STUDENT VALUES ( '667', 'Newman', 78, 82, 83 );
INSERT INTO STUDENT VALUES ( '888', 'Banya', 50, 65, 50 );
SELECT * FROM STUDENT;

DROP TABLE WEIGHTS CASCADE CONSTRAINTS;
CREATE TABLE WEIGHTS(
	MidPct	NUMBER(2,0) CHECK (MidPct>=0 AND MidPct<=100),
	FinPct	NUMBER(2,0) CHECK (FinPct>=0 AND FinPct<=100),
	HWPct	NUMBER(2,0) CHECK (HWPct>=0 AND HWPct<=100)
);
INSERT INTO WEIGHTS VALUES ( 30, 30, 40 );
SELECT * FROM WEIGHTS;
COMMIT;


declare
    midtermPct weights.MidPct%type;
    finalPct weights.FinPct%type;
    homeworkPct weights.HWPct%type;
    studentScore number(4,1);
    studentGrade char(1);
    studentInfo Student%rowtype;
    cursor studentPts is select * from Student;

begin
    select midPct, HWPct, FinPct
    into midtermPct, homeworkPct, finalPct
    from Weights;
    --First, report the three weights found in the WEIGHTS table.  
    dbms_output.put_line('Weights are '||midtermPct||','||homeworkPct||','||finalPct);
    
    for studentInfo in studentPts
    loop--Next, output the name of each student in the STUDENT table and their overall score
        studentScore := (studentInfo.Midterm * midtermPct + studentInfo.Homework * homeworkPct +
        studentInfo.Final * finalPct)/100;
        case--convert each student’s overall score to a letter grade by the rule 
        when(studentScore >= 90) then StudentGrade := 'A';
        when(studentScore >= 80) then StudentGrade := 'B';
        when(studentScore >= 70) then StudentGrade := 'C';
        when(studentScore >= 65) then StudentGrade := 'D';
        Else studentGrade := 'F';
        end case;
        
        dbms_output.put_line(studentInfo.ID||' '||studentInfo.Name||' '
                            ||studentScore||' '||studentGrade);
    end loop;
END;
/