class AboutController < ApplicationController
  def index
    @about = @current_language.about || About.new
  end

  def mission
    @resource = @current_language.mission || Mission.new
    @list = @current_language.activities.order('created_at desc') || [Activity.new]
  end

  def vision
  end

  def history
    @timeline = @current_language.timeline || Timeline.new
  end

  def organization
  end

  def team
  end

  def advisory
  end

end
