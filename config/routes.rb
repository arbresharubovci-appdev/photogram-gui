Rails.application.routes.draw do

get("/users" , {:controller => "users", :action =>"index"})
get("/users/:profile" , { :controller => "users" , :action => "show"})

end
