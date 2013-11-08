class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  #  rails tutorial 8.2.1
  #  By default, all the helpers are available in the views but not in the controllers.
  #  We need the methods from the Sessions helper in both places, so we have to include it explicitly.

  #http://edgeguides.rubyonrails.org/active_record_querying.html
  rescue_from ActiveRecord::DeleteRestrictionError , with: :record_delete_restrictions


  private
  def record_delete_restrictions
    @rio_destroy_message  ||= "Verwijdering mislukt ivm restricties"
    flash[:error] = @rio_destroy_message
    redirect_to :back
  end
end
