using NestedDecayTrees
using Documenter

DocMeta.setdocmeta!(NestedDecayTrees, :DocTestSetup, :(using NestedDecayTrees); recursive = true)

const page_rename = Dict("developer.md" => "Developer docs") # Without the numbers
const numbered_pages = [
    file for file in readdir(joinpath(@__DIR__, "src")) if
    file != "index.md" && splitext(file)[2] == ".md"
]

makedocs(;
    modules = [NestedDecayTrees],
    authors = "Mikhail Mikhasenko <mikhail.mikhasenko@cern.ch>",
    repo = "https://github.com/mmikhasenko/NestedDecayTrees.jl/blob/{commit}{path}#{line}",
    sitename = "NestedDecayTrees.jl",
    format = Documenter.HTML(; canonical = "https://mmikhasenko.github.io/NestedDecayTrees.jl"),
    pages = ["index.md"; numbered_pages],
)

deploydocs(; repo = "github.com/mmikhasenko/NestedDecayTrees.jl")
