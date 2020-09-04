class ElectricPostsController < ApplicationController
  def index
    @electric_posts = ElectricPost.order(id: :asc)
  end

  def show
    @electric_post = ElectricPost.find(params[:id])
  end

  def new
    @electric_post = ElectricPost.new
  end

  def create
    electric_post = ElectricPost.create!(electric_post_params)
    redirect_to electric_post
  end

  def edit
    @electric_post = ElectricPost.find(params[:id])
  end

  def update
     electric_post = ElectricPost.find(params[:id])
    electric_post.update!(electric_post_params)
    redirect_to electric_post
  end

  def destroy
    electric_post = ElectricPost.find(params[:id])
    electric_post.destroy!
    redirect_to electric_post
  end

  private

  def electric_post_params
    params.require(:electric_post).permit(:title, :content)
  end

end
