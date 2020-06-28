CREATE OR REPLACE MODEL pwagle.txtclass_logistic_reg
OPTIONS(model_type='logistic_reg', input_label_cols=['source'])
AS
WITH extracted AS (
SELECT source, title
FROM ds pwagle.txtclass_input
