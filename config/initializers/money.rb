MoneyRails.configure do |config|
  
    # set the default currency
    config.default_currency = :brl
  
    config.amount_column = {
      postfix: '_cents', # column name  postfix
    }
  
    config.no_cents_if_whole = false
  
  end