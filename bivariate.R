devtools::install_github("clauswilke/multiscales")
install.packages("colorspace", repos = "http://R-Forge.R-project.org")
library(ggplot2)
library(multiscales)
library(colorspace)
library(sf)
library(jpndistrict)
#データの取得
pref_36 <- jpn_pref(36)
pref_36$cli <- runif(24, min=-38, max=36)
pref_36$moe <- runif(24, min=0, max=1)


colors <- scales::colour_ramp(
  colors = c(red = "#AC202F", purple = "#740280", blue = "#2265A3")
)((0:7)/7)


ggplot(pref_36) + 
  geom_sf(aes(fill = zip(cli, moe)), color = "gray30", size = 0.2) + 
  coord_sf(datum = NA) +
  bivariate_scale("fill",
                  pal_vsup(values = colors, max_desat = 0.8, pow_desat = 0.2, max_light = 0.7, pow_light = 1),
                  name = c("cli", "moe"),
                  limits = list(c(-40, 40), c(0, 1)),
                  breaks = list(c(-40, -20, 0, 20, 40), c(0, 0.25, 0.50, 0.75, 1.)),
                  labels = list(waiver(), scales::percent),
                  guide = "colourfan"
  ) +
  theme_void() +
  theme(
    legend.key.size = grid::unit(0.6, "cm"),
    legend.title.align = 0.5,
    plot.margin = margin(5.5, 20, 5.5, 5.5)
  )
