class Array
    def my_uniq
        already_seen=[]
        self.each {|ele| already_seen << ele unless already_seen.include?(ele)}
    already_seen
    end
    def two_sum
        zero_pos=[]
        (0...self.length-1).each do |i|
        (i+1...self.length).each do |j|
            # p i
            # p j
        zero_pos << [i,j] if self[i]+self[j]==0
        end
        end
        zero_pos
    end
    def my_transpose
        col=[]
        new_mat=[]
        (0...self.length).each do |i|
            (0...self.length).each do |j|
                col << self[j][i]
            end
            new_mat << col
            col=[]

        end
        new_mat
    end
    def stock_picker
        max=0
        ideal_pos=[]
        (0...self.length-1).each do |ele|
        (ele+1...self.length).each do |ele_1|
            if self[ele]-self[ele_1]>max
                ideal_pos=[ele,ele_1]
                max = self[ele]-self[ele_1]
                end
            end
        end
            ideal_pos
    end
end