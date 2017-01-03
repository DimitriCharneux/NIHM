library("gplots")

tempsPourUneTechnique = function(technique, dataFrame){
	dataTechnique=subset(dataFrame,Technique==technique)
	return(mean(dataTechnique[,"Time"]))
}

tempsPourUneTechniqueSansErreur = function(technique, dataFrame){
	dataTechnique=subset(dataFrame,Technique==technique & Err == 0)
	return(mean(dataTechnique[,"Time"]))
}

intervalleConfiance = function(v){
	return(1.96 * (sd(v)/sqrt(length(v))))
}

intervallleConfianceTechnique = function(tech, data){
	return(intervalleConfiance(subset(data,Err==0 & Technique==tech)[,"Time"]))
}


v = c(12,.4,5,2,50,8,3,1,4,.25)
mean(v)
v[2] = 7
sum(v[v>10])
quantile(v, c(0.90))
data = read.table("data.txt", header=TRUE, sep=",")
participant2SurfPad=subset(data,Participant==2 & Technique=="SurfPad")
meanParticipant2SurfPad = mean(participant2SurfPad[,"Time"])
techniques=unique(data$Technique)

# Graphe du temps moyen par technique avec erreur
#res = sapply(techniques, tempsPourUneTechnique, data)
#barplot (res, main="temps moyen par technique", names.arg=techniques, ylab="temps", xlab="technique")

# Graphe du temps moyen par technique sans erreur
#res = sapply(techniques, tempsPourUneTechniqueSansErreur, data)
#barplot (res, main="temps moyen par technique", names.arg=techniques, ylab="temps", xlab="technique")

#Graphe des intervalles de confiance à 95%
tempsMoyenSansErreur = sapply(techniques, tempsPourUneTechniqueSansErreur, data)
intervalle = sapply(techniques, intervallleConfianceTechnique, data)
tempsInferieur = tempsMoyenSansErreur - (intervalle/2)
tempsSuperieur = tempsMoyenSansErreur + (intervalle/2)

#pdf(file="tempsMoyenAvecIntervalle")
barplot2(tempsMoyenSansErreur, main="temps moyen par technique avec intervalles de confiance", names.arg=techniques, plot.ci=TRUE, ylab="temps", xlab="technique", ci.l=tempsInferieur, ci.u=tempsSuperieur)
#dev.off()

#Fonction pour question 10
tempsPourUneTechniqueEtUneDensite = function(data, densite, technique){
	dataTechnique=subset(data,Technique==technique & Err == 0 & density==densite)
	return(mean(dataTechnique[,"Time"]))
}

tempsMoyenParDensite = function(data, technique, densite){
	return(sapply(technique, tempsPourUneTechniqueEtUneDensite, data=data, densite=densite))
}

#Q10

#densites=unique(data$density)
#png(file="tempsMoyenParDensite")
#tempsMoyenParDensite = sapply(densites, tempsMoyenParDensite, data=data, technique=techniques)
#barplot(tempsMoyenParDensite, main="temps moyen par technique pour chaque densite", names.arg=densites, ylab="temps", xlab="densite", legend=techniques, beside=TRUE)
#dev.off()


#data=subset(data, Technique!="SemPoint")
#techniques=unique(data$Technique)
#png(file="tempsMoyenParDensiteSansSempoint")
#tempsMoyenParDensite = sapply(densites, tempsMoyenParDensite, data=data, technique=techniques)
#barplot(tempsMoyenParDensite, main="temps moyen par technique pour chaque densite", names.arg=densites, ylab="temps", xlab="densite", legend=techniques, beside=TRUE)
#dev.off()





