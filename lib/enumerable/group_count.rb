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
    Hash.new{ 0 }.tap{|res|
      each do |val|
        res[block.call(val)] += 1
      end
    }
  end
end
