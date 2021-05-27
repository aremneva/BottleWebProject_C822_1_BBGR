from bottle import post, request

@post('/DFS', method='post')
def get_number():
    nodesNum = request.forms.get('nodesNum')
    return nodesNum + "!"
