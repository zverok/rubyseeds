# ## Object#decompose(:method1, :method2, ...)
#
# "Decomposes" some object into array of values, received by calling its
# getters.
#
# Usage:
# ```ruby
# # assuming we have some Author model
# Author.first.decompose(:first_name, :last_name).join(' ')
# ```
#
class Object
  def decompose(*methods)
    methods.map { |m| send(m) }
  end
end
