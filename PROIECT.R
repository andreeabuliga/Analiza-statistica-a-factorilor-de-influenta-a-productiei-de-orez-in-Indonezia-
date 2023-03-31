library(dplyr)

install.packages("psych")
library(psych)

library(readr)
ricefarms<-read.csv("D:/MASTER/Introducere in R/Proiect/RiceFarms.csv")

dim(ricefarms) 

##eliminam NA 

rice<-na.omit(ricefarms)

dim(rice)

##conditii variabile

dataset_rice<-subset(rice, select=c(size, seed, goutput, price, region),
                     size>=0.5 & seed>=10 & goutput<10000)


dim(dataset_rice)

write.csv(dataset_rice, "D:/MASTER/Introducere in R/Proiect/dataset_rice.csv")

##clasele variabilelor

sapply(dataset_rice, class)

##variabila categoriala price_interval

dataset_rice$price_interval<-cut(dataset_rice$price,c(0,60,100,150,200),
                                 c('pret_scazut', 'pret_acceptabil', 'pret_ridicat', 'pret_foarte_ridicat'))



sapply(dataset_rice, class)
 
##variabila factoriala region

dataset_rice$region<-as.factor(dataset_rice$region)

#nivelele variabilei 

levels(dataset_rice$region)


##dimensiunea setului de date 
dim(dataset_rice)

##clasele variabilelor
sapply(dataset_rice, class)

##structura setului de date
str(dataset_rice)

##denumirea coloanelor
names(dataset_rice)

##categoriile variabilelor nenumerice
levels(dataset_rice$region)

levels(dataset_rice$price_interval)

##date numerice subset_rice

subset_rice=subset(dataset_rice,select=c(size, seed, goutput))

summary(subset_rice)

##sau

describe(subset_rice)

##statistici descriptive pe grupuri

library(psych)

describeBy(dataset_rice$goutput, group=dataset_rice$price_interval, digits=4)

##analiza grafica a variabilelor numerice

hist(dataset_rice$size, xlab = 'suprafata totala cultivata cu orez, masurata în hectare')

hist(dataset_rice$seed, xlab = 'seminte de orez plantate (în kilograme)')

hist(dataset_rice$goutput, xlab = 'productia bruta de orez, în kg ')

##analiza grafica a variabilelor nenumerice

plot(dataset_rice$price_interval)

plot(dataset_rice$region)

##identificare outlieri

boxplot(dataset_rice$size, main= 'boxplot size', xlab='suprafata totala cultivata cu orez, masurata în hectare')

boxplot(dataset_rice$seed, main= 'boxplot seed', xlab='seminte de orez plantate (în kilograme)')

boxplot(dataset_rice$goutput, main= 'boxplot goutput', xlab='productia bruta de orez, în kg')

##frecv abs variab categ

tabel_frecv<-table(dataset_rice$price_interval, dataset_rice$region)

tabel_frecv

##frecv partiale rel

prop.table(tabel_frecv)


##frecv rel conditionate

prop.table(tabel_frecv,1)

prop.table(tabel_frecv,2)

##frecv rel marginale

addmargins(prop.table(tabel_frecv))

##analiza de asociere

summary(table(dataset_rice$price_interval, dataset_rice$region))

##analiza de concordanta

chisq.test(table(dataset_rice$price_interval))

##5

##analiza de covarianta

cov(subset_rice)

##matricea corelatiilor

cor(subset_rice)

##testarea coef de corelatie pt size si seed

cor.test(dataset_rice$size, dataset_rice$seed)


##testarea coef de corelatie pt size si goutput

cor.test(dataset_rice$size, dataset_rice$goutput)

##testarea coef de corelatie pt seed si goutput

cor.test(dataset_rice$seed, dataset_rice$goutput)

##5.2.1.
##regresia liniara simpla

regresie_simpla<- lm(subset_rice$goutput~subset_rice$size, subset_rice)
regresie_simpla

summary(regresie_simpla)

## regresia liniara multipla

regresie_multipla<- lm(subset_rice$goutput~subset_rice$size+subset_rice$seed)
regresie_multipla

summary(regresie_multipla)

##regresia neliniara

regresia_neliniara<- lm(subset_rice$goutput ~ subset_rice$size + I(size^2), subset_rice)
regresia_neliniara

summary(regresia_neliniara)

##compararea a 2 modele de regresie

anova(regresie_simpla, regresia_neliniara)


##6.
##estimarea mediei prin interval de incredere

t.test(dataset_rice$goutput, mu=0)

##testarea unei medii cu val fixa 2600

t.test(dataset_rice$goutput,mu=2600, alternative = "less")

##testarea diferentei intre 2 medii(esantioane independente)

t.test(goutput~price_interval, dataset_rice, price_interval %in% c("pret_acceptabil", "pret_ridicat"))

##testarea diferentei dintre 3 sau mai multe medii
medii<-aov(goutput~price_interval, dataset_rice)
anova(medii)

coef(medii)






