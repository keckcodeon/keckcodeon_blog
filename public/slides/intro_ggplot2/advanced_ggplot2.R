## ----setup, include=FALSE------------------------------------------------
options(htmltools.dir.version = FALSE)

knitr::opts_chunk$set(fig.height = 4, message = F, warning = F)


## ---- eval = F-----------------------------------------------------------
## # Load the ggplot2 package
## install.packages("ggplot2")
## install.packages("magrittr") # important so that we can use %>%!
## install.packages("gapminder")
## install.packages("dplyr")


## ------------------------------------------------------------------------
# Load the ggplot2 package
library(ggplot2)
library(magrittr) # important so that we can use %>%!
library(gapminder)
library(dplyr)


## ---- echo = F-----------------------------------------------------------

knitr::kable(head(mtcars), format = "html")


## ------------------------------------------------------------------------

str(mtcars)


## ------------------------------------------------------------------------

ggplot(mtcars, aes(x = cyl, y = mpg)) +
  geom_point()


## ------------------------------------------------------------------------
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point()


## ------------------------------------------------------------------------
ggplot(mtcars, aes(x = wt, y = mpg, color = disp)) +
  geom_point()


## ------------------------------------------------------------------------
ggplot(mtcars, aes(x = wt, y = mpg, size = disp)) +
  geom_point()



## ---- eval = F-----------------------------------------------------------
## ggplot(mtcars, aes(x = wt, y = mpg, shape = disp)) +
##   geom_point()
## 


## ------------------------------------------------------------------------

table(mtcars$disp)


## ------------------------------------------------------------------------
# Explore the diamonds data frame with str()
str(diamonds)


## ------------------------------------------------------------------------
# Add geom_point() with +
ggplot(diamonds, aes(x = carat, y = price))  +
  geom_point()


## ------------------------------------------------------------------------
# Add geom_point() and geom_smooth() with +
ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point() +
  geom_smooth()


## ---- echo = F-----------------------------------------------------------
# 1 - The plot you created in the previous exercise
ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point() +
  geom_smooth()


## ---- eval = F-----------------------------------------------------------
## # 1 - The plot you created in the previous exercise
## ggplot(diamonds, aes(x = carat, y = price)) +
##   geom_point() +
##   geom_smooth()


## ---- echo = F-----------------------------------------------------------
# 2 - Copy the above command but show only the smooth line
ggplot(diamonds, aes(x = carat, y = price)) +
  geom_smooth()


## ---- eval = F-----------------------------------------------------------
## # 2 - Copy the above command but show only the smooth line
## ggplot(diamonds, aes(x = carat, y = price)) +
##   geom_smooth()


## ---- echo = F-----------------------------------------------------------
# 3 - Copy the above command and assign the correct value to col in aes()
ggplot(diamonds, aes(x = carat, y = price, color = clarity)) +
  geom_smooth()


## ---- eval = F-----------------------------------------------------------
## # 3 - Copy the above command and assign the correct value to col in aes()
## ggplot(diamonds, aes(x = carat, y = price, color = clarity)) +
##   geom_smooth()


## ---- echo = F-----------------------------------------------------------
# 4 - Keep the color settings from previous command. Plot only the points with argument alpha.
ggplot(diamonds, aes(x = carat, y = price, color = clarity)) +
  geom_point(alpha = 0.4)


## ---- eval = F-----------------------------------------------------------
## # 4 - Keep the color settings from previous command. Plot only the points with argument alpha.
## ggplot(diamonds, aes(x = carat, y = price, color = clarity)) +
##   geom_point(alpha = 0.4)


## ------------------------------------------------------------------------
# Create the object containing the data and aes layers: dia_plot
dia_plot <- ggplot(diamonds, aes(x = carat, y = price))

# Add a geom layer with + and geom_point()
dia_plot + geom_point()


## ------------------------------------------------------------------------
# Add the same geom layer, but with aes() inside
dia_plot + geom_point(aes(color = clarity))


