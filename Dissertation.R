#1. Donwload
  #Donwload and save the original files from the WHO Mortality Database
  #? http://stackoverflow.com/questions/3053833/using-r-to-download-zipped-data-file-extract-and-import-data


#do it all in a tempfile

dir.create("Download")

download.file("http://www.who.int/entity/healthinfo/statistics/Morticd10_part2.zip?ua=1",
              "Download/Morticd10_part2")

unzip("Data/Morticd10_part2")



#2. Read
  #Read the data from downloaded .zip files
  #http://www.who.int/healthinfo/statistics/mortality_rawdata/en/
  #Jan 11th, 2016

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