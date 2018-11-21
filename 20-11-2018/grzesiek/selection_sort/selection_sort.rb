require 'byebug'

module SelectionSort
  
  def selection_sort
    dup.selection_sort!
  end

  def selection_sort!
    sorted_array = []
    self.size.times do |n|
      sorted_array << self.delete_at(self.index(self.min))
    end
    sorted_array.each_index do |index|
      self[index] = sorted_array[index]
    end
    self
  end

end