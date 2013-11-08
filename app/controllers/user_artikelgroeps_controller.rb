class UserArtikelgroepsController < ApplicationController
  before_action :user_is_admin
  before_action :set_user_artikelgroep, only: [:show, :edit, :update, :destroy]

  # GET /user_artikelgroeps
  # GET /user_artikelgroeps.json
  def index
    @user_artikelgroeps = UserArtikelgroep.all
  end

  # GET /user_artikelgroeps/1
  # GET /user_artikelgroeps/1.json
  def show
  end

  # GET /user_artikelgroeps/new
  def new
    @user_artikelgroep = UserArtikelgroep.new
  end

  # GET /user_artikelgroeps/1/edit
  def edit
  end

  # POST /user_artikelgroeps
  # POST /user_artikelgroeps.json
  def create

    @user_artikelgroep = UserArtikelgroep.new(user_artikelgroep_params)

    @user_artikelgroep.user_id ||= $rio_user_id #backup for user_id

    respond_to do |format|
      if @user_artikelgroep.save
        if mode1?($rio_mode) ##started from a specific user
          format.html { redirect_to artikelgroeps_user_path($rio_user_id), notice: 'User artikelgroep was successfully created.' }
        else
          format.html { redirect_to @user_artikelgroep, notice: 'User artikelgroep was successfully created.' }
        end
        format.json { render action: 'show', status: :created, location: @user_artikelgroep }
      else
        format.html { render action: 'new' } #when something goes wrong it is not too bad to go to new
        format.json { render json: @user_artikelgroep.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_artikelgroeps/1
  # PATCH/PUT /user_artikelgroeps/1.json
  def update
    #always current user id
    #  @user_artikelgroep.user_id=current_user.id

    respond_to do |format|
      if @user_artikelgroep.update(user_artikelgroep_params)
        if mode1?($rio_mode) ##started from a specific user
          format.html { redirect_to artikelgroeps_user_path(@user_artikelgroep.user_id), notice: 'User artikelgroep was successfully created.' }
        else
          format.html { redirect_to @user_artikelgroep, notice: 'User artikelgroep was successfully updated.' }
        end
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user_artikelgroep.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_artikelgroeps/1
  # DELETE /user_artikelgroeps/1.json
  def destroy
    $rio_user_id=@user_artikelgroep.user_id
    @user_artikelgroep.destroy
    respond_to do |format|
      if mode1?($rio_mode) ##started from a specific user
        format.html { redirect_to artikelgroeps_user_path($rio_user_id) }
      else
        format.html { redirect_to user_artikelgroeps_url }
      end
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user_artikelgroep
    @user_artikelgroep = UserArtikelgroep.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_artikelgroep_params
    params.require(:user_artikelgroep).permit(:user_id, :artikelgroep_id, :auth_c, :auth_r, :auth_u, :auth_d)
  end

  def mode1?(inpval)
    inpval == 1
    #   true
  end
end
