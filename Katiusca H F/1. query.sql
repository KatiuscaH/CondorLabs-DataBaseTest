1.
SELECT 
    t.cd_role_type as "User Type", 
    count(t.id_user) as "Total Active",
    SUM(IF(t.nm_middle is null,1,0)) as "No Middle Name"
from 
    (SELECT
        user_role.cd_role_type,
         user_role.id_user,
        user_profile.nm_middle
    FROM user_role
    LEFT JOIN user_profile
        ON user_role.id_user = user_profile.id_user
    where 
        user_role.in_status = 1
    ) as t,
    (select distinct cd_role_type from user_role) as t2
where
    t.cd_role_type = t2.cd_role_type
group by t2.cd_role_type;