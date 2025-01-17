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

def delete
  #Parameters: {"for_delete"=>" 777"}
  the_id = params.fetch("for_delete")
  matching_photos = Photo.where({ :id => the_id})
  the_photo = matching_photos.at(0)
  the_photo.destroy
  #render({ :template => "photo_templates/delete.html.erb"})
  redirect_to("/photos")
end

def create
   #Parameters: {"query_image"=>"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/4QEQRXhpZgAASUkqAAgAAAACAA4BAgDRAAAAJgAAAJiCAgARAAAA9wAAAAAAAABDVVBFUlRJTk8sIENBIC0gQVBSSUwgMDg6ICBBcHBsZSBDRU8gU3RldmUgSm9icyBzcGVha3MgZHVyaW5nIGFuIEFwcGxlIHNwZWNpYWwgZXZlbnQgQXByaWwgOCwgMjAxMCBpbiBDdXBlcnRpbm8sIENhbGlmb3JuaWEuIEpvYnMgYW5ub3VuY2VkIHRoZSBuZXcgaVBob25lIE9TNCBzb2Z0d2FyZS4gIChQaG90byBieSBKdXN0aW4gU3VsbGl2YW4vR2V0dHkgSW1hZ2VzKTIwMTAgR2V0dHkgSW1hZ2Vz/+0BLlBob3Rvc2hvcCAzLjAAOEJJTQQEAAAAAAERHAJQAA9KdXN0aW4gU3VsbGl2YW4cAngA0UNVUEVSVElOTywgQ0EgLSBBUFJJTCAwODogIEFwcGxlIENFTyBTdGV2ZSBKb2JzIHNwZWFrcyBkdXJpbmcgYW4gQXBwbGUgc3BlY2lhbCBldmVudCBBcHJpbCA4LCAyMDEwIGluIEN1cGVydGlubywgQ2FsaWZvcm5pYS4gSm9icyBhbm5vdW5jZWQgdGhlIG5ldyBpUGhvbmUgT1M0IHNvZnR3YXJlLiAgKFBob3RvIGJ5IEp1c3RpbiBTdWxsaXZhbi9HZXR0eSBJbWFnZXMpHAJ0ABEyMDEwIEdldHR5IEltYWdlcxwCbgAMR2V0dHkgSW1hZ2VzAP/hBelodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+Cjx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iPgoJPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd", "query_caption"=>"Steve Job", "query_owner_id"=>"117"}

  input_image = params.fetch("query_image")
  input_caption = params.fetch("query_caption")
  input_owner_id = params.fetch("query_owner_id")
  
  a_new_photo = Photo.new
  
  a_new_photo.image = input_image
  a_new_photo.caption = input_caption
  a_new_photo.owner_id = input_owner_id

  a_new_photo.save

  next_url ="/photos/" + a_new_photo.id.to_s
  redirect_to(next_url)


  #render( {:template => "photo_templates/create.html.erb"})
end

def update
  #Parameters: {"query_image"=>"https://www.chicagobooth.edu/", "query_caption"=>"ChI", "modify_id"=>"955"}
  the_id = params.fetch("modify_id")
  matching_photos = Photo.where({ :id => the_id})
  the_photo = matching_photos.at(0)

  input_image =params.fetch("query_image")
  input_caption = params.fetch("query_caption")

  the_photo.image = input_image
  the_photo.caption = input_caption

  the_photo.save
  
  #render( {:template => "photo_templates/update.html.erb"})
 
  next_url ="/photos/" + the_photo.id.to_s
  redirect_to(next_url)

end

end
