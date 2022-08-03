# from Chris Elrod

function findminmax(f::F, x) where {F}
   T = Base.promote_eltype(x)
   minind = 0
   maxind = 0
   minval = typemax(T)
   maxval = typemin(T)
   @inbounds for i = eachindex(x)
       fx = f(x[i])
       gt = fx > maxval
       lt = fx < minval
       maxval = gt ? fx : maxval
       minval = lt ? fx : minval
       maxind = gt ?  i : maxind
       minind = lt ?  i : minind
   end
   minind, maxind
end

function findminmax_turbo(f::F, x) where {F}
    T = Base.promote_eltype(x)
    minind = 0
    maxind = 0
    minval = typemax(T)
    maxval = typemin(T)
    @turbo for i = eachindex(x)
       fx = f(x[i])
       gt = fx > maxval
       lt = fx < minval
       maxval = gt ? fx : maxval
       minval = lt ? fx : minval
       maxind = gt ?  i : maxind
       minind = lt ?  i : minind
    end
    minind, maxind
end
