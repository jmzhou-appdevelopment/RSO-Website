class StudentsController < ApplicationController
  def index
    @students = Student.all

    render("student_templates/index.html.erb")
  end

  def show
    @student = Student.find(params.fetch("id_to_display"))

    render("student_templates/show.html.erb")
  end

  def new_form
    render("student_templates/new_form.html.erb")
  end

  def create_row
    @student = Student.new

    @student.name = params.fetch("name")
    
   if @student.valid?
      @student.save
      redirect_to("/students", :notice => "Student created successfully.")
    else
      render("student_templates/new_form.html.erb")
    end
  end

  def edit_form
    @student =Student.find(params.fetch("prefill_with_id"))

    render("student_templates/edit_form.html.erb")
  end

  def update_row
    @student = Student.find(params.fetch("id_to_modify"))

    @student.name = params.fetch("name")
    
    if @student.valid?
      @student.save
      redirect_to("/students", :notice => "Student updated successfully.")
    else
      render("student_templates/new_form.html.erb")
    end

  end

  def destroy_row
    @student = Student.find(params.fetch("id_to_remove"))

    @student.destroy
    
    @student.enrollments.each do |enrollment|
      enrollment.destroy
    end
    
    redirect_to("/students", :notice => "Student deleted successfully.")
  end
end