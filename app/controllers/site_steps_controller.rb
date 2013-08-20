#encoding: utf-8
class SiteStepsController < ApplicationController
	include Wicked::Wizard
  steps :theme, :content, :publish
  
  def show
    @site = Site.find(session[:site_id])
    render_wizard
  end
  
  def update
    @site = Site.find(session[:site_id])
    @site.attributes = params[:site]
    render_wizard @site
  end

  def redirect_to_finish_wizard(site)
  	session[:site_id] = nil
    redirect_to sites_url, notice: "网站创建成功."
  end

end
