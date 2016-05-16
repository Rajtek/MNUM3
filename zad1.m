function [Wynik, iteracje] = zad1(a,b,max_iter,epsilon,metoda)
%wyznaczanie miejsca zerowego, w przedziale a,b
%z metod� podan� w zmiennej metoda
%z podan� maksymaln� ilo�ci� iteracji max_iter
%z zadan� dok�adno�ci� epsilon

if funkcja_zad1(a)*funkcja_zad1(b)>0
    error('zly przedzial - f(a)*f(b)>0');
end
iteracje =0; %licznik iteracji
Wynik=zeros(max_iter,2); %alokacja pami�ci
for i=1:max_iter
    iteracje=iteracje+1; 
    switch metoda %wyb�r metody
        case 'bisekcja'
            Wynik(iteracje,1)=(a+b)*0.5; %wyznaczenie punktu �rodkowego i zapisanie w tablicy
            Wynik(iteracje,2)=funkcja_zad1(Wynik(iteracje,1)); %wyznaczenie warto�ci w punkcie
            if(funkcja_zad1(a)*Wynik(iteracje,2)<0) %decyzja o nowym przedziale na podstawie iloczynu
               b=Wynik(iteracje,1);
            else
               a=Wynik(iteracje,1);
            end

            end
            
        case 'sieczne'
            %wyznaczanie nowego punktu
            c=b-((funkcja_zad1(b)*(b-a))/(funkcja_zad1(b)-funkcja_zad1(a))); %wyznaczanie 
            %zast�pnie poprzednich warto�ci kolejnymi
            a=b;
            b=c;
            %decyzja kt�r� warto�c wybieramy jako wynik i zapisujemy j� w
            %tablicy
            if abs(funkcja_zad1(a))<abs(funkcja_zad1(b))
                 Wynik(iteracje,1)=a;
            else
                Wynik(iteracje,1)=b;
            end
            Wynik(iteracje,2)=funkcja_zad1(Wynik(iteracje,1));  

            end
        case 'Newton'
            %wyznaczanie przeci�cia stycznej w punkcie a
            %i zapisanie jej do tablicy
            Wynik(iteracje,1)=a-funkcja_zad1(a)/funkcja_poch_zad1(a);
            %wyliczenie warto�ci w tym punkcie
            Wynik(iteracje,2)=funkcja_zad1(Wynik(iteracje,1));
            %podstawienie nowego punktu
            a=Wynik(iteracje,1);
        otherwise
            error('B��dna metoda');
    end
    %sprawdzenie warunku ko�cowego
    if abs(Wynik(iteracje,2))<epsilon
        break;
    end
end
Wynik=Wynik(1:iteracje,:);%przyci�cie tablicy wynik�w

end