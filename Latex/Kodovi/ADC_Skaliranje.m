function [ skalirani_signal ] = ADC_Skaliranje( signal, ADrez, ADmax, ADmin )

k = (ADmax - ADmin) / (2^(ADrez)-1);
n = ADmin;
skalirani_signal = k*signal+n;

end

