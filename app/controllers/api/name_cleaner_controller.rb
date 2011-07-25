class Api::NameCleanerController < ApplicationController
  def show
    names = params[:data]
    p names.inspect
 end
end

