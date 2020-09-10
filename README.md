# Database-Processing-M8<br>
### Part 1<br>
<br>
Use a DataFrame in python to define the following queries using the Employee data (employee.csv is attached). You can read it using pandas.read_csv('Employee.txt'). Adding optional parameter names=[] will allow you to rename the columns.<br> 

a.	Find all male employees<br>

b.	Find the lowest salary for female employees<br>

c.	Print out salary groups (individual values without applying aggregation) by middle initial<br>
<br>
### Part 2<br>

Consider the table STUDENT with attributes ID, Name, Midterm, Final, and Homework, and the table WEIGHTS with attributes MidPct, FinPct, and HWPct defined and populated by the following script:<br>
Write an anonymous PL/SQL block that will do the following:<br>  

First, report the three weights found in the WEIGHTS table.  (You may assume that the WEIGHTS table contains only one record.)  Next, output the name of each student in the STUDENT table and their overall score, computed as x percent Midterm, y percent Final, and z percent Homework, where x, y, and z are the corresponding percentages found in the WEIGHTS table.  (You may assume that x+y+z=100.)  Also convert each student’s overall score to a letter grade by the rule 90-100=A, 80-89.99=B, 65-79.99=C, 0-64.99=F, and include the letter grade in the output.  Output each student’s information on a separate line. <br> 
<br>
###Part 3<br>

Consider the SECTION and ENROLLMENT tables defined by the following script, which also populates the SECTION table;<br>
The Students attribute of SECTION should store a count of how many students are enrolled in the section – that is, the number of records in ENROLLMENT with that SectionID – and its value should never exceed five (they are very small sections…).  Your task is to write two triggers that will maintain the value of the Students attribute as changes are made to the ENROLLMENT table.<br>

Write definitions of the following two triggers:<br>

A. Write a trigger that will fire when a user attempts to INSERT a row into ENROLLMENT. This trigger will check the value of SECTION.Students for the corresponding section. If SECTION.Students is less than 5, then there is still room in the section so allow the insert and update SECTION.Students. If SECTION.Students is equal to 5, then the section is full so it will cancel the INSERT and display an error message stating that the section is full.  <br>
You can raise an error using:<br>
raise_application_error(-20102, '[Place your error message here]');<br>
B. Write a trigger that will fire when a user attempts to DELETE one or more rows from ENROLLMENT.  This trigger will update the values of SECTION.Students for any affected sections to make sure they are accurate after the rows are deleted, by decreasing the value of SECTION.Students by one each time a student is removed from a section.

