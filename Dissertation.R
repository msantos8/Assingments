HomPop[HomPop$Per15_24 > 1, ]


ggplot(HomPop[HomPop$Country == 1125 & HomPop$Admin == "Country", ], aes(x = HomRate)) +
  geom_smooth(aes(y = Per15_24), method = "lm") +
  geom_point(aes(y = Per15_24), alpha = .5) +
  ggtitle(paste("Scatter Plot between the Percentage of the Population Aged 15 to 24 and Homicide Rate by Year - ",
                unique(HomPop$Name[HomPop$Country == 1125]), " (",
                unique(HomPop$Country[HomPop$Country == 1125]), ")")) +
  ylab("Homicide Rate per 100,000 population") +
  xlab("Percent of the Population Aged 15 to 24") +
  scale_x_continuous(labels = comma) +
  scale_y_continuous(labels = comma) +
  theme(
    text = element_text(family = "serif", size = 12),
    panel.grid.major.x = element_line(colour = "white"),
    panel.grid.major.y = element_line(colour = "gray"),
    panel.background = element_rect(fill = "white"))



unique(HomPop$Country)

ggplot(HomPop[HomPop$Country == 1125 & HomPop$Admin == "Country", ], aes(x = Year)) +
  geom_line(aes(y = HomRate), size = .5, color = "red") +
  geom_point(aes(y = HomRate), size = 1.5, color = "dark red") +
  ggtitle(paste("Homicide Rate - ",
                unique(HomPop$Name[HomPop$Country == 1125]), " (",
                unique(HomPop$Country[HomPop$Country == 1125]), ")")) +
  ylab("Homicide Rate per 100,000 population") +
  xlab("Year") +
  scale_x_continuous(breaks=seq(1950, 2015, 5), limits = c(1950, 2015)) +
  scale_y_continuous(labels = comma) +
  theme(
    text = element_text(family = "serif", size = 12),
    panel.grid.major.x = element_line(colour = "white"),
    panel.grid.major.y = element_line(colour = "gray"),
    panel.background = element_rect(fill = "white"))



ggplot(HomPop[HomPop$Country == 2450 & HomPop$Admin == "Country", ], aes(x = Year)) +
  geom_line(aes(y = Per14_24), size = .5, color = "blue") +
  geom_point(aes(y = Per14_24), size = 1.5, color = "dark blue") +
  ggtitle(paste("Percent Aged 15 to 24 - ",
                unique(HomPop$Name[HomPop$Country == 2450]), " (",
                unique(HomPop$Country[HomPop$Country == 2450]), ")")) +
  xlab("Year") +
  ylab("Percent of the Population Aged 15 to 24") +
  scale_x_continuous(breaks=seq(1950, 2015, 5), limits = c(1950, 2015)) +
  scale_y_continuous(labels = comma) +
  theme(
    text = element_text(family = "serif", size = 12),
    panel.grid.major.x = element_line(colour = "white"),
    panel.grid.major.y = element_line(colour = "gray"),
    panel.background = element_rect(fill = "white"))




ggplot(HomPop[HomPop$Country == 2070 & HomPop$Admin == "Country", ], aes(x = Year)) +
  geom_line(aes(y = HomRate), size = .5, color = "red") +
  geom_point(aes(y = HomRate), size = 1.5, color = "dark red") +
  ggtitle(paste("Total Homicides for",
                unique(HomPop$Name[HomPop$Country == 2070]), " (",
                unique(HomPop$Country[HomPop$Country == 2070]), ")")) +
  xlab("Year") +
  ylab("Homicide Rate per 100,000 Population") +
  scale_x_continuous(breaks=seq(1950, 2015, 5), limits = c(1950, 2015)) +
  scale_y_continuous(labels = comma) +
  theme(
    text = element_text(family = "serif", size = 12),
    panel.grid.major.x = element_line(colour = "white"),
    panel.grid.major.y = element_line(colour = "gray"),
    panel.background = element_rect(fill = "white"))


