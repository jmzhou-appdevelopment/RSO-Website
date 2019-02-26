class ExperimentController < ApplicationController
  def index
    if params.has_key?("filters")
      @filters = params.fetch("filters")
    end
    
    
    render("experiment_templates/index.html.erb")
  end
   
end

