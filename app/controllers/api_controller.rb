class ApiController < ApplicationController
  include JSONAPI::ActsAsResourceController
  include Knock::Authenticable
  before_action :authenticate
  protect_from_forgery
  skip_before_action :verify_authenticity_token, if: :json_request?

  def context
    #{current_user: current_user}
  end

  protected

  def json_request?
    request.format.json?
  end
end
