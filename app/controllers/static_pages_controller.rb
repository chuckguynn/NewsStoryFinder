class StaticPagesController < ApplicationController
  before_filter :authenticate_user!, except: [:welcome]
  def home
  end

  def welcome
    @stories = Story.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stories }
    end
  end
end
