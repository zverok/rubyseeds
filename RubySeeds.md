# RubySeeds

* [Array#convert(*conversions) -- per item array processing](#arrayconvertconversions----per-item-array-processing)
* [Enumerable#fraction -- fraction of items in a whole](#enumerablefraction----fraction-of-items-in-a-whole)
* [Enumerable#group_count -- count groups](#enumerablegroup_count----count-groups)
* [Hash#compact](#hashcompact)
* [Hash#except(*keys)](#hashexceptkeys)
* [Hash#only(*keys)](#hashonlykeys)
* [Hash: stringify and symbolize keys](#hash-stringify-and-symbolize-keys)
* [Numeric: rescale to another range (normalize)](#numeric-rescale-to-another-range-normalize)
* [Numeric: treat as time spans (minutes, hours and so on).](#numeric-treat-as-time-spans-minutes-hours-and-so-on)
* [Object#decompose(:method1, :method2, ...)](#objectdecomposemethod1-method2-)
* [String#split2(*patterns)](#stringsplit2patterns)
* [String#surround(before, after)](#stringsurroundbefore-after)

## Array#convert(*conversions) -- per item array processing

Processes each item of array with method provided.

**Usage:**
```ruby
# Code without convert:
arr = 'test;10;84.0;2015-08-01'.split(';')
return [arr[0], arr[1].to_i, arr[2].to_f, Time.parse(arr[3])]

# Code with convert:
return 'test;10;84.0;2015-08-01'.split(';').
  convert(:to_s, :to_i, :to_f, Time.method(:parse))
```
Conversions can be:
* symbol (sent to array item);
* proc or method (called with array item as an argument)
* nil (no conversion).

**Note**: if you'll use this method heavy, you may think of more
complicated implementation, with default values, errors processing and
stuff. But its out of scope of RubySeeds.

**Code**
```ruby
class Array
  def convert(*conversions)
    zip(conversions).map do |val, conv|
      case conv
      when Symbol       then val.send(conv)
      when Proc, Method then conv.call(val)
      when nil          then val
      else
        fail ArgumentError,
             "Can't append conversion of #{conv.class} to #{val.class}"
      end
    end
  end
end
```
## Enumerable#fraction -- fraction of items in a whole

Counts the part of collection which returns `true` for a block,
relative to entire collection size.

**Usage:**

```ruby
['test', 'me', 'heck'].fraction { |s| s.include?('t') } # => 1/3
```


**Code**
```ruby
module Enumerable
  def fraction(&block)
    whole, frac = inject([0, 0]) { |(w, f), i| [w + 1, f + (block.call(i) ? 1 : 0)] }
    whole.zero? ? Rational(1) : Rational(frac, whole)
  end
end
```
## Enumerable#group_count -- count groups

Counts items with same value returned by block.
Unlike `#group_by`, when no block provided, counts elements by their
values.

**Usage:**

```ruby
['test', 'me', 'heck'].group_count(&:length) # => {4 => 2, 2 => 1}

[:test, :test, :me, :foo, :foo].group_count
# => {:test => 2, :me => 1, :foo => 2}
```


**Code**
```ruby
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
```
## Hash#compact

Drop the nil values from hash (just like `Array#compact` do for arrays).

**Usage:**
```ruby
{a: 1, b: nil, c: 3, d: nil}.compact # => {a: 1, c: 3}
```

**Code**
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

**Usage:**
```ruby
{a: 1, b: 2, c: 3, d: 4}.except(:a, :c) # => {b: 2, d: 4}
```

**Code**
```ruby
class Hash
  def except(*keys)
    reject { |k, _v| keys.include?(k) }
  end
end
```
## Hash#only(*keys)

Returns the hash, where ONLY the specified keys left.

**Usage:**
```ruby
{a: 1, b: 2, c: 3, d: 4}.only(:a, :c) # => {a: 1, c: 3}
```

**Code**
```ruby
class Hash
  def only(*keys)
    select { |k, _v| keys.include?(k) }
  end
end
```
## Hash: stringify and symbolize keys

Just standalone implementation of this frequently-used methods.

**Usage:**

```ruby
{test: 1}.stringify_keys # => {'test' => 1}
{'test' => 1}.symbolize_keys # => {:test => 1}
```

Note: Uses just `to_s`/`to_sym` on keys, so, will raise of key is not
convertible. Which is most reasonable thing to do anyways.


**Code**
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
## Numeric: rescale to another range (normalize)

Rescales number from one known range to another.
Useful for data normalization.

**Note**: Depending on usage, you could consider types handling (int/float)
too naive.

**Usage:**

```ruby
array = [1, -5, 84, -3.5, 12]

array.map{|n| n.rescale(array.min..array.max, 0..100)}
# => [6, 0, 100, 1.68, 19]

```

**Code**
```ruby
class Numeric
  def rescale(from, to)
    from_size = from.end - from.begin
    to_size = to.end - to.begin

    (self - from.begin) * to_size / from_size + to.begin
  end
end
```
## Numeric: treat as time spans (minutes, hours and so on).

Really dead simple implementation. Yet it can be useful for small scripts
and prototypes and .irbrc, so I'm having it in my baggage.

**Note**: implementation is really simple, like `month` is 30 days, `year`
is 365 days, no timezones or stuff.

**Usage:**

```ruby
10.minutes # 10*60
# seconds, hours, days, weeks, months, years also work
# as well as singular forms like:
1.hour # => 60*60
```


**Code**
```ruby
class Numeric
  def seconds
    self
  end

  def minutes
    self * 60
  end

  def hours
    self * 60.minutes
  end

  def days
    self * 24.hours
  end

  def weeks
    self * 7.days
  end

  def months
    self * 30.days
  end

  def years
    self * 365.days
  end

  alias_method :second, :seconds
  alias_method :minute, :minutes
  alias_method :hour, :hours
  alias_method :day, :days
  alias_method :week, :weeks
  alias_method :month, :months
  alias_method :year, :years
end
```
## Object#decompose(:method1, :method2, ...)

"Decomposes" some object into array of values, received by calling its
getters.

**Usage:**
```ruby
# assuming we have some Author model
Author.first.decompose(:first_name, :last_name).join(' ')
```


**Code**
```ruby
class Object
  def decompose(*methods)
    methods.map { |m| send(m) }
  end
end
```
## String#split2(*patterns)

Recursively split string by multiple patterns.

**Usage:**
```ruby
# Without split2
'word:10,other:20,stats:50'.split(',').map{|wc| wc.split(':')}
# => [['word', '10'], ['other', '20'], ['stats', '50']]
File.read('data.tsv').split("\n").map{|ln| ln.split("\t")}
# => array of arrays

# With split2
'word:10,other:20,stats:50'.split2(',', ':')
# => [['word', '10'], ['other', '20'], ['stats', '50']]
File.read('data.tsv').split2("\n", "\t")
# => array of arrays
```

Note: there can be any number of patterns, not only two.

**Code**
```ruby
class String
  def split2(*patterns)
    if patterns.count > 1
      split(patterns.first).map { |item| item.split2(*patterns[1..-1]) }
    else
      split(patterns.first)
    end
  end
end
```
## String#surround(before, after)

Surrounds string with before/after strings.

**Usage:**
```ruby
'test'.surround('(', ')') # => '(test)'
'test'.surround('|') # => '|test|'
```

Note: for symmetry, some could ask for `#append` and `#prepend`... but
I've never felt a need for this.

**Code**
```ruby
class String
  def surround(before, after = before)
    "#{before}#{self}#{after}"
  end
end
```
