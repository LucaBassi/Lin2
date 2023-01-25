FROM python:2.7-alpine
COPY requirements.txt /
COPY app.py /app/
COPY static/* /app/static/
COPY templates/* /app/templates/
RUN pip install -r /requirements.txt; rm /requirements.txt
EXPOSE 5000
WORKDIR /app
ENTRYPOINT ["python","app.py"]
