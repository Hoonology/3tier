import os
from dotenv import load_dotenv
import psycopg2
import json

# .env 파일에서 환경 변수 불러오기
load_dotenv()
# RDS 연결 정보
HOST = os.environ.get('DB_HOST')
DATABASE = os.environ.get('DB_NAME')
USER = os.environ.get('DB_USER')
PASSWORD = os.environ.get('DB_PASSWORD')

# JSON 파일 읽기
with open('db.json', 'r') as f:
    data = json.load(f)

try:
    # RDS에 연결 및 커서 생성
    with psycopg2.connect(host=HOST, dbname=DATABASE, user=USER, password=PASSWORD) as conn:
        with conn.cursor() as cur:
            # JSON 파일에서 각 항목을 읽어와 SQL 쿼리를 실행
            for item in data:
                sql = """INSERT INTO admin_logentry (pk, action_time, "user", content_type, object_id, object_repr, action_flag, change_message) 
         VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"""

                values = (
                    item["pk"],
                    item["fields"]["action_time"],
                    item["fields"]["user"],
                    item["fields"]["content_type"],
                    item["fields"]["object_id"],
                    item["fields"]["object_repr"],
                    item["fields"]["action_flag"],
                    item["fields"]["change_message"]
                )
                cur.execute(sql, values)

            conn.commit()

except psycopg2.Error as e:
    print(f"Database error: {e}")
except json.JSONDecodeError:
    print("Error decoding JSON file.")
except Exception as e:
    print(f"Error occurred: {e}")
