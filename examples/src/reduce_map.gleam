import gleam/io
import gleam/list
import gleam/int

pub fn main() {
  let nums = [1, 2, 3, 4]
  let reduced = list.reduce(nums, int.add)
  io.debug(reduced)
}
