class Api::StoriesController < ApplicationController
  def show
    story = Story.find_by_code_and_position(params[:code], params[:position])
    render :text => story.body || '' 
  end
end
