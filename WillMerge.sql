AMANDA.VALIDDOCUMENT

//===================MergeDocument

3 Scenarios

K:\CSDCDOC\
K:\AMANDA7_PROD\CSDCDOC\
\\FILESERVA\KOMMON\AMANDA7_PROD\CSDCDOC\

--test query
SELECT
    AVD.MERGEDOCUMENT
FROM
    AMANDA.VALIDDOCUMENT AVD
WHERE
    UPPER(AVD.MERGEDOCUMENT) NOT LIKE UPPER('k:\%')
    AND UPPER(AVD.MERGEDOCUMENT) NOT LIKE UPPER('\\FILESERVA\KOMMON\%')
    AND UPPER(AVD.MERGEDOCUMENT) NOT LIKE UPPER('i:\%')
 --end test query
    //===================END MERGEDOCUMENT //===================SAVEPATH K:\CSDCDOC\ \\FILESERVA\APPDATA\AMANDA\A7PRD\ \\FILESERVA\KOMMON\AMANDA7_PROD\CSDCDOC \\FILESERVA\KOMMON\CSDCDOC\
 --test query
    SELECT
        AVD.SAVEPATH
    FROM
        AMANDA.VALIDDOCUMENT AVD
    WHERE
        UPPER(AVD.SAVEPATH) NOT LIKE UPPER('k:\csdcdoc\%')
        AND UPPER(AVD.SAVEPATH) NOT LIKE UPPER('\\fileserva\appdata\Amanda\A7PRD\%')
        AND UPPER(AVD.SAVEPATH) NOT LIKE UPPER('\\fileserva\Kommon\AMANDA7_PROD\csdcdoc\%')
        AND UPPER(AVD.SAVEPATH) NOT LIKE UPPER('\\fileserva\Kommon\csdcdoc\%')
        AND UPPER(AVD.SAVEPATH) NOT LIKE UPPER('i:\%')
 --end test query
        //===================END SAVEPATH //===================TEMPPATH K:\CSDCDOC\ \\FILESERVA\KOMMON\CSDCDOC\ \\FILESERVA\KOMMON\AMANDA7_PROD\CSDCDOC\%
        SELECT
            AVD.TEMPPATH
        FROM
            AMANDA.VALIDDOCUMENT AVD
        WHERE
            UPPER(AVD.TEMPPATH) NOT LIKE UPPER('k:\csdcdoc\%')
            AND UPPER(AVD.TEMPPATH) NOT LIKE UPPER('\\fileserva\Kommon\AMANDA7_PROD\csdcdoc\%')
            AND UPPER(AVD.TEMPPATH) NOT LIKE UPPER('\\fileserva\Kommon\csdcdoc\%')
            AND UPPER(AVD.TEMPPATH) NOT LIKE UPPER('i:\%') //===================END TEMPPATH //===================SENDPATH SCENARIOS K:\CSDCDOC\ \\FILESERVA\APPDATA\AMANDA\A7PRD\ \\FILESERVA\KOMMON\AMANDA6_PROD\CSDCDOC\ \\FILESERVA\KOMMON\AMANDA7_PROD\ \\FILESERVA\KOMMON\CSDCDOC\
 --test query
            SELECT
                AVD.SENDPATH
            FROM
                AMANDA.VALIDDOCUMENT AVD
            WHERE
                UPPER(AVD.SENDPATH) NOT LIKE UPPER('k:\csdcdoc\%')
                AND UPPER(AVD.SENDPATH) NOT LIKE UPPER('\\fileserva\appdata\Amanda\A7PRD\%')
                AND UPPER(AVD.SENDPATH) NOT LIKE UPPER('\\fileserva\Kommon\AMANDA6_PROD\csdcdoc\%')
                AND UPPER(AVD.SENDPATH) NOT LIKE UPPER('\\fileserva\Kommon\AMANDA7_PROD\%')
                AND UPPER(AVD.SENDPATH) NOT LIKE UPPER('\\fileserva\Kommon\csdcdoc\%')
                AND UPPER(AVD.SENDPATH) NOT LIKE UPPER('i:\%') //END ===================SENDPATH AMANDA.VALIDSITEOPTION //===================OPTIONVALUE SCENARIOS \\FILESERVA\APPDATA\AMANDA\A7PRD\ \\FILESERVA\AMANDA_DOCS\
 --test query
                SELECT
                    AVS.OPTIONVALUE
                FROM
                    AMANDA.VALIDSITEOPTION AVS
                WHERE
                    ( (UPPER(AVS.OPTIONVALUE) LIKE UPPER('%a7prd%') )
                    OR (UPPER(AVS.OPTIONVALUE) LIKE UPPER('%amanda_docs%')) )
                    AND UPPER(AVS.OPTIONVALUE) NOT LIKE UPPER('\\fileserva\appdata\Amanda\A7PRD\%')
                    AND UPPER(AVS.OPTIONVALUE) NOT LIKE UPPER('\\fileserva\amanda_docs\%') //===================END OPTIONVALUE AMANDA.VALIDDOCUMENTTEXT //===================DDECOMMAND SCENARIOS \\FILESERVA\KOMMON\AMANDA7_PROD\CSDCDOC\
                    SELECT
                        AVT.DDECOMMAND
                    FROM
                        AMANDA.VALIDDOCUMENTTEXT AVT
                    WHERE
                        UPPER(AVT.DDECOMMAND) NOT LIKE UPPER('%\\fileserva\Kommon\AMANDA7_PROD\csdcdoc\%')
                        AND TEXTORDER = 10 AMANDA.FOLDERDOCUMENT =====================DOSPATH SCENARIOS K:\MAILMERGE\SAVEPATH\
                        SELECT
                            AFD.DOSPATH
                        FROM
                            AMANDA.FOLDERDOCUMENT AFD
                        WHERE
                            UPPER(AFD.DOSPATH) NOT LIKE UPPER('K:\MAILMERGE\%')
                            AND UPPER(AFD.DOSPATH) NOT LIKE UPPER('\\fileserva\appdata\Amanda\A7PRD\%')
                            AND UPPER(AFD.DOSPATH) NOT LIKE UPPER('\\FILESERVA\KOMMON\AMANDA7_PROD\CSDCDOC\%')
                            AND UPPER(AFD.DOSPATH) NOT LIKE UPPER('\\fileserva\amanda_docs\%')
                            AND UPPER(AFD.DOSPATH) NOT LIKE UPPER('\\fileserva\plnshr\%')
                            AND UPPER(AFD.DOSPATH) NOT LIKE UPPER('K:\csdcdoc\%')
                            AND UPPER(AFD.DOSPATH) NOT LIKE UPPER('K:\Loc\%')
                            AND UPPER(AFD.DOSPATH) NOT LIKE UPPER('K:/Loc/%')
                            AND UPPER(AFD.DOSPATH) NOT LIKE UPPER('k:loc\%')
                            AND UPPER(AFD.DOSPATH) NOT LIKE UPPER('K:Loc/%')
                            AND UPPER(AFD.DOSPATH) NOT LIKE UPPER('K:\Lease Contracts\%')
                            AND UPPER(AFD.DOSPATH) NOT LIKE UPPER('L:\\Permits\Scanned Files\%')
                            AND UPPER(AFD.DOSPATH) NOT LIKE UPPER('M:\Development Engineering\%')
                            AND UPPER(AFD.DOSPATH) NOT LIKE UPPER('S:\PARKS\%')
                            AND UPPER(AFD.DOSPATH) NOT LIKE UPPER('L:\%')
                            AND UPPER(AFD.DOSPATH) NOT LIKE UPPER('i:\%')
                            AND UPPER(AFD.DOSPATH) NOT LIKE UPPER('c:\%')
                            AND UPPER(AFD.DOSPATH) NOT LIKE UPPER('R:\%')
                            AND UPPER(AFD.DOSPATH) NOT LIKE UPPER('U:\%') =====================END DOSPATH