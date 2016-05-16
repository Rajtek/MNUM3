function [Wynik, iteracje] = zad1(a,b,max_iter,epsilon,metoda)
%wyznaczanie miejsca zerowego, w przedziale a,b
%z metod¹ podan¹ w zmiennej metoda
%z podan¹ maksymaln¹ iloœci¹ iteracji max_iter
%z zadan¹ dok³adnoœci¹ epsilon

if funkcja_zad1(a)*funkcja_zad1(b)>0
    error('zly przedzial - f(a)*f(b)>0');
end
iteracje =0; %licznik iteracji
Wynik=zeros(max_iter,2); %alokacja pamiêci
for i=1:max_iter
    iteracje=iteracje+1; 
    switch metoda %wybór metody
        case 'bisekcja'
            Wynik(iteracje,1)=(a+b)*0.5; %wyznaczenie punktu œrodkowego i zapisanie w tablicy
            Wynik(iteracje,2)=funkcja_zad1(Wynik(iteracje,1)); %wyznaczenie wartoœci w punkcie
            if(funkcja_zad1(a)*Wynik(iteracje,2)<0) %decyzja o nowym przedziale na podstawie iloczynu
               b=Wynik(iteracje,1);
            else
               a=Wynik(iteracje,1);
            end

            end
            
        case 'sieczne'
            %wyznaczanie nowego punktu
            c=b-((funkcja_zad1(b)*(b-a))/(funkcja_zad1(b)-funkcja_zad1(a))); %wyznaczanie 
            %zast¹pnie poprzednich wartoœci kolejnymi
            a=b;
            b=c;
            %decyzja któr¹ wartoœc wybieramy jako wynik i zapisujemy j¹ w
            %tablicy
            if abs(funkcja_zad1(a))<abs(funkcja_zad1(b))
                 Wynik(iteracje,1)=a;
            else
                Wynik(iteracje,1)=b;
            end
            Wynik(iteracje,2)=funkcja_zad1(Wynik(iteracje,1));  

            end
        case 'Newton'
            %wyznaczanie przeciêcia stycznej w punkcie a
            %i zapisanie jej do tablicy
            Wynik(iteracje,1)=a-funkcja_zad1(a)/funkcja_poch_zad1(a);
            %wyliczenie wartoœci w tym punkcie
            Wynik(iteracje,2)=funkcja_zad1(Wynik(iteracje,1));
            %podstawienie nowego punktu
            a=Wynik(iteracje,1);
        otherwise
            error('B³êdna metoda');
    end
    %sprawdzenie warunku koñcowego
    if abs(Wynik(iteracje,2))<epsilon
        break;
    end
end
Wynik=Wynik(1:iteracje,:);%przyciêcie tablicy wyników

end