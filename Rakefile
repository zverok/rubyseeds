desc 'Build entire documented file'
task :build do
  output = ''
  toc = []
  
  Dir['lib/**/*.rb'].sort.each do |f|
    text = File.read(f).split("\n")
    docs = text.take_while{|ln| ln =~ /^\#/}.
      map{|ln| ln.sub(/^#\s?/, '').sub(/^\s*Usage:*/, '**Usage:**')}
      
    code = text.drop_while{|ln| ln =~ /^\#/}

    docs.first =~ /^\#\# / or
      fail("#{f}: each file's first line should be markdown header of second level (start with '##')")

    toc << docs.first.sub(/^\#\#\s+/, '')

    output << [
      *docs,
      '',
      '**Code**',
      '```ruby',
      *code,
      '```',
      ''
    ].join("\n")

  end


  File.open('RubySeeds.md', 'w'){|out|
    out.puts '# RubySeeds'
    out.puts
    toc.each do |h|
      link = h.downcase.gsub(/[^-a-z0-9 _]/, '').gsub(' ', '-')
      out.puts "* [#{h}](##{link})"
    end
    out.puts
    out.write output
  }
end