HomPop[HomPop$Name == "Brazil", c(1:9)]

#File
rm(list = ls())
load("Data/Homicide.RData")
load("Data/Mortality.RData")
load("Data/Population.RData")

load("Data/Data Jan21_2017.RData")

#######################################################################################
#History



#######

summary(HomPop$Year)


ifelse(sum(HomPop$Deaths1, na.rm = TRUE) > 0, print("ok"), print("no"))

orig.par = par(no.readonly = TRUE)
pdf(file = "just_plots.pdf")
par(mfrow=c(2,2))

pdf("Homicide & Population.pdf")
for (i in unique(HomPop$Country)) {
  ifelse(sum)
}

pdf("day08_homework_plots.pdf")
for (i in unique(Homicide.Pop$Country)) {
  print(paste("For Country =", unique(Homicide.Pop$Name[Homicide.Pop$Country == i])))
  tryCatch({
    print(ggplot(Homicide.Pop[Homicide.Pop$Country == i,], aes(Per15_24, HomicideRate)) +
            geom_point(alpha = .5, size = 3) +
            ggtitle(paste("Homicide Rate and Percent 15 to 24 for Country", 
                          unique(Homicide.Pop$Name[Homicide.Pop$Country == i]))) +
            geom_smooth(method = lm, color = "red") +
            theme_bw () +
            theme(text = element_text(family = "serif", size = 12),
                  panel.border = element_blank()) +
            xlab("Percent 15 to 24") +
            ylab("Homicide Rate"))
  }, error=function(e){cat(paste("ERROR in Country =", unique(Homicide.Pop$Name[Homicide.Pop$Country == i])),conditionMessage(e), "\n")})
}
dev.off()



facet_grid(~ Country)

see <- HomPop[HomPop$Country == 2450, ]

ggplot(HomPop[HomPop$Country == 2450,], aes(Year)) +
  geom_line(aes(y = Deaths1))

ggplot(HomPop[HomPop$Country == 2450,], aes(Year)) +
  geom_line(aes(y = HomicideRate)) +
  geom_line(aes(y = Per15_24))



Homicide <- data.frame(
  summarise_all(group_by(Homicide[,-7], 
                         Country, Year, Admin1, SubDiv, ICD, List, Frmat, IM_Frmat),
                funs(sum), na.rm = TRUE))



## Merge Population

```{r}
Population <- read.csv(unzip("Data/Pop.zip"))
save(Population, file = "Data/Population.RData")

load("Data/Mortality.RData")
load("Data/Population.RData")

ls()
str(Mortality)

colnames(Population) %in% colnames(Mortality) # Returns a logical where true is if the first thing is in the second thing

colnames(Population) %in% colnames(Mortality)

sum(colnames(Mortality) %in% colnames(Population)) #How many trues

which() # Which ones are true

Homicide_Population <- merge(Homicide, Population, all = TRUE)

head (Merged)

```



colnames(Homicide)

head(Homicide)

head(Homicide)

load(Homicide)


for (i in 1:2) {
  a<-paste("Homicide$Deaths", i, sep = "") <-
    a<-apply(Homicide[, c(i+10,i+40,i+70)], MARGIN = 1, FUN = sum, na.rm = TRUE)
}

paste("Homicide$Deaths", i, sep = "")
get(paste("Homicide$Deaths", i, sep = ""))

colnames(Homicide)

for(i in 1:2){
  print(paste("A", i, sep = ""))
}


?get
?assign

?tapply
apply(Homicide[, i], MARGIN = 1, FUN = sum, na.rm = TRUE)

apply

?apply

Homicide$Deaths1 <- apply(Homicide[, c(10,40,70)], MARGIN = 1, FUN = sum, na.rm = TRUE)

apply(Homicide[, grep("^Deaths1\\.", colnames(Homicide))], 
      MARGIN = 1, FUN = sum, na.rm = TRUE)

grep("^Deaths1\\.", colnames(Homicide))

head(Homicide)

Homicide[Homicide$Country == 1060, 1:10]
Homicide2[Homicide2$Country == 1060, 1:9]



