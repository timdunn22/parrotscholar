module Variableize

  # returns a string of logic statements for a given array using the same logic
  # and methods on every element of the array
    def variableize_logic(pre_method,array,method,logic="&&")
      eval_string = ""
      array.each do |arr|
        if arr != array.last
          eval_string = "#{eval_string}#{pre_method}#{arr}.#{method} #{logic} "
        else
          eval_string = "#{eval_string}#{arr}"
        end
      end
      eval_string
    end
    def similar_attributes(table, columns)
      "accepts_nested_attributes_for #{table},
      :reject_if => lambda { |a|  variableize_logic(a,#{columns},'blank?'))}, :allow_destroy => true"
    end

end
