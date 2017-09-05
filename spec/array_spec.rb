Dir['./lib/array/*.rb'].shuffle.each { |f| require f }
require 'time'

describe Array do
  describe '#convert' do
    it 'converts!' do
      expect(['test', '1', '2015-03-01'].convert(nil, :to_i, Time.method(:parse)))
        .to eq ['test', 1, Time.local(2015, 3, 1)]
    end

    it 'just leaves extra elements' do
      expect(['test', '1', '2015-03-01'].convert(nil, :to_i))
        .to eq ['test', 1, '2015-03-01']
    end

    it 'ignores extra methods' do
      expect(%w[test 1].convert(nil, :to_i, Time.method(:parse)))
        .to eq ['test', 1]
    end
  end
end
