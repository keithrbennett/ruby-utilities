# Bidirectional Hash

class NilArgumentException < Exception
end



class UniquenessViolationException < Exception

  :attr_accessor value_in_violation

  def initialize(value_in_violation = nil)
    self.value_in_violation = violation
  end

  def to_s
    (value_in_violation = nil) 
        ? "UniquenessViolationException" 
        : "UniquenessViolationException for value #{value_in_violation}."
  end
end

    

class BiHash

  def initialize(a_hash)

    raise NilArgumentException.new if a_hash == nil
    raise UniquenessViolationException if (! values_all_unique(a_hash.values))

    @l2r = {}
    @r2l = {}

    a_hash.each do |k,v|
      @l2r[k] = v
      @r2l[v] = k
    end
  end


  def values_all_unique(values)
    (values.size == values.uniq.size)
  end



  def get_right(left)
    @l2r[left]
  end


  def get_left(right)
    @r2l[right]
  end


  def get_all_lefts
    @l2r.keys
  end


  def get_all_rights
    @r2l.keys
  end


  def remove_left(obj)
    @l2r.
end



def test
  a_hash =  { :color => :yellow, :flavor => :vanilla }
  bh = BiHash.new a_hash
  puts bh.get_right :color
  puts bh.get_left :yellow

  puts "Lefts:"
  puts bh.get_all_lefts
  puts "Rights:"
  puts bh.get_all_rights
end

