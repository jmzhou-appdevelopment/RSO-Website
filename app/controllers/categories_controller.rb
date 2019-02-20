class CategoriesController < ApplicationController
  def index
    @categories = Category.all

    render("category_templates/index.html.erb")
  end
  
  def show 
    @category = Category.find(params.fetch("id_to_display"))
    
    render("category_templates/show.html.erb")
  end
  

  def new_form
    render("category_templates/new_form.html.erb")
  end
  
  

  def create_row
    @category = Category.new

    @category.description = params.fetch("description")
    
    if @category.valid?
      @category.save
      redirect_to("/categories", :notice => "Category created successfully.")
    else
      render("category_templates/new_form.html.erb")
    end
  end

  def edit_form
    @category = Category.find(params.fetch("prefill_with_id"))

    render("category_templates/edit_form.html.erb")
  end

  def update_row
    @category = Category.find(params.fetch("id_to_modify"))

    @category.description = params.fetch("description")
    
    if @category.valid?
      @category.save
      redirect_to("/categories", :notice => "Category updated successfully.")
    else
      render("category_templates/new_form.html.erb")
    end

  end

  def destroy_row
    @category = Category.find(params.fetch("id_to_remove"))

    @category.destroy

    redirect_to("/categories", :notice => "Category deleted successfully.")
  end
end