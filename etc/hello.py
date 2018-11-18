def application(env, start_response):
start_response('200 OK', [('Content-Type', 'text/plain')])
body = "\n".join(environ.get('QUERY_STRING').split("&"))
return body