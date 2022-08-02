function one_abs(a::Vec{N,T}) where {N,T}
  abs(a)
end

function one_neg(a::Vec{N,T}) where {N,T}
  -abs(a)
end

maxmin(a::Vec{N,T}, b::Vec{N,T}) where {N,T} =
    max(a,b), min(a,b)

function maxminmag((a::Vec{N,T}, b::Vec{N,T}) where {N,T} 
    absa = abs(a)
    absb = abs(b)
    amax = absa > absb
    bmax = ~(amax)
    throw(ErrorException("Not Implemented"))
end

function two_hilo_sum(a::Vec{N,T}, b::Vec{N,T}) where {N,T}
  hi = a + b
  lo = b - (hi - a)
  hi, lo
end

function two_sum(a::Vec{N,T}, b::Vec{N,T}) where {N,T}
  hi = a + b
  v  = hi - a
  lo = (a - (hi - v)) + (b - v)
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

# two_recip, two_div, two_sqrt are as close to error-free as possible

function two_recip(b::Vec{N,T}) where {N,T}
    hi = one(T) / b
    v  = -hi * b
    lo = v / b
    hi, lo
end

function two_div(a::Vec{N,T}, b::Vec{N,T}) where {N,T}
    hi = a / b
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
