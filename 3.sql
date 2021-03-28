SELECT
    users.name AS username,
    communities.name AS community,
    permissions.name AS permission
FROM users
LEFT JOIN community_members ON users.id = community_members.user_id
LEFT JOIN communities ON communities.id = community_members.community_id
LEFT JOIN community_member_permissions ON community_member_permissions.member_id = community_members.id
LEFT JOIN permissions ON community_member_permissions.permission_id = permissions.id
WHERE LENGTH(communities.name) < 15 AND ((users.name LIKE '%T%') OR (permissions.name LIKE '%articles%'))