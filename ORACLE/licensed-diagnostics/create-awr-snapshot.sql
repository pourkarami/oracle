SET SERVEROUTPUT ON
DECLARE
    snapshot_id NUMBER;
BEGIN
    snapshot_id := DBMS_WORKLOAD_REPOSITORY.CREATE_SNAPSHOT();
    DBMS_OUTPUT.PUT_LINE('Created AWR snapshot ' || snapshot_id);
END;
/
