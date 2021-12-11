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

class MyList
   include MyEnumerable
  def initialize(*args)
    @list = []
    args.each { |arg| @list << arg }
  end
end
