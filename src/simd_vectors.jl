simdvec(x::NTuple{4,T}) where {T<:SIMDNUMS} = SIMD.Vec{4,T}(x)
simdvec(x::NTuple{8,T}) where {T<:SIMDNUMS} = SIMD.Vec{8,T}(x)

simdvec(x::AbstractVector{T}) where {T<:SIMDNUMS} = simdvec(Tuple(x))
      
