import gleam/io

pub type Person {
  Teacher(name: String)
  Student(name: String, grade: String)
}

fn negate(bool: Bool) {
  case bool {
    True -> False
    False -> True
  }
}

pub fn main() {
  let student = Student("Vincent", "13")
  case student {
    Teacher(name) -> io.println(name)
    Student(name, grade) -> {
      io.println(name)
      io.println(grade)
    }
  }
}