Country+Year+Admin1+SubDiv+List+Frmat+IM_Frmat
apply

usePackage('dplyr')

head(Homicide)

aggregate(Deaths1.Male~Year+Country, data=Homicide, sum, na.rm=TRUE)

rm(a)

aggregate(cbind(x1, x2)~year+month, data=df1, sum, na.rm=TRUE)

aggregate(data = Homicide, FUN = sum)

aggregate(Homicide$Deaths1.Male, by=list(c(Homicide$Country,Homicide$Year)), FUN=sum)

tapply

unique(Homicide$Country)

save(Homicide, file = "Data/Homicide.RData")


rm(list = ls())
load("Data/Homicide.RData")
load("Data/Mortality.RData")
load("Data/Population.RData")

head(Homicide)

usePackage('reshape2')
?reshape

length(unique(Homicide$Country))
length(unique(Homicide2$Country))

is.na(Homicide$Admin1)

unique(Homicide$Admin1)
unique(Homicide$SubDiv)

head(Homicide)
head(Homicide2)

Homicide$Admin1



Homicide_07A <- Mortality[Mortality$List=="07A" & Mortality$Cause=="A149", ]
Homicide_07B <- Mortality[Mortality$List=="07B" & Mortality$Cause=="B050", ]
Homicide_08A <- Mortality[Mortality$List=="08A" & Mortality$Cause=="A148", ]
Homicide_08B <- Mortality[Mortality$List=="08B" & Mortality$Cause=="B050", ]
Homicide_09A <- Mortality[Mortality$List=="09A" & Mortality$Cause=="B55", ]
Homicide_09B <- Mortality[Mortality$List=="09B" & Mortality$Cause=="B55", ]
Homicide_09C <- Mortality[Mortality$List=="09C" & Mortality$Cause=="C103", ]
Homicide_09N <- Mortality[Mortality$List=="09N" & (Mortality$Cause=="B55" | Mortality$Cause=="CH17"), ]
Homicide_101 <- Mortality[Mortality$List=="101" & (Mortality$Cause=="1102" | Mortality$Cause=="1103"), ]
Homicide_103 <- Mortality[Mortality$List=="103" & (Mortality$Cause=="X85" | Mortality$Cause=="X86" | Mortality$Cause=="X87" | Mortality$Cause=="X88" | Mortality$Cause=="X89" | Mortality$Cause=="X90" | Mortality$Cause=="X91" | Mortality$Cause=="X92" | Mortality$Cause=="X93" | Mortality$Cause=="X94" | Mortality$Cause=="X95" | Mortality$Cause=="X96" | Mortality$Cause=="X97" | Mortality$Cause=="X98" | Mortality$Cause=="X99" | Mortality$Cause=="Y00" | Mortality$Cause=="Y01" | Mortality$Cause=="Y02" | Mortality$Cause=="Y03" | Mortality$Cause=="Y04" | Mortality$Cause=="Y05" | Mortality$Cause=="Y06" | Mortality$Cause=="Y07" | Mortality$Cause=="Y08" | Mortality$Cause=="Y09"), ]
Homicide_103 <- Mortality[Mortality$List=="103" & (Mortality$Cause=="X85" | Mortality$Cause=="X86" | Mortality$Cause=="X87" | Mortality$Cause=="X88" | Mortality$Cause=="X89" | Mortality$Cause=="X90" | Mortality$Cause=="X91" | Mortality$Cause=="X92" | Mortality$Cause=="X93" | Mortality$Cause=="X94" | Mortality$Cause=="X95" | Mortality$Cause=="X96" | Mortality$Cause=="X97" | Mortality$Cause=="X98" | Mortality$Cause=="X99" | Mortality$Cause=="Y00" | Mortality$Cause=="Y01" | Mortality$Cause=="Y02" | Mortality$Cause=="Y03" | Mortality$Cause=="Y04" | Mortality$Cause=="Y05" | Mortality$Cause=="Y06" | Mortality$Cause=="Y07" | Mortality$Cause=="Y08" | Mortality$Cause=="Y09"), ]


