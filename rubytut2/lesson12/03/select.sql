SELECT * FROM people
JOIN companies ON people.company_id = companies.id
WHERE companies.name = 'Yahoo';
