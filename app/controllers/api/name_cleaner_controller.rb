class Api::NameCleanerController < ApplicationController
  def clean_up
    names = params[:data]
    p names.inspect
 end
end

