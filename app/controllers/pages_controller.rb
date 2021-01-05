class PagesController < ApplicationController
  def index
    @photos = Photo.all
  end

  def get_suggestions
    @query = params[:q]

    @users = User.where('username LIKE ?', "%#{@query}%").limit(3)
    @photos = Photo.where('title LIKE ?', "%#{@query}%").limit(5)

    respond_to do |format|
      format.html {
        render partial: 'pages/suggestions', locals: {users: @users, photos: @photos}
      }
    end
  end
end
