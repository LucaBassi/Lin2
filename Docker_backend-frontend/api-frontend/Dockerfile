FROM python:2.7-alpine
COPY api.py requirements.txt /app/
WORKDIR /app
RUN pip install -r ./requirements.txt
ENTRYPOINT ["python","api.py"]
