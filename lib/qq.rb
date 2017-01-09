require 'open-uri'
require 'json'
# QQ Connect
class Qq
  require 'const.rb'
  attr_reader :openid
  # get APP_ID & APP_KEY from https://connect.qq.com/
  def initialize(code)
    # WARNING! return raise 'CSRF detected' if params[:state] != state
    # get token
    url = "#{QQ::TOKEN_URL}&code=#{code}"
    @token = open(url).read[/(?<=access_token=)\w{32}/]
    # get openid
    url = QQ::OPENID_URL + @token
    @openid = open(url).read[/\w{32}/]
    # get auth
    @auth = "access_token=#{@token}&" \
            "oauth_consumer_key=#{QQ::APP_ID}&" \
            "openid=#{@openid}"
  end

  def get_user_info
    back = open(QQ::G_U_I_URL + @auth).read.force_encoding('utf-8')
    back = JSON.parse(back)
    return raise back['ret'].to_s + ': ' + back['msg'] if back['ret'] != 0
    back
  end
end
