getwd()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile = "C:/Users/Nel/Documents/R files/getandcleandata/data.xls")
list.files(getwd())
data <- read_csv("./data.csv")
options(max.print = 50)
library(XML)

class(data$VAL)

val <- as.numeric(data$VAL)
sum(val == 24, na.rm = TRUE)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx", destfile = "C:/Users/Nel/Documents/R files/getandcleandata/gas_data.xlsx", mode="wb")
gasdata <- read_excel("./gas_data.xlsx")
install.packages("XML")
colindex <- 7:15
rowindex <- 18:23
dat <- read.xlsx("./gas_data.xlsx", sheetIndex=1, colIndex = colindex,rowIndex = rowindex)
sum(dat$Zip*dat$Ext,na.rm=T)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml", destfile = "./rest.xml")
rest_data <- xmlTreeParse("./rest.xml", useInternal=TRUE)
r <- xmlRoot(rest_data)
xmlName(r)
xmlSize(r)
r[[1]]
xmlName(r[[1]])
xmlSize(r[[1]])
xmlAttrs(r[[1]])
xmlChildren(r[[1]])
xmlChildren(r)
sapply(xmlChildren(r[[1]]), xmlName)
xmlApply(r[[1]], xmlAttrs)
r[[1]]["zipcode"]
xmlValue(r[[1]][[1]][[2]])
xmlValue(r[[1]][[1]]["zipcode"])
rest_zipcodes <- 1:1:xmlSize(r[[1]])
count_zipcodes <- for(i in 1:xmlSize(r[[1]])) {
  rest_zipcodes[i] <- xmlValue(r[[1]][[i]][[2]]) == "21231"
}
sum(rest_zipcodes)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", destfile = "./acs.csv", mode="wb")
acs_data <- fread()
?fread
install.packages("fasttime")
library(fasttime)
library(swirl)
install.packages("swirl")
library(swirl)
packageVersion("swirl")
swirl()
Nel
install_course("Getting and Cleaning Data")

getwd()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile = "./uscomsm.csv" )
uscomms <- read.csv("./uscomsm.csv")
head(uscomms)
agricultureLogical <- uscomms$ACR >= 3 & uscomms$AGS == 6
which(agricultureLogical)

install.packages("jpeg")
library(jpeg)
image <- readJPEG("./photo.jpeg", native=TRUE)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg", destfile = "./photo.jpeg", mode = "wb")
?download.file
quantile(image, probs = 0.80)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", destfile = "./edu.csv")
gdp <- read.csv("./gdp.csv", skip = 5, header = FALSE)
edu <- read.csv("./edu.csv")
head(gdp)
gdp <- colnames(gdp,C("CountryCode", "Rank", "v3", "Country", "gdp", "v6", "v7", "v8", "v9","v10"))
colnames(gdp) <- c("CountryCode", "Rank", "v3", "Country", "gdp", "v6", "v7", "v8", "v9","v10")
?colnames
str(edu)
gdp_edu <- gdp %>%
  right_join(edu, by = "CountryCode") %>%
  mutate(Rank = as.integer(Rank)) %>%
  arrange(desc(Rank))
str(gdp_edu)
sum(!is.na(gdp_edu$CountryCode))

head(gdp_edu)
gdp_edu2 <- merge(edu, gdp, by.x = "CountryCode", by.y = "CountryCode", all = TRUE)
dim(gdp_edu2)
head(select(gdp_edu2, 1:8))
unique(gdp_edu2$CountryCode)
colnames(edu)
head(edu$Income.Group)
class(gdp_edu$Rank)
gdp_edu$Groups <- cut(gdp_edu$Rank, breaks = quantile(gdp_edu$Rank, na.rm = TRUE, probs =c(0,0.2,0.4,0.6,0.8,1)))
table(gdp_edu$Groups, gdp_edu$Income.Group)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile = "./idaho.csv")
idaho <- read.csv("./idaho.csv")
options(max.print = 50)
dim(idaho)
head(select(idaho,1:5))
library(tidyverse)
install.packages("tidyverse")
idaho_split <- strsplit(colnames(idaho), "wgtp")
idaho_split[123]
gdp$V5 <- parse_number(gdp$V5, locale = locale(grouping_mark = "'"))
gdp
mean(parse_number(gsub(",","",gdp$V5)), na.rm = TRUE)
gdp
gdp <- gdp[1:190,]
grep("^United", gdp$V4)
gdp_edu
gdp_edu %>%
  select(contains("Fiscal"))
fiscal_pos <- grep("[Ff]iscal year end", gdp_edu$Special.Notes)
fiscal <- gdp_edu$Special.Notes[fiscal_pos]
sum(grepl("[Jj]une", fiscal))
install.packages("quantmod")
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
head(sampleTimes)
sampleTimes
sum(year(sampleTimes) == 2012)
?year

y <- year(sampleTimes)
x <- 1:length(sampleTimes)
sum(weekdays(sampleTimes[year(sampleTimes) == 2012]) == "Monday")
