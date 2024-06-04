With Subscribers as (
Select VIDEO_ID,
SUM(SUBSCRIBERS_GAINED) as Sub_Gained, 
Sum(SUBSCRIBERS_LOST) as Sub_Lost
From CHANNEL_BASICS
Group By VIDEO_ID)


Select ID, 
SNIPPET_TITLE, 
SNIPPET_PUBLISHED_AT, 
Sub_Gained, 
Sub_Lost
From VIDEO as V
Inner Join Numa On 
    V.ID = Numa.VIDEO_ID
