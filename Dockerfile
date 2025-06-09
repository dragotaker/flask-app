FROM python:3.9-slim-buster

WORKDIP /app

COPY requirements.txt ./
RUN pip install --no-cashe-dir -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["python", "app.py"]

