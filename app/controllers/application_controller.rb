class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    manifest_id = params[:manifest_id]
    if manifest_id.blank?
      manifest_id = $redis.get("octappus-ui:current")
    end
    index_from_redis = $redis.get("#{manifest_id}")
    render html: index_from_redis.to_s.html_safe
  end
end
