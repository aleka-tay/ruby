module Display
  def color_codes(number)
    {
      1 => "\e[101m  1  \e[0m",
      2 => "\e[104m  2  \e[0m",
      3 => "\e[102m  3  \e[0m",
      4 => "\e[103m  4  \e[0m",
      5 => "\e[105m  5  \e[0m",
      6 => "\e[43m  6  \e[0m"
    }[number]
  end

  def color_feedback(sign)
    {
      '*' => "\e[40m  BLACK  \e[0m",
      '?' => "\e[47m  GREY  \e[0m"
    }[sign]
  end

  def display_color(array_color)
    array_color.each do |num|
      print color_codes num
    end
    puts "\n"
  end

  def display_hints(array_color)
    array_color.each do |str|
      print color_feedback str
    end
    puts "\n"
  end
end
