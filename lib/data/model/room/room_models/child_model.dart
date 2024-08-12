class Child {
  final int id;
  int age;

  Child({
    this.id = 1,
    required this.age,
  });

  factory Child.empty() {
    return Child(
      id: 1,
      age: 2,
    );
  }
  factory Child.emptyWithId(int id) {
    return Child(
      id: id,
      age: 2,
    );
  }

  static List<int> getChildrenAges(List<Child> children) {
    List<int> ages = [];
    for (var child in children) {
      ages.add(child.age);
    }
    return ages;
  }
}
