SELECT
UPPER(s.value) as word,
COUNT(*) as Appearance,
sum(statistics_like_count) as Likes,
sum(statistics_comment_count) as Comments,
sum(statistics_view_count) as Views,

FROM video
left join lateral split_to_table(SNIPPET_TITLE,' ') as s
GROUP BY UPPER(S.value)
ORDER BY Appearance DESC