class OrdersController < ApplicationController
  before_action :signed_in_user
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    @order.user_id ||= $rio_user_id #backup for user_id

    respond_to do |format|
      if @order.save
        if mode1?($rio_mode) ##started from a specific user
          format.html { redirect_to orders_user_path($rio_user_id), notice: 'User order was successfully created.' }
        else
          format.html { redirect_to @order, notice: 'Order was successfully created.' }
        end
        format.json { render action: 'show', status: :created, location: @order }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        if mode1?($rio_mode) ##started from a specific user
          format.html { redirect_to orders_user_path(@order.user_id), notice: 'User order was successfully updated.' }
        else
          format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        end
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    $rio_user_id=@order.user_id
    @order.destroy
    respond_to do |format|
      if mode1?($rio_mode) ##started from a specific user
        format.html { redirect_to orders_user_path($rio_user_id) }
      else
        format.html { redirect_to orders_url }
      end
      format.json { head :no_content }
    end
  end

  def order_regels
    @order = Order.find(params[:id])
    @title = "Orders van " + @order.usr_name
    @order_regels = @order.order_regels
    $rio_mode2 = 1
  end

  def new_order_regel
    @order = Order.find(params[:id])
    @title = "Nieuwe orderregel voor " + @order.usr_name
    @order_regel=@order.order_regels.build #create relation with user
    $rio_mode2 = 1
    $rio_order_id = @order.id
  end



  private
  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit(:ordernr, :user_id, :opmerking)
  end

  def mode1?(inpval)
    inpval == 1
    #   true
  end
end
