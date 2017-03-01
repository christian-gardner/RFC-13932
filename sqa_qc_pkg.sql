SET DEFINE OFF;

CREATE OR REPLACE PACKAGE  SQA_QC_pkg
IS

/******************************************************
  Version # 1.0     CREATED 03/01/2017 Christian.gardner
 ******************************************************/


TYPE  GenRefCursor is REF CURSOR;
TYPE rowidArray is table of rowid index by binary_integer;

TYPE  JOB_TITLES IS RECORD 
( 
 JOB_TITLE   DBMS_SQL.VARCHAR2_TABLE,
 JOB_NAMES   DBMS_SQL.VARCHAR2_TABLE,
 ACTIVE      DBMS_SQL.NUMBER_TABLE
);
 


FUNCTION GET_JOB_TITLE ( P_ALT_TITLE VARCHAR2 ) RETURN VARCHAR2; 

PROCEDURE CONVERT_EIM_DATA;


END;
/
SHOW ERRORS;
SET DEFINE OFF;

CREATE OR REPLACE PACKAGE BODY SQA_QC_pkg
IS

    PROCEDURE CONVERT_EIM_DATA
    IS
    
    BEGIN
    
        NULL;    
    
    END;
    

    FUNCTION GET_JOB_TITLE ( P_ALT_TITLE VARCHAR2 ) RETURN VARCHAR2
    IS

    gc          GenRefCursor;
    JOB_TITLE   VARCHAR2(100 BYTE);
    SQL_STMT    VARCHAR2(32000 BYTE);
    CNT         NUMBER;

    JT          JOB_TITLES;

    BEGIN


        SQL_STMT := 'SELECT JOB_TITLE, JOB_NAMES, ACTIVE FROM SQA_QC_JOB_TITLES WHERE ACTIVE = 1 AND  upper(JOB_NAMES) = :A';

           OPEN GC FOR SQL_STMT USING upper(P_ALT_TITLE);

           FETCH GC BULK COLLECT INTO JT.JOB_TITLE, 
                                      JT.JOB_NAMES, 
                                      JT.ACTIVE;
     
            CNT := JT.JOB_TITLE.COUNT;

            IF ( CNT = 0 ) 
                THEN 
                JOB_TITLE := 'Job Title Unknown';
            else 
                JOB_TITLE := JT.JOB_TITLE(1);
                       
            END IF;

        CLOSE GC;

        
        RETURN JOB_TITLE;

    END;
 

end;
/
SHOW ERRORS;

