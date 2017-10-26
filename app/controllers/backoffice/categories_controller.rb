class Backoffice::CategoriesController < BackofficeController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @categories = @current_book.categories.top_level.page(params[:page])
  end

  # GET /categories/new
  def new
    @category = @current_book.categories.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = @current_book.categories.new(category_params)

    @categories = @current_book.categories.top_level.page(params[:page])
    
    if @category.save
      render :index, status: :created
    else
      flash[:error] = 'Não foi possível criar a categoria! Tente novamente.'
      render :show, status: :unprocessable_entity
    end

  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    @categories = @current_book.categories.top_level.page(params[:page])
    
    if @category.update(category_params)
      render :index, status: :ok
    else
      flash[:error] = 'Não foi possível atualizar a categoria! Tente novamente.'
      render :show, status: :unprocessable_entity
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    #TODO: Fazer algoritmo para 
    #      transferir categorias de uma 
    #      categoria a ser excluida para outra
    @category.destroy
    render :destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = @current_book.categories.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :color, :kind, :parent_id)
    end
end
