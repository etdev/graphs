module Graphs
  module BoundsChecking
    def with_bounds_check(vertex_count, *indices)
      indices.each { |i| raise OutOfBoundsError if i >= vertex_count }

      yield
    end

    class OutOfBoundsError < StandardError; end
  end
end
