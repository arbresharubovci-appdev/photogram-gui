class UsersController < ApplicationController
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc})
    render({:template => "user_templates/index.html.erb"})
  end

  def show
    #Parameters: {"profile"=>"anisa"}
    url_username = params.fetch("profile")
    matching_users = User.where({ :username => url_username})
    @the_user = matching_users.first
    render({:template => "user_templates/show.html.erb"})
  end

  def record
    #Parameters: {"input_username"=>"Arbresha"}
    the_user = params.fetch("input_username")
    
    
    #render({:template => "user_templates/record.html.erb"})
  end

  
  
  
  
  def comment 
    #Parameters: {"input_photo_id"=>"122", "input_author_id"=>"122", "input_body"=>"hello"}
    
    render({:template => "user_templates/comment.html.erb"})
  end

end
