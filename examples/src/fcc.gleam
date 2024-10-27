import gleam/io

fn my_function(x: Int) -> Int {
  2 * x
}

fn apply_twice(f: fn(Int) -> Int, x: Int) {
  f(f(x))
}

pub fn main() {
  let f = my_function

  let value = apply_twice(f, 2)

  io.debug(value)
}