## ---- echo = F-----------------------------------------------------------
# 2 - Expand dia_plot by adding geom_point() with alpha set to 0.2
dia_plot <- dia_plot + geom_point(alpha = 0.2)
print(dia_plot)


## ---- eval = F-----------------------------------------------------------
## # 2 - Expand dia_plot by adding geom_point() with alpha set to 0.2
## dia_plot <- dia_plot + geom_point(alpha = 0.2)
## print(dia_plot)


## ---- echo = F-----------------------------------------------------------
# 3 - Plot dia_plot with additional geom_smooth() with se set to FALSE
dia_plot + geom_smooth(se = FALSE)


## ---- eval = F-----------------------------------------------------------
## # 3 - Plot dia_plot with additional geom_smooth() with se set to FALSE
## dia_plot + geom_smooth(se = FALSE)


## ---- echo = F-----------------------------------------------------------
# 4 - Copy the command from above and add aes() with the correct mapping to geom_smooth()
dia_plot + geom_smooth(aes(col = clarity), se = FALSE)


## ---- eval = F-----------------------------------------------------------
## # 4 - Copy the command from above and add aes() with the correct mapping to geom_smooth()
## dia_plot + geom_smooth(aes(col = clarity), se = FALSE)


## ------------------------------------------------------------------------
knitr::kable(head(iris), format = "html")


## ------------------------------------------------------------------------
plot(iris$Sepal.Length, iris$Sepal.Width)
points(iris$Petal.Length, iris$Petal.Width, col = "red")


## ------------------------------------------------------------------------
# Plot the correct variables of mtcars
plot(mtcars$wt, mtcars$mpg, col = mtcars$cyl)


## ------------------------------------------------------------------------
# Change cyl inside mtcars to a factor
mtcars$fcyl <- as.factor(mtcars$cyl)

# Make the same plot as in the first instruction
plot(mtcars$wt, mtcars$mpg, col = mtcars$fcyl)


## ------------------------------------------------------------------------
# Use lm() to calculate a linear model and save it as carModel
carModel <- lm(mpg ~ wt, data = mtcars)

# Basic plot
mtcars$cyl <- as.factor(mtcars$cyl)
plot(mtcars$wt, mtcars$mpg, col = mtcars$cyl)

# Call abline() with carModel as first argument and set lty to 2
abline(carModel, lty = 2)


## ------------------------------------------------------------------------
# Plot 1: add geom_point() to this command to create a scatter plot
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
  geom_point()


## ------------------------------------------------------------------------
# Plot 2: include the lines of the linear models, per cyl
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
  geom_point() +
  geom_smooth(aes(group = 1), method = "lm", se = FALSE, linetype = 2)


## ------------------------------------------------------------------------
# Plot 3: include a lm for each group in the dataset
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  geom_smooth(aes(group = 1), method = "lm", se = FALSE, linetype = 2)


## ---- echo = F, results = 'hide'-----------------------------------------
knitr::kable(head(iris), format = "html")

iris_sepal <- dplyr::select(iris, -Petal.Length, -Petal.Width) %>% 
  dplyr::mutate(Part = "Sepal") %>% 
  dplyr::rename(Width = Sepal.Width, Length = Sepal.Length)

iris_petal <- dplyr::select(iris, -Sepal.Length, -Sepal.Width) %>% 
  dplyr::mutate(Part = "Petal") %>% 
  dplyr::rename(Width = Petal.Width, Length = Petal.Length)

iris.long <- dplyr::bind_rows(iris_petal, iris_sepal)




## ---- echo = F-----------------------------------------------------------
knitr::kable(head(iris), format = "html")

knitr::kable(head(iris.long), format = "html")


## ---- eval = F-----------------------------------------------------------
## # Option 1
## ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
##   geom_point() +
##   geom_point(aes(x = Petal.Length, y = Petal.Width), col = "red")
## 
## # Option 2
## ggplot(iris.long, aes(x = Length, y = Width, col = Part)) +
##   geom_point()
## 


