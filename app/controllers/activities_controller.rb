class ActivitiesController < ApplicationController

  def index
   @activities = PublicActivity::Activity.page(params[:page]).per(20).order("created_at desc")
  end

end
