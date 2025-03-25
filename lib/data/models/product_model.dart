
class ProductModel {
  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.prices,
  });

  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final double prices;

  @override
  String toString() {
    return 'ProductsModel('
        'id: $id,'
        'name: $name,'
        'description: $description,'
        'imageUrl: $imageUrl,'
        'prices: $prices'
        ')';
  }
}
