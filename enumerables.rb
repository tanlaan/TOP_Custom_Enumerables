module Enumerable

    def my_each
        for value in self
            yield value
        end
    end

    def my_each_with_index
        index = 0
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

    def my_count(arg = nil)
        count = 0
        if block_given?
            self.my_each {|item| count += 1 if yield item}
        elsif arg
            self.my_each {|item| count += 1 if item == arg}
        else
            self.my_each {count += 1} 
        end
        count
    end

    def my_map(map_proc = nil)
        map = []
        self.my_each do |item| 
            if map_proc
                map.append(map_proc.call(item))
            else
                map.append(yield item) 
            end
        end
        map
    end

    def my_inject(initial = nil)
        memo = initial 
        self.my_each do |item| 
            memo = item and next if memo.class == Symbol
            memo = initial.to_proc.call(memo, item) if initial.class == Symbol 
            memo = yield memo, item if block_given?
        end
        memo       
    end
end

numbers = [1,2,3,4,5]
numbers.each { |item| puts item }
numbers.my_each { |item| puts item }
numbers.each_with_index { |item, index| puts "#{item} #{index}" }
numbers.my_each_with_index { |item, index| puts "#{item} #{index}" }
