#encoding: utf-8
class UserBlogsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /user_blogs
  # GET /user_blogs.json
  def index
    @user_blogs = UserBlog.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_blogs }
    end
  end

  # GET /user_blogs/1
  # GET /user_blogs/1.json
  def show
    @user_blog = UserBlog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_blog }
    end
  end

  # GET /user_blogs/new
  # GET /user_blogs/new.json
  def new
    @user_blog = UserBlog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_blog }
    end
  end

  # GET /user_blogs/1/edit
  def edit
    @user_blog = UserBlog.find(params[:id])
  end

  # POST /user_blogs
  # POST /user_blogs.json
  def create
    @user_blog = UserBlog.new(params[:user_blog])

    respond_to do |format|
      if @user_blog.save
        format.html { redirect_to "/home/blog", notice: '绑定成功.' }
        format.json { render json: @user_blog, status: :created, location: @user_blog }
      else
        format.html { render action: "new" }
        format.json { render json: @user_blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_blogs/1
  # PUT /user_blogs/1.json
  def update
    @user_blog = UserBlog.find(params[:id])

    respond_to do |format|
      if @user_blog.update_attributes(params[:user_blog])
        format.html { redirect_to "/home/blog", notice: '绑定成功.'  }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_blogs/1
  # DELETE /user_blogs/1.json
  def destroy
    @user_blog = UserBlog.find(params[:id])
    @user_blog.destroy

    respond_to do |format|
      format.html { redirect_to user_blogs_url }
      format.json { head :no_content }
    end
  end
end
