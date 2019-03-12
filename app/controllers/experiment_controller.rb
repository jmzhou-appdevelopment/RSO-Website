class ExperimentController < ApplicationController
  def index
    if params.has_key?("filters")
      @filters = params.fetch("filters")
    end
    
    if params.has_key?("clubfilter")
      @clubfilter = 1
    end
    
    if params.has_key?("eventfilter")
      @eventfilter = 1
    end
    
    render("experiment_templates/index.html.erb")
  end
   
end

