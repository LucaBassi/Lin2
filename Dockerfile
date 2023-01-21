FROM python:3.12.0a4-alpine3.17
RUN pip3 install flask requests
COPY . /app
WORKDIR /app
ENTRYPOINT ["python3","api.py"]