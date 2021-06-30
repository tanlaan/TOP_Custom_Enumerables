module Enumerable
    def my_each
        for value in self
            yield value
        end
    end
    def my_each_with_index
        index = 0
        for value in self
            yield value, index
            index += 1
        end
    end
end

numbers = [1,2,3,4,5]
numbers.each { |item| puts item }
numbers.my_each { |item| puts item }
numbers.each_with_index { |item, index| puts "#{item} #{index}" }
numbers.my_each_with_index { |item, index| puts "#{item} #{index}" }
