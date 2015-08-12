# ## String#split2(*patterns)
#
# Recursively split string by multiple patterns.
#
# Usage:
# ```ruby
# # Without split2
# 'word:10,other:20,stats:50'.split(',').map{|wc| wc.split(':')}
# # => [['word', '10'], ['other', '20'], ['stats', '50']]
# File.read('data.tsv').split("\n").map{|ln| ln.split("\t")}
# # => array of arrays
#
# # With split2
# 'word:10,other:20,stats:50'.split2(',', ':')
# # => [['word', '10'], ['other', '20'], ['stats', '50']]
# File.read('data.tsv').split2("\n", "\t")
# # => array of arrays
# ```
#
# Note: there can be any number of patterns, not only two.
class String
  def split2(*patterns)
    if patterns.count > 1
      split(patterns.first).map { |item| item.split2(*patterns[1..-1]) }
    else
      split(patterns.first)
    end
  end
end
