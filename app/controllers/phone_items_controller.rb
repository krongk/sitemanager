#encoding: utf-8
class PhoneItemsController < ApplicationController
  def phone_send
    # render :text => params
    # return
    #{}"sms_tmp_id"=>"4", "DataTables_Table_0_length"=>"10", 
    #{}"phone_item_ids"=>["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"],
    if params[:sms_tmp_id].nil?
      flash[:error] = "没有选择短信模版"
      redirect_to "/home/sms"
      return
    end
    if params[:phone_item_ids].nil?
      flash[:error] = "没有选择任何要发送的手机号"
      redirect_to "/home/sms"
      return
    end

    sms_tmp = SmsTmp.find(params[:sms_tmp_id])
    phone_item_ids = params[:phone_item_ids] || []
    PhoneItem.where(:id => phone_item_ids).each do |item|
      status_id = SmsBao.send(ENV['SMS_BAO_USER'], ENV['SMS_BAO_PASSWORD'], item.mobile, sms_tmp.content)
      item.is_processed = "[#{sms_tmp.id},#{status_id}]" + item.is_processed
      item.send_count = item.send_count + 1
      item.save!
    end

    respond_to do |format|
      format.html {redirect_to "/home/sms", notice: '短信发送成功！'}
    end
  end

  # GET /phone_items
  # GET /phone_items.json
  def index
    @phone_items = PhoneItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @phone_items }
    end
  end

  # GET /phone_items/1
  # GET /phone_items/1.json
  def show
    @phone_item = PhoneItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @phone_item }
    end
  end

  # GET /phone_items/new
  # GET /phone_items/new.json
  def new
    @phone_item = PhoneItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @phone_item }
    end
  end

  # GET /phone_items/1/edit
  def edit
    @phone_item = PhoneItem.find(params[:id])
  end

  # POST /phone_items
  # POST /phone_items.json
  def create
    @phone_item = PhoneItem.new(params[:phone_item])

    respond_to do |format|
      if @phone_item.save
        format.html { redirect_to @phone_item, notice: 'Phone item was successfully created.' }
        format.json { render json: @phone_item, status: :created, location: @phone_item }
      else
        format.html { render action: "new" }
        format.json { render json: @phone_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /phone_items/1
  # PUT /phone_items/1.json
  def update
    @phone_item = PhoneItem.find(params[:id])

    respond_to do |format|
      if @phone_item.update_attributes(params[:phone_item])
        format.html { redirect_to @phone_item, notice: 'Phone item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @phone_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phone_items/1
  # DELETE /phone_items/1.json
  def destroy
    @phone_item = PhoneItem.find(params[:id])
    @phone_item.destroy

    respond_to do |format|
      format.html { redirect_to '/home/sms' }
      format.json { head :no_content }
    end
  end
end
