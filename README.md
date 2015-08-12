# RubySeeds: core_ext done right.

_In the core of apple, there are apple seeds. In your core_ext.rb should
be RubySeeds._

It is not unusual for Ruby developers to have own and favourite set of
ruby core classes extensions (typically lying somewhere in project tree in
`core_ext.rb`), dragged from project to project, growing, becoming cluttered
yet beloved.

Other developers rely on some external thing like ActiveSupport or Ruby
Facets to extend their core classes. And if it is not there, its nowhere.

RubySeeds is different.

## So, what is RubySeeds?

RubySeeds is **not a gem**. On my strong opinion, there is no good in
mixing together everything somebody can need in core classes. The same
way, there's no good to make a small gem of each useful idea.

RubySeeds is just an easily navigable **list of code snippets** with clean
and simple explanations. Those snippets are thought to be just droppable
in your projects `lib/core_ext.rb` (with possible renamings and rewritings).

Snippets selected for RubySeeds posess those common qualities:
* targeting shorter, yet clean code (not "clever" or "magic");
* as small dependencies between snippets as possible;
* as clean method names as possible;
* snippets' code itself should be small and easily verifieble "by eyes"
  (yet tested);
* strong emphasis on "more chainable code", method chaining is cool;
* strong emphasis on data processing with Ruby, so most of RubySeeds do
  shorten some container transformations.

## Usage

There's one huge, yet (supposedly) easily-navigable page with all seeds
described: [RubySeeds.md](https://github.com/zverok/rubyseeds/blob/master/RubySeeds.md).
(In future will be separate page with collapsible code.)

You just browse it, select what you like, expand **Code** section and
copy-paste it into your `core_ext.rb` or wherever you want.

### Refinements: highly recommended approach

Since version 2.0, Ruby has [refinements](http://ruby-doc.org/core-2.1.1/doc/syntax/refinements_rdoc.html)
which allows core (and other) classes to be extended not globally, but in
context of some module.

Before refinements:
```ruby
# in core_ext.rb
class Hash
  def symbolize_keys
    # ...
  end
end

# everywhere in code
require 'core_ext'
# now ANYWHERE Hash#symbolize_keys refers to your implementation... unless
# you require something else, redefining it.
```

With refinements:
```ruby
# in core_ext.rb
module HashSymbolize
  refine Hash do
    def symbolize_keys
      # ...
    end
  end
end

# in some concrete place:
require 'core_ext'
class MyClass
  using HashSymbolize
  # now Hash#symbolize_keys can be used inside your class only
end
```

## On "monkey-patching is bad" rant

Somebody can say that adding functionality to core classess (even through
refinements) is a bad practice.

It may be (or maybe not) true for large
enterprise-y systems with tens of juniors fixing your code here and there
and some contractor just running through it wildly...

Yet for many small-to-medium data-processing tasks you just want to be
comfortable with code, having it clean and looking like chain of data
processing calls. So, you just want
`load(something).do_this.and_that.and_shit` instead of multiple
`My::Deeply::Nested::Namespace.very_concrete_processing_method_name(data)`
calls. And you have it.

Also, take a look at Hal Fultons [post about "monkey patching"](http://rubyhacker.com/blog2/concerning-the-term-monkeypatching.html).

## On possible name confusion

There was [rubyseeds](https://github.com/rubyseeds) organization on github,
something about learning Ruby, I guess?..

Current project have no relation to this group, and, as
[the site](http://rubyseeds.github.io/materials/) seems to be dead, and
I've already thinked out and loved the name when I found the organization,
I allowed myself to keep the name.

## Other nice things to say

If you are like me (= understand, while we sometimes add features to our
beloved language to make code clear and rational), you may like also those
libraries:

* [hashie](https://github.com/intridea/hashie), which is the most popular
  way of treating hashes as a light-weight objects, as well as set of
  really useful Hash extensions;
* [naught](https://github.com/avdi/naught) -- a superior Ruby NullObject
  pattern implementation, with lot of options
* [time_boots](https://github.com/zverok/time_boots) (shameless
  self-promotion) -- the small and clean library dealing with everyday
  `Time` tasks like "next day", "prev day", "todays midnight",
  "list of time periods of arbitrary length" and so on (and NO
  core_ext-ing this time! compatible with everything).

## Contributing

Just usual fork-change-push-make pull request process. Note (if you haven't
already), that RubySeeds is highly opionated set of extensions, so,
there's no guarantee that pull requests with new features will be accepted.

NB: never try to update RubySeeds.md file -- it is built automatically from
code in `lib/**/*.rb`, with `rake build`.
