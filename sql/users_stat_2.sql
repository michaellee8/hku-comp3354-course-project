SELECT aq.uid, COUNT(aws_vote.id) AS article_comment_downvoted_count
FROM pincong_data.aws_vote
         RIGHT JOIN aws_article_comment aq on aws_vote.item_id = aq.id
WHERE aq.uid > 0
  AND aws_vote.value < 0
  AND aws_vote.type = "article_comment"
GROUP BY aq.uid
