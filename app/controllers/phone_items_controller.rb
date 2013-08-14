class PhoneItemsController < ApplicationController
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
      format.html { redirect_to phone_items_url }
      format.json { head :no_content }
    end
  end
end
