FROM python:3.9

# 필요한 패키지 설치
RUN pip install psycopg2-binary python-dotenv

# 스크립트와 JSON 파일을 컨테이너 내로 복사
COPY insert_to_rds.py .
COPY db.json .

# 스크립트 실행
CMD ["python", "insert_to_rds.py"]
