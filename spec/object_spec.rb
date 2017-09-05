Dir['./lib/object/*.rb'].shuffle.each { |f| require f }

describe Object do
  describe '#decompose' do
    it 'decomposes any objects into set of values' do
      expect('Test Me'.decompose(:upcase, :downcase, :length))
        .to eq(['TEST ME', 'test me', 7])
    end

    it 'fails on unknown methods' do
      expect { 'Test Me'.decompose(:upscase) }.to raise_error(NoMethodError)
    end

    it 'fails on private methods' do
      expect { 'Test Me'.decompose(:puts) }.to raise_error(NoMethodError)
    end
  end

  describe '#hashify' do
    it 'decomposes any objects into hash of values' do
      expect('Test Me'.hashify(:upcase, :downcase, :length))
        .to eq(upcase: 'TEST ME', downcase: 'test me', length: 7)
    end

    it 'fails on unknown methods' do
      expect { 'Test Me'.hashify(:upscase) }.to raise_error(NoMethodError)
    end

    it 'fails on private methods' do
      expect { 'Test Me'.hashify(:puts) }.to raise_error(NoMethodError)
    end
  end
end
