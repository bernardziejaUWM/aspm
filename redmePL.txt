Zadanie zaliczeniowe - Analiza struktur procesów masowych - UWM w Olsztynie

Treść zadania:
Pobierz dane z pliku https://github.com/pjastr/aspm2023/raw/main/temp.xlsx i załaduj je do RStudio jako ramkę danych.
Wybierz dowolną stację pomiarową.
Wykonaj polecenia dostępne w formularzu: https://forms.gle/2aC8cc2gsyPoPaiy7.
Czas realizacji: 15.01.2024.

Rozwiążanie:
Zadanie wykonane zostało w RStudio, z wykorzystaniem dodatkowych bibliotek: DescTools, readxl, tidyr, e1071.
W pierwszej kolejności wczytałem dane w formacie xlsx z podanego linku.
Ponieważ były to dane "długie" w kolejnym kroku za pomocom finkcji pivot_wider zamieniłem je do postaci "szerokiej", co znacznie ułatwiło dalszą pracę.
Następnie dla przejżystości zapisu utworzyłem 3 zmienne dla danych z poszczególnych stacji: waw, kra oraz gda.
Mimo iż zadanie można było wykonać tylko dla jednej, wybranej stacji ja postanowiłem wykonać obliczenia dla wszystkich stacji,
a wyniki zapisywać do odpowiednich wektorów.
W ten sposób obliczyłem: Średnią arytmetyczną, Odchylenie przeciętne, Medianę, Odchylenie standardowe, Kwantyle(Kwartyle), Klasyczny współczynnik asymetrii (skośność) oraz Kurtozę.
Wyniki umieściłem w ramce danych.
Dodatkowo stworzyłem wykresy dla wybranej stacji Kraków: histogram oraz wykres gęstości.
Wnioski:
Współczynnik asymetrii wynoszący -0.07722759 świadczy o bardzo słabej asymetrii lewostronnej, co widać również na wykresie - dane są lekko przesunięte w prawą stronę wykresu.
Kurtoza -1.010827 świadczy o delikatnie słabszej koncentracji danych co zdaje się być normalne dla temperatur z okresu 30 dni.
