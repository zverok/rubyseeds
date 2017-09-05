Dir['./lib/numeric/*.rb'].shuffle.each { |f| require f }

describe Numeric do
  describe 'timespans' do
    it 'converts' do
      expect(10.seconds).to eq 10
      expect(10.minutes).to eq 10 * 60
      expect(10.hours).to eq 10 * 60 * 60
      expect(10.days).to eq 10 * 60 * 60 * 24
      expect(10.weeks).to eq 10 * 60 * 60 * 24 * 7
      expect(10.months).to eq 10 * 60 * 60 * 24 * 30
      expect(10.years).to eq 10 * 60 * 60 * 24 * 365
    end
  end

  describe '#rescale' do
    it 'rescales' do
      expect(5.rescale(0..10, -100..100)).to eq 0
      expect(0.3.rescale(0..1, 10..20)).to be_within(0.01).of(13)
    end
  end
end
