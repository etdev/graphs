module Graphs
  module BoundsChecking
    def with_bounds_check(graph, *indices)
      indices.each { |i| raise OutOfBoundsError if i >= graph.vertex_count }

      yield
    end

    class OutOfBoundsError < StandardError; end
  end
end
