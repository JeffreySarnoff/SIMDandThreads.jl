simdvec(x::NTuple{N,T}) where {N, T<:SIMDNUMS} = SIMD.Vec{N,T}(x)
simdvec(x::AbstractVector{T}) where {T<:SIMDNUMS} = simdvec(Tuple(x))

simdvec(x::NTuple{N1,T}, y::NTuple{N2,T}) where {N1, N2, T<:SIMDNUMS} = SIMD.Vec{N1+N2,T}((x..., y...))
simdvec(x::Vec{N1,T}, y::Vec{N2,T}) where {N1, N2, T<:SIMDNUMS} = SIMD.Vec{N1+N2,T}((x.data..., y.data...))      
simdvec(x::AbstractVector{T}, y::AbstractVector{T}) where {T<:SIMDNUMS} = simdvec(Tuple(x), Tuple(y))
      
value(x::Vec{N,T}) where {N,T} = map(z->z.value, x.data)
