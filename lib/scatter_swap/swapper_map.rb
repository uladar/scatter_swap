# We want a unique map for each place in the original number
module ScatterSwap
  class SwapperMap
    @all_swapper_maps = {}

    class << self
      def instance(spin)
        @all_swapper_maps[spin] ||= new(spin)
      end
    end

    DIGITS = (0..9).to_a.freeze

    def initialize(spin)
      @spin = spin
      @caches = {}
    end

    def generate(index)
      @caches[index] ||= generate_without_cache(index)
    end

    private

    def generate_without_cache(index)
      array = DIGITS.dup
      sum = 0
      10.times.map.with_index do |i|
        sum = (sum + ((index + i) ^ @spin) - 1) % (10 - i)
        next array.delete_at(sum)
      end
    end
  end
end
