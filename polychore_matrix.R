# Hier wird eine Polychore Matrix berechnet
#
# Mit dieser Matrix können Zusammenhänge zwischen zwei Binär (0/1) codierten
# Dummy-Variablen dargestellt werden. Es kann aber auch eine Faktorenanalyse
# mit binären Items auf dieser Grundlage durchgeführt werden. Zudem kann mit
# einer solchen Polychoren Matrix eine Korrespondenzgrafik erstellt werden.


chooseCRANmirror("https://cran.uni-muenster.de")
40

#Sprache auf Englisch umstellen
Sys.setenv(LANG = "en")

# Paket installieren um SPSS Daten einzulesen
if (!require(haven))
  install.packages("haven")
library (haven)

# SPSS Daten einlesen
data.spss <- read_sav ("XX/Factominer_Null_keine_Missing.sav")

# Paket installieren
if (!require(polycor))
  install.packages("polycor")
library (polycor)

# Die Variablen als Faktoren definieren, damit die Analyse gemacht werden kann
data.spss <- sapply(data.spss, as.factor)
head(data.spss)

# Erstellen einer leeren Matrix
n      <- ncol(data.spss)
m      <- n
cormat <- matrix(nrow = n, ncol = m, data = NA)
for (i in 1:n) {
  for (j in 1:m) {
    cormat[i,j] <- polychor(data.spss[, i], data.spss[, j])
  }
}
diag(cormat) <- 1
print(cormat)
