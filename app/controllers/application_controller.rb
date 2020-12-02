class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :position, :occupation])
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:title])
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:catch_copy])
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:concept])
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:image])    

  end

  # def protospace_params
  #   params.require(:title).permit(:catch_copy).merge(user_id: current_user.id)
  # end

end
