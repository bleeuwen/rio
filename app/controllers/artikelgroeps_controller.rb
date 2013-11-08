class ArtikelgroepsController < ApplicationController
  before_action :user_is_admin
  before_action :admin_user, only: [:new,:create, :update, :destroy]
  before_action :set_artikelgroep, only: [:show, :edit, :update, :destroy]


  # GET /artikelgroeps
  # GET /artikelgroeps.json
  def index
    @artikelgroeps = Artikelgroep.all
  end

  # GET /artikelgroeps/1
  # GET /artikelgroeps/1.json
  def show
  end

  # GET /artikelgroeps/new
  def new
    @artikelgroep = Artikelgroep.new
  end

  # GET /artikelgroeps/1/edit
  def edit
  end

  # POST /artikelgroeps
  # POST /artikelgroeps.json
  def create
    @artikelgroep = Artikelgroep.new(artikelgroep_params)

    respond_to do |format|
      if @artikelgroep.save
        format.html { redirect_to @artikelgroep, notice: 'Artikelgroep was successfully created.' }
        format.json { render action: 'show', status: :created, location: @artikelgroep }
      else
        format.html { render action: 'new' }
        format.json { render json: @artikelgroep.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artikelgroeps/1
  # PATCH/PUT /artikelgroeps/1.json
  def update
    respond_to do |format|
      if @artikelgroep.update(artikelgroep_params)
        format.html { redirect_to @artikelgroep, notice: 'Artikelgroep was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @artikelgroep.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artikelgroeps/1
  # DELETE /artikelgroeps/1.json
  def destroy
    @rio_destroy_message ="Kan niet worden verwijderd, er zijn nog artikelen bij deze groep!!"
    @artikelgroep.destroy
    respond_to do |format|
      format.html { redirect_to artikelgroeps_url }
      format.json { head :no_content }
    end
  end



  private
  # Use callbacks to share common setup or constraints between actions.
  def set_artikelgroep
    @artikelgroep = Artikelgroep.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def artikelgroep_params
    params.require(:artikelgroep).permit(:groepcode, :omschrijving, :opmerking)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end
