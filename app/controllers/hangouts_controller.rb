class HangoutsController < ApplicationController
  before_action :set_hangout, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :check_access, only: [:edit, :update, :destroy]
  before_action :set_language

  # GET /hangouts
  # GET /hangouts.json
  def index
      @hangouts = Hangout.where(["language_id = ? and private = ? and end_time > ?" , @language.id, false, Time.now]).order( 'start_time ASC' )

      if params[:scheduled].present?
        @hangouts = @hangouts.scheduled
      elsif params[:live].present?
        @hangouts = @hangouts.live
      else
        @hangouts
      end
  end

  # GET /hangouts/1
  # GET /hangouts/1.json
  def show
    if params[:tag]
      #@posts = @hangout.posts.tagged_with(params[:tag])
      @posts = Post.tagged_with(params[:tag]).find_all_by_hangout_id(params[:hangout_id])
    else
      @posts = @hangout.posts
    end
  end

  # GET /hangouts/new
  def new
    @hangout = Hangout.new
  end

  # GET /hangouts/1/edit
  def edit
  end

  # POST /hangouts
  # POST /hangouts.json
  def create
    @hangout = Hangout.new(hangout_params)
    @hangout.language_id = @language.id
    @hangout.user_id = current_user.id
    @hangout.save

    respond_to do |format|
      if @hangout.save
        format.html { redirect_to language_hangout_path(@language,@hangout), notice: 'Hangout was successfully created.' }
        format.json { render action: 'show', status: :created, location: @hangout }
      else
        format.html { render action: 'new' }
        format.json { render json: @hangout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hangouts/1
  # PATCH/PUT /hangouts/1.json
  def update
    respond_to do |format|
      if @hangout.update(hangout_params)
        format.html { redirect_to language_hangout_path(@language, @hangout), notice: 'Hangout was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @hangout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hangouts/1
  # DELETE /hangouts/1.json
  def destroy
    @hangout.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hangout
      @hangout = Hangout.find(params[:hangout_id]) rescue Hangout.find(params[:id])
    end

    def set_language
      @language = Language.find(params[:language_id])
    end

    def check_access
      unless ( user_signed_in? && current_user.admin? ) || ( current_user && @hangout.user == current_user )
        redirect_to root_path, alert: "Sorry, you can't do that."
      end
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def hangout_params
      params.require(:hangout).permit(:description, :name, :language_id, :post_id, :private, :start_time, :end_time, :user_id)
    end
end