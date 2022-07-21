class PostsController < ApplicationController
    before_action :move_to_index, except: :index
    
    def index
        @posts = Post.all
    end
    
    def new
        @post = Post.new
    end
    
    def create
        Post.create(post_params)
        redirect_to root_path
    end
    
    def show
        @post = Post.find(params[:id])
    end
    
    def edit
        @post = Post.find(params[:id])
    end
    
    def update
        @post = Post.find(params[:id])
        @post.update(post_params)
        redirect_to root_path
    end
    
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to root_path, notice: "Delete Completed"
    end
    
    private
    def post_params
        params.require(:post).permit(:titles, :images, :receipes)
    end
    
    def move_to_index
        redirect_to action: :index unless user_signed_in?
    end
    
end
