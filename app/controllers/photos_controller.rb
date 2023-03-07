class PhotosController < ApplicationController
  
  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({ :created_at => :desc })
    render({:template => "photo_templates/index.html.erb"})
  end

def show_details
  #Parameters: {"details_photos"=>"777"}
  url_id = params.fetch("details_photos")
  matching_photos = Photo.where({ :id => url_id })
  @the_photo = matching_photos.at(0)
  render({ :template => "photo_templates/show_details.html.erb"})
end

end
