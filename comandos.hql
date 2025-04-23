python pages.py  

pscp -i "C:\Users\ROG\Downloads\llave-cluster.ppk" "C:\Users\ROG\Desktop\big data\indice invertido\pages.log" hadoop@ec2-34-226-141-155.compute-1.amazonaws.com:/home/hadoop/


hdfs dfs -mkdir -p /user/hadoop/rank/

hdfs dfs -put pages.log /user/hadoop/rank/

hdfs dfs -ls /user/hadoop/rank/




CREATE EXTERNAL TABLE page_ranks (
  url STRING,
  rank FLOAT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE
LOCATION '/user/hadoop/rank/';





CREATE TABLE rank_result AS
SELECT user_avg.username, user_avg.avg_rank
FROM (
    SELECT v.username, AVG(p.rank) AS avg_rank
    FROM visit_logs v
    JOIN page_ranks p ON v.website = p.url
    WHERE p.rank > 0.5
    GROUP BY v.username
) user_avg
WHERE user_avg.avg_rank > 0.5;
