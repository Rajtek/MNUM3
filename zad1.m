function [Wynik, iteracje] = zad1(a,b,max_iter,epsilon,metoda)
%wyznaczanie miejsca zerowego, w przedziale a,b
%z metod� podan� w zmiennej metoda
%z podan� maksymaln� ilo�ci� iteracji max_iter
%z zadan� dok�adno�ci� epsilon

if funkcja_zad1(a)*funkcja_zad1(b)>0
    error('zly przedzial - f(a)*f(b)>0');
end
iteracje =0;
Wynik=zeros(max_iter,2);
for i=1:max_iter
    iteracje=iteracje+1;
    switch metoda
        case 'bisekcja'
            Wynik(iteracje,1)=(a+b)*0.5;
            Wynik(iteracje,2)=funkcja_zad1(Wynik(iteracje,1));
            if(funkcja_zad1(a)*Wynik(iteracje,2)<0)
               b=Wynik(iteracje,1);
            else
               a=Wynik(iteracje,1);
            end
            if( abs(a-b)<epsilon)
                break;
            end
            
        case 'sieczne'
            c=b-((funkcja_zad1(b)*(b-a))/(funkcja_zad1(b)-funkcja_zad1(a)));
           
            a=b;
            b=c;
            if abs(funkcja_zad1(a))<abs(funkcja_zad1(b))
                 Wynik(iteracje,1)=a;
            else
                Wynik(iteracje,1)=b;
            end
            Wynik(iteracje,2)=funkcja_zad1(Wynik(iteracje,1));
            
            if(abs(a-b)<epsilon)
                break;
            end
        case 'Newton'
            Wynik(iteracje,1)=a-funkcja_zad1(a)/funkcja_poch_zad1(a);
            Wynik(iteracje,2)=funkcja_zad1(Wynik(iteracje,1));
            a=Wynik(iteracje,1);
        otherwise
            error('B��dna metoda');
    end
    
    if abs(Wynik(iteracje,2))<epsilon
        break;
    end
    
    
end
Wynik=Wynik(1:iteracje,:);
iteracje
end