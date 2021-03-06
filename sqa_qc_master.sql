DROP TABLE SQA_QC_MASTER CASCADE CONSTRAINTS;

CREATE TABLE SQA_QC_MASTER
(
  PID          NUMBER,
  CLIENT       VARCHAR2(40 BYTE),
  LOAN_TYPE    VARCHAR2(40 BYTE),
  WORK_CODE    VARCHAR2(40 BYTE),
  VENDOR_CODE  VARCHAR2(40 BYTE),
  LOAN_NUMBER  VARCHAR2(40 BYTE),
  QC_SEGMENT   VARCHAR2(40 BYTE),
  WORKING      NUMBER,
  COMPLETED    DATE,
  LOAD_DATE    DATE
)
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;
