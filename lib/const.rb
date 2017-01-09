require 'yaml'
# define const and load APP_ID form qq_secrets.yml
module QQ
  f = 'qq_secrets.yml'
  return raise 'qq_secrets.yml not found!' unless File.exist?(f)
  s = YAML.load_file(f)
  APP_ID = s['APP_ID'].freeze
  APP_KEY = s['APP_KEY'].freeze
  RED_URL = s['RED_URL'].freeze
  AUTH_URL = 'https://graph.qq.com/oauth2.0/authorize?' \
             'response_type=code&' \
             "client_id=#{APP_ID}&" \
             "redirect_uri=#{RED_URL}".freeze
  TOKEN_URL = 'https://graph.qq.com/oauth2.0/token?' \
              'grant_type=authorization_code&' \
              "client_id=#{APP_ID}&" \
              "client_secret=#{APP_KEY}&" \
              "redirect_uri=#{RED_URL}".freeze
  OPENID_URL = 'https://graph.qq.com/oauth2.0/me?' \
               'access_token='.freeze
  G_U_I_URL = 'https://graph.qq.com/user/get_user_info?'.freeze
  VERSION = '0.3.1'.freeze
end
