FROM python:2.7-alpine
LABEL hub_url="https://hub.docker.com/r/adieperi/api-frontend"
COPY api.py /api.py
RUN pip install requests flask
EXPOSE 8000
ENTRYPOINT ["python","/api.py"]