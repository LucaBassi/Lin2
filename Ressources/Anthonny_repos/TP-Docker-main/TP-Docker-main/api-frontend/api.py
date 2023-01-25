#!/usr/bin/python2.7
# coding: utf-8
# API Frontend
# File name : api.py

import os
import sys

import requests
from flask import Flask, jsonify, request

app = Flask(__name__)

try:
    api_backend_url = os.environ.get('API_BACKEND_URL')
except:
    print("L'Adresse de l'API n'est pas défini. Elle doit être définie dans une variable d'environnement nommé 'API_BACKEND_URL'")

try:
    api_backend_port = os.environ.get('API_BACKEND_PORT')
except:
    print("Le port de l'API n'est pas défini. Il doit être défini dans une variable d'environnement nommé 'API_BACKEND_PORT'")

if api_backend_url and api_backend_port:
    api_backend = 'http://{}:{}'.format(api_backend_url, api_backend_port)

@app.route('/')
def index():
    """
        Fait un call à l'API backend et renvoit le resultat au format JSON
    """
    response = {}
    api_call = requests.get(api_backend)
    if api_call.status_code != 200:
        response['error_message'] = 'GET / on backend API {}'.format(
                                    api_call.status_code)
        response['status'] = '[ERROR]'
    else:
        response['status'] = '[SUCESS]'
        response['return'] = api_call.json()
    return jsonify(response)

@app.route('/traceback')
def traceback():
    """
        Termine l'application avec un code erreur 1
    """
    os._exit(1)
    return

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=8000)
