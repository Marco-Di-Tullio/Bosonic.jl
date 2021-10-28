#SafeTestsets makes every test run in a separate enviromment
#so that errors can be found independently
using SafeTestsets
@safetestset "Operators fixed tests" begin include("operators_fixed_test.jl") end
