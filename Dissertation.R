

Mortality <- bind_rows("10_2" = read.csv(unz("Data/Morticd10_part2.zip","Morticd10_part2")),
                       "10_1" = read.csv(unz("Data/Morticd10_part1.zip","Morticd10_part1")),
                       "9" = read.csv(unz("Data/morticd9.zip","Morticd9")),
                       "8" = read.csv(unz("Data/morticd08.zip","Morticd8")),
                       "7" = read.csv(unz("Data/morticd07.zip","MortIcd7")),
                       .id = "ICD")


unzip("Data/Morticd10_part2.zip")

unz("http://www.who.int/entity/healthinfo/statistics/morticd07.zip?ua=1","MortIcd7")



############################################################################
#1. Donwload
  #Donwload and save the original files from the WHO Mortality Database
  #? http://stackoverflow.com/questions/3053833/using-r-to-download-zipped-data-file-extract-and-import-data


#do it all in a tempfile

dir.create("Download")

download.file("http://www.who.int/entity/healthinfo/statistics/Morticd10_part2.zip?ua=1",
              "Download/Morticd10_part2")

?unzip

unzip("Download/Morticd10_part2")

unz("Download/Morticd10_part2")

?unz



#2. Read
  #Read the data from downloaded .zip files
  #http://www.who.int/healthinfo/statistics/mortality_rawdata/en/
  #Jan 11th, 2016

install.packages('dplyr')

installed.packages()
library('dplyr')

temp <- tempfile()
download.file("http://www.who.int/entity/healthinfo/statistics/Morticd10_part2.zip?ua=1",temp)
data <- read.csv(unz(temp, "Download/Morticd10_part2"))
unlink(temp)

download.file("http://www.who.int/entity/healthinfo/statistics/Morticd10_part2.zip?ua=1","Download/")


?read.csv

?tempfile

Mortality <- bind_rows("10_2" = read.csv(unzip("Data/Morticd10_part2.zip")),
                       "10_1" = read.csv(unzip("Data/Morticd10_part1.zip")),
                       "9" = read.csv(unzip("Data/morticd9.zip")),
                       "8" = read.csv(unzip("Data/morticd08.zip")),
                       "7" = read.csv(unzip("Data/morticd07.zip")),
                       .id = "ICD")

Mortality$ICD <- factor(as.factor(Mortality$ICD), c("7","8","9","10_1","10_2"))
summary (Mortality$ICD)



table(Mortality$ICD)

?bind_rows

summary(Mortality$ICD)
head(Mortality)


Mortality <- rbind(read.csv(unzip("Data/Morticd10_part2.zip")),
                   read.csv(unzip("Data/Morticd10_part1.zip")),
                   read.csv(unzip("Data/morticd9.zip")),
                   read.csv(unzip("Data/morticd08.zip")),
                   read.csv(unzip("Data/morticd07.zip")))

Mortality <- rbind(read.csv(unzip("Data/Morticd10_part2.zip")),
                   read.csv(unzip("Data/Morticd10_part1.zip")),
                   read.csv(unzip("Data/morticd9.zip")),
                   read.csv(unzip("Data/morticd08.zip")),
                   read.csv(unzip("Data/morticd07.zip")))
save (Mortality, file = "Data/Mortality.RData")

Population <- read.csv(unzip("Data/Pop.zip"))
save(Population, file = "Data/Population.RData")

file.remove("Morticd10_part2","Morticd10_part1","Morticd9","Morticd8","MortIcd7","pop")




load("Data/Mortality.RData")
load("Data/Population.RData")