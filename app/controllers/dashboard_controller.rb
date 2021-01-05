class DashboardController < ApplicationController 
  before_action :authenticate_user!
  layout 'dashboard'

  def index
    @photos = current_user.photos
  end
end
