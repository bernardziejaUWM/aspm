#20  Mini-projekt
#Pobierz dane z pliku https://github.com/pjastr/aspm2023/raw/main/temp.xlsx i załaduj je do RStudio jako ramkę danych.
#Wybierz dowolną stację pomiarową.
#Wykonaj polecenia dostępne w formularzu: https://forms.gle/2aC8cc2gsyPoPaiy7.
#Czas realizacji: 15.01.2024.

library("DescTools") #MeanAD
library(readxl) #read_excel
library(tidyr) #pivot
library(e1071) #skewness
url <- "https://github.com/pjastr/aspm2023/raw/main/temp.xlsx"
destfile <- "Dane_dlugie.xlsx"
curl::curl_download(url, destfile)
dane_dlugie <- read_excel(destfile, col_types = c("text", 
                                                  "numeric", "numeric"))
#zamiana na dane szerokie
dane_szerokie <- pivot_wider(dane_dlugie, names_from = "Nazwa Stacji Pomiarowej", values_from = "Temperatura")
#przypisanie wektorów
waw <- dane_szerokie$Warszawa
kra <- dane_szerokie$Kraków
gda <- dane_szerokie$Gdańsk
#średnia arytmetyczna
c_mean <- c(mean(waw), mean(kra), mean(gda))
#Odchylenie przeciętne
c_MeanAD <- c(MeanAD(waw), MeanAD(kra), MeanAD(gda))
#Mediana
c_median <- c(median(waw), median(kra), median(gda))
#Odchylenie standardowe
c_sd <- c(sd(waw), sd(kra), sd(gda))
#Kwartyle
c_kwartyle_waw <- quantile(waw)
c_kwartyle_kra <- quantile(kra)
c_kwartyle_gda <- quantile(gda)
#Klasyczny współczynnik asymetrii
c_skewness <- c(skewness(waw), skewness(kra), skewness(gda))
#Określenie typu rozkładu(symetryczny/asymetria lewostr./asymetria prawostr./trudno określić)
#Ap v Wsk = 0 - rozkład symetryczny
#Ap v Wsk > 0 - asymetria prawostronna
#Ap v Wsk < 0 - asymetria lewostronna
# 0 - 0,2 - asymetria bardzo słaba
# >0,8 - asymetria bardzo silna
#Kurtoza
#k = 0 - rozkłada ma taką koncentrację jak rozkład normalny
#k > 0 - koncentracja silniejsza
#k < 0 - koncentracja słabsza
c_kurtosis <- c(kurtosis(waw), kurtosis(kra), kurtosis(gda))
#prezentcja wyników
df_wyniki <- data.frame(
  Miasto = names(dane_szerokie)[2:4],
  Średnia = c_mean,
  `Odchylenie przeciętne` = c_MeanAD,
  Mediana = c_median,
  `Odchylenie standardowe` = c_sd,
  `Pierwszy kwartyl` = c(c_kwartyle_waw[2], c_kwartyle_kra[2], c_kwartyle_gda[2]),
  `Drugi kwaryl` = c(c_kwartyle_waw[3], c_kwartyle_kra[3], c_kwartyle_gda[3]),
  `Trzeci kwartyl` = c(c_kwartyle_waw[4], c_kwartyle_kra[4], c_kwartyle_gda[4]),
  Skośność = c_skewness,
  Kurtoza = c_kurtosis
)
