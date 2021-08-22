class KittensController < ApplicationController
  before_action :set_kitten, only: %i[ show edit update destroy ]

  def index
    @kittens = Kitten.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :index, status: :ok }
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :show, status: :ok }
    end
  end

  def new
    @kitten = Kitten.new
  end

  def edit
  end

  def create
    @kitten = Kitten.new(kitten_params)
  end

  def update
  end

  def destroy
    @kitten.destroy
  end

  private
    def set_kitten
      @kitten = Kitten.find(params[:id])
    end

    def kitten_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
end
