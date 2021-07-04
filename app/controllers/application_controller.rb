class ApplicationController < ActionController::Base
  protect_from_forgery
  include ResponseHelper

  before_action :set_response

  def set_response
    @jresponse = initialize_response
  end

end
