class Greet
  def greet(name)
    name ||= "my friend"
    
    if name.is_a?(Array) 
      if name.any? {|name| name.include?("\"")}  
        name = name.map do |name|
          name.include?("\"") ? name.tr("\"","") : name
        end        
        "Hello, #{name.first} and #{name.last}."
      elsif name.any? {|name| name == name.upcase}
        upcase_name = name.detect {|name| name == name.upcase }
        name.delete_at(name.index(upcase_name))
        "Hello, #{name.first} and #{name.last}. AND HELLO #{upcase_name}!"
      elsif name.length == 2 && name.none? {|name| name.include?(",")}
        "Hello, #{name.first} and #{name.last}."
      else 
        if name.any? {|name| name.include?(",")}
          name = name.map do |name|
            name.include?(",") ? name.split(", ") : name
          end.flatten
        end
        last_name = name.pop
        "Hello, #{name.join(", ")}, and #{last_name}."
      end
    else
      name == name.upcase ? "HELLO #{name}." : "Hello, #{name}."
    end
  end
end