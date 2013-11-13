class OrderRegelsController < ApplicationController
  include OrderRegelsHelper
  before_action :signed_in_user
  before_action :set_order_regel, only: [:show, :edit, :update, :destroy]

  # GET /order_regels
  # GET /order_regels.json
  def index
    @order_regels = OrderRegel.all
  end

  # GET /order_regels/1
  # GET /order_regels/1.json
  def show
  end

  # GET /order_regels/new
  def new
    @order_regel = OrderRegel.new
  end

  # GET /order_regels/1/edit
  def edit
  end

  # POST /order_regels
  # POST /order_regels.json
  def create
    @order_regel = OrderRegel.new(order_regel_params)
    @order_regel.order_id ||= $rio_order_id #backup for order_id

    respond_to do |format|
      if @order_regel.save
        if mode1?($rio_mode2) ##started from a specific order
          format.html { redirect_to order_regels_order_path($rio_order_id), notice: 'User orderregel was successfully created.' }
        else
          format.html { redirect_to @order_regel, notice: 'Orderregel was successfully created.' }
        end
        format.json { render action: 'show', status: :created, location: @order_regel }
      else
      #  format.html { redirect_to about_url}
        format.html { render action: 'new' }
        format.json { render json: @order_regel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_regels/1
  # PATCH/PUT /order_regels/1.json
  def update
    respond_to do |format|
      if @order_regel.update(order_regel_params)
        if mode1?($rio_mode2) ##started from a specific order
          format.html { redirect_to order_regels_order_path(@order_regel.order_id), notice: 'User orderregel was successfully updated.' }
        else
          format.html { redirect_to @order_regel, notice: 'Orderregel was successfully updated.' }
        end
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order_regel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_regels/1
  # DELETE /order_regels/1.json
  def destroy
    $rio_order_id=@order_regel.order_id
    @order_regel.destroy
    respond_to do |format|
      if mode1?($rio_mode) ##started from a specific user
        format.html { redirect_to order_regels_order_path($rio_order_id) }
      else
        format.html { redirect_to order_regels_url }
      end
      format.json { head :no_content }
    end
  end

  #Artikel selectie
  # map to name and id for use in our options_for_select
  def artikel_selectie
 #   RIO_LOGGER.info("order_regels_controller") { "artikel_selectie" }
    art1= Artikel.joins(artikels_order_current_user_select(params[:artikelgroep_id], params[:zoekphrase]))
    @artikels=art1.map { |a| [a.omschrijving, a.id, {'data-prijs'=>a.prijs,'data-omschrijving'=>a.omschrijving}] }.insert(0, "Selecteer een artikel")
    logger.info @artikels
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_order_regel
    @order_regel = OrderRegel.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_regel_params
    params.require(:order_regel).permit(:order_id, :artikel_id, :aantal, :opmerking)
  end

  def mode1?(inpval)
    inpval == 1
    #   true
  end
end
