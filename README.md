
UNIVERSITATEA „ALEXANDRU IOAN CUZA “DIN IAȘI







Analiza statistică a factorilor de influență a producției de orez în Indonezia 




Student:
Buliga Andreea





IAȘI 2022


CUPRINS


1.	Introducere	
2.	Prezentarea bazei de date	
2.1.	Operațiuni preliminare și de transformare a variabilelor	
2.2.	Prezentarea bazei de date dataset_rice	
3.	Analiza grafică și numerică a variabilelor analizate	
3.1.	Analiza descriptivă numerică a variabilelor numerice și nenumerice	
3.2.	Analiza grafică a variabilelor numerice și nenumerice	
3.3.	Identificarea outlierilor și eliminarea acestora din bază (sau înlocuirea lor cu valori lipsă)	
4.	Analiza statistică a variabilelor categoriale	
4.1.	Tabelarea datelor (obținere frecvențe marginale, condiționate, parțiale)	
4.2.	Analiza de asociere	
4.3.	Analiza de concordanță	
5.	Analiza de regresie și de corelație	
5.1.	Analiza de corelație	
5.2.	Analiza de regresie	
5.2.1.	Regresie liniară simplă și multiplă	
5.2.2.	Regresia neliniară	
5.2.3.	Compararea a două modele de regresie și alegerea celui mai bun model	
6.	Estimarea și testarea mediilor	
6.1.	Estimarea mediei prin interval de încredere	
6.2.	Testarea mediilor populației	
6.2.1.	Testarea unei medii cu o valoare fixă	
6.2.2.	Testarea diferentei dintre doua medii (fie cu esantioane independente, fie cu esantioane perechi)	
6.2.3.	Testarea diferenței dintre trei sau mai multe medii	
7.	Concluzii	



Introducere

Scopul
          Scopul acestei lucrări este analiza factorilor de influență a producției de orez în Indonezia. 
Obiectivul
            Principalul obiectiv al acestui studiu este analiza descriptivă și inferențială a datelor, cu ajutorul mediului de programare, Rstudio, conceput pentru analiză statistică. 
Conținutul
       În primă fază, se va realiza o scurtă prezentare a bazei de date inițiale, RiceFarms, după care se vor extrage variabilele care vor fi utilizate pe parcursul acestui studiu. Astfel, se va lucra cu trei variabile cantitative și două variabile calitative. Asupra acestei baze de date se vor realiza câteva operații preliminare, iar apoi noua bază de date va fi exportată. Această nouă bază de date are numele dataset_rice și va fi utilizată pe parcursul întregului proiect. Aceasta, la rândul ei, va fi prezentată în mod amănunțit. 
       În continuare, se va efectua o analiză grafică și numerică a variabilelor alese, astfel că prima dată se realizează o analiză descriptivă a variabilelor numerice, fiind urmată de analiza indicatorilor descriptivi pe grupuri, analiza grafică a variabilelor numerice și nenumerice și identificarea outlierilor și eliminarea acestora din bază. 
      Se vor analiza statistic variabilele categoriale prin: tabelarea datelor – obținerea frecvențelor absolute, parțiale, relative condiționate, relative marginale, analiza de asociere și analiza de concordanță. 
       Pe lângă acestea, va fi realizată o analiză de corelație prin analiza de covarianță, matricea corelațiilor și testarea coeficienților de corelație. De asemenea, este nelipsită analiza de regresie, care se înfăptuiește prin regresia liniară simplă, multiplă, neliniară și compararea a două modele de regresie și alegerea celui mai bun model.        
        Ultimul capitol este destinat estimării și testării mediilor, astfel că se va realiza estimarea mediei prin interval de încredere și se va pune accent pe testarea mediilor populatiei, prin testarea unei medii cu o valoare fixă, testarea diferenței dintre două medii și testarea diferentei dintre trei sau mai multe medii. 



Prezentarea bazei de date

                 Baza de date “RiceFarms” , care face parte din pachetul “plm”, având titlul “Production of Rice in Indonesia” a fost extrasă de pe site-ul:
