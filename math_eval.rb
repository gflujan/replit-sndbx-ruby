def math_eval(string) 
  string.delete!(' ') 
  return 'You have an invalid input!' if !valid_string?(string) 
  parsed = parse_string(string) 
  sum = parsed[0].to_i 

  i = 2 
  while i < parsed.length 
    sum = do_operation(sum, parsed[i-1], parsed[i]) 
    i += 2 
  end 

  sum 
end 

def do_operation(sum, operator, num) 
  integer = num.to_i 

  case operator 
    when '+' then sum += integer 
    when '-' then sum -= integer 
    when '*' then sum *= integer 
    when '/' then sum /= integer 
    else # do nothing 
  end 

  sum 
end 

def valid_string?(string) 
  nums = '0123456789' 
  syms = '+-*/.' 

  string.each_char.with_index do |ch, idx| 
    if idx.even? 
      return false if !nums.include?(ch) 
    elsif idx.odd? 
      return false if !syms.include?(ch) 
    end 
  end 

  true 
end 

def parse_string(str) 
  nums = '0123456789' 
  syms = '+-*/.' 
  chars = [] 

  str.each_char.with_index do |ch, i| 
    if nums.include?(ch) && str[i+1] != '.' 
      chars << ch 
    elsif nums.include?(ch) && str[i+1] == '.' 
      suffix = '' 

      j = i+1 
      until !nums.include?(str[j]) 
        suffix += str[j] 
        j += 1 
      end 
      
      chars << ch + '.' + suffix 
    elsif syms.include?(ch) 
      chars << ch 
    end 
  end 

  chars 
end 

# # Examples: 
# p math_eval('5') 
# # #=> 5 
# p math_eval('5+5') 
# # #=> 10 
# p math_eval('1+2*3') 
# # #=> 9 
# p math_eval('1+2_3') 
# # #=> "You have an invalid input!" 
# p math_eval('+1-2') 
# # #=> "You have an invalid input!" 
# p math_eval('2-1 +3/2') 
# # #=> 2 
# p math_eval('6.4-2/2') 
# #=> 2.2 
