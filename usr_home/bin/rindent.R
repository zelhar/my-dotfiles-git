library(styler)
library(formatR)

f <- file("stdin", 'r')

mylines <- readLines(f)


#mylines <- tidy_source(mylines)

outstring <- style_text(mylines)

#outstring <- tidy_source(text=outstring)

write(outstring, "")

q()
