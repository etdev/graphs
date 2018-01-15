## Strategy for adding and removing edges from an undirected matrix graph
#module Graphs
  #module Edge
    #class MatrixStrategy
      #include BoundsChecking

      #def initialize(edge_type: :directed)
        #@edge_type = edge_type
      #end

      #def add_edge(graph, i, j)
        #with_bounds_check(graph, i, j) do
          #graph.elements[i][j] = Storage::MatrixStrategy::HAS_VERTEX

          #if undirected?
            #graph.elements[j][i] = Storage::MatrixStrategy::HAS_VERTEX
          #end
        #end
      #end

      #def remove_edge(graph, i, j)
        #with_bounds_check(graph, i, j) do
          #graph.elements[i][j] = Storage::MatrixStrategy::NO_VERTEX

          #if undirected?
            #graph.elements[j][i] = Storage::MatrixStrategy::NO_VERTEX
          #end
        #end
      #end

      #private

      #attr_reader :edge_type

      #def undirected?
        #edge_type == :undirected
      #end
    #end
  #end
#end
