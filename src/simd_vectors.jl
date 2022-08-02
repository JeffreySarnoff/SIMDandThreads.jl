simdvec(x::NTuple{N,T}) where {N, T<:SIMDNUMS} = SIMD.Vec{N,T}(x)
simdvec(x::AbstractVector{T}) where {T<:SIMDNUMS} = simdvec(Tuple(x))

      
