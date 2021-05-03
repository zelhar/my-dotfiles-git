library(styler)
library(formatR)

#f <- file("stdin", "r")
#mylines <- readLines(f)
#close(f)


#mylines <- tidy_source(mylines, width.cutoff = 48)

# outstring <- style_text(mylines)

#outstring <- tidy_source(mylines)

#outstring <- tidy_source(text = mylines, width.cutoff=68)


#write(outstring, "")

#lines <- readLines(con = file("stdin"))
#outstring <- tidy_source(text = lines, width.cutoff=48, arrow=TRUE)
#q()

f <- file("stdin", "r")
outstring <- tidy_source(source=f, width.cutoff=68, arrow=TRUE)
q()
