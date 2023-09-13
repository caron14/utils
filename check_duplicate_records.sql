SELECT
  COUNT(*) AS n_duplicate_rows,
  *
FROM
  `table id`
-- Perform the group by method by ALL columns.
GROUP BY
  --
  --
HAVING
  num_duplicate_rows > 1
;