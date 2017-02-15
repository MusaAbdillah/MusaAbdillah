class ActivitiesController < ApplicationController
   load_and_authorize_resource :class => false

  def index
   @activities = PublicActivity::Activity.page(params[:page]).per(20).order("id desc")
  end

end
