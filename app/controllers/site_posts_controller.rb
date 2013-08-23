#encoding: utf-8
class SitePostsController < ApplicationController
  layout 'theme', :only => [:show]

  # GET /site_posts
  # GET /site_posts.json
  def index
    @site_posts = SitePost.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @site_posts }
    end
  end

  # GET /site_posts/1
  # GET /site_posts/1.json
  def show
    @site_post = SitePost.find(params[:id])
    @site = @site_post.site

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
