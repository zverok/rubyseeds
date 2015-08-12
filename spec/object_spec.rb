Dir['./lib/object/*.rb'].shuffle.each{|f| require f}

describe Object do
  describe :decompose do
    it 'decomposes any objects into set of values' do
      expect('Test Me'.decompose(:upcase, :downcase, :length)).
        to eq(['TEST ME', 'test me', 7])
    end

    it 'fails on unknown methods' do
      expect{'Test Me'.decompose(:upscase)}.to raise_error(NoMethodError)
    end
  end
end
