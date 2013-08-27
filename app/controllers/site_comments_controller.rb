#encoding: utf-8
class SiteCommentsController < ApplicationController
  before_filter :authenticate_user!, :except => [:new, :create]
  layout 'theme', :only => [:new, :create]
  # GET /site_comments
  # GET /site_comments.json
  def index
    @site_comments = SiteComment.where(:site_id => current_user.sites.map(&:id)).order("updated_at DESC").paginate(:page => params[:page] || 1, :per_page => 20)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @site_comments }
    end
  end

  # GET /site_comments/1
  # GET /site_comments/1.json
  def show
    @site_comment = SiteComment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @site_comment }
    end
  end

  # GET /site_comments/new
  # GET /site_comments/new.json
  def new
    @site = Site.find_by_id(params[:site_id])
    @site_comment = @site.site_comments.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @site_comment }
    end
  end

  # GET /site_comments/1/edit
  def edit
    @site = Site.find_by_id(params[:site_id])
    @site_comment = SiteComment.find(params[:id])

  end

  # POST /site_comments
  # POST /site_comments.json
  def create
    @site = Site.find_by_id(params[:site_id])
    @site_comment = SiteComment.new(params[:site_comment])

    respond_to do |format|
      if @site_comment.save
        format.html { redirect_to site_path(@site), notice: '感谢您的留言，我们会尽快处理.' }
        format.json { render json: @site_comment, status: :created, location: @site_comment }
      else
        format.html { render action: "new" }
        format.json { render json: @site_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /site_comments/1
  # PUT /site_comments/1.json
  def update
    @site = Site.find_by_id(params[:site_id])
    @site_comment = SiteComment.find(params[:id])

    respond_to do |format|
      if @site_comment.update_attributes(params[:site_comment])
        format.html { redirect_to site_comments_path, notice: '留言更新成功.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @site_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /site_comments/1
  # DELETE /site_comments/1.json
  def destroy
    @site_comment = SiteComment.find(params[:id])
    @site_comment.destroy

    respond_to do |format|
      format.html { redirect_to site_comments_url }
      format.json { head :no_content }
    end
  end
end
