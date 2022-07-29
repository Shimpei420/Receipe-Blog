class CommentsController < ApplicationController
    
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.new(comment_params)
        @comment.user_id = current_user.id
        @comment.save
        redirect_to root_path
    end
    
    def destroy
        post = Post.find(params[:post_id])
        @comment = Comment.find(params[:id])
        if current_user.id == @comment.user.id
            @comment.destroy
            redirect_to post_path(post.id)
        else
            redirect_to root_path
        end
    end
    
    private
    def comment_params
        params.require(:comment).permit(:comment).merge(user_id: current_user.id, post_id: params[:post_id])
    end
end