Homicide_104 <- Mortality[Mortality$List=="104" & (Mortality$Cause=="X850" | Mortality$Cause=="X851" | Mortality$Cause=="X852"	| Mortality$Cause=="X853"	| Mortality$Cause=="X854" | Mortality$Cause=="X855" | Mortality$Cause=="X856" | Mortality$Cause=="X857" | Mortality$Cause=="X858" | Mortality$Cause=="X859" | Mortality$Cause=="X860" | Mortality$Cause=="X861" | Mortality$Cause=="X862" | Mortality$Cause=="X864" | Mortality$Cause=="X865" | Mortality$Cause=="X866" | Mortality$Cause=="X868" | Mortality$Cause=="X869" | Mortality$Cause=="X870" | Mortality$Cause=="X871" | Mortality$Cause=="X872" | Mortality$Cause=="X874" | Mortality$Cause=="X875" | Mortality$Cause=="X876" | Mortality$Cause=="X877" | Mortality$Cause=="X878" | Mortality$Cause=="X879" | Mortality$Cause=="X880" | Mortality$Cause=="X881" | Mortality$Cause=="X882" | Mortality$Cause=="X883" | Mortality$Cause=="X884" | Mortality$Cause=="X885" | Mortality$Cause=="X886" | Mortality$Cause=="X887" | Mortality$Cause=="X888" | Mortality$Cause=="X889" | Mortality$Cause=="X890" | Mortality$Cause=="X891" | Mortality$Cause=="X892" | Mortality$Cause=="X893" | Mortality$Cause=="X894" | Mortality$Cause=="X895" | Mortality$Cause=="X896" | Mortality$Cause=="X897" | Mortality$Cause=="X898" | Mortality$Cause=="X899" | Mortality$Cause=="X900" | Mortality$Cause=="X901" | Mortality$Cause=="X902" | Mortality$Cause=="X903" | Mortality$Cause=="X904" | Mortality$Cause=="X905" | Mortality$Cause=="X906" | Mortality$Cause=="X907" | Mortality$Cause=="X908" | Mortality$Cause=="X909" | Mortality$Cause=="X910" | Mortality$Cause=="X911" | Mortality$Cause=="X912" | Mortality$Cause=="X913" | Mortality$Cause=="X914" | Mortality$Cause=="X915" | Mortality$Cause=="X916" | Mortality$Cause=="X917" | Mortality$Cause=="X918" | Mortality$Cause=="X919" | Mortality$Cause=="X920" | Mortality$Cause=="X921" | Mortality$Cause=="X922" | Mortality$Cause=="X923" | Mortality$Cause=="X924" | Mortality$Cause=="X925" | Mortality$Cause=="X926" | Mortality$Cause=="X927" | Mortality$Cause=="X928" | Mortality$Cause=="X929" | Mortality$Cause=="X930" | Mortality$Cause=="X931" | Mortality$Cause=="X932" | Mortality$Cause=="X933" | Mortality$Cause=="X934" | Mortality$Cause=="X935" | Mortality$Cause=="X936" | Mortality$Cause=="X937" | Mortality$Cause=="X938" | Mortality$Cause=="X939" | Mortality$Cause=="X940" | Mortality$Cause=="X941" | Mortality$Cause=="X942" | Mortality$Cause=="X943" | Mortality$Cause=="X944" | Mortality$Cause=="X945" | Mortality$Cause=="X946" | Mortality$Cause=="X947" | Mortality$Cause=="X948" | Mortality$Cause=="X949" | Mortality$Cause=="X950" | Mortality$Cause=="X951" | Mortality$Cause=="X952" | Mortality$Cause=="X953" | Mortality$Cause=="X954" | Mortality$Cause=="X955" | Mortality$Cause=="X956" | Mortality$Cause=="X957" | Mortality$Cause=="X958" | Mortality$Cause=="X959" | Mortality$Cause=="X960" | Mortality$Cause=="X961" | Mortality$Cause=="X962" | Mortality$Cause=="X963" | Mortality$Cause=="X964" | Mortality$Cause=="X965" | Mortality$Cause=="X966" | Mortality$Cause=="X967" | Mortality$Cause=="X968" | Mortality$Cause=="X969" | Mortality$Cause=="X970" | Mortality$Cause=="X971" | Mortality$Cause=="X972" | Mortality$Cause=="X973" | Mortality$Cause=="X974" | Mortality$Cause=="X975" | Mortality$Cause=="X976" | Mortality$Cause=="X977" | Mortality$Cause=="X978" | Mortality$Cause=="X979" | Mortality$Cause=="X980" | Mortality$Cause=="X981" | Mortality$Cause=="X982" | Mortality$Cause=="X983" | Mortality$Cause=="X984" | Mortality$Cause=="X985" | Mortality$Cause=="X987" | Mortality$Cause=="X988" | Mortality$Cause=="X989" | Mortality$Cause=="X990" | Mortality$Cause=="X991" | Mortality$Cause=="X992" | Mortality$Cause=="X993" | Mortality$Cause=="X994" | Mortality$Cause=="X995" | Mortality$Cause=="X996" | Mortality$Cause=="X997" | Mortality$Cause=="X998" | Mortality$Cause=="X999" | Mortality$Cause=="Y000" | Mortality$Cause=="Y001" | Mortality$Cause=="Y002" | Mortality$Cause=="Y003" | Mortality$Cause=="Y004" | Mortality$Cause=="Y005" | Mortality$Cause=="Y006" | Mortality$Cause=="Y007" | Mortality$Cause=="Y008" | Mortality$Cause=="Y009" | Mortality$Cause=="Y010" | Mortality$Cause=="Y011" | Mortality$Cause=="Y012" | Mortality$Cause=="Y013" | Mortality$Cause=="Y014" | Mortality$Cause=="Y015" | Mortality$Cause=="Y016" | Mortality$Cause=="Y017" | Mortality$Cause=="Y018" | Mortality$Cause=="Y019" | Mortality$Cause=="Y020" | Mortality$Cause=="Y021" | Mortality$Cause=="Y022" | Mortality$Cause=="Y023" | Mortality$Cause=="Y024" | Mortality$Cause=="Y025" | Mortality$Cause=="Y026" | Mortality$Cause=="Y027" | Mortality$Cause=="Y028" | Mortality$Cause=="Y029" | Mortality$Cause=="Y030" | Mortality$Cause=="Y031" | Mortality$Cause=="Y032" | Mortality$Cause=="Y033" | Mortality$Cause=="Y034" | Mortality$Cause=="Y035" | Mortality$Cause=="Y036" | Mortality$Cause=="Y037" | Mortality$Cause=="Y038" | Mortality$Cause=="Y039" | Mortality$Cause=="Y040" | Mortality$Cause=="Y041" | Mortality$Cause=="Y042" | Mortality$Cause=="Y043" | Mortality$Cause=="Y044" | Mortality$Cause=="Y045" | Mortality$Cause=="Y046" | Mortality$Cause=="Y047" | Mortality$Cause=="Y048" | Mortality$Cause=="Y049" | Mortality$Cause=="Y050" | Mortality$Cause=="Y051" | Mortality$Cause=="Y052" | Mortality$Cause=="Y053" | Mortality$Cause=="Y054" | Mortality$Cause=="Y055" | Mortality$Cause=="Y056" | Mortality$Cause=="Y057" | Mortality$Cause=="Y058" | Mortality$Cause=="Y059" | Mortality$Cause=="Y060" | Mortality$Cause=="Y061" | Mortality$Cause=="Y062" | Mortality$Cause=="Y068" | Mortality$Cause=="Y069" | Mortality$Cause=="Y070" | Mortality$Cause=="Y071" | Mortality$Cause=="Y072" | Mortality$Cause=="Y073" | Mortality$Cause=="Y078" | Mortality$Cause=="Y079" | Mortality$Cause=="Y080" | Mortality$Cause=="Y081" | Mortality$Cause=="Y082" | Mortality$Cause=="Y083" | Mortality$Cause=="Y084" | Mortality$Cause=="Y085" | Mortality$Cause=="Y086" | Mortality$Cause=="Y087" | Mortality$Cause=="Y088" | Mortality$Cause=="Y089" | Mortality$Cause=="Y090" | Mortality$Cause=="Y091" | Mortality$Cause=="Y092" | Mortality$Cause=="Y093" | Mortality$Cause=="Y094" | Mortality$Cause=="Y095" | Mortality$Cause=="Y096" | Mortality$Cause=="Y097" | Mortality$Cause=="Y098" | Mortality$Cause=="Y099" | Mortality$Cause=="Y871"), ]


