#encoding: utf-8
class SitePostsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  layout 'theme', :only => [:show, :index]

  # GET /site_posts
  # GET /site_posts.json
  def index
    @site = Site.find_by_id(params[:site_id])
    @site ||= Site.find_by_site_name(params[:site_id])
    return check_nil(@site)

    @site_posts = @site.site_posts.where("cate_id = 0").order("updated_at DESC").paginate(:page => params[:page] || 1, :per_page => 8)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @site_posts }
    end
  end

  # GET /site_posts/1
  # GET /site_posts/1.json
  def show
    #{"action"=>"show", "controller"=>"site_posts", "site_id"=>"1", "id"=>"1"}
    @site = Site.find_by_id(params[:site_id])
    case params[:id]
    when 'about'
      @site_posts = @site.site_posts.select{|p| p.cate_id == SitePost.cate_id("关于我们")}
    when 'service'
      @site_posts = @site.site_posts.select{|p| p.cate_id == SitePost.cate_id("服务项目")}
    when 'post_list'
      @site_posts = @site.site_posts.select{|p| p.cate_id == SitePost.cate_id("新闻")}
    else
      @site_posts = @site.site_posts
    end

    @site_post = SitePost.find_by_id(params[:id])
    @site_post ||= @site_posts.first

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @site_post }
    end
  end

  # GET /site_posts/new
  # GET /site_posts/new.json
  def new
    @site_post = SitePost.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @site_post }
    end
  end

  # GET /site_posts/1/edit
  def edit
    @site_post = SitePost.find(params[:id])
  end

  # POST /site_posts
  # POST /site_posts.json
  def create
    @site_post = SitePost.new(params[:site_post])

    respond_to do |format|
      if @site_post.save
        format.html { redirect_to sites_path, notice: '文章添加成功.' }
        format.json { render json: @site_post, status: :created, location: @site_post }
      else
        format.html { render action: "new" }
        format.json { render json: @site_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /site_posts/1
  # PUT /site_posts/1.json
  def update
    @site_post = SitePost.find(params[:id])

    respond_to do |format|
      if @site_post.update_attributes(params[:site_post])
        format.html { redirect_to sites_path, notice: '文章更新成功.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @site_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /site_posts/1
  # DELETE /site_posts/1.json
  def destroy
    @site_post = SitePost.find(params[:id])
    @site_post.destroy

    respond_to do |format|
      format.html { redirect_to sites_url }
      format.json { head :no_content }
    end
  end
end
