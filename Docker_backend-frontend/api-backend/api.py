#!/usr/bin/python2.7
# coding: utf-8
# API Backend
# File name : api.py

import os
import sys

import requests
from flask import Flask, jsonify, request

app = Flask(__name__)

@app.route('/')
def index():
    """
      Renvoit un phrase dans un dictionnaire au format JSON
    """
    response = {}
    response['body'] = "Je suis une réponse du backend"
    return jsonify(response)

@app.route('/traceback')
def traceback():
    """
        Termine l'application avec un code erreur 1
    """
    os._exit(1)
    return

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=8001)
