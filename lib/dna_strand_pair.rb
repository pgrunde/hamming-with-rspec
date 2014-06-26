class DnaStrandPair
  def initialize(strand_1, strand_2)
    @strand_1 = strand_1.to_s
    @strand_2 = strand_2.to_s
    @hamming = 0
  end

  # calculated with slice & recursion
  def recursive_hamming_distance
    compare_1 = @strand_1.slice!(0)
    compare_2 = @strand_2.slice!(0)

    if compare_1 == nil || compare_2 == nil
      return @hamming
    end

    if compare_1 != compare_2
      @hamming += 1
    end

    recursive_hamming_distance
  end

  # calculated with each_with_index
  def index_hamming_distance
    compare_1 = @strand_1.split(//)
    compare_2 = @strand_2.split(//)

    compare_1.each_with_index do |char, ndx|
      if compare_2[ndx] != char && compare_2[ndx] != nil
        @hamming += 1
      end
    end
    @hamming
  end

  # calculated with find_all
  def hamming_distance
    compare_1 = @strand_1.split(//)
    compare_2 = @strand_2.split(//)

    iter = -1
    array_mismatch = compare_1.find_all do |letter|
      iter += 1
      compare_2[iter] != letter && compare_2[iter] != nil
    end
    array_mismatch.length
  end

end
