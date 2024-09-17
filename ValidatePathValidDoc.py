import oracledb
import os

# Define your DSN (TNS) entry for connecting to the Oracle database
dsn = 'A7PRD'  # The TNS entry in your tnsnames.ora file or full connection string

# Define the path to the text file where missing paths will be logged
log_file_path = r'd:\temp\missing_pathsPRD.txt'

# Define the query to fetch the data from AMANDA.VALIDDOCUMENT table
query = """
    SELECT DocumentCode, MergeDocument, savepath, temppath, sendpath
    FROM AMANDA.VALIDDOCUMENT
"""

# Function to log the missing path details into a text file
def log_missing_path(document_code, path_type, path):
    with open(log_file_path, 'a') as log_file:
        log_file.write(f"DocumentCode: {document_code}, Missing {path_type}: {path}\n")

try:
    # Initialize the Oracle client library
    oracledb.init_oracle_client()

    # Create the database connection using Windows Authentication (no username/password needed)
    connection = oracledb.connect(
        dsn=dsn
    )

    # Create a cursor
    cursor = connection.cursor()

    # Execute the query
    cursor.execute(query)

    # Fetch all rows from the query result
    rows = cursor.fetchall()

    # Process each row
    for row in rows:
        document_code = row[0]
        merge_document = row[1]
        save_path = row[2]
        temp_path = row[3]
        send_path = row[4]

        # Check if each path exists, and log if it does not
        if merge_document and not os.path.exists(merge_document):
            log_missing_path(document_code, "MergeDocument", merge_document)

        if save_path and not os.path.exists(save_path):
            log_missing_path(document_code, "SavePath", save_path)

        if temp_path and not os.path.exists(temp_path):
            log_missing_path(document_code, "TempPath", temp_path)

        if send_path and not os.path.exists(send_path):
            log_missing_path(document_code, "SendPath", send_path)

except oracledb.DatabaseError as e:
    print(f"Error connecting to Oracle: {e}")
finally:
    # Ensure that the cursor and connection are closed
    if 'cursor' in locals():
        cursor.close()
    if 'connection' in locals():
        connection.close()

print("Process complete. Check the missing_paths.txt for any missing paths.")
