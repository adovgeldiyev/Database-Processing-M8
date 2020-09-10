
DROP TABLE ENROLLMENT CASCADE CONSTRAINTS;
DROP TABLE SECTION CASCADE CONSTRAINTS;

CREATE TABLE SECTION(
 SectionID 	CHAR(5),
 Course	VARCHAR2(7),
 Students	NUMBER DEFAULT 0,
 CONSTRAINT PK_SECTION 
		PRIMARY KEY (SectionID)
);

CREATE TABLE ENROLLMENT(
 SectionID	CHAR(5),
 StudentID	CHAR(7),
 CONSTRAINT PK_ENROLLMENT 
		PRIMARY KEY (SectionID, StudentID),
 CONSTRAINT FK_ENROLLMENT_SECTION 
		FOREIGN KEY (SectionID)
		REFERENCES SECTION (SectionID)
);
 
INSERT INTO SECTION (SectionID, Course) VALUES ( '12345', 'CSC 355' );
INSERT INTO SECTION (SectionID, Course) VALUES ( '22109', 'CSC 309' );
INSERT INTO SECTION (SectionID, Course) VALUES ( '99113', 'CSC 300' );
INSERT INTO SECTION (SectionID, Course) VALUES ( '99114', 'CSC 300' );
COMMIT;
SELECT * FROM SECTION;

                            
create or replace trigger sNum
before insert on enrollment
for each row
declare
    studentNumber number;
begin
    select count(*) into studentNumber
    from enrollment
    where sectionID =:new.sectionID;
    studentNumber := studentNumber + 1;
    if studentNumber > 5 then
        raise_application_error(-20102, 'no more room');
    elsif studentNumber <= 5 then
        update section set section.students =studentNumber
        where section.sectionID =: new.sectionID;
    end if;
end;
/

INSERT INTO ENROLLMENT VALUES ('12345', '1234567');
INSERT INTO ENROLLMENT VALUES ('12345', '2234567');
INSERT INTO ENROLLMENT VALUES ('12345', '3234567');
INSERT INTO ENROLLMENT VALUES ('12345', '4234567');
INSERT INTO ENROLLMENT VALUES ('12345', '5234567');
INSERT INTO ENROLLMENT VALUES ('12345', '6234567');
SELECT * FROM Section;
SELECT * FROM Enrollment;

create or replace trigger removed
before delete on enrollment
for each row
begin
    update section
    set students = students - 1
    where sectionID =: old.sectionID;
end;
/
DELETE FROM ENROLLMENT WHERE StudentID = '1234567';
SELECT * FROM Section;
SELECT * FROM Enrollment;
