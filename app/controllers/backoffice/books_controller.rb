class Backoffice::BooksController < BackofficeController
  before_action :set_book, only: [:edit, :update, :destroy]

  # GET /books/new
  def new
    @book = current_user.books.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = current_user.books.new(book_params)

    if @book.save
      render :show, status: :created
    else
      flash[:error] = 'Não foi possível criar o livro! Tente novamente.'
      render :show, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    if @book.update(book_params)
      render :show, status: :ok
    else
      flash[:error] = 'Não foi possível atualizar o livro! Tente novamente.'
      render :show, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    render :destroy
  end

  # PUT /books/1/alternate
  def alternate
    @book = current_user.books.find(params[:book_id])    

    session[:current_book_id] = @book.id
    @current_book = @book

    redirect_back(fallback_location: root_path)
    #render :alternate, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = current_user.books.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:name, :kind, :main_currency, :logo)
    end
end
