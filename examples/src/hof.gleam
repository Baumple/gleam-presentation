import gleam/list
import gleam/io
import gleam/string

pub fn main() {
  let names = [
    "Thomas",
    "Bob",
    "Jana",
    "Florian"
  ]

  io.debug(names)

  list.map(names, string.uppercase)
  |> io.debug
}
