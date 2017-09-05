# ## Object#hashify(:method1, :method2, ...)
#
# Converts object to hash of selected attributes
#
# Usage:
#
# ```ruby
# # assuming we have some Author model
# Author.first.hashify(:first_name, :last_name)
# # => {first_name: 'John', last_name: 'Lennon'}
# ```
#
class Object
  def hashify(*methods)
    methods.map { |m| [m, public_send(m)] }.to_h
  end
end
