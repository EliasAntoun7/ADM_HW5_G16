#!/bin/bash
# This question is answered on AWS. Firslty, the two files (betweenness_centrality.csv and citation_graph_edges.csv)
#which are derived on the main.ipynb code are uploaded into the environment.

# Question 1
# The most important connector node is determined by sorting the betweenness centrality values. 
connector=$(sort -k2 -nr betweenness_centrality.csv | head -1)
echo "The most important connector node is: $connector"

# Question 2
# Firsly, the citation_graph_edges file is modified (removing parantheses) and saved into a new txt file. 
sed 's/[()]//g; s/,/\n/g' citation_graph_edges.csv > node_list.txt
# Then the nodes are sorted and unique nodes and their occurances are counted
sort node_list.txt | uniq -c > degree_count.txt
# In order not to clutter the result, only 10 of the nodes are displayed. 
degree=$(head -n 10 degree_count.txt)
echo "Node Degree Variation: $degree"

# Question 3
# Firslty, the csv file is modified (removing parantheses, replacing commas with spaces, removing quotes) and saves into a new txt file.
sed -E 's/"([0-9]+)"/\1/g' citation_graph_edges.csv | sed -e 's/[()]//g' -e 's/,/ /g' > edges.txt
sed -i 's/"//g' edges.txt

# Calling Python
short_path_avg=$(python3 -c "
import networkx as nx

# Reading edges and building a directed graph
graph = nx.DiGraph()
with open('edges.txt', 'r') as file:
    for line in file:
        try:
            source, target = map(int, line.split())
            graph.add_edge(source, target)
        except (ValueError, TypeError):
            # Skip lines that cannot be converted to integers
            continue
# Since the average shortest path length cannot be calculated directly, first we determined strongly connected components.
connected_components = nx.strongly_connected_components(graph)
avg_shortest_paths = []
for component in connected_components:
    subgraph = graph.subgraph(component)
    avg_shortest_paths.append(nx.average_shortest_path_length(subgraph))

# Computing the overall average shortest path length (mean of component averages)
short_path_avg = sum(avg_shortest_paths) / len(avg_shortest_paths)
print(f'{short_path_avg:.4f}')
")

echo "The Average Length of the Shortest Path Among Nodes: $short_path_avg"
