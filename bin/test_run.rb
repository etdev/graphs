require_relative "../lib/graphs"
include Graphs

# construct graph
graph = GraphFactory
  .new(storage_type: :list, edge_type: :directed)
  .create

 graph.add_vertex(9)
 graph.add_edge(0, 1)
 graph.add_edge(1, 3)
 graph.add_edge(1, 4)
 graph.add_edge(1, 5)
 graph.add_edge(4, 7)
 graph.add_edge(3, 4)
 graph.add_edge(7, 8)
 graph.add_edge(4, 8)

 #graph = Graphs::Graph.new(storage_type: :matrix, edge_type: :undirected)
 #graph.add_edge(0, 1)
 #graph.add_edge(1, 2)
 #graph.add_edge(1, 3)
 #graph.add_edge(3, 4)

# print graph in terminal
puts graph.to_s

# run BFS on graph
Graphs::Traversals::BFS.new(graph).run(0, 8) { |v, q| puts "Processing #{v}; q: #{q}" }

# print graph on screen
Graphs::Printers::SimplePrinter.new(graph).print
