def mod_pow (base, exponent , mod):
	result = 1
	while (exponent >0):
	   if ( exponent % 2 == 1 ):
	       result = (result*base)% mod
	   exponent = exponent >> 1
	   base = (base^2) % mod
	return result

print ( mod_pow(808017424794512875886459904961710757005754368000000000,808017424794512875886459904961710757005754368000000000,2013))
