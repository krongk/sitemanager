#encoding: utf-8
require 'roo'
class ResourceItemsController < ApplicationController
  # GET /resource_items
  # GET /resource_items.json
  def index
    @resource_items = ResourceItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @resource_items }
    end
  end

  # GET /resource_items/1
  # GET /resource_items/1.json
  def show
    @resource_item = ResourceItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @resource_item }
    end
  end

  # GET /resource_items/new
  # GET /resource_items/new.json
  def new
    @resource_item = ResourceItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @resource_item }
    end
  end

  # GET /resource_items/1/edit
  def edit
    @resource_item = ResourceItem.find(params[:id])
  end

  # POST /resource_items
  # POST /resource_items.json
  def create
    #upload file resource_item[upload_file]
    #render :text => RooExcel.extract('sdf')
    #return

    tmp = params[:resource_item][:upload_file].tempfile
    unless (file_ext = params[:resource_item][:upload_file].original_filename.split('.')).size > 1
      render :text => '错误的文件扩展名！<br/><a href="javascript: history.go(-1);">返回</a>'
      return
    end
    file_name = "#{Time.now.to_i}.#{file_ext.last.downcase}"
    file_path = File.join("public", "resource")
    unless File.exist?(file_path)
      FileUtils.mkdir_p file_path
    end
    #public/resource/picture/2/1304543534.jpg
    file = File.join(file_path, file_name)
    FileUtils.cp tmp.path, file
    #FileUtils.rm tmp.path

    s = Roo::Excel.new(file)
    s.default_sheet = s.sheets.first  # first sheet in the spreadsheet file will be used
    #导入的字段为（手机号、来源、姓名、城市、地区、描述）
    index = 0
    1.upto(10) do |row|
      val = []
      1.upto(6) do |col|
        val << s.cell(row, col)
      end
      PhoneItem.create!(:mobile => val[0], :source_name => val[1])
      index +=  1
    end

    respond_to do |format|
      if true
        format.html { redirect_to "/home/sms", notice: "总共导入数据#{index}条." }
      else
        format.html { render action: "new" }
      end
    end
  end

  def create_bak
    @resource_item = ResourceItem.new(params[:resource_item])

    respond_to do |format|
      if @resource_item.save
        format.html { redirect_to @resource_item, notice: 'Resource item was successfully created.' }
        format.json { render json: @resource_item, status: :created, location: @resource_item }
      else
        format.html { render action: "new" }
        format.json { render json: @resource_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /resource_items/1
  # PUT /resource_items/1.json
  def update
    @resource_item = ResourceItem.find(params[:id])

    respond_to do |format|
      if @resource_item.update_attributes(params[:resource_item])
        format.html { redirect_to @resource_item, notice: 'Resource item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @resource_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resource_items/1
  # DELETE /resource_items/1.json
  def destroy
    @resource_item = ResourceItem.find(params[:id])
    @resource_item.destroy

    respond_to do |format|
      format.html { redirect_to resource_items_url }
      format.json { head :no_content }
    end
  end
end
