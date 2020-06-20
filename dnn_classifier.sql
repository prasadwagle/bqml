CREATE OR REPLACE MODEL pwagle.txtclass_dnn_classifier
OPTIONS(model_type='DNN_CLASSIFIER', input_label_cols=['source'])
AS
WITH extracted AS (
SELECT source, REGEXP_REPLACE(LOWER(REGEXP_REPLACE(title, '[^a-zA-Z0-9 $-]', ' ')), "  ", " ") AS title 
FROM
  (SELECT
    ARRAY_REVERSE(SPLIT(REGEXP_EXTRACT(url, '.*://(.[^/]+)/'), '.'))[OFFSET(1)] AS source,
    title
  FROM
    `bigquery-public-data.hacker_news.stories`
  WHERE
    REGEXP_CONTAINS(REGEXP_EXTRACT(url, '.*://(.[^/]+)/'), '.com$')
    AND LENGTH(title) > 10
  )
)
, ds AS (
SELECT SPLIT(title, " ") AS words, source 
FROM extracted
WHERE (source = 'github' OR source = 'nytimes' OR source = 'techcrunch')
)
SELECT 
source, 
words
FROM ds
--limit 10000
