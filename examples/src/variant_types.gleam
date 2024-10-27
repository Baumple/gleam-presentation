import gleam/io

pub type Person {
  Teacher(name: String)
  Student(name: String, grade: String)
}

pub fn main() {
  let student = Student("Bob", "13")
  io.println(student.name)
  // io.println(student.grade)
}
