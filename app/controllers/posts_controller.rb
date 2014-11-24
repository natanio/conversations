class PostsController < ApplicationController
  before_action :set_hangout, :set_language, only: [:create]
  before_action :authenticate_user!, only: [:create]
  def index
    if params[:tag]
      @posts = @hangout.posts.tagged_with(params[:tag])
    else
      @posts = @hangout.posts
    end
  end

  def create
  	@post = Post.new(post_params)
    @post.hangout_id = @hangout.id
    @post.user_id = current_user.id

  	respond_to do |format|
  		if @post.save
  			format.js # Will search for create.js.erb
  		else
  			format.html { render language_hangout_path(@language, @hangout) }
  		end
  	end
  end

  private

  def set_hangout
    @hangout = Hangout.find(params[:hangout_id])
  end

  def set_language
    @language = Language.find(params[:language_id])
  end
  def post_params
  	params.require(:post).permit(:author, :content, :all_tags)
  end
end
