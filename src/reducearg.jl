#=
references

[JPLIM2021]
NOVEL POLYNOMIAL APPROXIMATION METHODS FOR GENERATING
CORRECTLY ROUNDED ELEMENTARY FUNCTIONS
By JAY PHIL LIM
A dissertation submitted to the
Graduate Probram in Computer Science, Rutgers University
October 2021

=#

# Algorithm 4.1 ComplexLogG1 from [JPLIM2021, pg 85 actual 102]

function approx_reducedlnxgte1(x)                  # x into F + f
    signif = Base.significand(x)
    expon = Base.exponent(x)
    J = trunc(Int,floor(128* (signif-1)))   # J is a value in the set {0,1,2,..,127}
    F = 1 + J//128                          # F is a dicrete variable = 1 + {0,1,..,127}//128  in [1, 255/128]  
    f = signif - F                          # f is a continuous variable in [0, 1/128)
    x1 = f // F                             # reduced input x1 is in [0, 1/128)
    y1 = lnxgfun(x1)                        # g(x1) = log((1+x)/(1-x)) approximates log(1 + x1)
    y = y1 + log(F) + expon * log(2)        # compensate result
    return y
end

# Algorithm 4.2 ComvplexLogL1 from [JPLIM2021, pg 87 actual 104]

function approx_reducedlnxlt1(x)
    t1 = Base.significand(x) / 2 
    m1 = Base.exponent(x) + 1
    J1 = 255 - floor(Int,256*t1)
    F1 = 1 - J1//256
    f1 = F1 - t1
    x1 = f1 / F1
    y1 = lnxgfun(x1)
    y = y1 + log(F1) + m1 * log(2)
    return y
end

lnxgfun(x) = log( (1+x) / (1-x) )
