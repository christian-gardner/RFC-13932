DROP SEQUENCE SQA_QC_MASTER_SEQ;

CREATE SEQUENCE SQA_QC_MASTER_SEQ
  START WITH 1
  MAXVALUE 9999999999999999999999999999
  MINVALUE 1
  NOCYCLE
  NOCACHE
  NOORDER;
