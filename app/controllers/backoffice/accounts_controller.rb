class Backoffice::AccountsController < BackofficeController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = @current_book.accounts
  end

  # GET /accounts/new
  def new
    @account = @current_book.accounts.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = @current_book.accounts.new(account_params)

    if @account.save
      render :show, status: :created
    else
      flash[:error] = 'Não foi possível criar a conta! Tente novamente.'
      render :show, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    if @account.update(account_params)
      render :show, status: :ok
    else
      flash[:error] = 'Não foi possível atualizar a conta! Tente novamente.'
      render :show, status: :unprocessable_entity
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    if @current_book.accounts.count > 1
      @account.destroy
    else
      render :destroy
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = @current_book.accounts.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:name, :description, :kind, :logo, :currency)
    end
end
