def solution(a, b)
  if a < 0 && a == -b
    count_of_squares(1, a.abs) * 2
  elsif a < 0 && 0 < b
    count_of_squares(1, a.abs) + count_of_squares(1, b.abs)
  else
    count_of_squares(a.abs, b.abs)
  end
end

def count_of_squares(a, b)
  a, b = [a,b].sort

  a = 1 if a == b || a == 0

  Math.sqrt(b).floor - Math.sqrt(a).ceil + 1
end

require 'minitest/autorun'

describe '#solution' do
  describe 'positive numbers' do
    describe 'more than 1' do
      it { solution(4, 17).must_equal 3 }
    end

    describe 'first is 1' do
      it { solution(1, 4).must_equal 2 }
    end

    describe 'first is 0' do
      it { solution(0, 4).must_equal 2 }
    end

    describe 'equals each other' do
      it { solution(4, 4).must_equal 2 }

      describe 'both 0' do
        it { solution(0, 0).must_equal 0 }
      end

      describe 'both 1' do
        it { solution(1, 1).must_equal 1 }
      end
    end
  end

  describe 'negative numbers' do
    describe 'more than 1' do
      it { solution(-17, -4).must_equal 3 }
    end

    describe 'first is -1' do
      it { solution(-4, -1).must_equal 2 }
    end

    describe 'last is 0' do
      it { solution(-4, 0).must_equal 2 }
    end

    describe 'equals each other' do
      it { solution(-4, -4).must_equal 2 }

      describe 'both -1' do
        it { solution(-1, -1).must_equal 1 }
      end
    end
  end

  describe 'mixed' do
    describe '|a| > |b|' do
      it { solution(-17, 4).must_equal 6 }
    end

    describe '|a| < |b|' do
      it { solution(-4, 17).must_equal 6 }
    end

    describe '|a| == |b|' do
      it { solution(-5, 5).must_equal 4 }
    end
  end
end
