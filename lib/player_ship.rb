
class PlayerShip
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
      player_ship2
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
end
