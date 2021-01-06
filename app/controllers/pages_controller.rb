class PagesController < ApplicationController
  def index
    @photos = Photo.all
  end

  def get_suggestions
    @query = params[:q].downcase

    @users = User.where('LOWER(username) LIKE ?', "%#{@query}%").limit(3)
    @photos = Photo.where('LOWER(title) LIKE ?', "%#{@query}%").limit(5)

    respond_to do |format|
      format.html {
        render partial: 'pages/suggestions', locals: {users: @users, photos: @photos}
      }
    end
  end
end
