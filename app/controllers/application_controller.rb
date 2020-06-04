class ApplicationController < ActionController::Base
  before_action :new_video
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def new_video
    @video = Post.new
  end

end
