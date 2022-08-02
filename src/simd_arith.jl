function add_dddd_dd(xhi::Vec{N,T}, xlo::Vec{N,T}, yhi::Vec{N,T}, ylo::Vec{N,T}) where {N,T}
  s, e = two_sum(xhi, yhi)
  w = xlo + ylo
  e = e + w
  two_hilo_sum(s, e)
end

function add_dddd_dd(xhilo::Vec{N,T}, yhilo::Vec{N,T}) where {N,T}
  xhi, xlo = xhilo
  s, e = two_sum(xhilo, yhi)
  w = xlo + ylo
  e = e + w
  rhi, rlo = two_hilo_sum(s, e)
  rhi, rlo
end
