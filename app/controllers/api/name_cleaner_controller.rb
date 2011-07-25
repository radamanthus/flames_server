class Api::NameCleanerController < ApplicationController
  def show
    names = params[:data]
    p names.inspect
    render :text => names.to_s
 end
end

