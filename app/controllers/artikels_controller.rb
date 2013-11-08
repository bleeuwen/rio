class ArtikelsController < ApplicationController
  include ArtikelsHelper
  before_action :signed_in_user
  before_action :artikel_crud_create, only: :create
  before_action :artikel_crud_read, only: :show
  before_action :artikel_crud_update, only: :update
  before_action :artikel_crud_edit, only: :edit
  before_action :artikel_crud_delete, only: :delete
# check on create in create-action it self

  def new
    @artikel=Artikel.new
  end

  def index
    if params[:search]
      @artikels=Artikel.joins(artikels_current_user_search(params[:search]))
    else
      @artikels=Artikel.joins(artikels_current_user)
    end
  end

  def show
    @artikel = Artikel.find(params[:id])
  end

  def create
    @artikel = Artikel.new(artikel_params)
    if @artikel.save
      flash[:success] = "Artikel aangemaakt"
      redirect_to artikels_url # not to artikel @artikel, user may not have rights to show option
    else
      render 'new'
    end
  end

  def update
    @artikel = Artikel.find(params[:id])
    if @artikel.update_attributes(artikel_params)
      flash[:success] = "Artikel geupdeet"
      redirect_to artikels_url
    else
      render 'edit'
    end
  end

  def edit
    @artikel = Artikel.find(params[:id])

  end

  #DELETE
  def destroy
    @artikel = Artikel.find(params[:id])
    @artikel.destroy
    flash[:success] = "Artikel verwijderd"
    respond_to do |format|
      format.html { redirect_to artikels_url }
      format.json { head :no_content }
    end
  end

  private

  def artikel_crud
    @artikel = Artikel.find(params[:id])
    crud_current_user(@artikel.artikelgroep_id)
  end


  def artikel_crud_create
    #check authorisation of new artikelgroep
    if !crud_current_user(params[:artikel][:artikelgroep_id]).include? 'C'
      flash[:error] = "Create Autorisatie??"
      redirect_to artikels_url
    end
  end


  def artikel_crud_read #one of the options
    if !artikel_crud.include? 'R'
      flash[:error] = "Read Autorisatie??"
      redirect_to artikels_url
    end
  end

  def artikel_crud_edit
    #check authorisation of new artikelgroep
    if !artikel_crud.include? 'U'
      flash[:error] = "edit Autorisatie??"
      redirect_to artikels_url
    end
  end

  def artikel_crud_update
    #check authorisation of new artikelgroep
    if !crud_current_user(params[:artikel][:artikelgroep_id]).include? 'U'
      flash[:error] = "Update Autorisatie??"
      redirect_to artikels_url
    end
  end

  def artikel_crud_delete
    artikel_crud
    if !artikel_crud.include? 'D'
      flash[:error] = "Autorisatie??"
      redirect_to artikels_url
    end
  end

  def artikel_params
    params.require(:artikel).permit(:artikelnummer, :omschrijving, :prijs,
                                    :opmerking, :artikelgroep_id)
  end
end



