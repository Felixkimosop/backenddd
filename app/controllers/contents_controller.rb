class ContentsController < ApplicationController
    def index
      contents = Content.all
      render json: contents
    end
  
    def show
      content = Content.find(params[:id])
      render json: content
    end
  
    def create
      content = Content.new(content_params)
      content.user = current_user
  
      if content.save
        render json: content
      else
        render json: { errors: content.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def update
      content = Content.find(params[:id])
  
      if content.update(content_params)
        render json: content
      else
        render json: { errors: content.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      content = Content.find(params[:id])
      content.destroy
    end
  
    private
  
    def content_params
      params.require(:content).permit(:title, :description, :content_type, :url, :thumbnail, :category_id)
    end
  end
  