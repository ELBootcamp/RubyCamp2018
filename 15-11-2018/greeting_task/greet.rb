class Greet

  def greet(name)
    name ||= "my friend"
    
    if name.is_a? Array 
      if name.length == 2 
        if name.any? {|name| name.include?("\"")}  
          handle_double_quotes(name)
        elsif name.any? {|name| name.include?(",")}
          name = separate_arguments(name)
          last_name = name.last
          name.delete_at(-1) 
          "Hello, #{name.join(", ")}, and #{last_name}."
        else 
          "Hello, #{name.first} and #{name.last}."
        end
      elsif name.any? {|name| name == name.upcase}
        upcase_name = name.detect {|name| name == name.upcase }
        name.delete_at(name.index(upcase_name))
        "Hello, #{name.first} and #{name[-1]}. AND HELLO #{upcase_name}!"
      else  
        last_name = name.last
        name.delete_at(-1)
        "Hello, " + name.join(", ") + ", and " + last_name + "."
      end
    elsif
      name && name == name.upcase
      "HELLO #{name}."
    else name 
      "Hello, #{name}."
   end
  end

  def handle_double_quotes(name)
    name = name.map do |name|
      name.include?("\"") ? name.tr("\"","") : name
    end        
    "Hello, #{name.first} and #{name.last}."
  end

  def separate_arguments(name)
    name = name.map do |name|
      name.include?(",") ? name.split(", ") : name
    end.flatten
  end

end