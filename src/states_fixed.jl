struct State_fixed{T<:AbstractVector}
    st::T
    ope::Op_fixed
    State_fixed(st,ope) = length(st) != binomial(dim(ope)+nume(ope)-1,nume(ope)) ? error("lenght of vector does not match dimension") : new{typeof(st)}(st/sqrt(st'*st),ope)
end

st(s::State_fixed) = s.st

ope(s::State_fixed) = s.ope

nume(s::State_fixed) = nume(s.ope)

dim(s::State_fixed) = dim(s.ope)

basis(s::State_fixed) = basis(s.ope)

typ(s::State_fixed) = eltype(s.st)


function rhosp(sta::State_fixed, precis=15)
    n = dim(sta)
    num = nume(sta)
    rhospv = spzeros(typ(sta),n,n)
    estate = st(sta)
    o = ope(sta)
    for i in 1:n
        for j in 1:n
            rhospv[i,j] = round(estate'*bdb(o, i, j)*estate, digits = precis)
        end
    end
    return rhospv
end
