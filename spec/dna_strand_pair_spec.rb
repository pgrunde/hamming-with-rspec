require "spec_helper"

describe DnaStrandPair do

  def strand_pair(strand_1, strand_2)
    DnaStrandPair.new(strand_1, strand_2)
  end

  it "calculates the distance between identical strands" do
    expect(strand_pair("A", "A").hamming_distance).to eq(0)
  end

  it "calculates the distance for single nucleotide strand" do
    expect(strand_pair("A", "G").hamming_distance).to eq(1)
  end

  it "calculates the distance between small strands" do
    expect(strand_pair("AG", "CT").hamming_distance).to eq(2)
  end

  it "calculates the distance between two other small strands" do
    expect(strand_pair("AT", "CT").hamming_distance).to eq(1)
  end

  it "calculates the distance in longer strands" do
    expect(strand_pair("GGACG", "GGTCG").hamming_distance).to eq(1)
  end

  it "ignores the extra length in the first strand when it is longer" do
    expect(strand_pair("GGACGACGTGA", "GGTCG").hamming_distance).to eq(1)
  end

  it "ignores the extra length in the second strand when it is longer" do
    expect(strand_pair("GGACG", "GGTCGAGTCAG").hamming_distance).to eq(1)
  end
end