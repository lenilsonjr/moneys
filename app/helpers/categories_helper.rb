module CategoriesHelper

  def select_kind
    output = []
    Category.available_kinds.each do |kind|
      output << [kind.first, kind.last, {"class" => "kind_#{kind.last}"}]
    end
    output
  end

  def select_parent
    output = []
    Category.parents_available.each do |parent|
      output << [parent.name, parent.id, {"class" => "hidden kind_#{parent.kind}"}]
    end
    output
  end


end
