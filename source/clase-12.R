## Eduard Martínez
## update: 16-04-2023

## llamar la librería pacman: contiene la función p_load()
rm(list=ls())
require(pacman)
p_load(tidyverse, # contiene las librerías ggplot, dplyr...
       rvest) # web-scraping

## Acceder al robots.txt de wikipedia
browseURL("https://en.wikipedia.org/robots.txt")

## Mi primer HTML
my_html <- 
'<!DOCTYPE html> 
<html>
<meta charset="utf-8">
<head>
<title> Título de la página: ejemplo de clase </title>
</head>
<body>
<h1> Title 1.</h1>
<h2> Subtitle <u>subrayado-1</u>. </h2>
<p> Este es un párrafo muy pequeño que se encuentra dentro de la etiqueta <b>p</b> de <i>html</i> </p>
<a href="https://es.wikipedia.org/wiki/Copa_Mundial_de_F%C3%BAtbol"> link a wikipedia </a>
</body>
</html>'

## export and read html
write.table(x=my_html , file='my_page.html' , quote=F , col.names=F , row.names=F)
browseURL("my_page.html") ## leer con el navegador de su equipo

## view rvest
vignette("rvest")

## 2.1 Aplicación en R:
my_url = "https://es.wikipedia.org/wiki/Copa_Mundial_de_F%C3%BAtbol"
browseURL(my_url) ## Ir a la página

## leer el html de la página
my_html = read_html(my_url) ## leer el html de la página
class(my_html) ## ver la clase del objeto

## ver la clase del objeto
my_html %>% html_elements("p")

## ver el objeto
my_html %>% html_elements("p") %>% .[13]

## 2.2 Extraer elementos de un HTML

## Obtener los elementos h2 de la página


## Ver los textos


## 2.3 Xpath
my_html %>% html_nodes(xpath="/html/body/div[3]/div[3]/div[5]/div[1]/p[13]")

my_html %>% html_nodes(xpath='//*[@id="mw-content-text"]/div[1]/p[13]') %>% html_text()

## extraer todas las tablas del html 
my_html %>% html_table()

tabla_1 <-  my_html %>% html_table() %>% .[[1]]

## numero de tablas extraidas

sub_html = my_html %>% html_nodes(xpath='//*[@id="mw-content-text"]/div[1]/table[2]/tbody')

elements = sub_html %>% html_nodes("a")

elements[1:5]

titles = elements %>% html_attr("title")

titles[1:5]

refs = elements %>% html_attr("href")

refs[1:5]

## tabla 10
elemento_mapa <- my_html %>% html_nodes(xpath='//*[@id="mw-content-text"]/div[1]/div[13]/div/a')


elemento_mapa %>% html_attr("href")

elemento_mapa %>% html_attr("title")



