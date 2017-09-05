Dir['./lib/string/*.rb'].shuffle.each { |f| require f }

describe String do
  describe '#split2' do
    it 'splits!' do
      expect('foo:1,bar:2,heck:3'.split2(',', ':'))
        .to eq [%w[foo 1], %w[bar 2], %w[heck 3]]
    end
  end

  describe '#surround' do
    it 'surrounds?' do
      expect('test'.surround('(', ')')).to eq '(test)'
      expect('test'.surround('|')).to eq '|test|'
    end
  end
end
