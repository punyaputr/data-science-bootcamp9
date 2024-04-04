# 5 Question about flights data
# data
data("flights")
data("airlines")
data("airports")
data("planes")

# add new month name table
month_name <- tribble(
  ~month, ~month_name,
  1, "January",
  2, "February",
  3, "March",
  4, "April",
  5, "May",
  6, "June",
  7, "July",
  8, "August",
  9, "September",
  10, "October",
  11, "November",
  12, "December"
)


## Q1 - What is 3 month name that have the most flights?
# create month tibble
Q1 <- flights %>%
  left_join(month_name, by="month") %>%
  count(month_name) %>%
  arrange(desc(n)) %>%
  head(3)

## Q2 - What is top 5 carrier’s name that have the most average minute departure delay?
Q2 <- flights %>%
  filter(dep_delay > 0) %>%
  left_join(airlines) %>%
  group_by(name) %>%
  summarise(avg_min = mean(dep_delay)) %>%
  arrange(desc(avg_min)) %>%
  head(5)

## Q3 - What's carrier's name that have the least total miles fly and how many times it flying?
Q3 <- flights %>%
  left_join(airlines) %>% 
  group_by(name) %>%
  summarise(total_miles = sum(distance),
            flying_times = n()) %>%
  arrange(total_miles) %>%
  head(1)

## Q4 - Which route have the longest miles and what route is it?
Q4 <- flights %>%
  group_by(origin, dest) %>%
  summarise(distance = mean(distance)) %>%
  filter(distance == max(distance)) %>%
  left_join(airports, by = c("origin" = "faa")) %>%
  mutate(ori_country = tzone) %>%
  select(ori_country, dest, distance) %>% 
  left_join(airports, by = c("dest" = "faa")) %>%
  mutate(dest_country = tzone) %>%
  select(origin, ori_country, dest, dest_country, distance) %>%
  arrange(desc(distance)) %>%
  head(1)

## Q5 Which plane manufacturer have less 50 times to fly? Please sort by ascending.
Q5 <- flights %>% 
  left_join(planes, by = "tailnum") %>%
  count(manufacturer) %>%
  filter(n < 50) %>%
  arrange(n)
