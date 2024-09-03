UPDATE AMANDA.VALIDDOCUMENTTEXT
SET DDECOMMAND = CASE
    WHEN UPPER(DDECOMMAND) LIKE UPPER('%K:\%') THEN
        REPLACE(UPPER(DDECOMMAND), UPPER('K:\'), '\\abbotsford.loc\AppData\Amanda')
    WHEN UPPER(DDECOMMAND) LIKE UPPER('%\\fileserva\Kommon%') THEN
        REPLACE(UPPER(DDECOMMAND), UPPER('\\fileserva\Kommon'), '\\abbotsford.loc\AppData\Amanda')
    WHEN UPPER(DDECOMMAND) LIKE UPPER('%\\fileserva\appdata\Amanda%') THEN
        REPLACE(UPPER(DDECOMMAND), UPPER('\\fileserva\appdata\Amanda'), '\\abbotsford.loc\AppData\Amanda')
    ELSE
        DDECOMMAND
END
WHERE DDECOMMAND IS NOT NULL;

commit;