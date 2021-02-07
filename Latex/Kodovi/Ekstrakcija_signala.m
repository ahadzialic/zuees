function [ A, fi ] = Ekstrakcija_signala( uzorci, N, odUzorka, Ts, ff )

Y = uzorci';
%formiranje matrice podataka
ksi = ones(N, 13);

w = 2*pi*ff;
for i=odUzorka:N
    %vrijednosti prvih 5 komponenti harmonijskog signala
    for j = 0:4
        ksi(i, 2*j+1) = sin((j+1)*w*Ts*i);
        ksi(i, 2*j+2) = cos((j+1)*w*Ts*i); 
    end
    %vrijednosti prva tri èlana Taylorovog razvoja DC komponente
    ksi(i, 12) = -Ts*i;
    ksi(i, 13) = (Ts*i)*(Ts*i);
end

%raèunanje koeficijenata LS metodom 
K = ksi' * ksi;
K = inv(K);
K = K * ksi';
K = K * Y;

%amplituda i faza fundamentalne komponente
fi = atan2(K(2), K(1));
A = K(2)/sin(fi);

end

