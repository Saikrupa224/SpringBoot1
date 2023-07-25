INSERT INTO test.employee (first_name, last_name, job_start_date, salary)
VALUES
  ('vivek', 'teja', '2022-01-15', 50000.00),
  ('sampath', 'manne', '2021-09-01', 60000.00),
  ('gopi', 'krishna', '2023-03-10', 55000.00),
  ('prasanth', 'andey', '2022-07-18', 45000.00);

Select * from test.employee;

ALTER TABLE test.employee
ADD COLUMN department VARCHAR(50);

Select first_name from test.employee where
 salary>=(Select Max(salary) from test.employee);
 
Select first_name from test.employee where
 job_start_date>=(Select Max(salary) from test.employee); 
 
 SELECT * FROM test.employee
WHERE job_start_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

UPDATE test.employee
SET department = 'computerscience'
WHERE first_name='vivek';

UPDATE test.employee
SET department = 'electrical'
WHERE first_name='sampath';

UPDATE test.employee
SET department = 'mechanical'
WHERE first_name='gopi';

UPDATE test.employee
SET department = 'civil'
WHERE first_name='prasanth';

Select first_name,count(first_name) from test.employee GROUP BY department;

Select * from test.consultant_detail;
Select * from test.submission;
UPDATE test.consultant_detail
SET email = 'vivek1@gmail.com'
WHERE first_name='vivek';

SELECT c.first_name,count(*) as no_of_submssions from test.submission s join test.consultant_detail c on s.id=c.id 
where s.submission_status='submitted' group by c.id;

SELECT c.first_name,count(*) as no_of_submssions from test.submission s join test.consultant_detail c on s.id=c.id where s.submission_status='submitted'
 group by s.submission_date;
 
 DELETE FROM submission
WHERE rate IS NULL;


 ALTER TABLE test.submission
ADD COLUMN lead_id VARCHAR(50);

 UPDATE test.submission
SET lead_id = '1'
WHERE id='1';

 UPDATE test.submission
SET lead_id = '4'
WHERE id='4';
 
 select * from test.submission 
 where lead_id IN(
 select id from test.lead_detail where first_name='vivek'
 )
 and submission_date='2022-01-15';
 

SELECT c.lead_id,count(*) as no_of_submssions from test.submission s join test.consultant_detail c on s.id=c.id 
where s.submission_status='submitted' group by c.id;