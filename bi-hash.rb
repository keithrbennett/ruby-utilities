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


def get_all_lefts
  @l2r.keys
end


def get_all_rights
  @r2l.keys
end

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

