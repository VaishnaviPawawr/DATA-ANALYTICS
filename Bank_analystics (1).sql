use project_analystics;

select * from finance1;
select * from finance2;

# KPI1 : Year wise loan amount status

SELECT YEAR(issue_d) AS loan_year,
		COUNT(*) AS total_loans,
        SUM(loan_amnt) AS total_loan_amount,
        AVG(loan_amnt) AS average_loan_amount,
        MAX(loan_amnt) AS Max_loan_amount,
        MIn(loan_amnt) AS min_loan_amount
FROM finance1
GROUP BY loan_year
ORDER BY loan_year;

#KPI2 : Grade and Subgrade wise Revol_balance

select grade, sub_grade, SUM(revol_bal) AS total_revol_bal
from finance1 B1 inner join finance2 B2
on(B1.id = B2.id)
group by grade,sub_grade
order by grade;

#KPI3 : Total payment for verified status Vs Total payment for non verified status 

select verification_status, round(sum(total_pymnt),2) AS Total_payment
from finance1 B1 inner join finance2 B2
on(B1.id = B2.id)
where verification_status in('Verified','Not Verified')
group by verification_status;

#KPI4 : use project_analystics;

select * from finance1;
select * from finance2;

# KPI1 : Year wise loan amount status

SELECT YEAR(issue_d) AS loan_year,
		COUNT(*) AS total_loans,
        SUM(loan_amnt) AS total_loan_amount,
        AVG(loan_amnt) AS average_loan_amount,
        MAX(loan_amnt) AS Max_loan_amount,
        MIn(loan_amnt) AS min_loan_amount
FROM finance1
GROUP BY loan_year
ORDER BY loan_year;

#KPI2 : Grade and Subgrade wise Revol_balance

select grade, sub_grade, SUM(revol_bal) AS total_revol_bal
from finance1 B1 inner join finance2 B2
on(B1.id = B2.id)
group by grade,sub_grade
order by grade;

#KPI3 : Total payment for verified status Vs Total payment for non verified status 

select verification_status, round(sum(total_pymnt),2) AS Total_payment
from finance1 B1 inner join finance2 B2
on(B1.id = B2.id)
where verification_status in('Verified','Not Verified')
group by verification_status;

#KPI4 : State wise and month wise loan status

select addr_state, last_credit_pull_d, loan_status
from finance1 B1 inner join finance2 B2
on(B1.id = B2.id)
group by addr_state, last_credit_pull_d, loan_status
order by addr_state;

#KPI5: Home ownership Vs last payment date stats

select home_ownership, last_pymnt_d as last_payment_date, sum(last_payment_date)
from finance1 B1 inner join B2
on(B1.id = B2.id)
group by last_pymnt_d, home_ownership
having sum(last_pymnt_amnt) =
(  select min(last_payment_amnt) 
   from finance1 B2 inner join B1
   on(B1.id = B2.id)
   group by last_payment_d, home_ownership
   );
   
select last_pymnt_d,sum(last_pymnt_amnt), home_ownership
from finance1 B2 join finance2 B1
on(B1.id = B2.id)
group by last_pymnt_d, home_ownership
order by last_pymnt_d desc;


