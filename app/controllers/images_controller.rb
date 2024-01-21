class ImagesController < ApplicationController
  def new
    @image = Image.new
    @images = Image.all
  end

  def show
    @image = Image.find(params[:id])
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      redirect_to @image
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @images = Image.all
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])

    if @image.update(edit_image_params)
      redirect_to @image
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def image_params
    params.require(:image).permit(:file)
  end

  def edit_image_params
    params.require(:image).permit(:name, :alt_text, :category)
  end
end
