
class ShipPlacement
  attr_accessor :play_cords1, :play_cords2, :play_cords3
  def initialize
  @play_cords1 = ["A1", "A2", "A3", "A4",
                  "B1", "B2", "B3", "B4",
                  "C1", "C2", "C3", "C4",
                  "D1", "D2", "D3", "D4"]

  @play_cords2 = [["A2","B1"], ["A1","B2","A3"], ["A2","B3","A4"], ["A3","B4"],
    ["A1","B2","C1"], ["B1","A2","B3","C2"], ["B2","A3","B4","C3"], ["B3","A4","C4"],
    ["B1","C2","D1"], ["C1","B2","C3","D2"], ["C2","B3","C4","D3"], ["C3","B4","D4"],
    ["C1","D2"], ["D1","C2","D3"], ["D2","C3","D4"], ["D3","C4"]]

  @play_cords3 = [["C1","A3"], ["C2","A4"], ["A1","C3"], ["A2","C4"],
                  ["D1","B3"], ["D2","B4"], ["B1","D3"], ["B2","D4"],
                  ["A1","C3"], ["A2","C4"], ["A3","C1"], ["C2","A4"],
                  ["B1","D3"], ["B2","D4"], ["B3","D1"], ["B4","D2"]]
  end

  def player_ship2(cord1 = gets.chomp.upcase!, cord2 = gets.chomp.upcase!)
    index = play_cords1.index(cord1)
    if play_cords1.include?(cord1) && play_cords2[index].include?(cord2)
      play_cords1[index] = nil
      play_cords1[play_cords1.index(cord2)] = nil
      x = 15
      16.times do
        array = play_cords3[x]
        array.delete_if { |x|  x == cord1 }
        array.delete_if { |x|  x == cord2 }
        x -= 1
      end
      Array[cord1, cord2]
    else
      puts "Please enter valid coordinates for your battleship"
      validate_cords2
    end
  end

  def player_ship3(cord1 = gets.chomp.upcase!, cord2 = gets.chomp.upcase!)
    cords = [cord1, cord2].sort
    cord1 = cords[0]
    cord2 = cords[1]
    index = play_cords1.index(cord1)
    if play_cords1.include?(cord1) && play_cords3[index].include?(cord2)
      if cord1.ord == cord2.ord
        return if play_cords1[index + 1].nil?
      else cord1.ord != cord2.ord
        return if play_cords1[index + 4].nil?
      end
    cords
    else
      puts "Please enter valid coordinates for your battleship"
      player_ship3
    end
  end

  def comp_ship2
    ship2_cord1 = play_cords1.sample
    index1 = play_cords1.index(ship2_cord1)
    ship2_cord2 = play_cords2[index1].sample
    play_cords1[index1] = nil
    play_cords1[play_cords1.index(ship2_cord2)] = nil
    x = 15
    16.times do
      array = play_cords3[x]
      array.delete_if { |y| y == ship2_cord1}
      array.delete_if { |y| y == ship2_cord2}
      x -= 1
    end
    Array[ship2_cord1, ship2_cord2]
  end

  def comp_ship3
    ship3_cord1 = play_cords1.sample
    while ship3_cord1 == nil
      ship3_cord1 = play_cords1.sample
    end
    ship3_cord2 = play_cords3[play_cords1.index(ship3_cord1)].sample
    array = [ ship3_cord1, ship3_cord2 ].sort
    ship3_cord1 = array[0]
    ship3_cord2 = array[1]
    index3 = play_cords1.index(ship3_cord1)

    if ship3_cord2.ord == ship3_cord1.ord
      array = nil if play_cords1[index3 + 1].nil?
    else ship3_cord2.ord != ship3_cord1.ord
      array = nil if play_cords1[index3 + 4].nil?
    end
    array
  end
end

comp_ship = ShipPlacement.new
array = comp_ship.comp_ship2
comp_cord1 = array[0]
comp_cord2 = array[1]

comp_ship3 = comp_ship.comp_ship3
while comp_ship3 == nil
  comp_ship3 = comp_ship.comp_ship3
end
comp_cord3 = comp_ship3[0]
comp_cord5 = comp_ship3[1]

if comp_cord3.ord == comp_cord5.ord
  comp_cord4 = comp_cord3.succ
else
  comp_cord4 = comp_cord3[0].succ + comp_cord3[1]
end
computer_board.update_board(comp_cord1)
computer_board.update_board(comp_cord2)
computer_board.update_board(comp_cord3)
computer_board.update_board(comp_cord4)
computer_board.update_board(comp_cord5)
computer_board.print_board

player_ship = ShipPlacement.new
puts "Please enter your Coordinates for ship 2"
ship2 = player_ship.player_ship2
cord1 = ship2[0]
cord2 = ship2[1]

player_board.update_board(cord1)
player_board.update_board(cord2)
player_board.print_board

puts "Please enter your Coordinates for ship 3"
ship3 = player_ship.player_ship3
while ship3 == nil
  puts "Ships may not overlap"
  ship3 = player_ship.player_ship3
end
cord1 = ship3[0]
cord3 = ship3[1]

if cord1.ord == cord3.ord
  cord2 = cord1.succ
else
  cord2 = cord1[0].succ + cord1[1]
end

player_board.update_board(cord1)
player_board.update_board(cord2)
player_board.update_board(cord3)
player_board.print_board
