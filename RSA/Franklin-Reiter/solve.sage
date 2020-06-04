#!/usr/bin/env python3
from Crypto.Util.number import *

n = 57124473624902616044065979988819249036140530316973180074875001119231275147326719871403919744846198688737558128396539417074957372007789686062427617444105614835437812539883078394896682964275614408165850319708198699762827523049745856017199729338653146705021969485082337324426166398103493183216927789604406357783
c1 = 46224295431605226426888432216720822715246994322855442900606411738629283816285605672367414265647206727379522984911613227139211601079155316212971922332378721957535558298234488365771959314199066927559598839108255498007681928214445471432733608990245326000463672106039796485825352497682438941653913601043451729371
c2 = 22687511875816102465620608216595871468366946783276630882561288293252869218288322270555012615055027768186721312617737789555009172230550393688651143701808971982798961099804563418997791818389420529139197307741245334476688201202443012133990242756963820324289749822263893575755943829342528291617801810118344888636

def gcd(a, b):
    return a.monic() if b == 0 else gcd(b, a % b)

P.<x> = PolynomialRing(Zmod(n))

e = 257
f1 = x ^ e - c1
f2 = (87 * x + 1337) ^ e - c2
m = -gcd(f1, f2).coefficients()[0]
print(long_to_bytes(m))