SELECT aws_users.uid,
       aws_users.user_name,
       aws_users.fans_count,
       aws_users.friend_count,
       aws_users.topic_focus_count,
       aws_users.agree_count,
       aws_users.views_count,
       aws_users.reputation,
       aws_users.flagged != 0 AS flagged,
       COUNT(aq.question_id)  AS question_count,
       COUNT(aqd.id)          AS question_disussion_count,
       COUNT(aa.answer_id)    AS answer_count,
       COUNT(a.id)            AS article_count,
       COUNT(aac.id)          AS article_comment_id
FROM aws_users
         LEFT JOIN aws_question aq on aws_users.uid = aq.uid
         LEFT JOIN aws_question_discussion aqd on aq.uid = aqd.uid
         LEFT JOIN aws_answer aa on aq.uid = aa.uid
         LEFT JOIN aws_article a on aa.uid = a.uid
         LEFT JOIN aws_article_comment aac on a.uid = aac.uid
GROUP BY aws_users.uid, aq.uid, aqd.uid, aa.uid, a.uid, aac.uid
