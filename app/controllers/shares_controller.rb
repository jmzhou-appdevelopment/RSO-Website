class SharesController < ApplicationController
  def index
    @shares = Share.all

    render("share_templates/index.html.erb")
  end

  def create_shares
    if current_user.present?
      i = 0
      @sharer_id = current_user.id
      @shared_item_id = params.fetch("shared_item_id")
      @share_type = params.fetch("share_type")
      success = 0
      while i < cookies[:friendcount].to_i
        if params.has_key?(@shared_item_id.to_s + "friend" + i.to_s) 
          success = 1
          @sharee_id = params.fetch(@shared_item_id.to_s + "friend" + i.to_s)
          s = Share.new
          s.sharer_id = @sharer_id
          s.sharee_id = @sharee_id
          s.shared_item_id = @shared_item_id
          s.share_type = @share_type
          s.save
        end
        i = i + 1
      end
      if success == 0
        redirect_to("/search", :notice => "You did not select any friends")
      else
      redirect_to("/search", :notice => "Shared successfully")
      end
    else
      redirect_to("/search", :notice => "You need to be signed in")
    end
  end
          
  def accept_share
    @share = Share.find(params.fetch("share_id"))
    if current_user.events.ids.include? @share.shared_item_id
      @share.destroy
      redirect_back(:fallback_location => "/mywall", :notice => "Already in favorites.")
    else
      
      @attendance = Attendance.new
      @attendance.user_id = params.fetch("user_id")
      @attendance.event_id = params.fetch("event_id")
      if @attendance.valid?
        @attendance.save
        @share.destroy
      else
        redirect_back(:fallback_location => "/mywall", :notice => "Something went wrong.")
      end
      redirect_back(:fallback_location => "/mywall", :notice => "Attendance created successfully.")
    end
  end
  
  def destroy_row
    @share = Share.find(params.fetch("id_to_remove"))

    @share.destroy
    
    redirect_back(:fallback_location => "/mywall", :notice => "Share deleted successfully.")
  end
end