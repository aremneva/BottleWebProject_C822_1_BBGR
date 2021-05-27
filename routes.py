"""
Routes and views for the bottle application.
"""

from bottle import route, view
from datetime import datetime

@route('/')
@route('/home')
@view('index')
def home():
    """Renders the home page."""
    return dict(
        year=datetime.now().year
    )

@route('/BFS')
@view('BFS')
def bfs():
    """Renders the contact page."""
    return dict(
        title='BFS',
        message='Breadth-first search',
        year=datetime.now().year
    )

@route('/DFS')
@view('DFS')
def dfs():
    """Renders the contact page."""
    return dict(
        title='DFS',
        message='Depth-first search',
        year=datetime.now().year
    )

@route('/Kruskal')
@view('Kruskal')
def kruskal():
    """Renders the contact page."""
    return dict(
        title='Kruskal',
        message='Kruskal`s algorithm',
        year=datetime.now().year
    )

@route('/Prim')
@view('Prim')
def prim():
    """Renders the contact page."""
    return dict(
        title='Prim',
        message='Prim`s algorithm',
        year=datetime.now().year
    )
@route('/about')
@view('about')
def about():
    """Renders the about page."""
    return dict(
        title='About authors',
        message='There will be information about authors of the website.',
        year=datetime.now().year
    )
@route('/static/<filename:path>', name='static')
def serve_stati(filename):
    return static_file(filename, root='static')