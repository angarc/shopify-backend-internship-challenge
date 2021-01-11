class PagesController < ApplicationController
  def index
    @photos = Photo.all.order('created_at DESC')
  end

  def get_suggestions
    @query = params[:q].downcase

    @photos = Photo.where("LOWER(title) LIKE ? OR LOWER(description) LIKE ?", "%#{@query}%", "% #{@query} %").limit(5)
    @users = User.where('LOWER(username) LIKE ?', "%#{@query}%").limit(3)

    respond_to do |format|
      format.html {
        render partial: 'pages/suggestions', locals: {users: @users, photos: @photos}
      }
    end
  end

  def search_results
    @query = params[:q].downcase

    @photos = Photo.where("LOWER(title) LIKE ? OR LOWER(description) LIKE ?", "%#{@query}%", "% #{@query} %")
    @users = User.where('LOWER(username) LIKE ?', "%#{@query}%")
  end
end
