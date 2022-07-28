class CommentsController < ApplicationController
    
    def create
        post = Post.find(params[:id])
        comment = currrent_user.comments.new(comment_params)
        comment.save
        redirect_to root_path
    end
    
    def destroy
        Coment.find(params[:id]).destroy
        redirect_to root_path
    end
    
    private
    def comment_params
        params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
    end
end
