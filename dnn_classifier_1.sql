CREATE OR REPLACE MODEL pwagle.txtclass_dnn_classifier_1
OPTIONS(model_type='DNN_CLASSIFIER', input_label_cols=['source'], hidden_units=[10, 5])
AS
SELECT source, words, 1 as dummy_feature -- workaround for BQML issue
FROM pwagle.txtclass_input
