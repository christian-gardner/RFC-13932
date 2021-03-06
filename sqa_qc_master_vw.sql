SET DEFINE OFF;
DROP VIEW SQA_QC_MASTER_VW
/

/* Formatted on 2/28/2017 3:09:46 PM (QP5 v5.185.11230.41888) */
CREATE OR REPLACE FORCE VIEW SQA_QC_MASTER_VW
(
   PID,
   CLIENT,
   LOAN_TYPE,
   WORK_CODE,
   VENDOR_CODE,
   LOAN_NUMBER,
   QC_SEGMENT,
   WORKING,
   COMPLETED
)
AS
     SELECT PID,
            CLIENT,
            LOAN_TYPE,
            WORK_CODE,
            VENDOR_CODE,
            LOAN_NUMBER,
            QC_SEGMENT,
            WORKING,
            COMPLETED
       FROM SQA_QC_MASTER
      WHERE NVL (WORKING, 0) = 0
   ORDER BY LOAD_DATE
/
