Dir['./lib/hash/*.rb'].shuffle.each { |f| require f }

describe Hash do
  describe '#symbolize_keys!' do
    it 'symbolizes' do
      hash = {first: 1, 'second' => 2}
      hash.symbolize_keys!
      expect(hash).to eq(first: 1, second: 2)
    end

    it 'raises on non-symbolizable' do
      hash = {'first' => 1, 2 => 2}
      expect { hash.symbolize_keys! }.to raise_error(NoMethodError, /to_sym/)
    end
  end

  describe '#stringify_keys!' do
    it 'stringifies' do
      hash = {first: 1, 'second' => 2}
      hash.stringify_keys!
      expect(hash).to eq('first' => 1, 'second' => 2)
    end
  end

  describe '#except' do
    it 'drops keys' do
      expect({first: 1, second: 2, third: 3}.except(:first, :third))
        .to eq(second: 2)
    end
  end

  describe '#only' do
    it 'preserves keys' do
      expect({first: 1, second: 2, third: 3}.only(:first, :third))
        .to eq(first: 1, third: 3)
    end
  end
end
