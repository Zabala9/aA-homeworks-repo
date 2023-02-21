class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {Array.new}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, idx|
      next if idx == 6 || idx == 13
      4.times do
        cup << :stone
      end
    end

    # @cups.each.with_index do |cup, idx|
    #   if idx == 6 || idx == 13
    #     i = 0
    #     while i < 4
    #       cup << :stone

    #       i += 1
    #     end
    #   end
  end

  def valid_move?(start_pos)
    raise ArgumentError.new "Invalid starting cup" if start_pos < 0 || start_pos > 14 || start_pos == 6
    raise ArgumentError.new "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    position = @cups[start_pos]
    @cups[start_pos] = []

    while !position.empty?
      start_pos += 1
      start_pos = 0 if start_pos > 13

      if start_pos == 6
        @cups[6] << position.pop if current_player_name == @name1
      elsif start_pos == 13
        @cups[13] << position.pop if current_player_name == @name2
      else
        @cups[start_pos] << position.pop
      end
    end

    render
    next_turn(start_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if @cups[ending_cup_idx].empty?
      return :switch
    elsif ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    else
    ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end