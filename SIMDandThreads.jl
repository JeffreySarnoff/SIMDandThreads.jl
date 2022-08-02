module SIMDandThreads

import SIMD
import VectorizationBase as VBASE
import LoopVectorization as VLOOP
import ErrorfreeArithmetic as EFA

include("simd_vectors.jl")
include("simd_arith.jl")
include("simd_fma.jl")

include("errorfree.jl")


end  # SIMDandThreads
