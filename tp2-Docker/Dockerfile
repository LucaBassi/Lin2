FROM python:2.7-alpine
COPY app.py requirements.txt /app/
COPY ./templates/* /app/templates/
COPY ./static/* /app/static/
WORKDIR /app
RUN pip install -r ./requirements.txt
ENTRYPOINT ["python","app.py"]
