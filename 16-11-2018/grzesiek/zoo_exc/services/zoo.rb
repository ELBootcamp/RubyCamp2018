class Zoo
  
  def inventory
    if @animals.to_s.empty?
      'Oh no! There are no animals in our ZOO!'
    elsif @animals.count == 2 && @animals.first.type.to_s == "Gorilla" && @animals.last.type.to_s == "Gorilla"
       "For now there are only 2 gorillas here! " + @animals.first.type + " " + @animals.first.name.to_s  + " from " + @animals.first.origin + " " +  @animals.first.description.to_s.downcase + " and " + @animals.last.type + " " + @animals.last.name.to_s  + " from " + @animals.last.origin + " " + @animals.last.description.uncapitalize + '. Hope you will enjoy your visit!'
    elsif @animals.count == 2
     "For now there are only 2 animals here! " + @animals.first.type + " " + @animals.first.name.to_s  + " from " + @animals.first.origin + " " +  @animals.first.description.to_s.downcase + " and " + @animals.last.type + " " + @animals.last.name.to_s  +  " " + @animals.last.description.uncapitalize + '. Hope you will enjoy your visit!'
    elsif @animals.count == 4
    "For now there are only 4 animals here! " + @animals.first.type + " " + @animals.first.name.to_s  + " from " + @animals.first.origin + " " +  @animals.first.description.to_s.downcase + ", " +
    + @animals.at(1).type + " " + @animals.at(1).name.to_s  + " from " + @animals.at(1).origin + " " + @animals.at(1).description.uncapitalize + ", " +
    + @animals.at(2).type + " " + @animals.at(2).name.to_s  +  " " + @animals.at(2).description.uncapitalize + ", " +
    + @animals.last.type + " " + @animals.last.name.to_s + " " + @animals.last.description.to_s.downcase + '. Hope you will enjoy your visit!'
     elsif @animals.count == 7
    "There are 7 animals in our ZOO! " + @animals.first.type + " " + @animals.first.name.to_s  + " from " + @animals.first.origin + " " +  @animals.first.description.to_s.downcase + ", " +
    + @animals.at(1).type + " " + @animals.at(1).name.to_s  + " from " + @animals.at(1).origin + " " + @animals.at(1).description.uncapitalize + ", " +
    + @animals.at(2).type + " " + @animals.at(2).name.to_s  +  " " + @animals.at(2).description.uncapitalize + ", " +
    + @animals.at(3).type + " " + @animals.at(3).name.to_s  +  " " + @animals.at(3).description.uncapitalize + ", " +
    + @animals.at(4).type + " " + @animals.at(4).name.to_s  +  " " + @animals.at(4).description.uncapitalize + ", " +
    + @animals.at(5).type + " " + @animals.at(5).name.to_s  +  " " + @animals.at(5).description.uncapitalize + ", " +
    + @animals.at(6).type + " " + @animals.at(6).name.to_s + " " + @animals.at(6).description.to_s.downcase + '. Hope you will enjoy your visit!'
    elsif @animals.count == 10
    "Yayy! We have 10 residents now! " + @animals.first.type + " " + @animals.first.name.to_s  + " from " + @animals.first.origin + " " +  @animals.first.description.to_s.downcase + ", " +
    + @animals.at(1).type + " " + @animals.at(1).name.to_s  + " from " + @animals.at(1).origin + " " + @animals.at(1).description.uncapitalize + ", " +
    + @animals.at(2).type +  " (kind: " + @animals.at(2).kind  + ") "+ @animals.at(2).name.to_s + " - " + @animals.at(2).description.uncapitalize + ", " +
    + @animals.at(3).type + " " + @animals.at(3).name.to_s  +  " " + @animals.at(3).description.uncapitalize + ", " +
    + @animals.at(4).type + " " + @animals.at(4).name.to_s  +  " " + @animals.at(4).description.uncapitalize + ", " +
    + @animals.at(5).type + " (kind: " + @animals.at(5).kind  + ") "  + @animals.at(5).name.to_s + " - "  + @animals.at(5).description.uncapitalize + ", " +
    + @animals.at(6).type + " " + @animals.at(6).name.to_s  +  " " + @animals.at(6).description.uncapitalize + ", " +
    + @animals.at(7).type + " " + @animals.at(7).name.to_s  +  " " + @animals.at(7).description.uncapitalize + ", " +
    + @animals.at(8).type + " " + @animals.at(8).name.to_s  +  " " + @animals.at(8).description.uncapitalize + ", " +
    + @animals.at(9).type + " " + @animals.at(9).name.to_s + " " + @animals.at(9).description.to_s.downcase + '. You need to visit us as soon as possible!'
    else
      temp = @animals.first
      if temp.type.to_s == "Gorilla"
        'There is only one animal in our ZOO! ' + temp.type + " " + temp.name.to_s + " from " + temp.origin + " " + temp.description.to_s.downcase + '. Hope you will enjoy your visit!'
      else
        'There is only one animal in our ZOO! ' + temp.type + " " + temp.name.to_s + " " + temp.description.to_s.downcase + '. Hope you will enjoy your visit!'
      end
    end
  end
  
  def add_animals(animals_passed)
    @animals = []
    animals_passed.each { |animal| @animals << animal }
    @animals.sort_by!{ |m| m.name.downcase }
  end
  
end

class String
  def uncapitalize 
    self[0, 1].downcase + self[1..-1]
  end
end