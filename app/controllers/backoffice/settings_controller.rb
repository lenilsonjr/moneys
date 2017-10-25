class Backoffice::SettingsController < BackofficeController
  def index
    @books = current_user.books
  end
end
