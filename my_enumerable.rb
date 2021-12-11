module MyEnumerable
    def all?
      each { |element| return false unless yield element }
      true
    end
  
    def any?
      each { |element| return true if yield element }
      false
    end
  
    def filter
      results = []
      each { |element| results.push(element) if yield element }
      results
    end
  end
end

class MyList
  include MyEnumerable
  def initialize(*args)
    @list = []
    args.each { |arg| @list << arg }
  end
  def each
    return to_enum(:each) unless block_given?
    i = 0
    while i < @list.length
      yield @list[i]
      i += 1
    end
    @list
  end
end
