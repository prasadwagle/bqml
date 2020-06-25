# bqml
Experiments with BQML based on Lak's blog post (TODO add link)

## Input

SQL to create txtclass_input in txtclass_input.sql.

select count(distinct words1)
from `twttr-bq-bqml-dev.pwagle.txtclass_input`, unnest(words) as words1

Result: 53838

## logistic_reg.sql

* Time to train Less than a minute
* Threshold 0.0000
* Precision 0.8363
* Recall 0.8355
* Accuracy 0.8415
* F1 score 0.8355
* Log loss 0.4247
* ROC AUC 0.9496

## DNN_CLASSIFIER

* This query will process 204.8 MB (ML) when run.
* Elapsed time 12 min 36 sec
* Slot time consumed 6 min 9.997 sec
* Stages Preprocess	35.278 sec
* Train	11 min 33.775 sec
* Evaluate	26.069 sec	
* Training iterations Completed: 2 Planned: 20
* Threshold 	0.0000
* Precision 	0.1284
* Recall 	0.3333
* Accuracy 0.3852
* F1 score 0.1854
* Log loss 1.1036
* ROC AUC 	0.0000
