CREATE OR REPLACE MODEL pwagle.txtclass_logistic_reg
OPTIONS(model_type='logistic_reg', input_label_cols=['source'])
AS
SELECT source, words
FROM pwagle.txtclass_input
