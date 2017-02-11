class ActivitiesController < ApplicationController

  def index
   @activities = PublicActivity::Activity.page(params[:page]).per(20).order("id desc")
  end

end
