str = 'Juventus is waxing poetic, these notes are a quirky, zany combo of what I learned from a/A as well as my take on things. :-)'

clean_str_arr = str.delete(' ').split('')

alpha = 'abcdefghijklmnopqrstuvwxyz'
count = 0

clean_str_arr.each_with_index do |ltr, idx| 
  clean_str_arr[idx] = ltr.downcase 
end 

dedupe = clean_str_arr.select.with_index do |l, i| 
  clean_str_arr.index(l) == i
end

dedupe.each { |ltr| count += 1 if alpha.include? ltr }

# p clean_str_arr
# puts
# p clean_str_arr.length
# puts
# p dedupe
# puts
# p dedupe.length
# puts
# puts count
