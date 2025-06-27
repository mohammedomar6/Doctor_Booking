class DepartmentModel {
  final String id;
  final String name;
  final int price;

  DepartmentModel({
    required this.id,
    required this.name,
    required this.price,
  });

  factory DepartmentModel.fromJson(Map<String, dynamic> json) {
    return DepartmentModel(
      id: json['_id'],
      name: json['name'],
      price: json['price'],
    );
  }
}
