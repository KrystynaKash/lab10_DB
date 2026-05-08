import psycopg2
from tabulate import tabulate

conn = psycopg2.connect(
    host="localhost",
    database="ford_service",
    user="admin",
    password="admin",
    port=5432
)

cur = conn.cursor()

queries = {
    "Всі ремонти": "SELECT * FROM repairs;",
    "Всі клієнти": "SELECT * FROM clients;",
    "Всі авто": "SELECT * FROM cars;"
}

for title, query in queries.items():

    print("\n" + "=" * 50)
    print(title)
    print("=" * 50)

    cur.execute(query)

    rows = cur.fetchall()

    headers = [desc[0] for desc in cur.description]

    print(tabulate(rows, headers=headers, tablefmt="grid"))

cur.close()
conn.close()