require 'rspec'
require 'tdd.rb'

RSpec.describe Array do

  describe "#my_uniq" do
    it "removes duplicates from array" do
      expect([1,2,3,1,3,3].my_uniq).to eq([1,2,3])
    end
  end

  describe '#two_sum' do
    it 'finds the idx positions w 2 numbers add to 0 sorted' do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0,4], [2,3]])
    end
  end

  describe '#my_transpose' do
    it 'returns an array containing arrays which rep rows' do
      expect([[0,1,2],[3,4,5],[6,7,8]].my_transpose).to eq([[0,3,6],[1,4,7],[2,5,8]])
    end
  end

  describe '#stock_picker' do
    it 'returns the most profitable pair regardless of day' do
      expect([30, 40, 50, 60].stock_picker).to eq([0,3])
    end
    it 'returns the most profitable pair of days to buy stock' do
      expect([100, 40, 50, 30, 80].stock_picker).to eq([3, 4])
    end
  end
end

RSpec.describe TowersOfHanoi do
  subject(:game){TowersOfHanoi.new}
  describe '#initialize' do
    it 'game creates starting towers' do
      expect(game.towers).to eq([[1,2,3], [], []])
    end
  end

  describe '#won?' do
    it 'returns true when first tower becomes last' do
      game.towers = [[],[],[1,2,3]] #remove this without attr_reader
      expect(game).to be_won
    end
  end

  describe '#move' do
    it 'moves the top disk to another tower' do
      expect(game.move(0,2)).to eq([ [2,3], [], [1] ])
      expect(game.move(0,1)).to eq([ [3], [2], [1] ])
    end
    it 'checks that arguments are integers' do
      expect{game.move('0','2')}.to raise_error(ArgumentError)
    end
  end

  describe '#valid_move?' do
    it 'return false if move(from) an empty tower' do
      # game.move(1,2)
      expect(game.valid_move?(1,2)).to be_falsy
    end

    it 'return false if moving a bigger piece to smaller piece' do
      game.move(0,2)
      expect(game.valid_move?(0,2)).to be_falsy
    end

    it 'test if from and to are valid positions' do
      expect(game.valid_move?(1,9)).to be_falsy
    end

    it 'return true if moving to empty tower' do
      expect(game.valid_move?(0,2)).to be_truthy
    end

    it 'return true if moving a smaller piece to bigger piece' do
      game.move(0,2)
      game.move(0,1)
      expect(game.valid_move?(2,1)).to be_truthy
    end
  end
  # describe '#won?' do
  #
  #   expect(game).to be_won
  #
  # end

end
