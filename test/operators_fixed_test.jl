using Bosonic
using Test
@testset "Bosonic.jl" begin
    @test basis_m(4,2)[1][1,:][4] == 2
end
