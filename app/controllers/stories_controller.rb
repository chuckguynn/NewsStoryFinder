class StoriesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  # GET /stories
  # GET /stories.json
  def index
    if params[:category_id]
    cat_name = Story.where(:category_id => params[:category_id])  
    @stories = cat_name.order('created_at desc').page(params[:page]).per(5)
    @categories = Category.all
    else  
    @stories = Story.order('created_at desc').page(params[:page]).per(5)
    @categories = Category.all



    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stories }
    end
  end
end

  # GET /stories/1
  # GET /stories/1.json
  def show
    @story = Story.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @story }
    end
  end

  # GET /stories/new
  # GET /stories/new.json
  def new
    @story = Story.new
    @categories = Category.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @story }
    end
  end

  # GET /stories/1/edit
  def edit
    @story = Story.find(params[:id])
    @categories = Category.all
  end

  # POST /stories
  # POST /stories.json
  def create
    @story = Story.new(params[:story])
    @story.user_id = current_user.id
    respond_to do |format|
      if @story.save
        format.html { redirect_to @story, notice: 'Story was successfully created.' }
        format.json { render json: @story, status: :created, location: @story }
      else
        format.html { render action: "new" }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  def up_vote
    @story = Story.find(params[:id])
    @story.liked_by current_user
    respond_to do |format|
      format.js
      format.html  { redirect_to stories_path, notice: 'Thanks For Your Vote!' }
      format.json { render json: @stories }
    end
  end

  def down_vote 
    @story = Story.find(params[:id])
    @story.disliked_by current_user 
    respond_to do |format|
      format.js
      format.html  { redirect_to stories_path, notice: 'Thanks For Your Vote!' }
      format.json { render json: @stories }
    end
  end

  # PUT /stories/1
  # PUT /stories/1.json
  def update
    @story = Story.find(params[:id])

    respond_to do |format|
      if @story.update_attributes(params[:story])
        format.html { redirect_to @story, notice: 'Story was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    @story = Story.find(params[:id])
    @story.destroy

    respond_to do |format|
      format.html { redirect_to stories_path }
        format.json { render json: @story, status: :created, location: @story }
    end
  end
end
