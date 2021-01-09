def sum_to(n)
return nil if n<0
return n if n==0
   #for -
   n+sum_to(n-1)
    #base case is when n = 1 returns 1
#general case: sum_to(n)=n+sum_to(n-1)
end
# p sum_to(5)
# p sum_to(1)
# p sum_to(9)
# p sum_to(-8)

def add_numbers(nums_array)
    #base case(s) : [1] or []
    return nums_array[0] if nums_array.length<=1 
    nums_array.pop+add_numbers(nums_array)
    #add_numbers([1,2])=add_numbers(nums_array).pop+add_numbers(nums_array)
end

# p add_numbers([1,2,3,4])
# p add_numbers([3]) # => returns 3
# p add_numbers([-80,34,7]) # => returns -39
# p add_numbers([]) # => returns nil

def gamma_fnc(integ)
# base case(s): 
return nil if integ ==0
return 1 if integ ==1

#general
#gamma(2)=1
#gamma(2)=(2-1)*gamma(1)
#gamma(3)=2
#gamme(3)= (3-1)*gamma(2)
(integ-1)*gamma_fnc(integ-1) 

end

# p gamma_fnc(0)  # => returns nil
# p gamma_fnc(1)  # => returns 1
# p gamma_fnc(4)  # => returns 6
# p gamma_fnc(8)  # => returns 5040

def ice_cream_shop(flavors,favorite)
#base cases
return false if flavors.empty? 
return true if flavors[-1] == favorite 
flavors.pop
ice_cream_shop(flavors,favorite)
end

p ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
p ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
p ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
p ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
p ice_cream_shop([], 'honey lavender')  # => returns false

def reverse(string)

    return string if string.empty?

    string[-1]+reverse(string[0...-1]) 
end

p reverse("house") # => "esuoh"
p reverse("dog") # => "god"
p reverse("atom") # => "mota"
p reverse("q") # => "q"
p reverse("id") # => "di"
p reverse("") # => ""