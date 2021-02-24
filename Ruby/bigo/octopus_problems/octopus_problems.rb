
require "byebug"
class OctopusProblems
@@fish=['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
@@tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
@@new_tiles_data_structure=@@tiles_array.to_h {|a|[a,@@tiles_array.index(a)]}
    def self.longest_fish
        for i in @@fish
            for j in @@fish
               max=j if j.length>i.length
            end
        end
        max        
    end
    def self.fish_merge_sort(arr=@@fish)
        # debugger
        return arr if arr.length <= 1 #do <=
        mid_index = arr.length / 2
        newarr=self.fish_merge(self.fish_merge_sort(arr.drop(mid_index)),self.fish_merge_sort(arr.take(mid_index)))
    #    p @@fish
        # return newarr
        return  newarr.length == 9 ? newarr[first] : newarr 
        # return 5
        
    end
    def self.fish_merge(arr1,arr2)
        merged=[]
        until arr1.empty? || arr2.empty?
            case arr1.first.length<=>arr2.first.length
            when -1
                merged << arr2.shift 
            when 0
                merged << arr2.shift
            when 1
                merged << arr1.shift
            end
            
        end
        merged + arr1 + arr2
    end
    def self.clever_octopus
        max=0
        final_fish=nil
         @@fish.each do |fish_example|
            if fish_example.length>max
                max = fish_example.length 
                final_fish = fish_example
            end
            
        end
        final_fish
    end
    def self.slow_dance(pos,tiles=@@tiles_array)
        tiles.each.with_index do |tile,idx|
            return idx if tile == pos
            
        end
    end
    def self.fast_dance(pos,struct=@@new_tiles_data_structure)
        return @@new_tiles_data_structure[pos]
    end
    
end
p OctopusProblems.longest_fish
OctopusProblems.fish_merge_sort()
p OctopusProblems.clever_octopus
# p OctopusProblems.slow_dance("right_down")
p OctopusProblems.fast_dance("right-down")