Homicide_10M <- Mortality[Mortality$List=="10M" & Mortality$Cause=="B050", ]
Homicide_UE1 <- Mortality[Mortality$List=="UE1" & Mortality$Cause=="B050", ]

unique(Homicide_09N$List)
unique(Homicide_09N$Cause)


                        (Mortality$List=="103" & (Mortality$Cause=="X85" | Mortality$Cause=="X86" | Mortality$Cause=="X87" | Mortality$Cause=="X88" | Mortality$Cause=="X89" | Mortality$Cause=="X90" | Mortality$Cause=="X91" | Mortality$Cause=="X92" | Mortality$Cause=="X93" | Mortality$Cause=="X94" | Mortality$Cause=="X95" | Mortality$Cause=="X96" | Mortality$Cause=="X97" | Mortality$Cause=="X98" | Mortality$Cause=="X99" | Mortality$Cause=="Y00" | Mortality$Cause=="Y01" | Mortality$Cause=="Y02" | Mortality$Cause=="Y03" | Mortality$Cause=="Y04" | Mortality$Cause=="Y05" | Mortality$Cause=="Y06" | Mortality$Cause=="Y07" | Mortality$Cause=="Y08" | Mortality$Cause=="Y09")),
                        (Mortality$List=="104" & (Mortality$Cause=="X850" | Mortality$Cause=="X851" | Mortality$Cause=="X852"	| Mortality$Cause=="X853"	| Mortality$Cause=="X854" | Mortality$Cause=="X855" | Mortality$Cause=="X856" | Mortality$Cause=="X857" | Mortality$Cause=="X858" | Mortality$Cause=="X859" | Mortality$Cause=="X860" | Mortality$Cause=="X861" | Mortality$Cause=="X862" | Mortality$Cause=="X864" | Mortality$Cause=="X865" | Mortality$Cause=="X866" | Mortality$Cause=="X868" | Mortality$Cause=="X869" | Mortality$Cause=="X870" | Mortality$Cause=="X871" | Mortality$Cause=="X872" | Mortality$Cause=="X874" | Mortality$Cause=="X875" | Mortality$Cause=="X876" | Mortality$Cause=="X877" | Mortality$Cause=="X878" | Mortality$Cause=="X879" | Mortality$Cause=="X880" | Mortality$Cause=="X881" | Mortality$Cause=="X882" | Mortality$Cause=="X883" | Mortality$Cause=="X884" | Mortality$Cause=="X885" | Mortality$Cause=="X886" | Mortality$Cause=="X887" | Mortality$Cause=="X888" | Mortality$Cause=="X889" | Mortality$Cause=="X890" | Mortality$Cause=="X891" | Mortality$Cause=="X892" | Mortality$Cause=="X893" | Mortality$Cause=="X894" | Mortality$Cause=="X895" | Mortality$Cause=="X896" | Mortality$Cause=="X897" | Mortality$Cause=="X898" | Mortality$Cause=="X899" | Mortality$Cause=="X900" | Mortality$Cause=="X901" | Mortality$Cause=="X902" | Mortality$Cause=="X903" | Mortality$Cause=="X904" | Mortality$Cause=="X905" | Mortality$Cause=="X906" | Mortality$Cause=="X907" | Mortality$Cause=="X908" | Mortality$Cause=="X909" | Mortality$Cause=="X910" | Mortality$Cause=="X911" | Mortality$Cause=="X912" | Mortality$Cause=="X913" | Mortality$Cause=="X914" | Mortality$Cause=="X915" | Mortality$Cause=="X916" | Mortality$Cause=="X917" | Mortality$Cause=="X918" | Mortality$Cause=="X919" | Mortality$Cause=="X920" | Mortality$Cause=="X921" | Mortality$Cause=="X922" | Mortality$Cause=="X923" | Mortality$Cause=="X924" | Mortality$Cause=="X925" | Mortality$Cause=="X926" | Mortality$Cause=="X927" | Mortality$Cause=="X928" | Mortality$Cause=="X929" | Mortality$Cause=="X930" | Mortality$Cause=="X931" | Mortality$Cause=="X932" | Mortality$Cause=="X933" | Mortality$Cause=="X934" | Mortality$Cause=="X935" | Mortality$Cause=="X936" | Mortality$Cause=="X937" | Mortality$Cause=="X938" | Mortality$Cause=="X939" | Mortality$Cause=="X940" | Mortality$Cause=="X941" | Mortality$Cause=="X942" | Mortality$Cause=="X943" | Mortality$Cause=="X944" | Mortality$Cause=="X945" | Mortality$Cause=="X946" | Mortality$Cause=="X947" | Mortality$Cause=="X948" | Mortality$Cause=="X949" | Mortality$Cause=="X950" | Mortality$Cause=="X951" | Mortality$Cause=="X952" | Mortality$Cause=="X953" | Mortality$Cause=="X954" | Mortality$Cause=="X955" | Mortality$Cause=="X956" | Mortality$Cause=="X957" | Mortality$Cause=="X958" | Mortality$Cause=="X959" | Mortality$Cause=="X960" | Mortality$Cause=="X961" | Mortality$Cause=="X962" | Mortality$Cause=="X963" | Mortality$Cause=="X964" | Mortality$Cause=="X965" | Mortality$Cause=="X966" | Mortality$Cause=="X967" | Mortality$Cause=="X968" | Mortality$Cause=="X969" | Mortality$Cause=="X970" | Mortality$Cause=="X971" | Mortality$Cause=="X972" | Mortality$Cause=="X973" | Mortality$Cause=="X974" | Mortality$Cause=="X975" | Mortality$Cause=="X976" | Mortality$Cause=="X977" | Mortality$Cause=="X978" | Mortality$Cause=="X979" | Mortality$Cause=="X980" | Mortality$Cause=="X981" | Mortality$Cause=="X982" | Mortality$Cause=="X983" | Mortality$Cause=="X984" | Mortality$Cause=="X985" | Mortality$Cause=="X987" | Mortality$Cause=="X988" | Mortality$Cause=="X989" | Mortality$Cause=="X990" | Mortality$Cause=="X991" | Mortality$Cause=="X992" | Mortality$Cause=="X993" | Mortality$Cause=="X994" | Mortality$Cause=="X995" | Mortality$Cause=="X996" | Mortality$Cause=="X997" | Mortality$Cause=="X998" | Mortality$Cause=="X999" | Mortality$Cause=="Y000" | Mortality$Cause=="Y001" | Mortality$Cause=="Y002" | Mortality$Cause=="Y003" | Mortality$Cause=="Y004" | Mortality$Cause=="Y005" | Mortality$Cause=="Y006" | Mortality$Cause=="Y007" | Mortality$Cause=="Y008" | Mortality$Cause=="Y009" | Mortality$Cause=="Y010" | Mortality$Cause=="Y011" | Mortality$Cause=="Y012" | Mortality$Cause=="Y013" | Mortality$Cause=="Y014" | Mortality$Cause=="Y015" | Mortality$Cause=="Y016" | Mortality$Cause=="Y017" | Mortality$Cause=="Y018" | Mortality$Cause=="Y019" | Mortality$Cause=="Y020" | Mortality$Cause=="Y021" | Mortality$Cause=="Y022" | Mortality$Cause=="Y023" | Mortality$Cause=="Y024" | Mortality$Cause=="Y025" | Mortality$Cause=="Y026" | Mortality$Cause=="Y027" | Mortality$Cause=="Y028" | Mortality$Cause=="Y029" | Mortality$Cause=="Y030" | Mortality$Cause=="Y031" | Mortality$Cause=="Y032" | Mortality$Cause=="Y033" | Mortality$Cause=="Y034" | Mortality$Cause=="Y035" | Mortality$Cause=="Y036" | Mortality$Cause=="Y037" | Mortality$Cause=="Y038" | Mortality$Cause=="Y039" | Mortality$Cause=="Y040" | Mortality$Cause=="Y041" | Mortality$Cause=="Y042" | Mortality$Cause=="Y043" | Mortality$Cause=="Y044" | Mortality$Cause=="Y045" | Mortality$Cause=="Y046" | Mortality$Cause=="Y047" | Mortality$Cause=="Y048" | Mortality$Cause=="Y049" | Mortality$Cause=="Y050" | Mortality$Cause=="Y051" | Mortality$Cause=="Y052" | Mortality$Cause=="Y053" | Mortality$Cause=="Y054" | Mortality$Cause=="Y055" | Mortality$Cause=="Y056" | Mortality$Cause=="Y057" | Mortality$Cause=="Y058" | Mortality$Cause=="Y059" | Mortality$Cause=="Y060" | Mortality$Cause=="Y061" | Mortality$Cause=="Y062" | Mortality$Cause=="Y068" | Mortality$Cause=="Y069" | Mortality$Cause=="Y070" | Mortality$Cause=="Y071" | Mortality$Cause=="Y072" | Mortality$Cause=="Y073" | Mortality$Cause=="Y078" | Mortality$Cause=="Y079" | Mortality$Cause=="Y080" | Mortality$Cause=="Y081" | Mortality$Cause=="Y082" | Mortality$Cause=="Y083" | Mortality$Cause=="Y084" | Mortality$Cause=="Y085" | Mortality$Cause=="Y086" | Mortality$Cause=="Y087" | Mortality$Cause=="Y088" | Mortality$Cause=="Y089" | Mortality$Cause=="Y090" | Mortality$Cause=="Y091" | Mortality$Cause=="Y092" | Mortality$Cause=="Y093" | Mortality$Cause=="Y094" | Mortality$Cause=="Y095" | Mortality$Cause=="Y096" | Mortality$Cause=="Y097" | Mortality$Cause=="Y098" | Mortality$Cause=="Y099" | Mortality$Cause=="Y871")),
                        (Mortality$List=="10M" & (Mortality$Cause=="Y871" | Mortality$Cause=="X85" | Mortality$Cause=="X86" | Mortality$Cause=="X87" | Mortality$Cause=="X88" | Mortality$Cause=="X89" | Mortality$Cause=="X90" | Mortality$Cause=="X91" | Mortality$Cause=="X92" | Mortality$Cause=="X93" | Mortality$Cause=="X94" | Mortality$Cause=="X95" | Mortality$Cause=="X96" | Mortality$Cause=="X97" | Mortality$Cause=="X98" | Mortality$Cause=="X99" | Mortality$Cause=="Y00" | Mortality$Cause=="Y01" | Mortality$Cause=="Y02" | Mortality$Cause=="Y03" | Mortality$Cause=="Y04" | Mortality$Cause=="Y05" | Mortality$Cause=="Y06" | Mortality$Cause=="Y07" | Mortality$Cause=="Y08" | Mortality$Cause=="Y09")),
                        (Mortality$List=="UE1" & Mortality$Cause=="UE64")), ]





save (Mortality, file = "Data/Mortality.RData")
save(Population, file = "Data/Population.RData")

load("Data/Mortality.RData")
load("Data/Population.RData")

rm(list = ls())


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