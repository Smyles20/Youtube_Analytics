With Word_CTE as (
SELECT
UPPER(s.value) as word,
COUNT(*) as Appearance,
sum(statistics_like_count) as Likes,
sum(statistics_comment_count) as Comments,
sum(statistics_view_count) as Views,

FROM SQL_HACKATHON.YOUTUBE_ANALYTICS.VIDEO
left join lateral split_to_table(SNIPPET_TITLE,' ') as s
GROUP BY UPPER(S.value)
ORDER BY Appearance DESC
)

Select regexp_replace ("WORD",'[[:punct:]]') as Word 
, SUM(Appearance) as Appearance
, Sum(Likes)as likes 
, Sum(Comments) as comments 
, SUM(Views) as "Views"
From Word_CTE
Where Word Not In ('A', 'ABOUT', 'ABOVE', 'AFTER', 'AGAIN', 'AGAINST', 'ALL', 'AM', 'AN', 'AND', 'ANY', 'ARE', 'AREN\'T', 'AS', 'AT', 'BE', 'BECAUSE', 'BEEN', 'BEFORE', 'BEING', 'BELOW', 'BETWEEN', 'BOTH', 'BUT', 'BY', 'CAN\'T', 'CANNOT', 'COULD', 'COULDN\'T', 'DID', 'DIDN\'T', 'DO', 'DOES', 'DOESN\'T', 'DOING', 'DON\'T', 'DOWN', 'DURING', 'EACH', 'FEW', 'FOR', 'FROM', 'FURTHER', 'HAD', 'HADN\'T', 'HAS', 'HASN\'T', 'HAVE', 'HAVEN\'T', 'HAVING', 'HE', 'HE\'D', 'HE\'LL', 'HE\'S', 'HER', 'HERE', 'HERE\'S', 'HERS', 'HERSELF', 'HIM', 'HIMSELF', 'HIS', 'HOW', 'HOW\'S', 'I', 'I\'D', 'I\'LL', 'I\'M', 'I\'VE', 'IF', 'IN', 'INTO', 'IS', 'ISN\'T', 'IT', 'IT\'S', 'ITS', 'ITSELF', 'LET\'S', 'ME', 'MORE', 'MOST', 'MUSTN\'T', 'MY', 'MYSELF', 'NO', 'NOR', 'NOT', 'OF', 'OFF', 'ON', 'ONCE', 'ONLY', 'OR', 'OTHER', 'OUGHT', 'OUR', 'OURS', 'OURSELVES', 'OUT', 'OVER', 'OWN', 'SAME', 'SHAN\'T', 'SHE', 'SHE\'D', 'SHE\'LL', 'SHE\'S', 'SHOULD', 'SHOULDN\'T', 'SO', 'SOME', 'SUCH', 'THAN', 'THAT', 'THAT\'S', 'THE', 'THEIR', 'THEIRS', 'THEM', 'THEMSELVES', 'THEN', 'THERE', 'THERE\'S', 'THESE', 'THEY', 'THEY\'D', 'THEY\'LL', 'THEY\'RE', 'THEY\'VE', 'THIS', 'THOSE', 'THROUGH', 'TO', 'TOO', 'UNDER', 'UNTIL', 'UP', 'VERY', 'WAS', 'WASN\'T', 'WE', 'WE\'D', 'WE\'LL', 'WE\'RE', 'WE\'VE', 'WERE', 'WEREN\'T', 'WHAT', 'WHAT\'S', 'WHEN', 'WHEN\'S', 'WHERE', 'WHERE\'S', 'WHICH', 'WHILE', 'WHO', 'WHO\'S', 'WHOM', 'WHY', 'WHY\'S', 'WITH', 'WON\'T', 'WOULD', 'WOULDN\'T', 'YOU', 'YOU\'D', 'YOU\'LL', 'YOU\'RE', 'YOU\'VE', 'YOUR', 'YOURS', 'YOURSELF', 'YOURSELVES'

)
Group by Word 