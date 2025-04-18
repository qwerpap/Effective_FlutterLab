class CategoryModel {
  CategoryModel({required this.id, required this.slug});

  final int id;
  final String slug;

  @override
  String toString() {
    return 'ProductsModel('
        'id: $id, '
        'slug: $slug'
        ')';
  }
}
