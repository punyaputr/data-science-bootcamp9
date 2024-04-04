# Create and Connect database to PostgreSQL (Pizza Restaurant)

## connect to PostgreSQL server
library(RPostgreSQL)
library(tidyverse)

## create connection
con <- dbConnect(
  PostgreSQL(),
  host = "floppy.db.elephantsql.com",
  dbname = "jctgkplk",
  user = "jctgkplk",
  password = "********************************",
  port = 5432
)

## create pizza dataframe
df_customers <- tribble(
  ~cus_id, ~cus_name, ~country, 
  01, "Mei", "China",
  02, "Priya", "India",
  03, "Miriam", "UK",
  04, "Abby", "Korea"
)

df_menus <- tribble(
  ~menu_id, ~menu_name, ~price,
  1, "Hawaiian", 139,
  2, "Margherita", 129,
  3, "Seafood", 119,
  4, "Pepperoni", 149
)

df_order <- tribble(
  ~order_id, ~menu_id, ~quantity, ~cus_id,
  001, 2, 3, 04,
  002, 3, 2, 01,
  003, 1, 3, 01,
  004, 4, 4, 02,
  005, 2, 6, 03,
  006, 3, 1, 04,
  007, 4, 5, 02,
  008, 1, 4, 03
)

## write table to db
dbWriteTable(con, "customers", df_customers)
dbWriteTable(con, "menus", df_menus)
dbWriteTable(con, "orders", df_order)

## check tables
dbListTables(con)

## check data
dbGetQuery(con, "select * from customers")
dbGetQuery(con, "select * from menus")
dbGetQuery(con, "select * from orders")

## Question
# Q1 Who's the top spender?
dbGetQuery(con, "select 
          cus_name,
          sum(quantity*price)
          from orders, menus, customers
          where orders.menu_id = menus.menu_id 
            and orders.cus_id = customers.cus_id
          group by cus_name
          order by 2 desc
           limit 1")

# Q2 Which menus have the least order and how many orders is it?   
dbGetQuery(con, "select 
          menu_name,
          sum(quantity)
          from orders
          join menus on orders.menu_id = menus.menu_id
          group by menu_name
          order by 2
           limit 1")

# Q3 Which order id have the most spend and who's buy it?
dbGetQuery(con, "select 
          order_id,
          cus_name,
          sum(quantity*price)
          from orders, menus, customers
          where orders.menu_id = menus.menu_id 
            and orders.cus_id = customers.cus_id
          group by order_id, cus_name
          order by 3 desc
           limit 1")

# remove data
dbRemoveTable(con, "customers")
dbRemoveTable(con, "menus")
dbRemoveTable(con, "orders")

## close data
dbDisconnect(con)
