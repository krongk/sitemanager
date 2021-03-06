#encoding: utf-8
class SitesController < ApplicationController
  include ApplicationHelper
  before_filter :authenticate_user!, :except => [:index, :show]

  layout 'theme', :only => [:show]

  before_filter :authenticate_user!, :except => [:index, :show]

  # GET /sites
  # GET /sites.json
  def index
    @sites = current_user.sites.all
    @site_posts = SitePost.where(:user_id => current_user.id).order("updated_at DESC").paginate(:page => params[:page] || 1, :per_page => 20)
    @site_comments = SiteComment.where(:site_id => @sites.map(&:id)).order("updated_at DESC").limit(20)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sites }
    end
  end

  # GET /sites/1
  # GET /sites/1.json
  def show
    @site = params[:id] =~ /^\d+$/ ? Site.find_by_id(params[:id]) : Site.find_by_site_name(params[:id])
    return check_nil(@site)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @site }
    end
  end

  # GET /sites/new
  # GET /sites/new.json
  def new
    @site = Site.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @site }
    end
  end

  # GET /sites/1/edit
  def edit
    @site = Site.find(params[:id])
  end

  # POST /sites
  # POST /sites.json
  def create
    @site = Site.new(params[:site])
    @site.user_id = current_user.id

    respond_to do |format|
      if @site.save
        session[:site_id] = @site.id
        format.html { redirect_to site_steps_path, notice: '网站名称设定成功.' }
        format.json { render json: @site, status: :created, location: @site }
      else
        format.html { render action: "new" }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sites/1
  # PUT /sites/1.json
  def update
    @site = Site.find(params[:id])

    respond_to do |format|
      if @site.update_attributes(params[:site])
        session[:site_id] = @site.id
        format.html { redirect_to site_steps_path, notice: '网站修改成功.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sites/1
  # DELETE /sites/1.json
  def destroy
    @site = Site.find(params[:id])
    @site.destroy

    respond_to do |format|
      format.html { redirect_to sites_url, notice: '网站删除成功。' }
      format.json { head :no_content }
    end
  end
end
