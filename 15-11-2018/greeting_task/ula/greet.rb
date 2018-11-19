class Greet
  def greet(name)
    name ||= 'my friend'

    name.is_a?(Array) ? handle_array_input(name) : handle_regular_input(name)
  end

  private

  def handle_array_input(name)
    if name.any?(&:with_quote?)
      sanitized_names = remove_quotes(name)
      "Hello, #{sanitized_names.first} and #{sanitized_names.last}."
    elsif name.any?(&:upcase?)
      upcase_name = name.detect(&:upcase?)
      name.delete_at(name.index(upcase_name))
      "Hello, #{name.first} and #{name.last}. AND HELLO #{upcase_name}!"
    elsif name.length == 2 && name.none?(&:with_comma?)
      "Hello, #{name.first} and #{name.last}."
    else
      name.any?(&:with_comma?) && (name = split_by_comma(name))

      last_name = name.pop
      "Hello, #{name.join(', ')}, and #{last_name}."
    end
  end

  def handle_regular_input(name)
    name.upcase? ? "HELLO #{name}." : "Hello, #{name}."
  end

  def remove_quotes(input)
    input.map { |item| item.with_quote? ? item.tr('"', '') : item }
  end

  def split_by_comma(input)
    input.map { |item| item.with_comma? && item.split(', ') || item }.flatten
  end
end

class String
  def upcase?
    self == upcase
  end

  def with_quote?
    include?('"')
  end

  def with_comma?
    include?(',')
  end
end
