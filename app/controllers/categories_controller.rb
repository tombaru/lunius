class CategoriesController < ApplicationController
	def index
    @categories = Categories.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @categories = Categories.new
  end

  # GET /products/1/edit
  def edit

    
  end

 #  def create
 #  @cost = Cost.create params[:сost].permit!
 #   redirect_to costs_path
 # end

   def create
    @categories = Categories.new(categories_params)

    if @categories.save
      redirect_to @categories, notice: 'Product was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @categories.update(categories_params)
        format.html { redirect_to @categories, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @categories.destroy
    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categories
      @categories = Categories.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def categories_params
      params[:categories].permit :title
    end
end
