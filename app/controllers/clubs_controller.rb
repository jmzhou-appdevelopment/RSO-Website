class ClubsController < ApplicationController
  def index
    @clubs = Club.all

    render("club_templates/index.html.erb")
  end
  
  def search
    # @filters = params.fetch("filters")
    if params.has_key?("clubs")
      @clubfilter = 1
      @club = params.fetch("clubs")
    else
      @clubfilter = 0
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

    render("club_templates/search.html.erb")
  end
  
  def searchfilter
    if params.has_key?("clubfilter")
      @clubfilter = 1
    end
    if params.has_key?("eventfilter")
      @eventfilter = 1
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
    if @club.valid?
      @club.save
      redirect_to("/clubs", :notice => "Club updated successfully.")
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
end