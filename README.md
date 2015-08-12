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
described: http://zverok.github.io/rubyseeds/

You just browse it, select what you like, expand **Code** section and
copy-paste it into your `core_ext.rb` or wherever you want.

### Refinements: highly recommended approach

Since version 2.0, Ruby has [refinements](http://ruby-doc.org/core-2.1.1/doc/syntax/refinements_rdoc.html)
which allows 

## On "monkey-patching is bad" rant

## On possible name confusion

There was [rubyseeds](https://github.com/rubyseeds) organization on github,
something about learning Ruby, I guess?..

Current project have no relation to this group, and, as
[the site](http://rubyseeds.github.io/materials/) seems to be dead, and I've already
thinked out and loved the name when I found the organization, I allowed myself to keep it.

## Other nice things to say

Approaches:

naught
hashie
time_boots

## Contributing

Just usual fork-change-push-make pull request process. Note (if you haven't
already), that RubySeeds is highly opionated set of extensions, so,
there's no guarantee that pull requests with new features will be accepted.
