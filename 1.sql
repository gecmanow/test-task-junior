SELECT
    users.id,
    users.name AS username,
    communities.name AS community,
    community_members.joined_at
FROM community_members
LEFT JOIN users ON users.id = community_members.user_id
LEFT JOIN communities ON communities.id = community_members.community_id
WHERE communities.created_at >= 2013-01-01
ORDER BY community_members.joined_at DESC