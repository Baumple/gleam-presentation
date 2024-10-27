import gleam/io
import gleam/list

pub fn main() {
  let nums = [1, 2, 3, 4]
  let transformed_nums = list.map(nums, fn(x) { x * 2 })
  io.debug(transformed_nums)
}
