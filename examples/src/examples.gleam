import gleam/io

type Person {
  Teacher(name: String)
  Student(name: String, age: Int)
}

fn new_student() -> Person {
  let student = Student("Vincent", 13)
  student
}

fn new_teacher() -> Person {
  let teacher = Teacher("Hr. Urner")
  teacher
}

pub fn main() {
  let person: Person = new_student()
  person.name
  Nil
}
