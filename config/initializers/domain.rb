#encoding: utf-8
# Define your site's name and default domain, which are used in various places,
class << Rails.application
  def domain
    if Rails.env == 'development'
       "121.199.46.174:3005"
    else
      "www.yufuwu.org"
    end
  end

  def name
    "雨服务"
   end
end

Rails.application.routes.default_url_options[:host] = Rails.application.domain
