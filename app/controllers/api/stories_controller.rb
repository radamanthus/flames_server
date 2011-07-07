class Api::StoriesController < ApplicationController
  def show
    story = Story.find_by_code_and_position(params[:code], params[:position])
    render :text => {:body => story.body || '', :title => story.title}.to_json
  end
end