## ---- eval = F-----------------------------------------------------------
## install.packages("nycflights13")
## install.packages("tidyr")


## ------------------------------------------------------------------------
library(tidyr)
library(nycflights13)


## ------------------------------------------------------------------------
ds <- nycflights13::airports %>% 
  gather(lat, lon, key = "coordinate", value = "value")


## ---- echo = F-----------------------------------------------------------
knitr::kable(head(ds), format = "html")


## ------------------------------------------------------------------------
ds <- ds %>% 
  tidyr::spread(coordinate, value, c("lat", "lon"))


## ---- echo = F-----------------------------------------------------------
knitr::kable(head(ds), format = "html")


## ------------------------------------------------------------------------
ds2 <- nycflights13::airports %>% 
  tidyr::separate(tzone, into = c("country", "city"), sep = "/")


## ---- echo = F-----------------------------------------------------------
knitr::kable(head(ds2), format = "html")



## ------------------------------------------------------------------------
ds2 <- ds2 %>% 
  tidyr::unite(country, city, col = "tzone", sep = "/")


## ---- echo = F-----------------------------------------------------------
knitr::kable(head(ds2), format = "html")


## ---- echo = F, results = 'hide'-----------------------------------------
library(patchwork)

cyl.am <- ggplot(mtcars, aes(x = factor(cyl), fill = factor(am)))

# The base layer, cyl.am, is available for you
# Add geom (position = "stack" by default)
stplot <- cyl.am + 
  geom_bar()

# Fill - show proportion
fillplot <- cyl.am + 
  geom_bar(position = "fill")

# Dodging - principles of similarity and proximity
dodgeplot <- cyl.am +
  geom_bar(position = "dodge") 



## ---- echo = F-----------------------------------------------------------
stplot + fillplot + dodgeplot


## ------------------------------------------------------------------------
gm_2007 <- gapminder %>%
  filter(year == 2007)



## ------------------------------------------------------------------------
by_year_continent <- gapminder %>%
  group_by(year, continent) %>%
  summarize(totalPop = sum(pop),
            meanLifeExp = mean(lifeExp))



## ------------------------------------------------------------------------
ggplot(by_year_continent, aes(x = year, y = totalPop, color = continent, height = 3)) +
  geom_line() + #<<
  expand_limits(y = 0)


## ---- echo = F-----------------------------------------------------------

by_continent <- gapminder %>%
  group_by(continent) %>%
  summarize(meanLifeExp = mean(lifeExp, na.rm = T)) %>%
  identity()



## ------------------------------------------------------------------------
ggplot(by_continent, aes(x = continent, y = meanLifeExp)) +
  geom_col() #<<



## ------------------------------------------------------------------------
ggplot(gm_2007, aes(x = lifeExp)) +
  geom_histogram() #<<


## ------------------------------------------------------------------------
ggplot(gm_2007, aes(x = lifeExp)) +
  geom_histogram(binwidth = 5) #<<


## ------------------------------------------------------------------------
ggplot(gm_2007, aes(x = continent, y = lifeExp)) +
  geom_boxplot() #<<


## ------------------------------------------------------------------------
hist_plot <- ggplot(gm_2007, aes(x = lifeExp)) +
  geom_histogram() #<<

hist_plot


## ------------------------------------------------------------------------
ggplot(gm_2007, aes(x = continent, y = lifeExp)) +
  geom_boxplot() #<<


## ------------------------------------------------------------------------
ggsave("test_histogram.pdf")


## ------------------------------------------------------------------------
ggsave("test_histogram2.pdf", plot = hist_plot)


## ------------------------------------------------------------------------
 
pdf("test_histogram3.pdf")
hist_plot
dev.off()


## ------------------------------------------------------------------------
# can use the rstudio viewer pane
print(hist_plot)

