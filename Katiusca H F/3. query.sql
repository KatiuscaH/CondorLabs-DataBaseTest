3.
SELECT
	COUNT(user_role.in_status) AS "Non-active Providers"
FROM
	user_role, user_profile 
WHERE 
	(cd_role_type = "provider")  AND in_status != 1 AND		user_profile.id_user = user_role.id_user