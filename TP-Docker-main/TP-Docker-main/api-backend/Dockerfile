FROM python:2.7-alpine
LABEL hub_url="https://hub.docker.com/r/adieperi/api-backend"
COPY api.py /api.py
RUN pip install requests flask
EXPOSE 8001
ENTRYPOINT ["python","/api.py"]
