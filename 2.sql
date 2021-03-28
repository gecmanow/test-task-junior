SELECT
    communities.id,
    communities.name AS communityName,
    permissions.name AS permissionName,
    COUNT(permissions.name) AS permissionCount
FROM permissions
LEFT JOIN community_member_permissions ON community_member_permissions.permission_id = permissions.id
LEFT JOIN community_members ON community_members.id = community_member_permissions.member_id
LEFT JOIN communities ON community_members.community_id = communities.id
GROUP BY permissions.name, communities.name, communities.id
HAVING permissionCount >= 5
ORDER BY communities.id DESC LIMIT 100