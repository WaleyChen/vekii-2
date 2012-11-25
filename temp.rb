require 'google/api_client'
require 'httparty'
require 'pry'

# Initialize the client & Google+ API

client = Google::APIClient.new
plus = client.discovered_api('plus')

# Initialize OAuth 2.0 client    
client.authorization.client_id = '908038792880-vm3862hmpnp7u6gnmgd8104g8u7r1sr1.apps.googleusercontent.com'
client.authorization.client_secret = 'VhkK45V3YKXIsjgmmADnGhwn'
client.authorization.redirect_uri = 'https://www.lvh.me'

client.authorization.scope = 'https://www.googleapis.com/auth/plus.me'

# Request authorization
redirect_uri = client.authorization.authorization_uri

puts redirect_uri

# Wait for authorization code then exchange for token
client.authorization.code = '4/zrNZZjppMmepXaQCr9GELVYW9gVl.8hUixRFsSxYRuJJVnL49Cc_mnJlidgI'

binding.pry

client.authorization.fetch_access_token!

# Make an API call
result = client.execute(
  :api_method => plus.activities.list,
  :parameters => {'collection' => 'public', 'userId' => 'me'}
)

puts result.data