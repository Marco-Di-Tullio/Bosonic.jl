module Bosonic
using SparseArrays
using LinearAlgebra

include("operators_fixed.jl")
export basis_m, bdb, bbd, Op_fixed, b, bd
end