https://vincentarelbundock.github.io/Rdatasets/datasets.html . 
                Baza de date inițială conține 1026 de observații și 21 de variabile:
	Nr.crt
	id - identificatorul fermei
	size - suprafața totală cultivată cu orez, măsurată în hectare
	status- statutul terenului, unul dintre 'owner', 'share' , 'mixed'
	varieties- soiuri: 'trad'(soiuri tradiționale), 'high'(soiuri cu randament ridicat) și 'mixed'(soiuri mixte)
	bimas - este un program de intensificare; unul dintre 'no'(fermier non-bimas), 'yes'(fermier bimas) sau 'mixed'(o parte, dar nu tot terenul fermierului a fost înregistrat pentru a fi în programul bimas)
	seed- semințe de orez plantate (în kilograme)
	urea- uree în kilograme
	phosphate- fosfat în kilograme
	pesticide - costul pesticidelor în Rupiah
	pseed- prețul semințelor în rupie pe kg
	purea - prețul ureei în rupie pe kg
	pphosph- prețul fosfatului în rupie pe kg
	hiredlabor- forță de muncă în ore
	famlabor- munca de familie in ore
	totlabor- totalul forței de muncă (excluzând forța de recoltare)
	wage- salariul muncii în rupie pe oră
	goutput- producția brută de orez în kg
	noutput-  producția netă, producția brută minus costul de recoltare
	price- prețul orezului brut în rupie indoneziană pe kg
	region- regiunile 'wargabinangun', 'langan', 'gunungwangi', 'malausma', 'sukaambit', 'ciwangi'



    Din această bază de date am extras 5 variabile pe care le voi utiliza pentru a îndeplini scopul lucrării. 
   Variabile cantitative:
- size - suprafața totală cultivată cu orez, măsurată în hectare   (variabila independentă)
- seed- semințe de orez plantate (în kilograme)  (variabila independentă)
- goutput- producția brută de orez în kg (variabilă dependentă)

          Variabile calitative:
- region- regiunile 'wargabinangun', 'langan', 'gunungwangi', 'malausma', 'sukaambit', 'ciwangi'
- price_interval- intervale de preț ale orezului brut în rupie indoneziană pe kg 

  „Price_interval” este o variabilă obținută prin transformarea variabilei numerice ‚price’ într-o variabilă categorială și este exprimată în patru intervale specifice: „preț scăzut”, „preț acceptabil”, „preț ridicat”, „preț foarte ridicat”. 

 
	Operațiuni preliminare și de transformare a variabilelor

În primă fază, verific dimensiunea bazei de date. 
dim(ricefarms)
 
Baza de date conține 1026 de obervații și 21 de variabile. 

O primă operațiune efectuată asupra bazei de date este eliminarea valorilor lipsă „NA”, în cazul în care există. 
##eliminam NA
rice<-na.omit(ricefarms)

Verific, din nou, dimensiunea bazei de date. 
dim(rice)
 
După cum se poate oberva, numărul de observații și de variabile a rămas la fel, ceea ce înseamnă că nu există valori lipsă în baza de date ricefarms.
În continuare, efectuez selecția celor 5 variabile: size, seed, goutput, price, region, și aplic condiții pentru 3 dintre acestea(size, seed, goutput): 
##conditii variabile
dataset_rice<-subset(rice, select=c(size, seed, goutput, price, region),
                     size>=0.5 & seed>=10 & goutput<10000)

Noua bază de date este numită „dataset_rice” și este exportată astfel:
write.csv(dataset_rice, "D:/MASTER/Introducere in R/Proiect/dataset_rice.csv")

Clasele variabilelor pot fi vizualizate astfel:
##clasele variabilelor
sapply(dataset_rice, class)
 

Având în vedere că există doar o variabilă nenumerică, voi transforma variabila numerică price într-o variabilă categorială price_interval cu patru categorii:
0-60           preț scazut
60-100       preț acceptabil
100-150     preț ridicat
150-200     preț foarte ridicat

##variabila categoriala price_interval
dataset_rice$price_interval<-cut(dataset_rice$price,c(0,60,100,150,200),
     c('pret_scazut','pret_acceptabil','pret_ridicat', 'pret_foarte_ridicat'))

Voi transforma și variabila character region într-o variabilă factorială.
##variabila factoriala region
dataset_rice$region<-as.factor(dataset_rice$region)

