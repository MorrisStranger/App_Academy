class Array
	def bubble_sort!(&prc)
		prc ||= Proc.new {|a,b|a<b} 
		sorted = false
		while !sorted
			sorted = true
			(0...self.length-1).each do |i|
				
				if prc.call(self[i],self[i+1])==1
					sorted = false
					self[i],self[i+1]=self[i+1],self[i]
				end
			end
		end
	self
	end
	def bubble_sort(&prc)
		copy_arr=[*self]
		prc ||= Proc.new {|a,b|a<b} 
		sorted = false
		while !sorted
			sorted = true
			(0...copy_arr.length-1).each do |i|
				
				if prc.call(copy_arr[i],copy_arr[i+1])==1
					sorted = false
					copy_arr[i],copy_arr[i+1]=copy_arr[i+1],copy_arr[i]
				end
			end
		end
	copy_arr
	end


end
def substring(string)
	subs=[]
	(0..string.length).each do |i|
	(i+1..string.length).each do |i_1|
	subs << string[i...i_1]
	end
	end
	subs

end
p substring("cat")
p [1,2,3,4].bubble_sort! {|a,b|b<=>a}
p [1,2,3,4].bubble_sort {|a,b|b<=>a}