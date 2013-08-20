#encoding: utf-8
class MailItemsController < ApplicationController
  before_filter :authenticate_user!
  
  #POST
  def mail_send
    if params[:mail_tmp_id].nil?
      flash[:error] = "没有选择邮件模版"
      redirect_to "/home/email"
      return
    end
    if params[:mail_item_ids].nil?
      flash[:error] = "没有选择任何要发送的邮箱"
      redirect_to "/home/email"
      return
    end

    email_tmp = MailTmp.find(params[:mail_tmp_id])
    mail_item_ids = params[:mail_item_ids] || []
    content = email_tmp.content
    BizMailer.marketing_mail(content).deliver

    # MailItem.where(:id => mail_item_ids).each do |item|
    #   
    #   status_id = emailBao.send(ENV['email_BAO_USER'], ENV['email_BAO_PASSWORD'], item.mobile, content)
    #   item.is_processed = item.is_processed == 'n' ? "#{email_tmp.id},#{status_id}" : "#{email_tmp.id},#{status_id}|" + item.is_processed
    #   item.send_count = item.send_count + 1
    #   item.save!
    #   Keystore.increment_value_for("user:#{item.user_id}:mail_items_send")
    # end

    respond_to do |format|
      format.html {redirect_to "/home/email", notice: '邮件发送成功！'}
    end
  end

  # GET /mail_items
  # GET /mail_items.json
  def index
    @mail_items = MailItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mail_items }
    end
  end

  # GET /mail_items/1
  # GET /mail_items/1.json
  def show
    @mail_item = MailItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mail_item }
    end
  end

  # GET /mail_items/new
  # GET /mail_items/new.json
  def new
    @mail_item = MailItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mail_item }
    end
  end

  # GET /mail_items/1/edit
  def edit
    @mail_item = MailItem.find(params[:id])
  end

  # POST /mail_items
  # POST /mail_items.json
  def create
    @mail_item = MailItem.new(params[:mail_item])
    @mail_item.source_name = '人工添加' if @mail_item.source_name.nil?

    respond_to do |format|
      if @mail_item.save
        format.html { redirect_to "/home/email", notice: '电子邮箱添加成功.' }
        format.json { render json: @mail_item, status: :created, location: @mail_item }
      else
        format.html { render action: "new" }
        format.json { render json: @mail_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mail_items/1
  # PUT /mail_items/1.json
  def update
    @mail_item = MailItem.find(params[:id])

    respond_to do |format|
      if @mail_item.update_attributes(params[:mail_item])
        format.html { redirect_to "/home/email", notice: '电子邮箱修改成功.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mail_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mail_items/1
  # DELETE /mail_items/1.json
  def destroy
    @mail_item = MailItem.find(params[:id])
    @mail_item.destroy

    respond_to do |format|
      format.html { redirect_to mail_items_url }
      format.json { head :no_content }
    end
  end
end
