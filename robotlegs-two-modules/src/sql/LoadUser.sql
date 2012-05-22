SELECT 
	user_name,
	user_password
FROM main.users
WHERE user_name = :user_name AND user_password = :user_password