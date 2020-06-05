#!/usr/bin/env python3
from Crypto.Util.number import *

def gcd(a, b):
    return a.monic() if b == 0 else gcd(b, a % b)

n = 54847089125195789285913910923314718137180838906170786871644548797481971507277710605148260046746848035433193206617737640890844373957244372599904010214513836721013061625082524896797742564756800444767936669001511912202955557657552226492881275407906261921066096578192502781854585463452169607152118321803725402177
c1 = 21933719937033151271586966977105722938556070294916239458067734861773680152975688897930454577337490679246024226757283564896863252972620483502773051877351351683839047187387415592356120614948216276534985007899027616980444560926576440348522911768041758118369130619345756965497627922035799906938702711323851197293
c2 = 54495976468816515668280570636798587742966277905214668975288699497715801822997923601757460835785145690659034973268601664669124985338568590155720311156987348307531386084705119786241823876009356901735154725471504730481077782390811500926648689016338941656135436062255769276966282124153528267006456745133904596404
e = 3

# can't compute resultant if choose Zmod(n) as ring
# only use the constant part of PolynomialRing(Zmod(n), name='a')
P.<x,y> = PolynomialRing(PolynomialRing(Zmod(n), name='a'))

g1 = x ^ e - c1
g2 = (x + y) ^ e - c2

h = g1.resultant(g2, x)
h = h.univariate_polynomial()
h = h.change_ring(Zmod(n))
h = h.monic()
roots = h.small_roots(epsilon=1/30)

if roots:
    y = roots[0]
    P.<x> = PolynomialRing(Zmod(n))
    g1 = x ^ e - c1
    g2 = (x + y) ^ e - c2
    m = -gcd(g1, g2).coefficients()[0]
    print(long_to_bytes(m))