#nivelele variabilei
levels(dataset_rice$region
 

	Prezentarea bazei de date dataset_rice

   Având în vedere operațiunile efectuate la subpunctul anterior, baza de date finală este dataset_rice, care conține:
	3 variabile numerice:  size, seed, goutput, dintre care două sunt de tip integer(seed, goutput) 
	2 variabile nenumerice: o variabilă factorială cu 4 categorii, price_interval, care a fost obținută din variabila price, și o variabilă categorială, region, cu 6 categorii:
'ciwangi',  'gunungwangi', 'langan',  'malausma', 'sukaambit', 'wargabinangun'. 

Baza de date inițială conținea 1026 de observații și 20 de variabile. Baza de date dataset_rice cuprinde 259 de observații și 5 variabile. 

	Dimensiunea setului de date dataset_rice
dim(dataset_rice)
 

	Structura setului de date dataset_rice
str(dataset_rice)
 
	Denumirea coloanelor
names(dataset_rice)
 
	Categoriile variabilelor nenumerice
-variabila region
levels(dataset_rice$region)
 

-variabila price_interval
levels(dataset_rice$price_interval)
 













Analiza grafică și numerică a variabilelor analizate

	Analiza descriptivă numerică a variabilelor numerice și nenumerice

Analiza descriptivă a variabilelor numerice
Metodele prin care se poate realiza analiza descriptivă a variabilelor numerice sunt summary sau describe. Voi crea un subset de date subset_rice, care să conțină cele trei variabile numerice, pentru a se aplica funcția asupra celor trei variabile simultan. 

subset_rice=subset(dataset_rice,select=c(size, seed, goutput))
summary(subset_rice)
 

##sau
describe(subset_rice)
 


Interpretări

Variabila size
Suprafața minimă (Min.) cultivată cu orez este 0,5000 hectare, iar suprafața maximă (Max.) cultivată cu orez este 3,6430 hectare. În medie (Mean), suprafața cultivată cu orez este 0,8813 hectare.
Q1- quartila 1- indică faptul că 25% din suprafața cultivată cu orez are de până la 0,5710 hectare, iar 75% din suprafața cultivată cu orez are de peste 0,5710 hectare. 
Q3-quartila 3-indică faptul că 75% din suprafața cultivată de orez are de până la 1 hectar, iar 25% din suprafața cultivată de orez are de peste 1 hectar. 
Mediana indică faptul că 50% din suprafața cultivată cu orez are de până la 0,7140 hectare, iar 50% din suprafața cultivată cu orez are de peste 0,7140 hectare.

Variabila seed
Cantitatea minimă (Min.) de semințe de orez plantate este de 10 kg, iar cantitatea maximă (Max.) de semințe de orez plantate este de 200 kg. În medie (Mean), cantitatea de semințe de orez plantate este de 32,98 kg.
Q1- quartila 1- indică faptul că 25% din cantitatea de semințe de orez plantate este de până la 20 kg, iar 75% din cantitatea de semințe de orez plantate este de peste 20 kg.
Q3-quartila 3- indică faptul că 75% din cantitatea semințe de orez plantate are de până la 40 kg, iar 25% din cantitatea de semințe de orez plantate este de peste 40 kg.
Mediana indică faptul că 50% din cantitatea de semințe de orez plantate are de până la 25 kg, iar 50% din cantitatea de semințe de orez plantate are de peste 25 kg.

Variabila goutput
Cantitatea minimă (Min.) de orez produsă este de 473 de kg, iar cantitatea maximă (Max.) de orez produsă este de 9000 kg. În medie (Mean), cantitatea de orez produsă este de 2691 kg. 
Q1-quartila 1- indică faptul că 25% din cantitatea de orez produsă este de până la 1612 kg, iar 75% din cantitatea de orez produsă este de peste 1612 kg. 
Q3- quartila 3- indică faptul că 75% din cantitatea de orez produsă este de până la 3465 kg, iar 25% din cantitatea de orez produsă este de peste 3465 kg.
Mediana indică faptul că 50% din cantitatea de orez produsă are de până la 2224 kg, iar 50% din cantitatea de orez produsă este de peste 2224 kg. 

Analiza indicatorilor descriptivi pe grupuri

describeBy(dataset_rice$goutput, group=dataset_rice$price_interval, digits=4)

 

În prima categorie – pret_scazut, se găsesc 68 de producții brute de orez. Media cantității de orez produse este 2398,72 kg. De asemenea, 50% dintre producțiile de orez din categoria pret_scazut au cantitatea de până la 1833,5 kg, iar 50% dintre producțiile de orez din categoria pret_scazut, au cantitatea de peste 1833.5 kg. 
Pentru această categorie de preț, cantitatea minimă de orez produsă este de 800 kg, iar cantitatea maximă de orez produsă este de 7980 kg. 

În cea de-a doua categorie – pret_acceptabil, se găsesc 115 producții brute de orez. . Media cantității de orez produse este 2455,83 kg. De asemenea, 50% dintre producțiile de orez din categoria pret_scazut au cantitatea de până la 2093 kg, iar 50% dintre producțiile de orez din categoria pret_acceptabil, au cantitatea de peste 2093 kg. 
Pentru această categorie de preț, cantitatea minimă de orez produsă este de 473 kg, iar cantitatea maximă de orez produsă este de 9000 kg. 

În cea de-a treia categorie – pret_ridicat, se găsesc 50 de producții brute de orez. . Media cantității de orez produse este 3819,36 kg. De asemenea, 50% dintre producțiile de orez din categoria pret_ridicat au cantitatea de până la 3452,5 kg, iar 50% dintre producțiile de orez din categoria pret_scazut, au cantitatea de peste 3452,5 kg. 
Pentru această categorie de preț, cantitatea minimă de orez produsă este de 1375 kg, iar cantitatea maximă de orez produsă este de 9000 kg. 

În cea de-a patra categorie – pret_foarte_ridicat, se găsesc 26 de producții brute de orez. . Media cantității de orez produse este 2324,88 kg. De asemenea, 50% dintre producțiile de orez din categoria pret_foarte_ridicat au cantitatea de până la 2319,5 kg, iar 50% dintre producțiile de orez din categoria pret_scazut, au cantitatea de peste 2319,5 kg. 
Pentru această categorie de preț, cantitatea minimă de orez produsă este de 1027 kg, iar cantitatea maximă de orez produsă este de 4400 kg.

	Analiza grafică a variabilelor numerice și nenumerice

##analiza grafica a variabilelor numerice
hist(dataset_rice$size, xlab = 'suprafata totală cultivată cu orez, măsurată în hectare')
 










hist(dataset_rice$seed, xlab = 'seminte de orez plantate (în kilograme)')
 

hist(dataset_rice$goutput, xlab = 'productia brută de orez, în kg ')

 

Se poate observa că toate cele trei variabile numerice (size, seed și goutput) sunt asimetrice la dreapta. 





##analiza grafica a variabilelor nenumerice
plot(dataset_rice$price_interval)
 
Pentru variabila price_interval, se observă că cele mai multe producții de orez se vând la categoria preț_acceptabil, iar cele mai puține producții de orez se vând la categoria preț_foarte_ridicat. 

plot(dataset_rice$region)
 
În ceea ce privește variabila region, se poate observa că cele mai multe producții de orez rezultă din categoria gunungwangi, iar cele mai puține producții de orez rezultă din categoria sukaambit. 


	Identificarea outlierilor și eliminarea acestora din bază (sau înlocuirea lor cu valori lipsă)

boxplot(dataset_rice$size, main= 'boxplot size', xlab='suprafata totală cultivată cu orez, măsurată în hectare')
 

boxplot(dataset_rice$seed, main= 'boxplot seed', xlab='seminte de orez plantate (în kilograme)')
 

boxplot(dataset_rice$goutput, main= 'boxplot goutput', xlab='productia brută de orez, în kg')
 

Variabilele size, seed și goutput nu prezintă outlieri. 













Analiza statistică a variabilelor categoriale

	 Tabelarea datelor (obținere frecvențe marginale, condiționate, parțiale)

Frecvențe absolute pentru variabile categoriale

##frecv abs variab categ
tabel_frecv<-table(dataset_rice$price_interval, dataset_rice$region)
tabel_frecv

 

Frecvențe parțiale exprimate procentual (relative)

##frecv partiale rel
prop.table(tabel_frecv)

 


Interpretare
Putem spune că:
	 1,15% din producția de orez se vinde la preț scăzut și provine din regiunea Ciwangi. 
	14,67% din producția de orez se vinde la preț acceptabil și provine din regiunea Ciwangi
	5,79% din producția de prez se vinde la preț ridicat și provine din regiunea ciwangi
	2,31% din producția de orez se vinde la preț scăzut și provine din regiunea Gunungwangi
	17,37% din producția de orez se vinde la preț acceptabil și provine din regiunea Gunungwangi
	Etc.

Frecvențe relative condiționate pentru variabila region

##frecv rel conditionate
prop.table(tabel_frecv,1)
 
Interpretare
Putem spune că:
	4,41% din producția de orez la preț scăzut provine din regiunea Ciwangi
	33,04% din producția de orez la preț acceptabil provine din regiunea Ciwangi
	30% din producția de orez la preț ridicat provine din regiunea Ciwangi
	8,82% din producția de orez la preț scăzut provine din regiunea Gunungwangi
	39,13% din producția de orez la preț acceptabil provine din regiunea Gunungwangi
	6% din producția de orez la preț ridicat provine din regiunea Gunungwangi
	96,15% din producția de orez la preț foarte ridicat provine din regiunea Gunungwangi
	Etc. 

Frecvențe relative condiționate pentru variabila pret_interval
prop.table(tabel_frecv,2)
 

Interpretare
Putem spune că:
	5,35% din producția de orez din regiunea Ciwangi se vinde la preț scăzut
	67,85% din producția de orez din regiunea Ciwangi se vinde la preț acceptabil
	26,78% din producția de orez din regiunea Ciwangi se vinde la preț ridicat
	7,59% din producția de orez din regiunea Gunungwangi se vinde la preț scăzut
	56,96% din producția de orez din regiunea Gunungwangi se vinde la preț acceptabil
	3,79% din producția de orez din regiunea Gunungwangi se vinde la preț ridicat
	31,64% din producția de orez din regiunea Gunungwangi se vinde la preț foarte ridicat
	Etc.


Frecvențe relative marginale

##frecv rel marginale
addmargins(prop.table(tabel_frecv))
 
Interpretare
Putem spune că:
	26,25% din totalul cantității de orez produsă se găsește la preț scăzut
	44,40% din totalul cantității de orez produsă se găsește la preț acceptabil
	19,30% din totalul cantității de orez produsă se găsește la preț ridicat
	10,03% din totalul cantității de orez produsă se găsește la preț foarte ridicat

	21,62% din totalul cantității de orez produsă se găsește în regiunea Ciwangi
	30,50% din totalul cantității de orez produsă se găsește în regiunea Gunungwangi
	23,55% din totalul cantității de orez produsă se găsește în regiunea Langan
	5,40% din totalul cantității de orez produsă se găsește în regiunea Malausma
	4,63% din totalul cantității de orez produsă se găsește în regiunea Sukaambit
	14,28% din totalul cantității de orez produsă se găsește în regiunea Wargabinangun


	Analiza de asociere

            Verificăm dacă există asociere semnificativă între categoriile variabilelor region și price_interval, utilizând testul Chi-square.

##analiza de asociere
summary(table(dataset_rice$price_interval, dataset_rice$region))

 

	Formularea ipotezelor

	H0: între categoriile variabilelor intervalul de preț și regiune nu există o asociere semnificativă (variabilele sunt independente)
	H1: între categoriile variabilelor intervalul de preț și regiune există o asociere semnificativă (variabilele nu sunt independente)

	Regula de decizie

Sig< α – se respinge ipoteza nulă H0
Sig>α – nu se respinge ipoteza nulă H0

       P-value = 2.134e-24 < 0.05, se respinge H0

	Interpretare

Deoarece p-value< α, cu o probabilitate de 95%, există o asociere semnificativă între categoriile variabilelor intervalul de preț și regiune (variabilele nu sunt independente).


	Analiza de concordanță

      Testul de concordanță verifică dacă între distribuția empirică (observată) a unei variabile categoriale și o distribuție teoretică există diferențe semnificative.

##analiza de concordanta
chisq.test(table(dataset_rice$price_interval))

 


	Formularea ipotezelor
	H0: între cele două distribuții nu există diferențe semnificative (există concordanță de structură)
	H1: cele două distribuții diferă semnificativ (nu există concordanță de structură)

	Regula de decizie

Sig< α – se respinge ipoteza nulă H0
Sig>α – nu se respinge ipoteza nulă H0

       P-value = 3.535e-14 < 0.05, se respinge H0

	Interpretare

Deoarece p-value< α, cu o probabilitate de 95%, putem afirma că nu există o concordanță de structură între cele două distribuții.









Analiza de regresie și de corelație

	 Analiza de corelație

Analiza de covarianță

##analiza de covarianta
cov(subset_rice)

 

##matricea corelatiilor
cor(subset_rice)

 

Interpretare

Între variabilele size (suprafața totală cultivată cu orez) și seed (semințe de orez plantate – în kg) există o corelație pozitivă și de intensitate ridicată (r=0,802). 

Între variabilele size (suprafața totală cultivată cu orez) și goutput (producția brută de orez - în kg) există o corelație pozitivă și de intensitate ridicată (r= 0,695).

Între variabilele seed (semințe de orez plantate – în kg) și goutput (producția brută de orez - în kg) există o corelație pozitivă și de intensitate ridicată (r= 0,616).

Testarea coeficienților de corelație

	Ipoteze de testare:

H0: nu există corelație între variabilele size și seed (coeficientul de corelație nu e semnificativ statistic)
H1: între variabilele size și seed există corelație (coeficientul de corelație e semnificativ statistic)

##testarea coef de corelatie pt size si seed
cor.test(dataset_rice$size, dataset_rice$seed)

 

Valoarea coeficientului de corelație pentru variabilele size (suprafața totală cultivată cu orez) și seed (semințe de orez plantate – în kg) este 0,8021 și indică o legătură directă și puternică între variabile. 

	Regula de decizie

Sig< α – se respinge ipoteza nulă H0
Sig>α – nu se respinge ipoteza nulă H0

Deoarece p-value=2,2e-16 este mai mic decât α=0.05, se respinge ipoteza nulă. Cu o probabilitate de 95% putem spune că există corelație între variabilele size și seed. Coeficientul de corelație dintre cele două variabile este semnificativ statistic. 


##testarea coef de corelatie pt size si goutput
cor.test(dataset_rice$size, dataset_rice$goutput)

 
	Ipoteze de testare:

H0: nu există corelație între variabilele size și goutput (coeficientul de corelație nu e semnificativ statistic)
H1: între variabilele size și goutput există corelație (coeficientul de corelație e semnificativ statistic)

Valoarea coeficientului de corelație pentru variabilele size (suprafața totală cultivată cu orez) și goutput (producția brută de orez - în kg) este 0,6957 și indică o legătură directă și puternică între variabile. 

	Regula de decizie

Sig< α – se respinge ipoteza nulă H0
Sig>α – nu se respinge ipoteza nulă H0

Deoarece p-value=2,2e-16 este mai mic decât α=0.05, se respinge ipoteza nulă. Cu o probabilitate de 95% putem spune că există corelație între variabilele size și goutput. Coeficientul de corelație dintre cele două variabile este semnificativ statistic. 




##testarea coef de corelatie pt seed si goutput
cor.test(dataset_rice$seed, dataset_rice$goutput)

 
	Ipoteze de testare:

H0: nu există corelație între variabilele seed și goutput (coeficientul de corelație nu e semnificativ statistic)
H1: între variabilele seed și goutput există corelație (coeficientul de corelație e semnificativ statistic)

Valoarea coeficientului de corelație pentru variabilele seed (semințe de orez plantate – în kg)  și goutput (producția brută de orez - în kg) este 0,6162și indică o legătură directă și puternică între variabile. 

	Regula de decizie

Sig< α – se respinge ipoteza nulă H0
Sig>α – nu se respinge ipoteza nulă H0

Deoarece p-value=2,2e-16 este mai mic decât α=0.05, se respinge ipoteza nulă. Cu o probabilitate de 95% putem spune că există corelație între variabilele seed și goutput. Coeficientul de corelație dintre cele două variabile este semnificativ statistic. 




	Analiza de regresie

	Regresie liniară simplă și multiplă

	Regresia liniară simplă

Regresia liniară simplă se va realiza între variabila dependentă goutput (producția brută de orez - în kg) și factorul de influență cu cel mai mare coeficient de corelație, size (suprafața totală cultivată cu orez). 

Ecuația modelului de regresie liniară simplă: Y= β0 + β1 X + εi

Y – variabila dependentă (goutput =producția brută de orez - în kg)
X – variabila independentă (size = suprafața totală cultivată cu orez)
ε – variabila reziduală sau eroare
β0 , β1 – parametrii modelului econometric, coeficienți de regresie

##regresia liniara simpla
regresie_simpla<- lm(subset_rice$goutput~subset_rice$size, subset_rice)
regresie_simpla

 






summary(regresie_simpla)

 
Ecuația estimată a modelului

goutput = 729,5 + 2225,8 size

b_0= 729,5
b_1 = 2225,8

Interpretare

β0: Producția brută de orez este de 729,5 kg atunci când suprafața cultivată cu orez este de 0 hectare. 

β1:  Producția brută de orez crește în medie cu 2225,8 kg atunci când suprafața cultivată cu orez crește cu 1 hectar. 

Ipotezele statistice sunt:

H0: β1= 0 ( Parametrul: β1 nu este semnificativ statistic )
H1: β1 ≠ 0 ( Parametrul: β1 este semnificativ statistic )

Regula de decizie:

• sig > α= 0,05 , nu se respinge ipoteza nulă ;
• sig< α= 0,05 , se respinge ipoteza nulă.


Probabilitatea asociată testului Student este p-value = 2e-16 <  α = 0.05 și resultă că se respinge ipoteza nulă. Cu o probabilitate de 95% putem spune că parametrul β1 este semnificativ statstic.

Raportul de determinație (R^2 ) este = 0,484  și indică faptul că 48,4% din variația variabilei dependente goutput este explicată de variația variabilei independente size.


	 Regresia liniară multiplă

Modelul de regresie liniară multiplă va fi realizat între variabila dependentă goutput și factorii de influență size și seed. 

Ecuația modelului de regresie multiplă : Y= β0 + β1 X1 + β2X2 + εi

Y – variabila dependentă (goutput - producția brută de orez în kg)
X1 – variabila independentă (size- suprafața totală cultivată cu orez, măsurată în hectare)
X2 – variabila indepedentă (seed - semințe de orez plantate, în kilograme)
ε – variabila reziduală sau eroare
β0 , β1 , β2 – parametrii modelului econometric, coeficienți de regresie

## regresia liniara multipla
regresie_multipla<- lm(subset_rice$goutput~subset_rice$size+subset_rice$seed)
regresie_multipla

 

summary(regresie_multipla)

 

Ecuația estimată a modelului

Goutput= 753,207 + 1806,712 size + 10,479 seed
b_0= 753,207
b_1= 1806,712
b_2= 10,479



Interpretare

β0: Producția brută de orez (goutput) este de 753,207 kg atunci când influența simultană a celorlalți doi factori: suprafața totală cultivată cu orez (size) și semințe de orez plantate (seed), este nulă. 

β1: Producția brută de orez (goutput) crește cu 1806,712 kg la o creștere cu 1 hectar a suprafeteței cultivate cu orez (size), în condițiile în care influența variabilei seed (semințe de orez plantate) rămâne constantă. 

β2: Producția brută de orez (goutput) crește cu 10,479 kg la o creștere cu 1 kg a semințelor de orez plantate (seed), în condițiile în care influența variabilei size (suprafața totală cultivată cu orez) rămâne constantă. 

Probabilitățile asociate testului Student sunt 6,32e-13 și 0.0293, care sunt mai mici decât riscul α = 0,05, de unde rezultă că se respinge ipoteza nulă. Cu o probabilitate de 95%, spunem că parametrii β1 si β2 sunt semnificativi statistic. 

Raportul de determinație (R^2 ) este = 0,4935 și indică faptul că 49,35% din variația variabilei dependente goutput este explicată de variația variabilelor independente size și seed. 


	Regresia neliniară

Se vor utiliza variabilele goutput și size. 

Ecuatia generală a modelului:

Y=β_0+β_1 X+β_2 X^2+εi 

La nivelul esantionului:

Y_X=b_0+b_1 X+b_2 X^2  



##regresia neliniara
regresia_neliniara<- lm(subset_rice$goutput ~ subset_rice$size + I(size^2), subset_rice)
regresia_neliniara

 

summary(regresia_neliniara)

 



Ecuația modelului

Goutput= -728,5 + 4847,5 size – 832,5 size^2

Raportul de determinație (R^2 ) este = 0,5503, ceea ce înseamnă că modelul explică 55,03% din variația variabilei dependente goutput. 

	 Compararea a două modele de regresie și alegerea celui mai bun model

Se va compara modelul de regresie liniară simplă cu modelul de regresie neliniară, cu ajutorul metodei ANOVA. 

Ipoteze

H0 : modelul de regresie neliniară nu este semnificativ mai bun decât modelul de regresie simplă
H1: modelul de regresie neliniară este semnificativ mai bun decât modelul de regresie simplă

Regula de decizie

Sig< α – se respinge ipoteza nulă H0
Sig>α – nu se respinge ipoteza nulă H0

##compararea a 2 modele de regresie
anova(regresie_simpla, regresia_neliniara)

 

Potrivit regulii de decizie, se respinge ipoteza H0. Se observă că probabilitatea asociată testului F este p-value=3,106e-09  < α =0,05.  Acest lucru semnifică faptul că regresia_neliniara este un model semnificativ mai bun decat regresie_simpla pentru a explica variația variabilei dependente goutput (producția brută de orez - în kg ).  



























Estimarea și testarea mediilor

	 Estimarea mediei prin interval de încredere

Ipoteze

H0: media este egală cu 0
H1: media este diferită de 0

Regula de decizie

Sig< α – se respinge ipoteza nulă H0
Sig>α – nu se respinge ipoteza nulă H0

##estimarea mediei prin interval de incredere
t.test(dataset_rice$goutput, mu=0)

 

Se observă faptul că p-value = 2,2e-16 < α =0,05, resultând că se respinge ipoteza nulă și media diferă de 0. Cu un risc de 5%, spunem că media producției brute de orez - în kg (goutput) este acoperită de intervlul [2495,750; 2886,096] kg.



	 Testarea mediilor populației

	 Testarea unei medii cu o valoare fixă

Ipoteze pentru variabila goutput

𝐻0: 𝜇= 2600 kg (în medie, producția brută de orez nu diferă semnificativ de 2600 kg)
𝐻1:𝜇≠ 2600 kg(în medie, producția brută de orez diferă semnificativ de 2600 kg)

Regula de decizie

Sig< α – se respinge ipoteza nulă H0
Sig>α – nu se respinge ipoteza nulă H0

##testarea unei medii cu val fixa 2600
t.test(dataset_rice$goutput,mu=2600, alternative = "less")

 

Interpretare
Se observă faptul că p-value = 0,8201> α =0,05, rezultând că nu se respinge ipoteza nulă H0. Cu un risc de 5%, spunem că, în medie, producția brută de orez nu diferă semnificativ de 2600 kg.


	 Testarea diferentei dintre doua medii (fie cu esantioane independente, fie cu esantioane perechi)

Pentru acest subpunct, se va analiza dacă există diferențe semnificative între producțiile brute de orez pentru două categorii de preț (acceptabil, ridicat). 

Formularea ipotezelor:

𝐻0: 𝜇1=𝜇2 ( nu există diferențe semnificative între producțiile brute de orez pentru cele două categorii de preț)
𝐻1:𝜇1<>𝜇2 (există diferențe semnificative între producțiile brute de orez pentru cele două categorii de preț)

Regula de decizie

Sig< α – se respinge ipoteza nulă H0
Sig>α – nu se respinge ipoteza nulă H0

##testarea diferentei intre 2 medii(esantioane independente)
t.test(goutput~price_interval, dataset_rice, price_interval %in% c("pret_acceptabil", "pret_ridicat"))

 




Interpretare

Se observă faptul că p-value = 7,268e-06> α =0,05, rezultând că nu se respinge ipoteza nulă H0. Cu un risc de 5%, spunem că, nu există diferențe semnificative între producțiile brute de orez pentru cele două categorii de preț – preț acceptabil și preț ridicat. 

Intervalul de încredere al diferenței dintre cele două medii este [-1929,6549; -797,3955]. Astfel, cu o probabilitate de 95%, spunem că diferența dintre cele două categorii de preț - preț acceptabil și preț ridicat- pentru producția de orez, acoperă intervalul [-1929,6549; -797,3955].


	 Testarea diferenței dintre trei sau mai multe medii

Pentru acest subpunct, se va analiza diferența dintre producțiile medii de orez în funcție de categoriile de preț (scăzut, acceptabil, ridicat, foarte ridicat). 

Formularea ipotezelor:

𝐻0: 𝜇1=𝜇2=𝜇3 (producțiile medii de orez în funcție de categoriile de preț nu diferă semnificativ între ele)
H1: 𝜇1≠𝜇2≠𝜇3 (cel putin doua medii diferă semnificativ intre ele)

Regula de decizie

Sig< α – se respinge ipoteza nulă H0
Sig>α – nu se respinge ipoteza nulă H0

##testarea diferentei dintre 3 sau mai multe medii
medii<-aov(goutput~price_interval, dataset_rice)
anova(medii)

 

Interpretare

Se observă faptul că valoarea probabilității asociată testului F= 3,379e-07> α =0,05, rezultând că nu se respinge ipoteza nulă H0. Cu un risc de 5%, spunem că, mediile nu diferă semnificativ între ele. 

coef(medii)

 

Producția brută de orez medie pentru categoria preț_scăzut este de 2398,72 kg. 
Producția brută de orez medie pentru categoria preț_acceptabil este cu 57,11 kg mai mare față de categoria preț_scăzut. 
Producția brută de orez medie pentru categoria preț_ridicat este cu 1420,63 kg mai mare față de categoria preț_scăzut. 
Producția brută de orez medie pentru categoria preț_foarte_ridicat este cu 73,72 kg mai mică față de categoria preț_scăzut. 








Concluzii



       Proiectul a avut ca scop analiza factorilor de influență a producției de orez în Indonezia, având în vedere factorii specifici, precum: suprafața totală cultivată cu orez, măsurată în hectare  și semințe de orez plantate (în kilograme) . 
       Suprafața minimă  cultivată cu orez este 0,5000 hectare, iar suprafața maximă cultivată cu orez este 3,6430 hectare. Cantitatea minimă de semințe de orez plantate este de 10 kg, iar cantitatea maximă de semințe de orez plantate este de 200 kg. Cantitatea minimă de orez produsă este de 473 de kg, iar cantitatea maximă  de orez produsă este de 9000 kg.
       48.52% din producția de orez la preț scăzut provine din regiunea Langan, 39,13% din producția de orez la preț acceptabil provine din regiunea Gunungwangi,  60% din producția de orez la preț ridicat provine din regiunile Ciwangi și Langan, iar  96,15% din producția de orez la preț foarte ridicat provine din regiunea Gunungwangi. 
      26,25% din totalul cantității de orez produsă se găsește la preț scăzut, 44,40% din totalul cantității de orez produsă se găsește la preț acceptabil, 19,30% din totalul cantității de orez produsă se găsește la preț ridicat, 10,03% din totalul cantității de orez produsă se găsește la preț foarte ridicat. 
      Regresia neliniară este un model semnificativ mai bun decat regresia simplă pentru a explica variația variabilei dependente goutput (producția brută de orez - în kg ).  
    Cu un risc de 5%, spunem că, nu există diferențe semnificative între producțiile brute de orez pentru două categorii de preț – preț acceptabil și preț ridicat.


     
     




