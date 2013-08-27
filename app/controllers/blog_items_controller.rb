#encoding: utf-8
class BlogItemsController < ApplicationController
  before_filter :authenticate_user!

  # GET /blog_items
  # GET /blog_items.json
  def index
    @blog_items = BlogItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @blog_items }
    end
  end

  # GET /blog_items/1
  # GET /blog_items/1.json
  def show
    @blog_item = BlogItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @blog_item }
    end
  end

  # GET /blog_items/new
  # GET /blog_items/new.json
  def new
    @blog_item = BlogItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @blog_item }
    end
  end

  # GET /blog_items/1/edit
  def edit
    @blog_item = BlogItem.find(params[:id])
  end

  # POST /blog_items
  # POST /blog_items.json
  def create
    @blog_item = BlogItem.new(params[:blog_item])

    respond_to do |format|
      if @blog_item.save
        format.html { redirect_to blog_items_path, notice: '博客项目添加成功.' }
        format.json { render json: @blog_item, status: :created, location: @blog_item }
      else
        format.html { render action: "new" }
        format.json { render json: @blog_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /blog_items/1
  # PUT /blog_items/1.json
  def update
    @blog_item = BlogItem.find(params[:id])

    respond_to do |format|
      if @blog_item.update_attributes(params[:blog_item])
        format.html { redirect_to blog_items_path, notice: '博客项目修改成功.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @blog_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blog_items/1
  # DELETE /blog_items/1.json
  def destroy
    @blog_item = BlogItem.find(params[:id])
    @blog_item.destroy

    respond_to do |format|
      format.html { redirect_to blog_items_url }
      format.json { head :no_content }
    end
  end
end
