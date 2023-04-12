class CommentsController < ApplicationController
    def index
      comments = Comment.all
      render json: comments
    end
  
    def show
      comment = Comment.find(params[:id])
      render json: comment
    end
  
    def create
      comment = Comment.new(comment_params)
      comment.user = current_user
  
      if comment.save
        render json: comment
      else
        render json: { errors: comment.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def update
      comment = Comment.find(params[:id])
  
      if comment.update(comment_params)
        render json: comment
      else
        render json: { errors: comment.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      comment = Comment.find(params[:id])
      comment.destroy
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:content_id, :comment, :parent_id)
    end
  end
  