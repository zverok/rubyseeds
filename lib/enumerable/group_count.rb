# ## Enumerable#group_count -- count groups
#
# Performs `#group_by`, and then counts items in each group.
# Unlike `#group_by`, when no block provided, groups elements by their
# values.
#
# Usage:
#
# ```ruby
# ['test', 'me', 'heck'].group_count(&:length) # => {4 => 2, 2 => 1}
#
# [:test, :test, :me, :foo, :foo].group_count
# # => {:test => 2, :me => 1, :foo => 2}
# ```
#
module Enumerable
  def group_count(&block)
    block ||= ->(x) { x }
    group_by(&block).map { |title, group| [title, group.count] }.to_h
  end
end
