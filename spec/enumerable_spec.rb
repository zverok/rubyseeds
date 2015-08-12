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
end
