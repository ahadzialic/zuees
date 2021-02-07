function [ prorada_a, prorada_b, prorada_c ] = Zastita( Z1, Z2, Z3, Z4, Z_a, Z_b, Z_c )

Re = [real(Z1) real(Z2) real(Z3) real(Z4) real(Z1)];
Im = [imag(Z1) imag(Z2) imag(Z3) imag(Z4) imag(Z1)];

prorada_a = 0;
prorada_b = 0;
prorada_c = 0;

%eliminacija dijeljenja sa nulom
if (Re(1)-Re(2)) == 0
    Re(1) = Re(1) + 0.00001;
end
if (Re(2)-Re(3)) == 0
    Re(2) = Re(2) + 0.00001;
end
if (Re(3)-Re(4)) == 0
    Re(3) = Re(3) + 0.00001;
end
if (Re(4)-Re(1)) == 0
    Re(4) = Re(4) + 0.00001;
end

%odreðivanje pravaca poligona
k1 = (Im(1)-Im(2))/(Re(1)-Re(2));
n1 = Im(1) - k1*Re(1);
k2 = (Im(2)-Im(3))/(Re(2)-Re(3));
n2 = Im(2) - k2*Re(2);
k3 = (Im(3)-Im(4))/(Re(3)-Re(4));
n3 = Im(3) - k3*Re(3);
k4 = (Im(4)-Im(1))/(Re(4)-Re(1));
n4 = Im(4) - k4*Re(4);

%provjera pripadnosti poligonu
if (imag(Z_a) > k1*real(Z_a)+n1 && ((k2>0 && imag(Z_a) > k2*real(Z_a)+n2) || (k2<0 && imag(Z_a) < k2*real(Z_a)+n2)) && ((k4>0 && imag(Z_a) < k4*real(Z_a)+n4) || (k4<0 && imag(Z_a) > k4*real(Z_a)+n4)) && imag(Z_a) < k3*real(Z_a)+n3)
    prorada_a = 1;
end

if (imag(Z_b) > k1*real(Z_b)+n1 && ((k2>0 && imag(Z_b) > k2*real(Z_b)+n2) || (k2<0 && imag(Z_b) < k2*real(Z_b)+n2)) && ((k4>0 && imag(Z_b) < k4*real(Z_b)+n4) || (k4<0 && imag(Z_b) > k4*real(Z_b)+n4)) && imag(Z_b) < k3*real(Z_b)+n3)
    prorada_b = 1;
end

if (imag(Z_c) > k1*real(Z_c)+n1 && ((k2>0 && imag(Z_c) > k2*real(Z_c)+n2) || (k2<0 && imag(Z_c) < k2*real(Z_c)+n2)) && ((k4>0 && imag(Z_c) < k4*real(Z_c)+n4) || (k4<0 && imag(Z_c) > k4*real(Z_c)+n4)) && imag(Z_c) < k3*real(Z_c)+n3)
    prorada_c = 1;
end

figure
plot(Re, Im)
hold on
plot(real(Z_a), imag(Z_a), 'r*')
plot(real(Z_b), imag(Z_b), 'g*')
plot(real(Z_c), imag(Z_c), 'b*')
legend('Poligonalna karakteristika', 'Za', 'Zb', 'Zc');
grid on

end
