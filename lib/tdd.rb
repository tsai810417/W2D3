class Array
  def my_uniq
    ans = []
    self.each do | el |
      ans << el unless ans.include?(el)
    end

    ans
  end

  def two_sum
    result = []
    (0...self.length).each do |i|
      (i+1...self.length).each do |j|
        result << [i, j] if self[i] + self[j] == 0
      end
    end

    result
  end

  def my_transpose
    ans = []
    i = 0
    until i == self.length
      temp = []
      self.each do | row |
        temp << row[i]
      end
      ans << temp
      i += 1
    end

    ans
  end

  def stock_picker

    max_profit = [0,0]
    (0...self.length).each do |day1|
      (day1+1...self.length).each do |day2|
        if self[day2] - self[day1] > self[max_profit[-1]] - self[max_profit[0]]
          max_profit = [day1, day2]
        end
      end
    end
    max_profit

  end

end

class TowersOfHanoi
  attr_accessor :towers
  def initialize
    @towers = [[1,2,3], [], []]
  end

  def auto_win
    @towers = [[],[],[1,2,3]]
  end

  def move(from, to)
    raise ArgumentError unless from.is_a?(Integer) || to.is_a?(Integer)
    towers[to].unshift(towers[from].shift)
    towers
  end

  def valid_move?(from, to)
    return false if [from,to].any?{ |el| el < 0 || el > 2 }
    return false if towers[from].empty?
    return true if towers[to].empty?
    return false if towers[to][0] < towers[from][0]

    true
  end

  def won?
    towers == [[],[],[1,2,3]]
  end

  def get_move
    from, to = prompt

    unless valid_move?(from, to)
      puts "invalid position, try again..."
      get_move
    end

    [from, to]
  end

  def prompt
    puts "Move from what tower(0-2)?"
    from = gets.chomp.to_i
    puts "Move to what tower(0-2)?"
    to = gets.chomp.to_i
    [from, to]
  end
  # def move(from, to)

  def play
    until won?
      p towers
      from, to = get_move
      move(from, to)
      system("clear")
    end

    puts "You made the tower"
  end
end
