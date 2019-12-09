require 'spec_helper'
require 'scatter_swap'

describe "#hash" do
  it "should be 10 digits by default" do
    100.times do |integer|
      expect(ScatterSwap.hash(integer).to_s.length).to eq 10
    end
  end

  it "should accept a length" do
    100.times do |integer|
      length = 1 + (integer / 10)
      expect(ScatterSwap.hash(integer, 0, length).to_s.length).to eq length
    end
  end

  it "should not be sequential" do
    100.times do |integer|
      expect(ScatterSwap.hash(integer + 1).to_i).not_to eq(ScatterSwap.hash(integer).to_i + 1)
    end
  end

  it "should be reversible" do
    100.times do |integer|
      hashed = ScatterSwap.hash(integer)
      expect(ScatterSwap.reverse_hash(hashed).to_i).to eq integer
    end
  end

  it "should be reversible in different length" do
    100.times do |length|
      hashed = ScatterSwap.hash(123456, length)
      expect(ScatterSwap.reverse_hash(hashed, length).to_i).to eq 123456
    end
  end

  context "When hashed_integer length is less than length used in ScatterSwap.hash" do
    it "should be reversible" do
      length = 20
      integer = 2970439418180909067

      hashed = ScatterSwap.hash(integer, 0, length)
      # => "02792428384994356370"

      expect(ScatterSwap.reverse_hash(hashed, 0, length).to_i).to eq integer
      expect(ScatterSwap.reverse_hash(hashed.to_i, 0, length).to_i).to eq integer
    end
  end
end

describe "#swapper_map" do
  before do
    @map_set = []
    s = ScatterSwap::Hasher.new(1)
    10.times do |digit|
      @map_set.push s.swapper_map(digit)
    end
  end

  it "should create a unique map array for each digit" do
    expect(@map_set.length).to eq 10
    expect(@map_set.uniq.length).to eq 10
  end

  it "should include all 10 digits in each map" do
    @map_set.each do |map|
      expect(map.length).to eq 10
      expect(map.uniq.length).to eq 10
    end
  end
end

describe "#scatter" do
  it "should return a number different from original" do
    100.times do |integer|
      s = ScatterSwap::Hasher.new(integer)
      original_array = s.working_array
      s.scatter
      expect(s.working_array).not_to eq original_array
    end
  end

  it "should be reversible" do
    100.times do |integer|
      s = ScatterSwap::Hasher.new(integer)
      original_array = s.working_array.clone
      s.scatter
      s.unscatter
      expect(s.working_array).to eq original_array
    end
  end
end

describe "#swap" do
  it "should be different from original" do
    100.times do |integer|
      s = ScatterSwap::Hasher.new(integer)
      original_array = s.working_array.clone
      s.swap
      expect(s.working_array).not_to eq original_array
    end
  end

  it "should be reversible" do
    100.times do |integer|
      s = ScatterSwap::Hasher.new(integer)
      original_array = s.working_array.clone
      s.swap
      s.unswap
      expect(s.working_array).to eq original_array
    end
  end
end
