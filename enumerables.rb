module Enumerable

    def my_each
        for value in self
            yield value
        end
    end

    def my_each_with_index
        index = 0
        # self.my_each {|item| yield item, index and index += 1}
        # ^^^ look into why this doesn't work
        # 
        self.my_each do |item|
            yield item, index
            index += 1
        end
    end

    def my_select
        selection = []
        self.my_each { |item| selection.append(item) if yield item }
        selection
    end

    def my_all?
        all = true
        self.my_each {|item| all &&= yield item}
        all
    end

    def my_any?
        any = false
        self.my_each {|item| any ||= yield item}
        any
    end

    def my_none?
        !self.my_all? {|item| yield item}
    end

    def my_count

    end

    def my_map

    end

    def my_inject

    end
end

numbers = [1,2,3,4,5]
numbers.each { |item| puts item }
numbers.my_each { |item| puts item }
numbers.each_with_index { |item, index| puts "#{item} #{index}" }
numbers.my_each_with_index { |item, index| puts "#{item} #{index}" }
