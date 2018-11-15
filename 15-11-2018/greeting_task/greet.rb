class Greet
  def greet(name)
    if name.is_a? Array 
      if name.any? {|name| name.include?("\"")}  
          name = name.map do |name|
            name.include?("\"") ? name.tr("\"","") : name
          end        
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
        last_name = name.last
        name.delete_at(name.length-1)
        names= name.join(", ")
        puts names
        "Hello, "+names+"#{name.length > 1? ",": ""} and " + last_name + "."  
      end
    else 
      "#{name == name.to_s.upcase ? "HELLO ": "Hello, "}" + "#{name.nil? ? "my friend." : name +"."}"
   end
  end
end

