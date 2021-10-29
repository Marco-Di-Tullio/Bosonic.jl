
function basis_m(n::Int64,m::Int64)
    len = binomial(n+m-1,m)
    base = spzeros(len,n)
    counter = 1
    index = Int64[]
    for i in 1:((m+1)^n-1)
        bin_vec = splitter(string(i,base=(m+1)),n)
        if sum(bin_vec) == m
            base[counter,:] = bin_vec
            append!(index,i)
            counter += 1
        end
    end
    return base, index
end

function splitter(x,n)
    vectorized = zeros(Int64,0)
    while length(x) < n
        x = "0"*x
    end
    for i in x
        str_to_int = parse(Int, i)
        append!(vectorized, str_to_int)
    end
    return vectorized
end

function myfind(c,j)
    a = similar(c, Int)
    count = 1
    @inbounds for i in eachindex(c)
        a[count] = i
        count += (c[i] == j)
    end
    return a[1:(count-1)]
end

function bdb(n::Int64, m::Int64, i::Int64, j::Int64)
    base, ind = basis_m(n,m)
    l = binomial(n+m-1,m)
    op = spzeros(l,l)
    if i==j
        for k in 1:l
            if base[k,:][j] != 0
                op[k,k] = base[k,:][j]
            end
        end
    else
        for k in 1:l
           if base[k,:][j] != 0
                ill = Int(ind[k]-(m+1)^(n-j)+(m+1)^(n-i))
                ill2 = myfind(ind, ill)[1]
                op[ill2,k] = 1
            end
        end
    end
    return op
end

function bbd(n::Int64, m::Int64, i::Int64, j::Int64)
    return bdb(n, m, j, i)
end

function bdb(base::SparseMatrixCSC{Float64,Int64}, ind::Array{Int64,1}, m::Int64, i::Int64, j::Int64)
    l = size(base)[1]
    n = size(base)[2]
    op = spzeros(l,l)
    if i==j
        for k in 1:l
            if base[k,:][j] != 0
                op[k,k] = base[k,:][j]
            end
        end
    else
        for k in 1:l
           if base[k,:][j] != 0
                ill = Int(ind[k]-(m+1)^(n-j)+(m+1)^(n-i))
                ill2 = myfind(ind, ill)[1]
                op[ill2,k] = 1
            end
        end
    end
    return op
end

function bbd(base::SparseMatrixCSC{Float64,Int64}, ind::Array{Int64,1}, m::Int64, i::Int64, j::Int64)
    return bdb(base, ind, m, j, i)
end

struct Op_fixed
    dim::Int
    nume::Int
    bdbtot::SparseMatrixCSC{Float64,Int64}
    le::Int
    basis::SparseMatrixCSC{Float64,Int64}
    Op_fixed(dim,nume) = new(dim, nume, operators_fixed(dim,nume)...)
end

dim(o::Op_fixed) = o.dim
nume(o::Op_fixed) = o.nume
bdbtot(o::Op_fixed) = o.bdbtot
le(o::Op_fixed) = o.le
basis(o::Op_fixed) = o.basis

bdb(o::Op_fixed,i,j) = bdbtot(o)[(1+(i-1)*le(o)):i*le(o),(1+(j-1)*le(o)):j*le(o)]
bbd(o::Op_fixed,i,j) = bdb(o,j,i)

# Here we create the full matrix with all
# fixed particle operators definitions
function operators_fixed(n::Int,m::Int)
    l1 = binomial(n+m-1,m)
    l2 = n*l1
    bas,ind = basis_m(n,m)
    z = spzeros(l2,l2)
    for i in 1:n
        for j in i:n
            if i==j
                z[(1+(i-1)*l1):i*l1,(1+(j-1)*l1):j*l1] = 1/2*bdb(bas,ind, m, i,j)
            else
                z[(1+(i-1)*l1):i*l1,(1+(j-1)*l1):j*l1] = bdb(bas,ind, m, i,j)
            end
        end
    end
    op_general = z+z'
    return op_general, l1, bas
end

function bd(n::Int64, m::Int64, i::Int64)
    base1, ind1 = basis_m(n,m)
    l2 = binomial(n+m-1,m)
    base2, ind2 = basis_m(n,m+1)
    l1 = binomial(n+m,m+1)
    op = spzeros(l1,l2)
    s2 = sparse([(m+2)^l for l in 0:(n-1)])
    for k in 1:l2
        j = myfind(ind2, (s2[end:-1:1]'*base1[k,:])+(m+2)^(n-i))[1]
        op[j,k] = 1
    end
    return op
end


function b(n::Int64, m::Int64, i::Int64)
    op = bd(n, m-1, i)
    return op'
end


# This serves for applying several creations op
# at once. Modes will be a vector with the chosen
# modes
function bd(n::Int64, m::Int64, modes::Array{Int64,1})
    l = length(modes)
    op  = bd(n,m,modes[1])
    for k in 2:l
        op = bd(n,m+k-1,modes[k])*op
    end
    return op
end

function b(n::Int64, m::Int64, modes::Array{Int64,1})
    l = length(modes)
    op  = b(n,m,modes[1])
    for k in 2:l
        op = b(n,m-k+1,modes[k])*op
    end
    return op
end
