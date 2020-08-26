class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do
    flash[:error] = 'Access denied!'
    sign_out
    redirect_to new_user_session_url
  end
end
