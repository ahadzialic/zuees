function [ prorada_a, prorada_b, prorada_c, kvar, udaljenost ] = Glavna_funkcija( UA, UB, UC, IA, IB, IC, Z1, Z2, Z3, Z4, fs, f_fund, ADrez, ADmin, ADmax, Z0_line, Z1_line )

Ts = 1/fs;

%skaliranje AD konvertora
Ua = ADC_Skaliranje(UA, ADrez, ADmax, ADmin);
Ub = ADC_Skaliranje(UB, ADrez, ADmax, ADmin);
Uc = ADC_Skaliranje(UC, ADrez, ADmax, ADmin);
Ia = ADC_Skaliranje(IA, ADrez, ADmax, ADmin);
Ib = ADC_Skaliranje(IB, ADrez, ADmax, ADmin);
Ic = ADC_Skaliranje(IC, ADrez, ADmax, ADmin);

%formiranje vremenskog horizonta
t = 0:size(Ua, 2)-1;
t = t/fs;

%ekstrakcija fazora struja i napona
odUzorka = 1;
[UA_a, Uphi_a] = Ekstrakcija_signala(Ua, odUzorka+size(t, 2)-1, odUzorka, Ts, f_fund);
[UA_b, Uphi_b] = Ekstrakcija_signala(Ub, odUzorka+size(t, 2)-1, odUzorka, Ts, f_fund);
[UA_c, Uphi_c] = Ekstrakcija_signala(Uc, odUzorka+size(t, 2)-1, odUzorka, Ts, f_fund);
[IA_a, Iphi_a] = Ekstrakcija_signala(Ia, odUzorka+size(t, 2)-1, odUzorka, Ts, f_fund);
[IA_b, Iphi_b] = Ekstrakcija_signala(Ib, odUzorka+size(t, 2)-1, odUzorka, Ts, f_fund);
[IA_c, Iphi_c] = Ekstrakcija_signala(Ic, odUzorka+size(t, 2)-1, odUzorka, Ts, f_fund);

Ia = IA_a*exp(1j*Iphi_a);
Ib = IA_b*exp(1j*Iphi_b);
Ic = IA_c*exp(1j*Iphi_c);
Ua = UA_a*exp(1j*Uphi_a);
Ub = UA_b*exp(1j*Uphi_b);
Uc = UA_c*exp(1j*Uphi_c);

%odreðivanje impedansi faza
Z_a = Ua/Ia;
Z_b = Ub/Ib;
Z_c = Uc/Ic;

%pokretanje zatite
[prorada_a, prorada_b, prorada_c] = Zastita( Z1, Z2, Z3, Z4, Z_a, Z_b, Z_c );

%vrsta i udaljenost kvara
[kvar, udaljenost] = vrstaKvara(prorada_a, prorada_b, prorada_c, Ua, Ub, Uc, Ia, Ib, Ic, f_fund, Z0_line, Z1_line);


end

