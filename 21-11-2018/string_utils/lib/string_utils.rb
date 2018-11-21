module StringUtils
  module_function

  # Adds `!` character at the end of the string.
  #
  # E.g.
  #
  #   bangify('what?') # => 'what?!'
  def bangify(text); 
    text.is_a?(String) || raise(ArgumentError)
    text + "!"
  end

  # By default, +camelize+ converts strings to UpperCamelCase. If the argument
  # to +camelize+ is set to <tt>:lower</tt> then +camelize+ produces
  # lowerCamelCase.
  #
  # E.g.:
  #
  #   camelize('active_model')         # => "ActiveModel"
  #   camelize('active_model', :lower) # => "activeModel"
  def camelize(term, uppercase_first_letter = true); end

  # Makes an underscored, lowercase form from the expression in the string.
  #
  # E.g.:
  #
  #   underscore('ActiveModel') # => "active_model"
  def underscore(camel_cased_word); end

  # Tweaks an attribute name for display to end users.
  #
  # Specifically, +humanize+ performs these transformations:
  #
  #   * Deletes leading underscores, if any.
  #   * Removes a "_id" suffix if present.
  #   * Replaces underscores with spaces, if any.
  #   * Downcases all words.
  #   * Capitalizes the first word.
  #
  # The capitalization of the first word can be turned off by setting the
  # +:capitalize+ option to false (default is true).
  #
  # E.g.:
  #
  #   humanize('employee_salary')              # => "Employee salary"
  #   humanize('author_id')                    # => "Author"
  #   humanize('author_id', capitalize: false) # => "author"
  #   humanize('_id')                          # => "Id"
  def humanize(word, options = { capitalize: true }); end

  # Capitalizes all the words and replaces some characters (dashes and underscores)
  # in the string to create a nicer looking title.
  #
  # E.g.:
  #
  #   titleize('man from the boondocks')   # => "Man From The Boondocks"
  #   titleize('x-men: the last stand')    # => "X Men: The Last Stand"
  #   titleize('TheManWithoutAPast')       # => "The Man Without A Past"
  #   titleize('raiders_of_the_lost_ark')  # => "Raiders Of The Lost Ark"
  def titleize(word); end

  # Turns a number into an ordinal string used to denote the position in an
  # ordered sequence such as 1st, 2nd, 3rd, 4th.
  #
  # E.g.:
  #
  #   ordinalize(1)     # => "1st"
  #   ordinalize(2)     # => "2nd"
  #   ordinalize(1002)  # => "1002nd"
  #   ordinalize(1003)  # => "1003rd"
  #   ordinalize(-11)   # => "-11th"
  #   ordinalize(-1021) # => "-1021st"
  def ordinalize(numeric); end

  # Fixes several punctuation problems.
  #
  #   * Collapses multiple spaces and commas into one occurrence.
  #   * Fixes spacing around commas.
  #   * Removes trailing and leading commas.
  #
  # E.g.:
  #
  #   normalize_punctuation(',,,  ')     # => ", "
  #   normalize_punctuation('a  ,  b')   # => "a, b"
  #   normalize_punctuation(' , a,,b ,') # => "a, b"
  def normalize_punctuation(text); end

  # Truncates the string to given length and adds an omission at the end.
  #
  # E.g.:
  #
  #   truncate('Once upon a time in a world far far away') # => "Once upon a time in a world..."
  def truncate(text); end

  # Wraps the text into lines no longer than line_width width.
  #
  # E.g.:
  #
  #   text_wrap('Once upon a time, in a kingdom called Far Far Away, a king fell ill, and finding a successor to the throne turned out to be more trouble than anyone could have imagined')
  #   # => "Once upon a time, in a kingdom\n called Far Far Away, a king f\nell ill, and finding a success\nor to the throne turned out to\n be more trouble than anyone c\nould have imagined"
  def text_wrap(text, line_width = 5); end

  # Checks whether given text is blank, i.e. contains only whitespace (spaces, tabs, enters etc.).
  #
  # E.g.:
  #
  #   blank?(' a ')        # => false
  #   blank?('')           # => true
  #   blank?("   \t  \n ") # => true
  def blank?(text); end

  # Returns the string, first removing all whitespace on both ends of
  # the string, and then changing remaining consecutive whitespace
  # groups into one space each.
  #
  # Note that it handles both ASCII and Unicode whitespace.
  #
  # E.g.:
  #
  #   squish(%{ Multi-line
  #      string })                          # => "Multi-line string"
  #   squish(" foo   bar    \n   \t   boo") # => "foo bar boo"
  def squish(text); end

  # Replaces underscores with dashes in the string.
  #
  #   dasherize('puni_puni') # => "puni-puni"
  def dasherize(string); end

  # Returns a new string with all occurrences of the patterns removed.
  #
  #   str = 'foo bar test'
  #   remove(str, ' test')        # => 'foo bar'
  #   remove(str, ' test', /bar/) # => 'foo '
  #   str                         # => 'foo bar test'
  def remove(*patterns); end
end
