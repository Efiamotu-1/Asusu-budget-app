class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @categories = Category.all.order(created_at: :desc)
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])

    respond_to do |format|
      format.html { render :edit, locals: { post: @category } }
    end
  end

  def create
    @category = Category.new(category_params)
    @category.author_id = current_user.id
    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path, notice: 'Category was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    @category = Category.find(params[:id])
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to categories_path, notice: 'Category was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully deleted.' }
    end
  end

  private

  def category_params
    params.require(:category).permit(:icon, :name)
  end
end
