class HangoutsController < ApplicationController
  before_action :set_hangout, only: [:show, :edit, :update, :destroy]
  before_action :set_language

  # GET /hangouts
  # GET /hangouts.json
  def index
    @hangouts = Hangout.all
  end

  # GET /hangouts/1
  # GET /hangouts/1.json
  def show
    @posts = Post.all
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

    respond_to do |format|
      if @hangout.save
        format.html { redirect_to @hangout, notice: 'Hangout was successfully created.' }
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
        format.html { redirect_to @hangout, notice: 'Hangout was successfully updated.' }
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
      format.html { redirect_to hangouts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hangout
      @hangout = Hangout.find(params[:id])
    end

    def set_language
      @language = Language.find(params[:language_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hangout_params
      params.require(:hangout).permit(:name, :language_id, :post_id, :private)
    end
end
