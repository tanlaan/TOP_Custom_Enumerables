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

    def my_select
        selection = []
        self.my_each do |item|
            if yield item
                selection.append(item)
            end
        end
        selection
    end

    def my_all?
        all = true
        self.my_each do |item|
            all &&= yield item
        end
        all
    end

    def my_any?
        any = false
        self.my_each do |item|
            any ||= yield item
        end
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
