Graphviz & DOT
==============

Attributes
----------
[bron](http://www.graphviz.org/doc/info/attrs.html#d:style)

Compilatie
----------
Algemeen:

    dot -T[pdf|dvi|ps] -O [file.dot]

Voorbeeld:

    dot -Tpdf -O mygraph.dot

Handige opties
--------------
### General
Rechte lijnen

    splines=line;

Nodes op dezelfde hoogte

    {rank=same;nodeA,nodeB};

### Graph

    graph [pad=.75, ranksep=0.7, nodesep=0.7];

### Nodes
### Edges
Een node in dezelfde rank krijgen zoals weergegeven:

    digraph G {                               [a]
        a -> c;                              /   \
        a -> b;                             /     \
        b -> c [constraint=false];        [b]-----[c]
    }

De lengte van een edge instellen:

    graph [nodesep="0.5"];
    a -> b [minlen="0.8"];


Voorbeeld
---------

    digraph G {
        rankdir = LR
        node [shape=box]
        edge [arrowhead=none]

        A [label="my node",shape=note]
        B [label="my other node",style=fill,fillcolor=black,fontcolor=white]

        A -> B -> B [label="my arc", weight="12"]

        subgraph cluster_0 {
            label = "Mijn subgraaf"
            C
        }

        C -> A

        {rank=same; A, C}
    }

Colors
------
[bron](http://www.graphviz.org/doc/info/colors.html)
