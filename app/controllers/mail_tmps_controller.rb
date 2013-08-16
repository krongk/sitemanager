#encoding: utf-8
class MailTmpsController < ApplicationController
  # GET /mail_tmps
  # GET /mail_tmps.json
  def index
    @mail_tmps = MailTmp.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mail_tmps }
    end
  end

  # GET /mail_tmps/1
  # GET /mail_tmps/1.json
  def show
    @mail_tmp = MailTmp.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mail_tmp }
    end
  end

  # GET /mail_tmps/new
  # GET /mail_tmps/new.json
  def new
    @mail_tmp = MailTmp.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mail_tmp }
    end
  end

  # GET /mail_tmps/1/edit
  def edit
    @mail_tmp = MailTmp.find(params[:id])
  end

  # POST /mail_tmps
  # POST /mail_tmps.json
  def create
    @mail_tmp = MailTmp.new(params[:mail_tmp])

    respond_to do |format|
      if @mail_tmp.save
        format.html { redirect_to "/home/email", notice: '邮件模版创建成功.' }
        format.json { render json: @mail_tmp, status: :created, location: @mail_tmp }
      else
        format.html { render action: "new" }
        format.json { render json: @mail_tmp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mail_tmps/1
  # PUT /mail_tmps/1.json
  def update
    @mail_tmp = MailTmp.find(params[:id])

    respond_to do |format|
      if @mail_tmp.update_attributes(params[:mail_tmp])
        format.html { redirect_to "/home/email", notice: '邮件模版修改成功.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mail_tmp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mail_tmps/1
  # DELETE /mail_tmps/1.json
  def destroy
    @mail_tmp = MailTmp.find(params[:id])
    @mail_tmp.destroy

    respond_to do |format|
      format.html { redirect_to mail_tmps_url }
      format.json { head :no_content }
    end
  end
end
