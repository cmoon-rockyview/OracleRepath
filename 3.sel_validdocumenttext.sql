CREATE TABLE AMANDA.VALIDDOCUMENTTEXTBKT AS
    SELECT
        DOCUMENTCODE,
 
        -- Original and transformed ddecommand column
        DDECOMMAND,
        CASE
            WHEN UPPER(DDECOMMAND) LIKE UPPER('K:\%') THEN
                REPLACE(UPPER(DDECOMMAND), UPPER('K:\'), '\\abbotsford.loc\AppData\Amanda')
            WHEN UPPER(DDECOMMAND) LIKE UPPER('%\\fileserva\Kommon%') THEN
                REPLACE(UPPER(DDECOMMAND), UPPER('\\fileserva\Kommon'), '\\abbotsford.loc\AppData\Amanda')
            WHEN UPPER(DDECOMMAND) LIKE UPPER('%\\fileserva\appdata\Amanda%') THEN
                REPLACE(UPPER(DDECOMMAND), UPPER('\\fileserva\appdata\Amanda'), '\\abbotsford.loc\AppData\Amanda')
            ELSE
                DDECOMMAND
        END          AS NEW_DDECOMMAND
    FROM
        AMANDA.VALIDDOCUMENTTEXT
    WHERE
        DDECOMMAND IS NOT NULL;