Create Table Amanda.ValidSiteOptionBKT as
SELECT
 
    OptionKey,
    -- Original and transformed optionvalue column
    OPTIONVALUE,
    CASE
        WHEN UPPER(OPTIONVALUE) LIKE UPPER('K:\%') THEN
            REPLACE(UPPER(OPTIONVALUE), UPPER('K:\'), '\\abbotsford.loc\AppData\Amanda')
        WHEN UPPER(OPTIONVALUE) LIKE UPPER('\\fileserva\Kommon%') THEN
            REPLACE(UPPER(OPTIONVALUE), UPPER('\\fileserva\Kommon'), '\\abbotsford.loc\AppData\Amanda')
        WHEN UPPER(OPTIONVALUE) LIKE UPPER('\\fileserva\appdata\Amanda%') THEN
            REPLACE(UPPER(OPTIONVALUE), UPPER('\\fileserva\appdata\Amanda'), '\\abbotsford.loc\AppData\Amanda')
        ELSE
            OPTIONVALUE
    END           AS NEW_OPTIONVALUE,
 
    -- Original and transformed optionkey column
    OPTIONKEY,
    CASE
        WHEN UPPER(OPTIONKEY) LIKE UPPER('K:\%') THEN
            REPLACE(UPPER(OPTIONKEY), UPPER('K:\'), '\\abbotsford.loc\AppData\Amanda')
        WHEN UPPER(OPTIONKEY) LIKE UPPER('\\fileserva\Kommon%') THEN
            REPLACE(UPPER(OPTIONKEY), UPPER('\\fileserva\Kommon'), '\\abbotsford.loc\AppData\Amanda')
        WHEN UPPER(OPTIONKEY) LIKE UPPER('\\fileserva\appdata\Amanda%') THEN
            REPLACE(UPPER(OPTIONKEY), UPPER('\\fileserva\appdata\Amanda'), '\\abbotsford.loc\AppData\Amanda')
        ELSE
            OPTIONKEY
    END           AS NEW_OPTIONKEY,
 
    -- Original and transformed optioncomment column
    OPTIONCOMMENT,
    CASE
        WHEN UPPER(OPTIONCOMMENT) LIKE UPPER('K:\%') THEN
            REPLACE(UPPER(OPTIONCOMMENT), UPPER('K:\'), '\\abbotsford.loc\AppData\Amanda')
        WHEN UPPER(OPTIONCOMMENT) LIKE UPPER('\\fileserva\Kommon%') THEN
            REPLACE(UPPER(OPTIONCOMMENT), UPPER('\\fileserva\Kommon'), '\\abbotsford.loc\AppData\Amanda')
        WHEN UPPER(OPTIONCOMMENT) LIKE UPPER('\\fileserva\appdata\Amanda%') THEN
            REPLACE(UPPER(OPTIONCOMMENT), UPPER('\\fileserva\appdata\Amanda'), '\\abbotsford.loc\AppData\Amanda')
        ELSE
            OPTIONCOMMENT
    END           AS NEW_OPTIONCOMMENT
FROM
    AMANDA.VALIDSITEOPTION;


