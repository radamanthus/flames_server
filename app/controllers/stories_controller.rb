class StoriesController < ApplicationController
  include ApplicationHelper
  
  before_filter :require_login, :except => [:show]
  
  def create
    @story = Story.new(params[:story])
    if @story.save
      flash[:notice] = "The new story for result '#{@story.code}', position #{@story.position} has been created."
      redirect_to stories_path
    else
      flash[:error] = @story.errors.full_messages.join("; ")
      redirect_to new_story_path({story:params[:story]})
    end
  end

  def destroy
    @story = Story.find(params[:id])
    if @story && @story.destroy
      flash[:notice] = "The story titled '#{@story.title}' has been removed."
    else
      flash[:error] = @story.errors
    end
    redirect_to stories_path
  end

  def edit
    @story = Story.find(params[:id])
  end

  def index
    @stories = Story.order("code ASC, position ASC")
  end
    
  def new
    @story = Story.new(params[:story])
    if @story.code
      @story.position = Story.next_position_available(@story.code)
    end
  end

  def show
    respond_to do |format|
      format.html { @story = Story.find(params[:id]) }
      format.json do
        @story = Story.find_by_code_and_position(params[:code], params[:position])
        unless @story
          @story = Story.find_by_code(params[:code])
        end
        render :text => @story.body
      end
    end
  end

  def update
    @story = Story.find(params[:id])
    @story.update_attributes(params[:story])

    flash[:notice] = "The story for result '#{@story.code}', position #{@story.position} has been updated."
    redirect_to stories_path
  end
end
