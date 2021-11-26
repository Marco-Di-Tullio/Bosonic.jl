# Bosonic

<!---[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://Marco-Di-Tullio.github.io/Bosonic.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://Marco-Di-Tullio.github.io/Bosonic.jl/dev)
[![Build Status](https://github.com/Marco-Di-Tullio/Bosonic.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/Marco-Di-Tullio/Bosonic.jl/actions/workflows/CI.yml?query=branch%3Amain)-->
<!--[![Build Status](https://travis-ci.com/Marco-Di-Tullio/Bosonic.jl.svg?branch=main)](https://travis-ci.com/Marco-Di-Tullio/Bosonic.jl)-->
[![Build Status](https://ci.appveyor.com/api/projects/status/github/Marco-Di-Tullio/Bosonic.jl?svg=true)](https://ci.appveyor.com/project/Marco-Di-Tullio/Bosonic-jl)
[![codecov](https://codecov.io/gh/Marco-Di-Tullio/Bosonic.jl/branch/main/graph/badge.svg?token=yVWSggChX4)](https://codecov.io/gh/Marco-Di-Tullio/Bosonic.jl)
<!--[![Coverage Status](https://coveralls.io/repos/github/Marco-Di-Tullio/Bosonic.jl/badge.svg?branch=main)](https://coveralls.io/github/Marco-Di-Tullio/Bosonic.jl?branch=main)-->


Bosonic is a Julia toolkit for implementing bosonic simulations and exploring its quantum information properties.

Everything relating to bosons can be expressed in terms of annihilation and creation operators. The full Fock space is infinite-dimensional, so this package focuses on the fixed particle number subspace. It numerically constructs bosonic operators in this reduced system, which _the secret weapon_ of this library. Then you can define states in the corresponding base and calculate several properties. 

Many interesting quantities can be obtained from states in Bosonic, such as one body matrices entropy, partially traced systems, m-bodies density matrices, one body entropies, majorization relations, average particle number and more.

## Installation

For installing this package, you must first access the pkg REPL (by typing ']' in your command line) and then execute

```add Bosonic```

The pkg manager will automatically download the package. Then you can initialize it by typing

```using Bosonic```

Alternatively, you can install the package from an editor/Jupyter notebook by typing

```import Pkg```

```Pkg.add("Bosonic")```

```using Bosonic```

![](/images/quantuminfo.png)
