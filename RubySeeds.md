# RubySeeds

* Hash#compact
* Hash#except(*keys)
* Hash#only(*keys)
* Hash: stringify and symbolize keys

## Hash#compact

Drop the nil values from hash (just like `Array#compact` do for arrays).

Usage:
```ruby
{a: 1, b: nil, c: 3, d: nil}.compact # => {a: 1, c: 3}
```

### Code
```ruby
class Hash
  def compact!
    reject! { |_k, v| v.nil? }
    self
  end

  def compact
    dup.compact!
  end
end
```
## Hash#except(*keys)

Returns the hash without keys specified.

Usage:
```ruby
{a: 1, b: 2, c: 3, d: 4}.except(:a, :c) # => {b: 2, d: 4}
```

### Code
```ruby
class Hash
  def except(*keys)
    reject { |k, _v| keys.include?(k) }
  end
end
```
## Hash#only(*keys)

Returns the hash, where ONLY the specified keys left.

Usage:
```ruby
{a: 1, b: 2, c: 3, d: 4}.only(:a, :c) # => {a: 1, c: 3}
```

### Code
```ruby
class Hash
  def only(*keys)
    select { |k, _v| keys.include?(k) }
  end
end
```
## Hash: stringify and symbolize keys

Just standalone implementation of this frequently-used methods.

Usage:

```ruby
{test: 1}.stringify_keys # => {'test' => 1}
{'test' => 1}.symbolize_keys # => {:test => 1}
```

Note: Uses just `to_s`/`to_sym` on keys, so, will raise of key is not
convertible. Which is most reasonable thing to do anyways.


### Code
```ruby
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
```
