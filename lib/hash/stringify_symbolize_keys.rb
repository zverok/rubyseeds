# ## Hash: stringify and symbolize keys
#
# Just standalone implementation of this frequently-used methods.
#
# Usage:
#
# ```ruby
# {test: 1}.stringify_keys # => {'test' => 1}
# {'test' => 1}.symbolize_keys # => {:test => 1}
# ```
#
# Note: Uses just `to_s`/`to_sym` on keys, so, will raise of key is not
# convertible. Which is most reasonable thing to do anyways.
#
class Hash
  def stringify_keys!
    keys.each do |key|
      self[key.to_s] = delete(key)
    end
    self
  end

  def stringify_keys
    dup.stringify_keys!
  end

  def symbolize_keys!
    keys.each do |key|
      self[key.to_sym] = delete(key)
    end
    self
  end

  def symbolize_keys
    dup.symbolize_keys!
  end
end
