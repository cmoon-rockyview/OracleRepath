--CREATE TABLE AMANDA.FOLDERDOCUMENTBKT AS
ALTER TRIGGER AMANDA.FOLDERDOCUMENT_UPD_LOG DISABLE;

ALTER TRIGGER AMANDA.FOLDERDOCUMENT_DEL_LOG DISABLE;

ALTER TRIGGER AMANDA.FOLDERDOCUMENT_DEL DISABLE;

CREATE TABLE AMANDA.FOLDERDOCUMENTBKT AS
SELECT
 
    DOCUMENTRSN,
    -- ORIGINAL AND TRANSFORMED DOSPATH COLUMN
    DOSPATH,
    CASE
        WHEN UPPER(DOSPATH) LIKE UPPER('K:\%') THEN
            REPLACE(UPPER(DOSPATH), UPPER('K:\'), '\\ABBOTSFORD.LOC\APPDATA\AMANDA')
        WHEN UPPER(DOSPATH) LIKE UPPER('\\FILESERVA\KOMMON%') THEN
            REPLACE(UPPER(DOSPATH), UPPER('\\FILESERVA\KOMMON'), '\\ABBOTSFORD.LOC\APPDATA\AMANDA')
        WHEN UPPER(DOSPATH) LIKE UPPER('\\FILESERVA\APPDATA\AMANDA%') THEN
            REPLACE(UPPER(DOSPATH), UPPER('\\FILESERVA\APPDATA\AMANDA'), '\\ABBOTSFORD.LOC\APPDATA\AMANDA')
        ELSE
            DOSPATH
    END     AS NEW_DOSPATH
FROM
    AMANDA.FOLDERDOCUMENT
WHERE
    DOSPATH IS NOT NULL;

ALTER TRIGGER AMANDA.FOLDERDOCUMENT_UPD_LOG ENABLE;

ALTER TRIGGER AMANDA.FOLDERDOCUMENT_DEL_LOG ENABLE;

ALTER TRIGGER AMANDA.FOLDERDOCUMENT_DEL ENABLE;