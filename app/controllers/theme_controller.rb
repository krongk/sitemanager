#encoding: utf-8
class ThemeController < ApplicationController

  #{"id"=>"2", "s"=>"34s", "controller"=>"theme", "action"=>"show"}
  #every 'id' refer to each theme layout, 's' refer to site.site_name
  def show
  	@site = Site.find_by_site_name(params[:s])
  	if @site.nil?
  		render :text => '找不到该网站'
  		return
  	end

  	case params[:id].to_i
  	when 1
  		render :show, :layout => nil
  	when 2
  		render :show, :layout => 'theme'
  	else
  		render :show, :layout => 'page'
  	end
  end
end
