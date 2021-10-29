using Bosonic
using Test
@testset "Bosonic.jl" begin
    @test round(st(State_fixed(ones(10),Op_fixed(4,2)))'*st(State_fixed(ones(10),Op_fixed(4,2))),digits=4) == 1
    @test nume(State_fixed(ones(10),Op_fixed(4,2))) == 2
    @test basis(State_fixed(ones(10),Op_fixed(4,2)))[1,:][4] == 2
    @test rhosp(State_fixed(ones(10),Op_fixed(4,2)))[3,1] == 0.4
end
