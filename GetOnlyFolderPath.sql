CREATE OR REPLACE FUNCTION get_folder_path (file_path IN VARCHAR2)
RETURN VARCHAR2 IS
   folder_path VARCHAR2(4000);
BEGIN
   -- Find the position of the last backslash
   folder_path := SUBSTR(file_path, 1, INSTR(file_path, '\', -1, 1) - 1);
   RETURN folder_path;
END get_folder_path;
