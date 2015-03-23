def translate(word)
  vowel = ['a', 'e', 'i', 'o', 'u']
  new_word = word.split(' ')
  output = []

  new_word.each do |word|
    if vowel.include?(word[0])
     output << word + "ay"

    elsif !vowel.include?(word[0]) && !vowel.include?(word[1]) && !vowel.include?(word[2] )|| "q".include?(word[1]) && "u".include?(word[2])
      output << word[3..-1] + word[0..2] + "ay"

    elsif !vowel.include?(word[0]) && !vowel.include?(word[1]) || "q".include?(word[0]) && "u".include?(word[1])
      output << word[2..-1] + word[0..1] + "ay"

    else
      output << word[1..-1] + word[0] + "ay"

    end
  end
  output_phrase = output.join(' ')
  return output_phrase

end

