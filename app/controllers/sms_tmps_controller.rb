#encoding: utf-8
class SmsTmpsController < ApplicationController
  # GET /sms_tmps
  # GET /sms_tmps.json
  def index
    @sms_tmps = SmsTmp.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sms_tmps }
    end
  end

  # GET /sms_tmps/1
  # GET /sms_tmps/1.json
  def show
    @sms_tmp = SmsTmp.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sms_tmp }
    end
  end

  # GET /sms_tmps/new
  # GET /sms_tmps/new.json
  def new
    @sms_tmp = SmsTmp.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sms_tmp }
    end
  end

  # GET /sms_tmps/1/edit
  def edit
    @sms_tmp = SmsTmp.find(params[:id])
  end

  # POST /sms_tmps
  # POST /sms_tmps.json
  def create
    @sms_tmp = SmsTmp.new(params[:sms_tmp])

    respond_to do |format|
      if @sms_tmp.save
        format.html { redirect_to "/home/sms", notice: '短信模版创建成功.' }
        format.json { render json: @sms_tmp, status: :created, location: @sms_tmp }
      else
        format.html { render action: "new" }
        format.json { render json: @sms_tmp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sms_tmps/1
  # PUT /sms_tmps/1.json
  def update
    @sms_tmp = SmsTmp.find(params[:id])

    respond_to do |format|
      if @sms_tmp.update_attributes(params[:sms_tmp])
        format.html { redirect_to "/home/sms", notice: '短信模版修改成功.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sms_tmp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sms_tmps/1
  # DELETE /sms_tmps/1.json
  def destroy
    @sms_tmp = SmsTmp.find(params[:id])
    @sms_tmp.destroy

    respond_to do |format|
      format.html { redirect_to "/home/sms", notice: '删除成功。' }
      format.json { head :no_content }
    end
  end
end
