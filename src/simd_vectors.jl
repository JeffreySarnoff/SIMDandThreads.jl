simdvec(x::NTuple{N,T}) where {N,T} = SIMD.Vec{N,T}(x)
simdvec(x::AbstractVector{T}) where {T} = simdvec(Tuple(x))

simdvec(x::NTuple{N1,T}, y::NTuple{N2,T}) where {N1,N2,T} = SIMD.Vec{N1+N2,T}((x..., y...))
simdvec(x::Vec{N1,T}, y::Vec{N2,T}) where {N1,N2,T} = SIMD.Vec{N1+N2,T}((x.data..., y.data...))      
simdvec(x::AbstractVector{T}, y::AbstractVector{T}) where {T} = simdvec(Tuple(x), Tuple(y))

simdvec(x::NTuple{N1,T}, y::NTuple{N2,T}, z::NTuple{N3,T}) where {N1,N2,N3,T} =
    SIMD.Vec{N1+N2+N3,T}((x..., y..., z...))
simdvec(x::Vec{N1,T}, y::Vec{N2,T}, z::Vec{N3,T}) where {N1,N2,N3,T} = 
    SIMD.Vec{N1+N2+N3,T}((x.data..., y.data..., z.data...))      
simdvec(x::AbstractVector{T}, y::AbstractVector{T}, z::AbstractVector{T}) where {T} = 
    simdvec(Tuple(x), Tuple(y), Tuple(z))

simdvec(x::NTuple{N1,T}, y::NTuple{N2,T}, z::NTuple{N3,T}, z::NTuple{N4,T}) where {N1,N2,N3,N4,T} =
    SIMD.Vec{N1+N2+N3+N4,T}((x..., y..., z..., w...))
simdvec(x::Vec{N1,T}, y::Vec{N2,T}, z::Vec{N3,T}, z::Vec{N4,T}) where {N1,N2,N3,N4,T} = 
    SIMD.Vec{N1+N2+N3+N4,T}((x.data..., y.data..., z.data..., w.data...))      
simdvec(x::AbstractVector{T}, y::AbstractVector{T}, z::AbstractVector{T}, w::AbstractVector{T}) where {T} = 
    simdvec(Tuple(x), Tuple(y), Tuple(z), Tuple(w))

value(x::Vec{N,T}) where {N,T} = map(z->z.value, x.data)

simdhilo(hilo::NTuple{2,T}) where {T} = SIMD.Vec{2,T}(hilo)
simdhilo(hilo::NTuple{2,NTuple{2,T}}) where {T} =
    SIMD.Vec{4,T}((hilo[1][1], hilo[1][2], hilo[2][1], hilo[2][2]))
simdhilo(hilo::NTuple{4,NTuple{2,T}}) where {T} =
    SIMD.Vec{8,T}((hilo[1][1], hilo[1][2], hilo[2][1], hilo[2][2], hilo[3][1], hilo[3][2], hilo[4][1], hilo[4][2]))

