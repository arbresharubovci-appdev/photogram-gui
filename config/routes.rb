Rails.application.routes.draw do

get("/users" , {:controller => "users", :action =>"index"})
get("/users/:profile" , { :controller => "users" , :action => "show"})
get("/photos" , { :controller => "photos" , :action => "index"})
get("/photos/:details_photos", { :controller => "photos" , :action => "show_details"})
get("/delete_photo/:for_delete" , {:controller => "photos" , :action => "delete"})

end
