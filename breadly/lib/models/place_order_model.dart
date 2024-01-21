class PlaceOrderBody {
  final List<OrderDetail> details;

  PlaceOrderBody({required this.details});

  factory PlaceOrderBody.fromJson(Map<String, dynamic> json) {
    return PlaceOrderBody(
      details: List<OrderDetail>.from(
        json['details'].map((detail) => OrderDetail.fromJson(detail)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'details': details.map((detail) => detail.toJson()).toList(),
    };
  }
}

class OrderDetail {
  final int productId;
  final int quantity;
  final double totalPrice;

  OrderDetail({
    required this.productId,
    required this.quantity,
    required this.totalPrice,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) {
    return OrderDetail(
      productId: json['product_id'] ?? 0,
      quantity: json['quantity'] ?? 0,
      totalPrice: json['total_price'] ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'quantity': quantity,
      'total_price': totalPrice,
    };
  }
}
