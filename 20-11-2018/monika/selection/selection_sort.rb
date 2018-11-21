require 'byebug'

module SelectionSort
  def selection_sort
    dup.selection_sort!
  end
  
  def selection_sort!
    self.each_index do |index| 
      min_array = self[index..-1].each_with_index.min
      self[index], self[min_array[1]+index] = min_array[0], self[index]
    end
    self
  end  
end