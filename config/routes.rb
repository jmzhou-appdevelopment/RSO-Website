Rails.application.routes.draw do
  devise_for :users
  # Routes for the Attendance resource:

  # CREATE
  get("/attendances/new", { :controller => "attendances", :action => "new_form" })
  post("/create_attendance", { :controller => "attendances", :action => "create_row" })

  # READ
  get("/attendances", { :controller => "attendances", :action => "index" })
  get("/attendances/:id_to_display", { :controller => "attendances", :action => "show" })

  # UPDATE
  get("/attendances/:prefill_with_id/edit", { :controller => "attendances", :action => "edit_form" })
  post("/update_attendance/:id_to_modify", { :controller => "attendances", :action => "update_row" })

  # DELETE
  get("/delete_attendance/:id_to_remove", { :controller => "attendances", :action => "destroy_row" })

  #------------------------------

  # Routes for the Tag resource:

  # CREATE
  get("/tags/new", { :controller => "tags", :action => "new_form" })
  post("/create_tag", { :controller => "tags", :action => "create_row" })

  # READ
  get("/tags", { :controller => "tags", :action => "index" })
  get("/tags/:id_to_display", { :controller => "tags", :action => "show" })

  # UPDATE
  get("/tags/:prefill_with_id/edit", { :controller => "tags", :action => "edit_form" })
  post("/update_tag/:id_to_modify", { :controller => "tags", :action => "update_row" })

  # DELETE
  get("/delete_tag/:id_to_remove", { :controller => "tags", :action => "destroy_row" })

  #------------------------------

  # Routes for the Enrollment resource:

  # CREATE
  get("/enrollments/new", { :controller => "enrollments", :action => "new_form" })
  post("/create_enrollment", { :controller => "enrollments", :action => "create_row" })

  # READ
  get("/enrollments", { :controller => "enrollments", :action => "index" })
  get("/enrollments/:id_to_display", { :controller => "enrollments", :action => "show" })

  # UPDATE
  get("/enrollments/:prefill_with_id/edit", { :controller => "enrollments", :action => "edit_form" })
  post("/update_enrollment/:id_to_modify", { :controller => "enrollments", :action => "update_row" })

  # DELETE
  get("/delete_enrollment/:id_to_remove", { :controller => "enrollments", :action => "destroy_row" })

  #------------------------------

  # Routes for the club resource:

  # CREATE
  get("/clubs/new", { :controller => "clubs", :action => "new_form" })
  post("/create_club", { :controller => "clubs", :action => "create_row" })

  # READ
  get("/clubs", { :controller => "clubs", :action => "index" })
  get("/clubs/:id_to_display", { :controller => "clubs", :action => "show" })
  get("/clubssearch", { :controller => "clubs", :action => "search" })
  post("/clubssearch/filters" , { :controller => "clubs" , :action => "searchfilter"})

  # UPDATE
  get("/clubs/:prefill_with_id/edit", { :controller => "clubs", :action => "edit_form" })
  post("/update_club/:id_to_modify", { :controller => "clubs", :action => "update_row" })

  # DELETE
  get("/delete_club/:id_to_remove", { :controller => "clubs", :action => "destroy_row" })

  #------------------------------

  # Routes for the events resource:

  get("/", { :controller => "clubs", :action => "index" })

  # CREATE
  get("/events/new", { :controller => "events", :action => "new_form" })
  post("/create_event", { :controller => "events", :action => "create_row" })

  # READ
  get("/events", { :controller => "events", :action => "index" })
  get("/events/:id_to_display", { :controller => "events", :action => "show" })

  # UPDATE
  get("/events/:prefill_with_id/edit", { :controller => "events", :action => "edit_form" })
  post("/update_event/:id_to_modify", { :controller => "events", :action => "update_row" })

  # DELETE
  get("/delete_event/:id_to_remove", { :controller => "events", :action => "destroy_row" })

  #------------------------------

  # Routes for the student resource:

  # CREATE
  get("/students/new", { :controller => "students", :action => "new_form" })
  post("/create_student", { :controller => "students", :action => "create_row" })

  # READ
  get("/students", { :controller => "students", :action => "index" })
  get("/students/:id_to_display", { :controller => "students", :action => "show" })

  # UPDATE
  get("/students/:prefill_with_id/edit", { :controller => "students", :action => "edit_form" })
  get("/update_student/:id_to_modify", { :controller => "students", :action => "update_row" })

  # DELETE
  get("/delete_student/:id_to_remove", { :controller => "students", :action => "destroy_row" })

  #------------------------------
  
    # Routes for the categories resource:

  # CREATE
  get("/categories/new", { :controller => "categories", :action => "new_form" })
  post("/create_category", { :controller => "categories", :action => "create_row" })

  # READ
  get("/categories", { :controller => "categories", :action => "index" })
  get("/categories/:id_to_display", { :controller => "categories", :action => "show" })

  # UPDATE
  get("/categories/:prefill_with_id/edit", { :controller => "categories", :action => "edit_form" })
  get("/update_category/:id_to_modify", { :controller => "categories", :action => "update_row" })

  # DELETE
  get("/delete_category/:id_to_remove", { :controller => "categories", :action => "destroy_row" })

  #------------------------------
  get("/experiment", { :controller => "experiment", :action => "index" })
  post("/experiment", { :controller => "experiment", :action => "index" })


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
