class ClubsController < ApplicationController
  def index
    @clubs = Club.all

    render("club_templates/index.html.erb")
  end
  
  def search
    # @filters = params.fetch("filters")
    @clubfilter = 1
    @eventfilter = 0
    if params.has_key?("typefilter")
      if params.fetch("typefilter") == "clubfilter"
        @clubfilter = 1
        @eventfilter = 0
      elsif params.fetch("typefilter") == "eventfilter"
        @eventfilter = 1
        @clubfilter = 0
      end
    end
    if params.has_key?("friendfilter")
      @friendfilter = 1
    end
    if params.has_key?("foodfilter")
      @foodfilter = 1
    end
    if params.has_key?("admissionfilter")
      @admissionfilter = 1
    end
    if params.has_key?("soonfilter")
      @soonfilter = 1
    end
    @categorynames = [ ]
    Category.all.each do |category|
      @categorynames.push(category.description)
    end
    @categoryexists = [ ]
    @categorynames.each do |category|
      if params.has_key?(category)
        @categoryexists.push(1)
      else
        @categoryexists.push(0)
      end
    end
    
    
    @clubs = Club.all
    @categories = Category.all
    @events = Event.all
    
    if current_user.present?
      @friend_hashs = [ ]
      Friend.all.each do |friend|
        if current_user.id == friend.invitee_id
          if friend.status == 1
            f = Hash.new
            f["fr"] = friend
            f["id"] = friend.inviter_id
            @friend_hashs << f
          end
        end
        if current_user.id == friend.inviter_id
          if friend.status == 1
            f = Hash.new
            f["fr"] = friend
            f["id"] = friend.invitee_id
            @friend_hashs << f
          end
        end
      end
    end
    render("club_templates/search.html.erb")
  end
  
  def searchfilter
    if params.has_key?("typefilter")
      if params.fetch("typefilter") == "clubfilter"
        @clubfilter = 1
      elsif params.fetch("typefilter") == "eventfilter"
        @eventfilter = 1
      end
    end
    if params.has_key?("friendfilter")
      @friendfilter = 1
    end
    if params.has_key?("foodfilter")
      @foodfilter = 1
    end
    if params.has_key?("admissionfilter")
      @admissionfilter = 1
    end
    if params.has_key?("soonfilter")
      @soonfilter = 1
    end
    
    @categorynames = [ ]
    Category.all.each do |category|
      @categorynames.push(category.description)
    end
    @categoryexists = [ ]
    @categorynames.each do |category|
      if params.has_key?(category)
        @categoryexists.push(1)
      else
        @categoryexists.push(0)
      end
    end
    
    

    @q = Club.ransack(params[:q])
    @clubs = @q.result
    @categories = Category.all
    
    @events=Event.all

    render("club_templates/search.html.erb")
  end

  def show
    @club = Club.find(params.fetch("id_to_display"))

    render("club_templates/show.html.erb")
  end

  def new_form
    render("club_templates/new_form.html.erb")
  end

  def create_row
    @club = Club.new

    @club.title = params.fetch("title")
    @club.blurb = params.fetch("blurb")
    @club.summary = params.fetch("summary")
    @club.source = params.fetch("image_url")
    @club.commitment = params.fetch("commitment")
    @club.schedule = params.fetch("schedule")
    @club.getinvolved = params.fetch("getinvolved")
    @club.admin_user_id = params.fetch("admin_user_id")
    if @club.valid?
      @club.save
      redirect_to("/clubs", :notice => "Club created successfully.")
    else
      render("club_templates/new_form.html.erb")
    end

  end

  def edit_form
    @club = Club.find(params.fetch("prefill_with_id"))

    render("club_templates/edit_form.html.erb")
  end

  def update_row
    @club = Club.find(params.fetch("id_to_modify"))

    @club.title = params.fetch("title")
    @club.source = params.fetch("image_url")
    @club.blurb = params.fetch("blurb")
    @club.summary = params.fetch("summary")
    @club.commitment = params.fetch("commitment")
    @club.schedule = params.fetch("schedule")
    @club.getinvolved = params.fetch("getinvolved")
    @club.admin_user_id = params.fetch("admin_user_id")
    if @club.valid?
      @club.save
      redirect_to("/clubprofile/#{@club.id}", :notice => "Club updated successfully.")
    else
      render("club_templates/edit_form.html.erb")
    end

  end

  def destroy_row
    @club = Club.find(params.fetch("id_to_remove"))

    @club.destroy
    
    @club.enrollments.each do |enrollment|
      enrollment.destroy
    end
    
    @club.tags.each do |tag|
      tag.destroy
    end

    redirect_to("/clubs", :notice => "Club deleted successfully.")
  end
  
  def show_users
    @users = User.all
    render("user_templates/show.html.erb")
  end
  
  def user_wall

    @user_to_display = params.fetch("id_to_display")
    @user = User.find_by(id: @user_to_display)
    if current_user.id == @user_to_display.to_i
      redirect_to("/users/edit")
    else
      @friend_hashs = [ ]
      
      @pending_invite_ids = [ ]
      @pending_request_ids = [ ]
      Friend.all.each do |friend|
       if @user.id == friend.invitee_id
         if friend.status == 0
           @pending_invite_ids << friend
         else friend.status == 1
           f = Hash.new
           f["fr"] = friend
           f["id"] = friend.inviter_id
           @friend_hashs << f
         end
       end
       if @user.id == friend.inviter_id
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
      #display type: 0 if not friends, 1 if needs response to friend request, 2 if request pending
      possiblefriend_inviter = Friend.where(inviter_id: current_user.id).find_by(invitee_id: @user_to_display)
        if possiblefriend_inviter.present?
          if possiblefriend_inviter.status == 0
            @message= "Your friend request is pending."
            @display_type= 2
            render("/user_templates/user_wall_basic.html.erb")
          else possiblefriend_inviter.status == 1
            render("/user_templates/user_wall.html.erb")
          end
        end
      possiblefriend_invitee = Friend.where(invitee_id: current_user.id).find_by(inviter_id: @user_to_display)
        if possiblefriend_invitee.present?
          if possiblefriend_invitee.status == 0
            @message= @user.firstname + " wants to be your friend."
            @display_type= 1
            render("/user_templates/user_wall_basic.html.erb")
          else possiblefriend_invitee.status == 1
            render("/user_templates/user_wall.html.erb")
          end
        end
        unless possiblefriend_invitee.present? or possiblefriend_inviter.present?
          @display_type= 0
          @message = "Friend " + @user.firstname + " to find out more."
        render("/user_templates/user_wall_basic.html.erb")
        end
    end
  end
  
  def show_club_profile
    @club = Club.find(params.fetch("id_to_display"))

    render("club_templates/club_profile.html.erb")
  end
  
  def show_club_profile_edit
    @club = Club.find(params.fetch("prefill_with_id"))

    render("club_templates/club_profile_edit.html.erb")
  end
  
end