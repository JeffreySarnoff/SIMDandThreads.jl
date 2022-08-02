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
  p1, p2 = two_prod(x
