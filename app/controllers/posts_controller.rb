class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def create
  	@post = Post.new(post_params)
  	respond_to do |format|
  		if @post.save
  			format.js # Will search for create.js.erb
  		else
  			format.html { render language_hangout_posts_path(@language, @hangout, @post) }
  		end
  	end
  end

  private
  def post_params
  	params.require(:post).permit(:author, :content, :all_tags)
  end
end
