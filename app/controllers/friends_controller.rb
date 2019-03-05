class FriendsController < ApplicationController
  def index
    @friends = Friend.all
    

    render("friend_templates/index.html.erb")
  end
  
  def myfriends
    if current_user.present?
      @friend_hashs = [ ]
      
      @pending_invite_ids = [ ]
      @pending_request_ids = [ ]
      Friend.all.each do |friend|
       if current_user.id == friend.invitee_id
         if friend.status == 0
           @pending_invite_ids << friend
         else friend.status == 1
           f = Hash.new
           f["fr"] = friend
           f["id"] = friend.inviter_id
           @friend_hashs << f
         end
       end
       if current_user.id == friend.inviter_id
         if friend.status == 0
          @pending_request_ids << friend
         else friend.status == 1
           f = Hash.new
           f["fr"] = friend
           f["id"] = friend.invitee_id
           @friend_hashs << f
          end
       end
      end
    
    render("friend_templates/myfriends.html.erb")
    else
      redirect_to("/users/sign_in")
    end 
  end

  def show
    @friend = Friend.find(params.fetch("id_to_display"))
    
    render("friend_templates/show.html.erb")
  end

  def new_form
    @friend = Friend.new

    render("friend_templates/new_form.html.erb")
  end

  def create_row
    @friend = Friend.new

    @friend.inviter_id = params.fetch("inviter_id")
    @friend.invitee_id = params.fetch("invitee_id")
    @friend.status = params.fetch("status")

    if @friend.valid?
      @friend.save

      redirect_back(:fallback_location => "/friends", :notice => "Friend created successfully.")
    else
      render("friend_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @friend = Friend.find(params.fetch("prefill_with_id"))

    redirect_back(:fallback_location => "/myfriends", :notice => "Friend request accepted.")
  end

  def update_row
    @friend = Friend.find(params.fetch("id_to_modify"))

    @friend.inviter_id = params.fetch("inviter_id")
    @friend.invitee_id = params.fetch("invitee_id")
    @friend.status = params.fetch("status")

    if @friend.valid?
      @friend.save

      redirect_to("/friends/#{@friend.id}", :notice => "Friend updated successfully.")
    else
      render("friend_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @friend = Friend.find(params.fetch("id_to_remove"))

    @friend.destroy

    redirect_back(:fallback_location => "/myfriends", :notice => "Friend deleted successfully.")
  end
end
