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

# Algorithm 4.1 ComplexLogG1 from [JPLIM2021]

function reducedlnxgte1(x)
    signif = Base.significand(x)
    expon = Base.exponent(x)
    J = trunc(Int,floor(128* (signif-1)))
    F = 1 + J//128
    f = signif - F
    x1 = f / F
    y1 = log((1+x1)/(1-x1))
    y = y1 + log(F) + expon * log(2)
    return y
end
