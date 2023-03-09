Rails.application.routes.draw do
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:username", { :controller => "users", :action => "show" })
  get("/insert_user_record", { :controller => "users", :action => "record" })
  get("/update_user/", { :controller => "users", :action => "update" })

  get("/insert_comment_record", { :controller => "users", :action => "comment" })

  get("/photos", { :controller => "photos", :action => "index" })
  get("/photos/:details_photos", { :controller => "photos", :action => "show_details" })
  get("/delete_photo/:for_delete", { :controller => "photos", :action => "delete" })
  get("/insert_photo", { :controller => "photos", :action => "create" })
  get("/update_photo/:modify_id", { :controller => "photos", :action => "update" })

  get("/", { :controller => "users", :action => "index" })
end
