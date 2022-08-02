module SIMDandThreads

import SIMD
import VectorizationBase as VBASE
import LoopVectorization as VLOOP
import ErrorfreeArithmetic as EFA

const SIMDNUMS = Union{UInt32, UInt64, Int32, Int64, Float32, Float64} 

include("errorfree.jl")

include("simd_vectors.jl")
include("simd_errorfree.jl")
include("simd_arith.jl")
include("simd_fma.jl")

include("simd_ddprearith.jl")
include("simd_ddarith.jl")



end  # SIMDandThreads
