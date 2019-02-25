import sys
#needed to pip install psycopg2-binary to get this
import psycopg2

weedname = sys.argv[1]
weedcount_increment_string = sys.argv[2]
current_value_string = ''

# Connect to the database
conn = psycopg2.connect("dbname=spray_development user=john password=john")
cur = conn.cursor()

# Get the old value
SQL = """SELECT value FROM kvs WHERE kvs.key = %s LIMIT 1;"""
cur.execute(SQL, [weedname])
current_value_string =  cur.fetchone()[0]
print ( current_value_string )
# Put in the new value
new_value_string = ("%d" % (  int(current_value_string) + int(weedcount_increment_string) ) )
print ( new_value_string)
print (weedname)
SQL2 = """UPDATE kvs SET value = (%s) WHERE key = (%s);"""
cur2 = conn.cursor()
cur2.execute(SQL2, (new_value_string, weedname,))

conn.commit()
cur2.close()

# Print the new value
SQL3 = """SELECT value FROM kvs WHERE kvs.key = %s LIMIT 1;"""
cur.execute(SQL3, [weedname])
current_value_string =  cur.fetchone()[0]
print ( "New count for %s is %s" % ( weedname, current_value_string))

cur.close()
conn.close()
