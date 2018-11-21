module SelectionSort
  def selection_sort
    dup.selection_sort!
  end

  def selection_sort!
    not_self_arr = self.dup
    self.each.with_index do |_, i|
      min = not_self_arr.min
      not_self_arr.delete(min)
      self[i] = min
    end
    self
    # self.replace(self.min(self.size))
  end
end