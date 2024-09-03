--CREATE TABLE AMANDA.VALIDSITEOPTIONBKT AS
--
--SELECT *
--FROM AMANDA.VALIDSITEOPTION;

UPDATE AMANDA.VALIDSITEOPTION
SET
    OPTIONVALUE = CASE WHEN UPPER(
        OPTIONVALUE
    ) LIKE UPPER(
        'K:\%'
    ) THEN REPLACE(
        UPPER(OPTIONVALUE),
        UPPER('K:\'),
        '\\abbotsford.loc\AppData\Amanda'
    ) WHEN UPPER(
        OPTIONVALUE
    ) LIKE UPPER(
        '\\fileserva\Kommon%'
    ) THEN REPLACE(
        UPPER(OPTIONVALUE),
        UPPER('\\fileserva\Kommon'),
        '\\abbotsford.loc\AppData\Amanda'
    ) WHEN UPPER(
        OPTIONVALUE
    ) LIKE UPPER(
        '\\fileserva\appdata\Amanda%'
    ) THEN REPLACE(
        UPPER(OPTIONVALUE),
        UPPER('\\fileserva\appdata\Amanda'),
        '\\abbotsford.loc\AppData\Amanda'
    ) ELSE OPTIONVALUE END,
    OPTIONKEY = CASE WHEN UPPER(
        OPTIONKEY
    ) LIKE UPPER(
        'K:\%'
    ) THEN REPLACE(
        UPPER(OPTIONKEY),
        UPPER('K:\'),
        '\\abbotsford.loc\AppData\Amanda'
    ) WHEN UPPER(
        OPTIONKEY
    ) LIKE UPPER(
        '\\fileserva\Kommon%'
    ) THEN REPLACE(
        UPPER(OPTIONKEY),
        UPPER('\\fileserva\Kommon'),
        '\\abbotsford.loc\AppData\Amanda'
    ) WHEN UPPER(
        OPTIONKEY
    ) LIKE UPPER(
        '\\fileserva\appdata\Amanda%'
    ) THEN REPLACE(
        UPPER(OPTIONKEY),
        UPPER('\\fileserva\appdata\Amanda'),
        '\\abbotsford.loc\AppData\Amanda'
    ) ELSE OPTIONKEY END,
    OPTIONCOMMENT = CASE WHEN UPPER(
        OPTIONCOMMENT
    ) LIKE UPPER(
        'K:\%'
    ) THEN REPLACE(
        UPPER(OPTIONCOMMENT),
        UPPER('K:\'),
        '\\abbotsford.loc\AppData\Amanda'
    ) WHEN UPPER(
        OPTIONCOMMENT
    ) LIKE UPPER(
        '\\fileserva\Kommon%'
    ) THEN REPLACE(
        UPPER(OPTIONCOMMENT),
        UPPER('\\fileserva\Kommon'),
        '\\abbotsford.loc\AppData\Amanda'
    ) WHEN UPPER(
        OPTIONCOMMENT
    ) LIKE UPPER(
        '\\fileserva\appdata\Amanda%'
    ) THEN REPLACE(
        UPPER(OPTIONCOMMENT),
        UPPER('\\fileserva\appdata\Amanda'),
        '\\abbotsford.loc\AppData\Amanda'
    ) ELSE OPTIONCOMMENT END;
    
    commit;