ebola <- read_csv("/Users/anna/Desktop/Uni:Learing/Visualization_R/raw/ebola.csv")
                  
arrange(ebola$Date)
# filter data frame covid: 
# only keep confirmed cases in the cantons of Zurich, Bern and Vaud 
# in the first half of the year 2020
ebola_date_beforeMarch15 <- ebola %>% filter(Date <= ymd("2015-03-31") 
                                       & (Country == "Mali" | Country == "Sierra Leone" | Country == "United Kingdom"))


remotes::install_github("CTU-Bern/unibeCols")
plotMarch15 <- ggplot(data = ebola_date_beforeMarch15, 
                              mapping = aes(x = Date, y = Cum_conf_cases)) + 
  geom_point(alpha = 0.7, shape = 22, size = 1.5, stroke = 1.5) +
  scale_fill_brewer(name = "Country",
                    palette = "Set1") +
  scale_color_brewer(name = "Country",
                     palette = "Set2") +
  labs(title ="Ebola Cases (Mali, Sierra Leone, United Kingdom)",
       x = "Date", 
       y ="Confirmed Cases (comulative)")

plotMarch15

lineplotMarch15 <- ggplot(data = ebola_date_beforeMarch15, 
                      mapping = aes(x = Date, y = Cum_conf_cases)) + 
  geom_line(mapping = aes(color = Country)) +
  labs(title ="Ebola Cases (Mali, Sierra Leone, United Kingdom)",
       x = "Date", 
       y ="Confirmed Cases (comulative)")



lineplotMarch15

# Save the plot as a PDF using ggsave
ggsave("/Users/anna/Desktop/Uni:Learing/Visualization_R/data/processed/lineplot_ebolaMarch15.pdf", plot = lineplotMarch15, width = 8, height = 6)



colplotMarch15 <- ggplot(data = ebola_date_beforeMarch15, 
                          mapping = aes(x = Date, y = Cum_conf_cases)) + 
  geom_col(mapping = aes(color = Country)) +
  labs(title ="Ebola Cases (Mali, Sierra Leone, United Kingdom)",
       x = "Date", 
       y ="Confirmed Cases (comulative)")


colplotMarch15

# Save the plot as a PDF using ggsave
ggsave("/Users/anna/Desktop/Uni:Learing/Visualization_R/data/processed/colplot_ebolaMarch15.pdf", plot = colplotMarch15, width = 8, height = 6)



ggplot(data = ebola_date_beforeMarch15, 
       mapping = aes(x = Date, y = Cum_conf_cases, colour = Country, 
                     fill = Country, group_by = Country)) + 
  geom_point(alpha = 0.7, shape = 21, size = 1.5, stroke = 1.5) +
  geom_line()
# write data frame covid_cantons_2020 to a csv file
write_csv(x = covid_cantons_2020, file = "data/processed/covid_cantons_2020_06.csv")


library(RColorBrewer)
par(mar=c(3,4,2,2))
display.brewer.all()


