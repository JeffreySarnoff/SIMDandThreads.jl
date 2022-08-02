#=


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


function two_prod(a::Vec{N,T}, b::Vec{N,T}) where {N,T}
    hi = a * b
    lo = fma(a, b, -hi)
    hi, lo
end

=#


function add_dddd_dd(xhi::Vec{N,T}, xlo::Vec{N,T}, yhi::Vec{N,T}, ylo::Vec{N,T}) where {N,T}
  s, e = two_sum(xhi, yhi)
  w = xlo + ylo
  e = e + w
  two_hilo_sum(s, e)
end

function add_dddd_dd(xhilo::Vec{2,T}, yhilo::Vec{2,T}) where {T}
  xhi, xlo = xhilo
  yhi, ylo = yhilo
  s, e = two_sum(xhilo, yhi)
  w = xlo + ylo
  e = e + w
  rhi, rlo = two_hilo_sum(s, e)
  rhi, rlo
end

function add_dddd_dd(xhilo::Vec{4,T}, yhilo::Vec{4,T}) where {T}
  ?
  s, e = two_sum(xhilo, yhi)
  w = xlo + ylo
  e = e + w
  rhi, rlo = two_hilo_sum(s, e)
  rhi, rlo
end

function mul_dddd_dd(xhilo::Vec{N,T}, yhilo::Vec{N,T}) where {N,T}
  xhi, xlo = xhilo
  yhi, ylo = yhilo
  pi, p2 = two_prod(xhi, yhi)
  w1 = xhi * ylo
  w2 = xlo * yhi
  w3 = w1 * w2
  p2 = p2 * w3
  two_hilo_sum(p1, p2)
end
