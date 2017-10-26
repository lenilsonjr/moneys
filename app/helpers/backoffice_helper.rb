module BackofficeHelper

  def bank_icons
    Dir.entries(Rails.root.join('public', 'assets', 'accounts')).select {|f| !File.directory? f}.sort_by!{ |m| m }
  end

end
