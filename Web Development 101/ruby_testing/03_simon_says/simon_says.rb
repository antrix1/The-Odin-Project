def echo(str)
	str
end

def shout(str)
  str.upcase
end

def repeat(str, num=2)
  [str] * num * ' '
end

def start_of_word(word, num=1)
  word[0,num]
end

def first_word(word)
  new_word = word.split(" ")[0]
end

def titleize(str)
  small_words = ["and", "the", "over"]
  new_str = str.split(" ")
  new_str[0].capitalize!

  for index in 1..new_str.length-1
    if !small_words.include?(new_str[index])
      new_str[index].capitalize!
    end
  end
  new_str.join(" ")
end

