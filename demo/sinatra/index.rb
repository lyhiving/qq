require 'sinatra'
require 'qq'

set :bind, 'YOUR SITE'
enable :sessions

get '/' do
  session['csrf'] = Digest::MD5.hexdigest(rand.to_s)
  code = "<a href=\"#{QQ::AUTH_URL}&state=#{session['csrf']}\">Login</a>"
  erb code
end

get '/login/back' do
  raise 'CSRF!' if session['csrf'] != params['state']
  u = Qq.new(params['code'])
  session['openid'] = u.openid
  u.get_user_info['nickname']
end
