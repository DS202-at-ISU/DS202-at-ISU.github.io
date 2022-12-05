# the output of kaggle_meta has two important variables:
# key and value
# and then a lot of 'stuff' that might be important
# unfortunately there is also 'stuff' in both the key and value variables
# but you can see from the example below that it might be at least
# workable, if not pretty

kaggle_meta <- function(url) {
  site <- read_html(url)
  text <- site %>% html_elements(css="div[data-component-name=DatasetMaterialContainer]+script") %>% html_text()


  #remotes::install_github("bedapub/ribiosArg")
  library(ribiosArg)
  left <- gregexpr("{", text, fixed=TRUE)
  right <- gregexpr("}", text, fixed=TRUE)

  dframe <- data.frame(
    index = c(left[[1]], right[[1]]),
    side = c(rep("L", length(left[[1]])), rep("R", length(right[[1]]))),
    depth = c(rep(1, length(left[[1]])), rep(-1, length(right[[1]])))
  )
  dframe <- dframe %>% arrange(index) %>% mutate(
    depth = cumsum(depth),
    length = c(diff(index), NA)
  )

  dframe <- dframe %>% arrange(desc(depth))
  dframe <- dframe %>% mutate(
    piece = str_sub(text, index, index+length)
  )


  splitPiece <- function(x) {
    if (is.na(x)) return(data.frame())
    idx <- grep(":", x)
    if (length(idx) < 1) return(data.frame())

    x <- gsub("http:/", "http/", x)
    x <- gsub("https:/", "https/", x)
    x <- gsub("\"","", x)
    res <- parsePairs(x, sep=":")
    if (length(res) == 0) return(data.frame())
    res <- data.frame(res)
    row.names(res) <- NULL
    attr(res$key, "names") <- NULL
    attr(res$value, "names") <- NULL
    res
  }

  dframe <- dframe %>% mutate(
    list = piece %>% purrr::map(.f= splitPiece)
  )

  meta <- unnest(dframe, col=list)
  meta
}

# example:

url <- "https://www.kaggle.com/datasets/shivam2503/diamonds?select=diamonds.csv"
meta <- kaggle_meta(url)


# download the csv file and save it as temp.csv
idx <- grep("downloadUrl", meta$key)
down_url <- meta$value[idx][2]

download.file(paste0("https://www.kaggle.com", down_url),
              destfile = "temp.csv", mode = "wb")
