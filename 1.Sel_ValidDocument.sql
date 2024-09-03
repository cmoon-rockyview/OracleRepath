ALTER TRIGGER AMANDA.VALIDDOCUMENT_UPD DISABLE;

ALTER TRIGGER AMANDA.VALIDDOCUMENT_DEL DISABLE;

BEGIN
    -- Check if the table exists
    DECLARE
        v_count NUMBER;
    BEGIN
        SELECT COUNT(*)
        INTO v_count
        FROM all_tables 
        WHERE owner = 'AMANDA' 
        AND table_name = 'VALIDDOCUMENTBKT';

        IF v_count > 0 THEN
            EXECUTE IMMEDIATE 'DROP TABLE amanda.validdocumentBKT';
        END IF;
    END;
END;

CREATE TABLE Amanda.ValidDocumentBKT AS

-- Truncate table Amanda.ValidDocumentBKT;
-- Insert into Amanda.ValidDocumentBKT
SELECT
 
    -- Original and transformed MergeDocument columns
    DOCUMENTCODE, 
    
    MERGEDOCUMENT,
    CASE
        WHEN UPPER(MERGEDOCUMENT) LIKE UPPER('K:\%') THEN
            REPLACE(UPPER(MERGEDOCUMENT), UPPER('K:\'), '\\abbotsford.loc\AppData\Amanda')
        WHEN UPPER(MERGEDOCUMENT) LIKE UPPER('\\fileserva\Kommon%') THEN
            REPLACE(UPPER(MERGEDOCUMENT), UPPER('\\fileserva\Kommon'), '\\abbotsford.loc\AppData\Amanda')
        WHEN UPPER(MERGEDOCUMENT) LIKE UPPER('\\fileserva\appdata\Amanda%') THEN
            REPLACE(UPPER(MERGEDOCUMENT), UPPER('\\fileserva\appdata\Amanda'), '\\abbotsford.loc\AppData\Amanda')
        ELSE
            MERGEDOCUMENT
    END           AS NEW_MERGEDOCUMENT,
 
    -- Original and transformed savepath columns
    SAVEPATH,
    CASE
        WHEN UPPER(SAVEPATH) LIKE UPPER('K:\%') THEN
            REPLACE(UPPER(SAVEPATH), UPPER('K:\'), '\\abbotsford.loc\AppData\Amanda')
        WHEN UPPER(SAVEPATH) LIKE UPPER('\\fileserva\Kommon%') THEN
            REPLACE(UPPER(SAVEPATH), UPPER('\\fileserva\Kommon'), '\\abbotsford.loc\AppData\Amanda')
        WHEN UPPER(SAVEPATH) LIKE UPPER('\\fileserva\appdata\Amanda%') THEN
            REPLACE(UPPER(SAVEPATH), UPPER('\\fileserva\appdata\Amanda'), '\\abbotsford.loc\AppData\Amanda')
        ELSE
            SAVEPATH
    END           AS NEW_SAVEPATH,
 
    -- Original and transformed temppath columns
    TEMPPATH,
    CASE
        WHEN UPPER(TEMPPATH) LIKE UPPER('K:\%') THEN
            REPLACE(UPPER(TEMPPATH), UPPER('K:\'), '\\abbotsford.loc\AppData\Amanda')
        WHEN UPPER(TEMPPATH) LIKE UPPER('\\fileserva\Kommon%') THEN
            REPLACE(UPPER(TEMPPATH), UPPER('\\fileserva\Kommon'), '\\abbotsford.loc\AppData\Amanda')
        WHEN UPPER(TEMPPATH) LIKE UPPER('\\fileserva\appdata\Amanda%') THEN
            REPLACE(UPPER(TEMPPATH), UPPER('\\fileserva\appdata\Amanda'), '\\abbotsford.loc\AppData\Amanda')
        ELSE
            TEMPPATH
    END           AS NEW_TEMPPATH,
 
    -- Original and transformed sendpath columns
    SENDPATH,
    CASE
        WHEN UPPER(SENDPATH) LIKE UPPER('K:\%') THEN
            REPLACE(UPPER(SENDPATH), UPPER('K:\'), '\\abbotsford.loc\AppData\Amanda')
        WHEN UPPER(SENDPATH) LIKE UPPER('\\fileserva\Kommon%') THEN
            REPLACE(UPPER(SENDPATH), UPPER('\\fileserva\Kommon'), '\\abbotsford.loc\AppData\Amanda')
        WHEN UPPER(SENDPATH) LIKE UPPER('\\fileserva\appdata\Amanda%') THEN
            REPLACE(UPPER(SENDPATH), UPPER('\\fileserva\appdata\Amanda'), '\\abbotsford.loc\AppData\Amanda')
        ELSE
            SENDPATH
    END           AS NEW_SENDPATH
FROM
    AMANDA.VALIDDOCUMENT;

ALTER TRIGGER AMANDA.VALIDDOCUMENT_UPD ENABLE;

ALTER TRIGGER AMANDA.VALIDDOCUMENT_DEL ENABLE;

SELECT *
FROM AMANDA.VALIDDOCUMENTBKT;