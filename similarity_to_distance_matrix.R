#Creation of an element that contains the data
GED_norm<-read.delim("GeneExpressionDataset_normalized.tsv",row.names=1)
#Creation of a matrix where the logged differential expressions will be stored
logmat<-matrix(NA,length(GED_norm[,1]),5)
row.names(logmat)<-row.names(GED_norm)
colnames(logmat)<-c("log2FC(TG)","log2FC(TherA)","log2FC(TherB)","log2FC(TherC)","log2FC(TherD)")
#Application of a while-loop and a for-loop to compute the logged differential expressions
k=11
l=20
m=1
while (l<=60){
  for(i in 1:length(logmat[,1])){
    logmat[i,m]<-mean(as.numeric(GED_norm[i,k:l]))-mean(as.numeric(GED_norm[i,1:10]))
  }
  k<-k+10
  l<-l+10
  m<-m+1}
print(head(logmat))
