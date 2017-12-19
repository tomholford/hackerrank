# movie_titles

## Prerequisites

```
gem install awesome_print
```

## Example

```
> ruby movie_titles.rb
> enter a query string:
> spiderman
Page 1:
{
           "page" => 1,
       "per_page" => 10,
          "total" => 14,
    "total_pages" => 2
}
Page 2:
{
           "page" => "2",
       "per_page" => 10,
          "total" => 14,
    "total_pages" => 2
}
Output:
[
    [ 0] "20 años sin Cecilia: Desde que tú te has ido",
    [ 1] "A Very Potter Sequel",
    [ 2] "Aquellos sin nombre",
    [ 3] "Burlesque Cake Walk",
    [ 4] "Cherry, Harry & Raquel!",
    [ 5] "La milpa sin quema: El cultivo sin callejón",
    [ 6] "La semana que viene (sin falta)",
    [ 7] "Lo que hacemos sin mirar",
    [ 8] "No se quede sin saberlo",
    [ 9] "Sin esperar que algo pase",
    [10] "Sin querer",
    [11] "Sin querer, queriendo",
    [12] "Swordquest: Waterworld",
    [13] "The Sin of Martha Queed"
]
```
