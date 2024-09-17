import oracledb
import os
import re

# Define the query to fetch data from the dynamic table with dynamic fields
def construct_query(table_name, primary_field, path_field):
    return f"""
        SELECT {primary_field}, {path_field}
        FROM {table_name}
        WHERE {path_field} is not null 
        and (Upper({path_field}) like '%ABBOTSFORD%' OR Upper({path_field}) like '%FILESERVA%' )
    """

def extract_between_quotes(text):
    # Regular expression to extract text between double quotes
    pattern = r'\"(.*?)\"'
    
    # Find all matches of the pattern
    matches = re.findall(pattern, text)
    
    # If one match (i.e., single quoted content), return the content
    if len(matches) == 1:
        return matches[0]
    elif len(matches) > 1:
        return matches  # Multiple quoted contents, return the list
    else:
        return text  # No quotes found, return the original text

# Function to log the missing path details into a text file
def log_missing_path(primary_value, path_type, path):
    with open(log_file_path, 'a') as log_file:
        log_file.write(f"{primary_value}: Missing {path_type}: {path}\n")

def check_missing_paths(dsn, table_name, primary_field, path_field):
    try:

        # Initialize the Oracle client library
        oracledb.init_oracle_client()
        # Create the database connection using Windows Authentication (no username/password needed)
        connection = oracledb.connect(
            dsn=dsn
        )

        # Create a cursor
        cursor = connection.cursor()

        # Construct and execute the query
        query = construct_query(table_name, primary_field, path_field)
        cursor.execute(query)

        # Fetch all rows from the query result
        rows = cursor.fetchall()

        # Process each row
        for row in rows:
            primary_value = row[0]
            docu_path = extract_between_quotes(row[1])

            # Check if each path exists, and log if it does not
            if docu_path and not os.path.exists(docu_path):
                log_missing_path(primary_value, path_field, docu_path)

    except oracledb.DatabaseError as e:
        print(f"Error connecting to Oracle: {e}")
    finally:
        # Ensure that the cursor and connection are closed
        if 'cursor' in locals():
            cursor.close()
        if 'connection' in locals():
            connection.close()

    print("Process complete. Check the missing_paths.txt for any missing paths.")

# Example usage
dsn = 'A7TST'


# Define the path to the text file where missing paths will be logged
# log_file_path = r'd:\temp\missing_attachment.txt'
# table_name = 'AMANDA.ATTACHMENT'
# primary_field = 'ATTACHMENTRSN'  # Primary key field
# path_field = 'DOSPATH'


# log_file_path = r'd:\temp\missing_FOLDERDOCUMENT.txt'
# table_name = 'AMANDA.FOLDERDOCUMENT'
# primary_field = 'DOCUMENTRSN'  # Primary key field
# path_field = 'DOSPATH'


log_file_path = r'd:\temp\missing_validdocumenttext.txt'
table_name = 'AMANDA.validdocumenttext'
primary_field = 'DOCUMENTCODE'  # Primary key field
path_field = 'ddecommand'

check_missing_paths(dsn, table_name, primary_field, path_field)
