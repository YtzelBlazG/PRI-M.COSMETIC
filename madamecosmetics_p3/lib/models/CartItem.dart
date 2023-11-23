class CartItem {
  final String title;
  final double price;
  int quantity;
  final String imageUrl;

  CartItem({
    required this.title,
    required this.price,
    this.quantity = 1,
    required this.imageUrl,
  });
}
