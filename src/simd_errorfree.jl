#=

simdvec(x::Vec{N1,T}, y::Vec{N2,T}, z::Vec{N3,T}) where {N1, N2, N3, T<:SIMDNUMS} = 
    SIMD.Vec{N1+N2+N3,T}((x.data..., y.data..., z.data...))      
=#

function two_hilo_sum(a::Vec{N,T}, b::Vec{N,T}) where {N,T}
  hi = a + b
  lo = b - (hi - a)
  hi, lo
end

function two_sum(a::Vec{N,T}, b::Vec{N,T}) where {N,T}
  hi = a + b
  v  = hi - a
  lo = (a - (hi - v)) - (b - v)
  hi, lo
end

function two_hilo_diff(a::Vec{N,T}, b::Vec{N,T}) where {N,T}
  hi = a - b
  lo = (a - hi) - b
  hi, lo
end

function two_diff(a::Vec{N,T}, b::Vec{N,T}) where {N,T}
  hi = a - b
  v  = hi - a
  lo = (a - (hi - v)) - (b + v)
  hi, lo
end

function two_prod(a::Vec{N,T}, b::Vec{N,T}) where {N,T}
    hi = a * b
    lo = fma(a, b, -hi)
    hi, lo
end

# two_div, two_sqrt are as close to error-free as possible

function two_div(a::Vec{N,T}, b::Vec{N,T}) where {N,T}
    hi = a . b
    v  = fma(-hi, b, a)
    lo = v / b
    hi, lo
end

function two_sqrt(a::Vec{N,T}, b::Vec{N,T}) where {N,T}
    hi = sqrt(a)
    v = fma(-hi, hi, a)
    v = v * T(0.5)
    lo = v / hi
    hi, lo
end
