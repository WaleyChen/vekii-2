client_id = '908038792880-vm3862hmpnp7u6gnmgd8104g8u7r1sr1.apps.googleusercontent.com'
gscope = 'https://gdata.youtube.com'
redirect_uri = window.location
request_access_token_path = 'https://accounts.google.com/o/oauth2/auth?'
response_type = 'token'

request_access_token_path = request_access_token_path 
								+ 'client_id=' + client_id 
								+ '&redirect_uri=' + redirect_uri 
								+ '&scope=' + gscope 
								+ '&response_type=' + response_type;