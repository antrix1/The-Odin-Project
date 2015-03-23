dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(str="", dictionary)
  list = Hash.new
  str_array = str.split(" ")
  counter = 0

  str_array.each do |s|
    dictionary.each do |d|
      if s.downcase.include?(d)
      counter += 1
      list[d] = counter
      end
    end
    counter = 0
  end
  list
end

puts substrings("Howdy partner, sit down! How's it going?", dictionary) # == > {"how"=>1, "howdy"=>2, "part"=>1, "partner"=>2, "it"=>1, "i"=>3, "sit"=>3, "down"=>1, "own"=>2, "go"=>1, "going"=>2}

