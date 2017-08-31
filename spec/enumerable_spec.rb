Dir['./lib/enumerable/*.rb'].shuffle.each{|f| require f}

describe Enumerable do
  describe :group_count do
    it 'counts with block' do
      expect([1,1,2,2,2,3,4,4,4,5].group_count(&:odd?)).
        to eq(false => 6, true => 4)
    end

    it 'counts without block' do
      expect([1,1,2,2,2,3,4,4,4,5].group_count).
        to eq(1 => 2, 2 => 3, 3 => 1,  4 => 3, 5 => 1)
    end
  end

  describe :fraction do
    it 'counts non-empty fraction' do
      expect((1..30).fraction(&:odd?)).to eq Rational(1, 2)
      expect((1..30).fraction { |i| i.to_s.include?('3') }).to eq Rational(2, 15)
      expect((1..30).fraction { |i| !i.zero? }).to eq 1
    end

    it 'counts empty fraction' do
      expect((1..30).fraction(&:nil?)).to eq 0
    end

    it 'works with empty array' do
      expect([].fraction(&:nil?)).to eq 1
    end
  end
end
