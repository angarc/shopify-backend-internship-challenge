module Dashboard
  class PhotosController < BaseController
    before_action :set_photo, only: [:show, :edit, :update, :destroy]
      
    def new
      @photo = Photo.new
    end

    def create
      @photo = current_user.photos.build(photo_params)
      
      if @photo.save
        flash[:success] = "Created new photo successfully"  
        redirect_to dashboard_photo_path(@photo)
      else
        flash[:danger] = @photo.errors.full_messages.to_sentence
        render :new
      end
    end

    def show
    end

    def edit
    end

    def update
      respond_to do |format|
        format.js { @photo.update photo_params }
        format.html {
          if @photo.update photo_params
            flash[:success] = "Successfully updated photo"
            redirect_to dashboard_photo_path(@photo)
          else
            flash[:error] = @photo.errors.full_messages.to_sentence
            render :edit
          end
        }
      end
    end

    def destroy
      respond_to do |format|
        format.js { @photo.destroy }
        format.html {
          @photo.destroy
          flash[:success] = "Deleted photo successfully"
          redirect_to dashboard_path
        }
      end
    end

    private
      def photo_params
        params.require(:photo).permit(:description, :title, :image)
      end

      def set_photo
        @photo = current_user.photos.find(params[:id])
      end

  end
end
