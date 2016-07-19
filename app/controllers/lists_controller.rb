class ListsController < ApplicationController
  def index
    render template: 'lists/index.html.erb', locals: {
      lists: List.all
    }
  end

  def show
    render locals: {
      list: List.find(params[:id])
    }
  end

  def new
    render locals: {
      list: List.new,
    }
  end

  def create
    list = List.new(list_params)
    if list.save
      redirect_to list_path(list)
    else
      render :new
    end
  end

  def edit
    render locals: {
      list: List.find(params[:id])
    }
  end

  def update
    list = List.find(params[:id])
    if list.update(list_params)
      redirect_to list
    else
      render :edit
    end
  end

  def destroy
    if List.exists?(params[:id])

      List.destroy(params[:id])
      flash[:notice] = "List and tasks destroyed."
      redirect_to "/lists"
    else
      flash[:alert] = "List was not deleted due to an error."
    end
  end


  private
  def list_params
    params.require(:list).permit(:name)
  end
end
