#Defining the new class of errors
class UnsupportedDestinationCurrency < StandardError; end

class Numeric
#A hash table of all money conversions FROM ... TO ..
 #@@currencies =  {'dollar'=>{ 'dollar'=> 1, 'yen'=> 76.92, 'euro'=> 1.292,'rupee'=>52.63}, 'yen'=> {'dollar'=>0.013, 'yen'=>1, 'euro'=>0.01, 'rupee'=>0.684}, 'euro'=>{'dollar'=> 0.77, 'yen'=> 0.01, 'euro'=>1, 'rupee'=>0.01463}, 'rupee'=>{'dollar'=>52.63, 'yen'=> 0.68419, 'euro'=> 67.997,'rupee'=>1}}

@@currencies = @@currencies = {'dollar'=>1, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}

 def method_missing(method_id, *args, &block)
   singular_currency = method_id.to_s.gsub( /s$/, '') # return copy with filter
   if @@currencies.has_key?(singular_currency)
     self*@@currencies [singular_currency]
   else
     super
   end
 end


 def in(destination_currency)

	#mAKING SURE THE CURRENCY IS A STRING AND COMPATIBLE WITH THE TABLE
	destination_currency = destination_currency.to_s.gsub( /s$/, '')


	#Processing
	if @@currencies.key?(destination_currency)
	   result = self / @@currencies[destination_currency].round(3)
	else
	   raise UnsupportedDestinationCurrency
	end
  
   result
  end

end

p "6 Dollars is: "+6.dollar.in(:euro).to_s+"in Euros"
p "8 Euros is equivalent to:"+8.euro.in(:dollar).to_s+"in Dollars"
