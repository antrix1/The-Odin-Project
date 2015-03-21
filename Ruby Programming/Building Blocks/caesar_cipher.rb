def caesar_cipher(input, shift_num)
  input_bytes = input.bytes
  output_bytes = []

  input_bytes.each do |i|

    if i.to_s.to_i.between?(65, 90)
      if !(i + shift_num).to_s.to_i.between?(65, 90)
        i = 65
        output_bytes.push(i + shift_num)
      else
        output_bytes.push(i + shift_num)
      end

    elsif i.to_s.to_i.between?(97, 122)
      if !(i + shift_num).to_s.to_i.between?(97, 122)
        i = 97
        output_bytes.push(i + shift_num)
      else
        output_bytes.push(i + shift_num)
      end

    else
      output_bytes.push(i)
    end
  end
  output_bytes.pack('c*')
end

puts caesar_cipher("Andrej is loving Ruby!", 10) # ==> Kxnkot sk vyksxq Kklk!

