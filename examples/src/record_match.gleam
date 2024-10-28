import gleam/io
import gleam/int

type Person {
  Teacher(name: String)
  Student(name: String, grade: Int)
}

fn print_person(person: Person) {
  case person {
     Teacher(name) -> io.println(name)

     Student(name, grade) -> {
        io.println(name)
        let grade = int.to_string(grade)
        io.println(grade)
     }

  }
}

pub fn main() {
  io.println("Record pattern matching:")
  let person = Student("Vincent", 13)
  print_person(person)
}
