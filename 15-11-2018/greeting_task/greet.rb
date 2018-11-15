class Greet
  def greet(name = "my friend")
    if name.is_a? Array 
      #if name.length == 2 
      if name.any? {|name| name.include?("\"")}  
          name = name.map do |name|
            name.include?("\"") ? name.tr("\"","") : name
          end        
          #"Hello, #{name.first} and #{name.last}."
          last_name = name.last
          name.delete_at(name.length-1) 
          "Hello, #{name.join(", ")} and #{last_name}."
      elsif name.any? {|name| name.include?(",")}
          name = name.map do |name|
            name.include?(",") ? name.split(", ") : name
          end.flatten
          last_name = name.last
          name.delete_at(name.length-1) 
          "Hello, #{name.join(", ")}, and #{last_name}."      
      elsif name.any? {|name| name == name.upcase}
        upcase_name = name.detect {|name| name == name.upcase }
        name.delete_at(name.index(upcase_name))
        "Hello, #{name.first} and #{name[-1]}. AND HELLO #{upcase_name}!"
      else  
      #elsif 
        #"Hello, #{name.first} and #{name.last}."
        last_name = name.last
        name.delete_at(name.length-1)
        names= name.join(", ")
        puts names
        "Hello, "+names+"#{name.length > 1? ",": ""} and " + last_name + "."  
        #if name.length == 1
         # "Hello, " + names + " and " + last_name + "."         
        #else
         # "Hello, " + names + ", and " + last_name + "."
        #end
      end
    elsif
      name && name == name.upcase
      "HELLO #{name}."
    elsif name 
      "Hello, Bob."
    else
      "Hello, my friend."
   end
  end
end