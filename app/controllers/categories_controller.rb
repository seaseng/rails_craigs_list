class CategoriesController < ApplicationController

  # categories       GET    /categories(.:format)           categories#index
  #                  POST   /categories(.:format)           categories#create
  #     new_category GET    /categories/new(.:format)       categories#new
  #    edit_category GET    /categories/:id/edit(.:format)  categories#edit
  #         category GET    /categories/:id(.:format)       categories#show
  #                  PUT    /categories/:id(.:format)       categories#update
  #                  DELETE /categories/:id(.:format)       categories#destroy

  # before_action :set_category

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end


  def create

    @category = Category.new(params[:category])
    if @category.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit

  end



  def update
    @category = Category.find(params[:id])
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'category was successfully updated.' }
        # format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        # format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /zombies/1
  # DELETE /zombies/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url }
      # format.json { head :no_content }
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end
  

end
