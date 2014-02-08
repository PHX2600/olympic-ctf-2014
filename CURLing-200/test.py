#!/usr/bin/env python

import urllib
from flask import Flask, Response, request, make_response, render_template
from werkzeug.contrib.fixers import ProxyFix

DEBUG = False
NEWS_ROOT = '/home/user/news/'

app = Flask(__name__)

@app.route('/')
def home():
    retpath = request.args.get('retpath', '')
    if retpath:
        resp = make_response('', 307)
        resp.headers['Location'] = urllib.unquote(retpath)
        return resp
    return make_response(render_template('index.html'))

@app.route('/news/')
def news():
    filepath = request.args.get('f', '')
    if filepath:
	filepath = filepath.replace('dev', '').replace('random', '')
        filepath = NEWS_ROOT + filepath
        content = open(filepath).read()
        resp = make_response(render_template('news.html', content=content))
    else:
        resp = make_response(render_template('news.html'))
    return resp

app.wsgi_app = ProxyFix(app.wsgi_app)

if __name__ == '__main__':
    app.run(debug=DEBUG)
