class BoardSetup
attr_accessor :a, :b, :c, :d
  def initialize
    @one = "=" * 11
    @two = ". 1 2 3 4"
    @a =   "A        "
    @b =   "B        "
    @c =   "C        "
    @d =   "D        "
    @three = "=" * 11
  end

  def update_board(cord)
    num = cord[1].to_i * 2
    let = cord[0].to_s.upcase
    if let == "A"
      a[num] = "#"
    elsif let == "B"
      b[num] = "#"
    elsif let == "C"
      c[num] = "#"
    else let == "D"
      d[num] = "#"
    end
  end

  def print_board
    puts @one
    puts @two
    puts @a
    puts @b
    puts @c
    puts @d
    puts @three
  end
end
