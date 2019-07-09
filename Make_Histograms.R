library(ggplot2)

library(gdata)

# Set PATH equal to the working directory that stores your example data set.
# PATH = ''

Data = read.csv(sprintf('%s\\Example_Data.csv', PATH), check.names = FALSE, fileEncoding="UTF-8-BOM")

valCol = 'Animals'

df = as.data.frame(Data)

freq_vec = c(df[['Frequency']])

Vals = df[[valCol]]

Vals = Vals[!is.na(freq_vec)]

freq_vec = freq_vec[!is.na(freq_vec)]

barplot(freq_vec, main = valCol, xlab = valCol, names.arg = Vals)

valsNew = c()
j = 1

for (i in Vals){
  updateVec = c()
  updateVec = rep(i,freq_vec[[j]])
  valsNew = c(valsNew,updateVec)
  j = j + 1
}

valsNew

valsDf = data.frame((valsNew))

colnames(valsDf) = c(valCol)

valsDf

p = qplot(valsNew,
      geom="bar",
      # binwidth = 0.01,
      main = sprintf("Histogram of %s", 'Animals in the Zoo.'),
      xlab = "Value",
      ylab = 'Frequency',
      fill=I('#004488'),
      col=I('#000000'),
      alpha=I(1)
) + theme(plot.title = element_text(size = 20)) + theme(axis.title.x = element_text(size = 18)) + theme(axis.title.y = element_text(size = 18))

p = p + theme(axis.text.x = element_text(size = 14), axis.text.y = element_text(size = 14))

p = p + theme(axis.title.y = element_text(margin = margin(t = 0, r = 20, b = 0, l = 0))) + theme(axis.title.x = element_text(margin = margin(t = 20, r = 0, b = 0, l = 0)))

p




