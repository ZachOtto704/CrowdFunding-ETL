-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT cf_id, SUM(backers_count)
FROM campaign
WHERE campaign.outcome = 'live'
GROUP BY cf_id
ORDER BY sum desc
;


-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
select * FROM backers;


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
SELECT b.first_name, b.last_name, b.email, (c.goal - c.pledged) 
INTO email_contacts_remaining_goal_amount
FROM backers as b
LEFT JOIN campaign as c
ON b.cf_id=c.cf_id
WHERE c.outcome = 'live';



-- Check the table
select * from  email_contacts_remaining_goal_amount

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 

SELECT b.email, b.first_name, b.last_name, b.cf_id, c.company_name, c.description, c.end_date, (c.goal - c.pledged) 
INTO email_backers_remaining_goal_amount
FROM backers as b
LEFT JOIN campaign as c
ON b.cf_id=c.cf_id
WHERE c.outcome = 'live';

-- Check the table
SELECT * FROM email_backers_remaining_goal_amount

