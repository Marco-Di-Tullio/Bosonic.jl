using Bosonic
using Test
@testset "Bosonic.jl" begin
    @test basis_m(4,2)[1][1,:][4] == 2
    @test basis_m(4,3)[2][4] == 12
    @test bdb(4,2,1,2)[7,4] == 1
    @test bbd(4,3,2,2)[10,10] == 3
    @test bdb(basis_m(4,2)[1],basis_m(4,2)[2],2,1,2)[9,6] == 1
    @test bbd(basis_m(4,2)[1],basis_m(4,2)[2],2,1,2)[6,9] == 1
    @test bdb(Op_fixed(4,2),1,2)[9,6] == 1
    @test bbd(Op_fixed(4,2),1,2)[9,10] == 1
    @test dim(Op_fixed(5,1)) == 5
    @test nume(Op_fixed(4,3)) == 3
    @test le(Op_fixed(4,3)) == binomial(4+3-1,3)
    @test basis(Op_fixed(4,2))[2,4] == 1
    @test bd(4,1,1)[8,2] == 1
    @test b(4,2,1)[1,7] == 1
    @test bd(4,1,[1,2])[15,2] == 1
    @test b(4,3,[1,2])[1,14] == 1
end
