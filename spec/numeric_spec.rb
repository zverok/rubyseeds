Dir['./lib/numeric/*.rb'].shuffle.each{|f| require f}

describe Numeric do
  describe 'timespans' do
    it 'should convert!' do
      expect(10.seconds).to eq 10
      expect(10.minutes).to eq 10*60
      expect(10.hours).to eq 10*60*60
      expect(10.days).to eq 10*60*60*24
      expect(10.weeks).to eq 10*60*60*24*7
      expect(10.months).to eq 10*60*60*24*30
      expect(10.years).to eq 10*60*60*24*365
    end
  end
end
