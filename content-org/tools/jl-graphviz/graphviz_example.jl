 = An example code for my note
   at https://www.bochkarev.io/tools/julia-graphs/

   A. Bochkarev, 2021 =#
using LightGraphs

"""Creates a sample graph."""
function make_graph()
    G = erdos_renyi(5, 0.7)
    W = Dict()
    for e in edges(G)
        W[(src(e), dst(e))] = rand(1:10)
    end
    s = rand([n for n in vertices(G)])
    t = rand([n for n in vertices(G) if n != s])

    return G, s, t, W
end

"""Shows the graph with source node `s`, dest `t`,
and arc costs `W`."""
function showgraph(G, s, t, W,
                   filename="./graph.dot",
                   display=true)

    open(filename, "w") do file
        write(file, "digraph {\n")
        for n in vertices(G)
            if n == s
                style = "[style=filled, fillcolor=red]"
            elseif n==t
                style = "[style=filled, fillcolor=green]"
            else
                style = ""
            end
            write(file,
                  "    $n $style;\n")
        end

        for e in edges(G)
            i=src(e); j=dst(e); cost=W[(i,j)]
            write(file,
                  "    $i -> $j" *
                      " [label=$(cost)];\n")
        end
        write(file, "}")
    end

    run(pipeline(`dot -Tpng $filename`,
                 stdout="$filename.png"))
    if display
        run(`xdg-open $filename.png`, wait=false)
    end
end

#= A more complex example:
- additional data
- more formatting =#

"""Generates some dummy data for graph `G`."""
function gen_data(G)
    names = ["name<SUB>$j</SUB>" for j in vertices(G)]
    info = ["info<SUB>$j</SUB>" for j in vertices(G)]
    return names, info
end

"""Shows the graph with additional metadata,
still using stand-alone Graphviz."""
function showgraph_more(G, s, t, W,
                   names,
                   info,
                   filename="./graph.dot",
                   display=true)

    open(filename, "w") do file
        write(file, "digraph {\n")
        for n in vertices(G)
            if n == s
                style = "style=filled, fillcolor=red,"
            elseif n==t
                style = "style=filled, fillcolor=green,"
            else
                style = ""
            end

            label = "<<B>Name:</B> $(names[n])<BR/>" *
                "<B>Info:</B> $(info[n])<BR/>" *
                "<B>Node number:</B> $n>"

            write(file,
                  "    $n[$style label=$label]\n")
        end

        for e in edges(G)
            i=src(e); j=dst(e); cost=W[(i,j)]
            write(file,
                  "    $i -> $j" *
                      " [label=\"added cost $(cost)\"];\n")
        end
        write(file, "}")
    end

    run(pipeline(`dot -Tpng $filename`, stdout="$filename.png"))
    if display
        run(`xdg-open $filename.png`, wait=false)
    end
end

"""Draws a graph using TikZ."""
function showgraph_tikz(G, s, t, W,
                   filename="./graph",
                   display=true)

    preamble = """\\documentclass{standalone}
\\usepackage{tikz}
\\usetikzlibrary{graphs,graphdrawing,quotes}
\\usegdlibrary{force}

\\begin{document}
\\begin{tikzpicture}
  \\graph [spring layout, node distance=20mm, nodes={draw, circle, fill=blue, text=white},
  edge quotes={fill=yellow, inner sep=2pt}]
  {\n"""

    postamble = """};
\\end{tikzpicture}
\\end{document}"""

    open(filename * ".tex", "w") do file
        write(file, preamble)
        for n in vertices(G)
            if n == s
                style = "fill=red, text=white"
            elseif n==t
                style = "fill=green, text=black"
            else
                style = "fill=white, text=black"
            end

            write(file,
                  "    $n [as={\$n_{$n}\$}, $(style)];\n")
        end

        for e in edges(G)
            i = src(e)
            j = dst(e)
            cost = W[(i, j)]
            write(file,
                  "    $i ->[\"$(cost)\"] $j;")
        end
        write(file, postamble)
    end

    run(pipeline(`lualatex $filename`))
    if display
        run(`xdg-open $filename.pdf`, wait=false)
    end
end
