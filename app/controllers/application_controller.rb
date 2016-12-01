class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :get_category_list

  protected

  def get_category_list
    @category = Category.all
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:username, :email)
    end
    devise_parameter_sanitizer.permit(:account_update, keys: [:image])
  end
end
