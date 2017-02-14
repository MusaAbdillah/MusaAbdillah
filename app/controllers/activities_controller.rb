class ActivitiesController < ApplicationController
   load_and_authorize_resource 

  def index
   @activities = PublicActivity::Activity.page(params[:page]).per(20).order("id desc")
  end

end
