# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Hello.Repo.insert!(%Hello.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Hello.Hello.Piece
alias Hello.Repo

Repo.insert! %Piece{
  name: "Big Ben",
  url: "https://static.thenounproject.com/png/454592-200.png",
  lat: 51.50074521576869,
  lon: -0.12461504962750786
}

Repo.insert! %Piece{
  name: "Statue of Liberty",
  url: "https://static.thenounproject.com/png/54971-200.png",
  lat: 40.68925101761656,
  lon: -74.04453697995372
}

Repo.insert! %Piece{
  name: "Opera House",
  url: "https://static.thenounproject.com/png/204463-200.png",
  lat: -33.85682975267617,
  lon: 151.21525379888092
}

Repo.insert! %Piece{
  name: "Golden Gate Bridge",
  url: "https://image.flaticon.com/icons/png/512/82/82619.png",
  lat: 37.819921381664216,
  lon: -122.47854306704156
}

Repo.insert! %Piece{
  name: "Taj Mahal",
  url: "https://static.thenounproject.com/png/3613-200.png",
  lat: 27.17499172997024,
  lon: 78.04212500617578
}

Repo.insert! %Piece{
  name: "Great Wall of China",
  url: "https://cdn.icon-icons.com/icons2/2070/PNG/512/the_great_wall_of_china_icon_126210.png",
  lat: 40.431907213925804,
  lon: 116.57036020007934
}

Repo.insert! %Piece{
  name: "Great Pyramid of Giza",
  url: "https://static.thenounproject.com/png/1006003-200.png",
  lat: 29.979167580068637,
  lon: 31.13419342115606
}

Repo.insert! %Piece{
  name: "Leaning Tower Of Pisa",
  url: "https://cdn2.iconfinder.com/data/icons/history-set/128/history-century-80-512.png",
  lat: 43.722946738307115,
  lon: 10.396625851700868
}
