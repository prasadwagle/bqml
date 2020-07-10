CREATE OR REPLACE MODEL pwagle.txtclass_xgboost
OPTIONS(model_type='BOOSTED_TREE_CLASSIFIER', input_label_cols=['source'])
AS
SELECT source, words
FROM pwagle.txtclass_input
WHERE ABS(MOD(FARM_FINGERPRINT(words[OFFSET(0)]), 10)) < 1 -- workaround for upper limit of allowed array inputs in the XGBoost model. The current limit is 9999, and the model is using 14895.
