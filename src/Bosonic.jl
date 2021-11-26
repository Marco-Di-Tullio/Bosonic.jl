module Bosonic
using SparseArrays
using LinearAlgebra

include("operators_fixed.jl")
include("states_fixed.jl")
include("correlations.jl")

export basis_m, bdb, bbd, Op_fixed, dim, nume, le, basis, b, bd, state_form
export State_fixed, st, ope, nume, dim, basis, typ, rhosp
end
