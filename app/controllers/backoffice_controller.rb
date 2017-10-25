class BackofficeController < ApplicationController

  layout 'backoffice'
  before_action :authenticate_user!
  before_action :set_book

  private
    def set_book
      if current_user && (session[:current_book_id].nil? || !session[:current_book_id].integer?)
        @current_book = current_user.books.first
      elsif current_user && session[:current_book_id].present?

        if current_user.books.where(id: session[:current_book_id]).count > 0
          @current_book = current_user.books.find(session[:current_book_id])          
        else
          @current_book = current_user.books.first          
        end

      else
        @current_book = nil
      end
    end

end
