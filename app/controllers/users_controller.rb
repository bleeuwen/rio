class UsersController < ApplicationController
  before_action :signed_in_user, unless: :new
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def new
    @user = User.new
  end

  def edit
    #   @user = User.find(params[:id])      , not necessary
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def index
#    @users = User.all
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @user_artikelgroeps = @user.user_artikelgroeps
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @user }
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  def artikelgroeps
    @user = User.find(params[:id])
    @title = "Artikelgroepen van " + @user.name
    @user_ags = @user.user_artikelgroeps
    $rio_mode = 1
  end

  def new_artikelgroep
    @user = User.find(params[:id])
    @title = "Nieuwe artikelgroep voor " + @user.name
    @user_artikelgroep =@user.user_artikelgroeps.build #create relation with user
    $rio_mode = 1
    $rio_user_id = @user.id
  end

  def orders
    @user = User.find(params[:id])
    @title = "Orders van " + @user.name
    @orders = @user.orders
    $rio_mode = 1
  end

  def new_order
    @user = User.find(params[:id])
    @title = "Nieuwe order voor " + @user.name
    @order=@user.orders.build #create relation with user
    $rio_mode = 1
    $rio_user_id = @user.id
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  # Before filters

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless (current_user?(@user) || current_user.admin?)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end


end
