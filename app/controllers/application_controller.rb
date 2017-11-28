class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if:  :devise_controller?
  before_action :set_notifications, if: :user_signed_in?
  
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to unathorized_access_url
  end
  
  
  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end
  
  def set_notifications
    @notifications = Notification.where(recipient: current_user).recent
  end

  def search
  @q = "%#{params[:query]}%"
  @items = Item.where("name LIKE ? or description LIKE ?", @q, @q)
  @categories =Category.all
  render "items/index"
end
  protected

  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number ,:location_id, :user_type_id, :profilepic])

  end
end
