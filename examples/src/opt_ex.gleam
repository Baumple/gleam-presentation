import gleam/io
import gleam/int
import gleam/option.{type Option, Some, None}

fn divide(x: Int, y: Int) -> Option(Int) {
  case y {
    0 -> None
    y -> Some(x / y)
  }
}

pub fn main() {
  let maybe_int: Option(Int) = divide(42, 1)
  
  case maybe_int {
      Some(value) -> {
        let value = int.to_string(value)
        io.println(value)
      }
      None -> io.println("💥")
  }
}
