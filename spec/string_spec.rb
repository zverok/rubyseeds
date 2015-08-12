Dir['./lib/string/*.rb'].shuffle.each{|f| require f}

describe String do
  describe :split2 do
    it 'splits!' do
      expect('foo:1,bar:2,heck:3'.split2(',', ':')).
        to eq [['foo', '1'], ['bar', '2'], ['heck', '3']]
    end
  end
end
