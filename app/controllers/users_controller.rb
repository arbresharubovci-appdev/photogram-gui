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
end
