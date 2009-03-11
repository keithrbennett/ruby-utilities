# Bidirectional Hash

class BiHash


def initialize(a_hash)

  raise Exception.new if a_hash == nil

  @l2r = {}
  @r2l = {}

  a_hash.each do |k,v|
    @l2r[k] = v
    @r2l[v] = k
  end
end


def get_right(left)
  @l2r[left]
end


def get_left(right)
  @r2l[right]
end

end

a_hash =  { :color => :yellow, :flavor => :vanilla }
bh = BiHash.new a_hash
puts bh.get_right :color
puts bh.get_left :yellow

