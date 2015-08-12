Dir['./lib/hash/*.rb'].each{|f| require f}

describe Hash do
  describe :symbolize_keys! do
    it 'should symbolize' do
      hash = {first: 1, 'second' => 2}
      hash.symbolize_keys!
      expect(hash).to eq(first: 1, second: 2)
    end

    it 'should raise on non-symbolizable' do
      hash = {'first' => 1, 2 => 2}
      expect{hash.symbolize_keys!}.to raise_error(NoMethodError, /to_sym/)
    end
  end

  describe :stringify_keys! do
    it 'should stringify' do
      hash = {first: 1, 'second' => 2}
      hash.stringify_keys!
      expect(hash).to eq('first' => 1, 'second' => 2)
    end
  end
end
