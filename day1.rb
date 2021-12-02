class IncreaseCounter
  def initialize(data)
    @data = []
    File.open(data).each do |line|
      @data << line.chomp.to_i
    end
  end

  def increases
    increases = 0
    @data.each_with_index do |item, index|
      next if index < 1
      if item > @data[index-1]
        increases +=1
      end
    end
    increases
  end

  def window_increases
    last_sum = nil
    increases = 0
    @data.each_cons(3) do |group|
      if last_sum && group.sum > last_sum
        increases +=1
      end
      last_sum = group.sum
    end
    increases
  end
end
