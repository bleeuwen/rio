module SessionsHelper
  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    self.current_user = user
  end

  def current_user=(user) #http://ruby.railstutorial.org/book/ruby-on-rails-tutorial#code-current_user_equals
    @current_user = user
  end

  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def current_user?(user)
    user == current_user
  end

  # used always, unless users3new
  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end

  def signed_in?
    !current_user.nil?
  end

  def user_is_admin
    unless user_is_admin?
      redirect_to root_url, notice: "Only for admins."
    end
  end

  def user_is_admin?
    current_user.admin?
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end

  def clean_id (id)
    id = (!id.nil?) ? id : 0 #check 0
    id=(id.to_i.integer?) ? id : 0 #check integer
  end
end
