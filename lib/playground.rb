# frozen_string_literal: true

def caesar_cipher(sentance, num)
  words_list = sentance.downcase.split('').map(&:ord)
  new_sentance = []
  words_list.each do |letter|
    if letter > 96 && letter < 123
      if letter + num > 122
        letter = letter + num - 26
      else
        letter += num
      end
    end
    new_sentance.push(letter.chr)
  end
  new_sentance.join.capitalize
end

puts caesar_cipher('What a string!', 5)
