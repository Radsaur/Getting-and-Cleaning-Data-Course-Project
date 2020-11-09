#--------------------------------------------------------------------------
#1. Set the working directory/unpack files
#--------------------------------------------------------------------------
#quickly set wd by copying the path to my work dir and replacing \ by /
x <- readline()
D:\DOCS\Sauran.S\R\Coursera\Questions\Week4
x<-gsub("\\\\", "/", x)
setwd(x)
path<-getwd()

#reading and unzipping files
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,  "df.zip")
unzip('df.zip')
setwd("./UCI HAR Dataset")

#--------------------------------------------------------------------------
#2.Read the files and merge them into one dataset
#--------------------------------------------------------------------------
#select all files which are gonna be needed for the task
train<-list.files('train',full.names = T)
test<- list.files('test',full.names = T)
file_names<-c(train[2:4],test[2:4])

# Read in all six files
data <-lapply(file_names, read.table, stringsAsFactors = F, header = F)
df <- mapply(rbind, data[1:3], data[4:6])
df_full<-do.call(cbind,df) 


library(data.table)
list.files() #check the file name needed, select and copy "features.txt"
featurenames <- fread("features.txt", header = FALSE, stringsAsFactor = FALSE )

#-------------------------------------------------------------------------
#3. Uses descriptive activity names to name the activities in the data set
#-------------------------------------------------------------------------
setnames(df_full, c(1:ncol(df_full)), c( "subject", featurenames$V2, "activity" ) )

# Extract only those columns which end with mean() or std()
# Move the index of each columns by 1,as we should not touch the first column
# We have to use some meta data to isolate means() and std() from other similarly written words

index_df <- grep( "std|mean\\(\\)", featurenames$V2 ) + 1

# contains only the mean and standard deviation for feature column, as always we add one column at the begiing at 
df_full1 <- df_full[, c(1, index_df, 563 )]

#--------------------------------------------------------------------------
#4.Appropriately labels the data set with descriptive variable names
#--------------------------------------------------------------------------

list.files()

descrop_names <- fread("activity_labels.txt", header = FALSE, stringsAsFactor = FALSE )

df_full1$activity <- descrop_names$V2[match(df_full1$activity, descrop_names$V1)]

#--------------------------------------------------------------------------
#5. Tidy Data 
#--------------------------------------------------------------------------

tidy_data <- aggregate( . ~ subject + activity, data = df_full1, FUN = mean )
write.table( tidy_data, "tidy_data.txt", row.names = FALSE )
