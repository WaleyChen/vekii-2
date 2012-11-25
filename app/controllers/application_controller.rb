class ApplicationController < ActionController::Base
  protect_from_forgery

  def vekii
    # Initialize the client & Google+ API
    client = Google::APIClient.new
    plus = client.discovered_api('plus')

    # Initialize OAuth 2.0 client
    client.authorization.client_id = '908038792880-vm3862hmpnp7u6gnmgd8104g8u7r1sr1.apps.googleusercontent.com'
    client.authorization.client_secret = 'VhkK45V3YKXIsjgmmADnGhwn'
    client.authorization.redirect_uri = request.url
    client.authorization.scope = 'https://www.googleapis.com/auth/plus.me'

    if params[:code].nil?
      @goog_request_token_path = client.authorization.authorization_uri  # Request authorization
      client.authorization.code = '4/RralVlbqI37VU55YST36EHuFNhtH.Mm6skaCbM4kYuJJVnL49Cc8q-0NjdgI'
    else
      if session[:access_token].nil?
        client.authorization.code = params[:code]
        client.authorization.fetch_access_token!

        session[:access_token] = client.authorization.access_token
        session[:refresh_token] = client.authorization.refresh_token
        session[:expires_in] = client.authorization.expires_in
        session[:issued_at] = client.authorization.issued_at
      else
        client.authorization.access_token = session[:access_token] 
        client.authorization.refresh_token = session[:refresh_token]
        client.authorization.expires_in = session[:expires_in]
        client.authorization.issued_at = session[:issued_at]
      end

      # Make an API call
      result = client.execute(
        :api_method => plus.activities.list,
        :parameters => {'collection' => 'public', 'userId' => 'me'}
      )

      # grab user's playlists
      puts result.data
    end

  end

  def sign_in
  end
end

# https://accounts.google.com/AccountChooser?service=lso&continue=https%3A%2F%2Faccounts.google.com%2Fo%2Foauth2%2Fauth%3Fscope%3Dhttps%3A%2F%2Fwww.googleapis.com%2Fauth%2Fplus.me%26response_type%3Dcode%26redirect_uri%3Dhttp%3A%2F%2Flvh.me%3A3000%2F%26access_type%3Doffline%26approval_prompt%3Dforce%26client_id%3D908038792880-vm3862hmpnp7u6gnmgd8104g8u7r1sr1.apps.googleusercontent.com%26hl%3Den%26from_login%3D1%26as%3D-4d76dbabe420a016&btmpl=authsub&hl=en
# 4/RralVlbqI37VU55YST36EHuFNhtH.Mm6skaCbM4kYuJJVnL49Cc8q-0NjdgI