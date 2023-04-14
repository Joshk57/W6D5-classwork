class CatsController < ApplicationController

    def index
        @cats = Cats.all
        render :index
    end

    def show
        @cat = Cats.find(params[:id])
        render json: @cat
    end

    def update
        @cat = Cats.find(params[:id])

        if @cat.update(cat_params)
            redirect_to cat_url(@cat)
        else
            render json: @cat.errors.full_messages, status: 422
        end
    end

    def new
        @cat = Cat.new
        render :new
    end

    def create
        @cat = Cat.new(cat_params)
    
        if @cat.save
          redirect_to cat_url(@cat)
        else
          render json: @cat.errors.full_messages, status: 422
        end
    end

   private
    def cat_params 
        params.require(:cat).permit(:name, :color, :birth_date, :sex, :description)
    end
end