ALTER TRIGGER AMANDA.FOLDERDOCUMENT_UPD_LOG DISABLE;

ALTER TRIGGER AMANDA.FOLDERDOCUMENT_DEL_LOG DISABLE;

ALTER TRIGGER AMANDA.FOLDERDOCUMENT_DEL DISABLE;

UPDATE AMANDA.FOLDERDOCUMENT
SET
    DOSPATH = C_REPLACE_PATH(
        DOSPATH
    )
WHERE
    DOSPATH IS NOT NULL;

ALTER TRIGGER AMANDA.FOLDERDOCUMENT_UPD_LOG ENABLE;

ALTER TRIGGER AMANDA.FOLDERDOCUMENT_DEL_LOG ENABLE;

ALTER TRIGGER AMANDA.FOLDERDOCUMENT_DEL ENABLE;

COMMIT;