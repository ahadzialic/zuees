function [ kvar, udaljenost ] = vrstaKvara(prorada_a, prorada_b, prorada_c, Ua, Ub, Uc, Ia, Ib, Ic, f_fund, Z0_line, Z1_line)

a=exp(2i*pi/3);

I0=1/3*(Ia+Ib+Ic);
I1=1/3*(Ia+a*Ib+a*a*Ic);
I2=1/3*(Ia+a*a*Ib+a*Ic);
   
U0=1/3*(Ua+Ub+Uc);
U1=1/3*(Ua+a*Ub+a*a*Uc);
U2=1/3*(Ua+a*a*Ub+a*Uc);

k01 = (Z0_line/Z1_line);
k0 = (Z0_line-Z1_line)/(3*Z1_line);

Z1 = 0;

%odreðivanje vrste kvara
kvar = '';
if (prorada_a == 1 && prorada_b == 1 && prorada_c == 1)
    kvar = 'Trofazni KS';
    Z1 = U1/I1;
elseif (prorada_a == 1 && prorada_b == 1) 
    kvar = 'Dvofazni KS';
    Z1 = (Ua-Ub)/(Ia-Ib);
elseif (prorada_a == 1 && prorada_c == 1)
    kvar = 'Dvofazni KS';
    Z1 = (Uc-Ua)/(Ic-Ia);
elseif (prorada_b == 1 && prorada_c == 1)
    kvar = 'Dvofazni KS';
    Z1 = (Ub-Uc)/(Ib-Ic);
elseif (prorada_a == 1)
    kvar = 'Jednofazni KS';
    Z1 = Ua/(Ia+3*k0*I0);
elseif (prorada_b == 1)
    kvar = 'Jednofazni KS';
    Z1 = Ub/(Ib+3*k0*I0);
elseif (prorada_c == 1)
    kvar = 'Jednofazni KS';
    Z1 = Uc/(Ic+3*k0*I0);
end

udaljenost = abs(Z1/Z1_line);

end

