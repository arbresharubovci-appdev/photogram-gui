class UsersController < ApplicationController
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc })
    render({ :template => "user_templates/index.html.erb" })
  end

  def show
    #params: {"username"=>"my-name"}
    username = params.fetch("username")
    matching_users = User.where({ :username => username })
    @the_user = matching_users.first

    render({ :template => "user_templates/show.html.erb" })
  end

  def record
    #Parameters: {"input_username"=>"Arbresha"}
    input_username = params.fetch("input_username")

    new_user = User.new

    new_user.username = input_username

    new_user.save

    user_show = "/users/#{new_user.username}"
    redirect_to(user_show)

    #render({:template => "user_templates/record.html.erb"})
  end

  def comment
    #Parameters: {"input_photo_id"=>"777", "input_author_id"=>"122", "input_body"=>"so goo"}
    input_photo_id = params.fetch("input_photo_id")
    input_author_id = params.fetch("input_author_id")
    input_body = params.fetch("input_body")

    a_new_comment = Comment.new

    a_new_comment.photo_id = input_photo_id
    a_new_comment.author_id = input_author_id
    a_new_comment.body = input_body

    a_new_comment.save

    next_url = "/photos/" + input_photo_id.to_s
    puts next_url
    redirect_to(next_url)
    #render({:template => "user_templates/comment.html.erb"})
  end

  def update
    # #Parameters: {"input_username"=>"Inaa"}
    #Parameters: {"input_username"=>"Thomas R", "username"=>"username"}
    user_id = params.fetch("input_id")
    input_username = params.fetch("input_username")

    matching_user = User.where({ :id => user_id})
    the_user = matching_user.at(0)
  
    the_user.username = input_username
   
    the_user.save
    
    #render( {:template => "user_templates/update.html.erb"})
   
    next_url ="/users/" + the_user.username
    redirect_to(next_url)
  
  end

end
