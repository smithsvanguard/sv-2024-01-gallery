class ImagesController < ApplicationController
  def new
    # Path: /images [GET] This is set by convention of Ruby on Rails.

    # Prepares the new image record to be added
    @image = Image.new

    # Get all the images from the database (e.g. SQLite)
    @images = Image.all

    # Renders the new.html.erb and passing the @image and @images variables with all of the content
  end

  def create
    # Path: /images [POST] This is set by convention of Ruby on Rails.

    # Calls the function, image_params, that accept the image file
    @image = Image.new(image_params)

    # Performs a save operation of the image file depending on the configures active_storage (e.g. Local or Amazon S3)
    if @image.save
      # If the result is success, redirect to the view image details path
      redirect_to @image
    else
      # If the record is not save, return an error
      render :new, status: :unprocessable_entity
    end
  end

  def show
    # path: /images/:id [GET] This is set by convention of Ruby on Rails.

    # Find the image record with the specific ID
    @image = Image.find(params[:id])

    # Render the details to show.html.erb
  end

  def index
    # path: /images [GET] This is set by convention of Ruby on Rails.

    # Retrieve all of the image records
    @images = Image.all
  end

  def edit
    # path: /images/:id/edit [GET] This is set by convention of Ruby on Rails.

    # Update the image record with the specific ID
    @image = Image.find(params[:id])

    # Return the page: edit.html.erb include the @image variable with the details
  end

  def update
    # path: /images/:id [PUT] This is set by convention of Ruby on Rails.

    # Find the image record with the specific ID
    @image = Image.find(params[:id])

    # Update the image with the specific image parameters
    if @image.update(edit_image_params)

      # If the result is success, redirect to the view image details path
      redirect_to @image
    else

      # If the record is not save, return an error to the edit page.
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # path: /images/:id [DELETE]. This is set by convention of Ruby on Rails.

    # Find the image record with the specific ID
    @image = Image.find(params[:id])

    # Delete the retrieved image
    @image.destroy

    # Return to the root_path, which is configured in the config/routes.rb
    redirect_to root_path, status: :see_other
  end

  private

  def image_params
    # a function that determine which attributes are allowed. In this case a file
    params.require(:image).permit(:file)
  end

  def edit_image_params
    # a function that determines which fields are allowed to be edited
    params.require(:image).permit(:name, :alt_text, :category)
  end
end
