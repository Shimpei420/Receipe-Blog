class PostsController < ApplicationController
    before_action :move_to_index, except: :index
    
    
    def index
        @posts = Post.includes(:user).order(created_at: :desc)
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
        @comment = Comment.new
        @comments = @post.comments.order(created_at: :desc)
    end
    
    def edit
        @post = Post.find(params[:id])
        unless @post.user == current_user
            redirect_to root_path
        end
    end
    
    def update
        @post = Post.find(params[:id])
        if @post.user == current_user
            @post.update(post_params)
            redirect_to root_path
        else
            redirect_to root_path
        end
    end
    
    def destroy
        @post = Post.find(params[:id])
        if @post.user == current_user
            @post.destroy
            redirect_to root_path, notice: "Delete Completed"
        else
            redirect_to root_path
        end
    end
    
    private
    def post_params
        params.require(:post).permit(:titles, :images, :receipes).merge(user_id: current_user.id)
    end
    
    def move_to_index
        redirect_to action: :index unless user_signed_in?
    end
    
end
