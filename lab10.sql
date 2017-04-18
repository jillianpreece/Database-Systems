--Number 1--
create or replace function PreReqsFor(int, REFCURSOR) returns refcursor as 
$$
declare
   courseNumInput   int       := $1;
   resultset   	    REFCURSOR := $2;
begin
   open resultset for 
      SELECT num, name as PreReqName
      FROM Courses 
      INNER JOIN Prerequisites on courses.num = prerequisites.preReqNum
      WHERE courseNumInput = Prerequisites.courseNum;
   return resultset;
end;
$$ 
language plpgsql;

SELECT PreReqsFor(220, 'results');
Fetch all from results;



--Number 2--
create or replace function IsPreReqFor(int, REFCURSOR) returns REFCURSOR as 
$$
declare
	PreReqNumInput int := $1;
    resultSet REFCURSOR := $2;
begin 
	open resultSet for
    	   SELECT courseNum
           FROM Prerequisites
           WHERE PreReqNumInput = PreReqNum;
        return resultSet;
end;
$$
language plpgsql;

SELECT IsPreReqFor(308, 'results');
fetch all from results;