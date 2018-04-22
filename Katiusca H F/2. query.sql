2. 
SELECT 
	COUNT(user_role.cd_role_type) as "Active Licensees With 	Address Info" 
FROM 
	user_role, user_address
WHERE 
	(cd_role_type = "licensee" or cd_role_type = "limited") AND 	in_status = 1 and user_role.id_user = user_address.id_user 	AND user_address.id_address is not null