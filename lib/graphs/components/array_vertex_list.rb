module Graphs
  module Components
    class ArrayVertexList
      HAS_VERTEX = 1
      NO_VERTEX = 0

      def initialize(vertex_count = 0)
        @elements = Array.new(vertex_count, NO_VERTEX)
      end

      def add(i = @elements.size)
        @elements[i] = HAS_VERTEX
      end

      def remove(i = @elements.size - 1)
        @elements[i] = NO_VERTEX
      end

      def add_blank(i = @elements.size)
        @elements[i] = NO_VERTEX
      end

      def contains?(j)
        @elements[j] == HAS_VERTEX
      end

      def to_s
        @elements.to_s
      end

      def to_a
        @elements.each_index.reduce([]) do |present_indices, i|
          @elements[i] == HAS_VERTEX ? present_indices << i : present_indices
        end
      end

      private

      attr_reader :elements
    end
  end
end
