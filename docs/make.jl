using Bosonic
using Documenter

DocMeta.setdocmeta!(Bosonic, :DocTestSetup, :(using Bosonic); recursive=true)

makedocs(;
    modules=[Bosonic],
    authors="Marco Di Tullio",
    repo="https://github.com/Marco-Di-Tullio/Bosonic.jl/blob/{commit}{path}#{line}",
    sitename="Bosonic.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://Marco-Di-Tullio.github.io/Bosonic.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/Marco-Di-Tullio/Bosonic.jl",
    devbranch="main",
)
