import 'package:intuji_infogrid/core/imports/ui_imports.dart';

class ProductDetailModel {
  final String id;
  final String name;
  final List<String> images; // Multiple product images
  final double price;
  final double? compareAtPrice; // Original price if on sale
  final String description;
  final String subDescription;
  final bool isAvailable;
  final int stockQuantity;
  final double averageRating;
  final int reviewCount;
  final String brand;
  final String sku;
  final List<ProductVariant> variants;
  final List<String> tags;
  final Map<String, List<String>> attributes; // For dynamic attributes
  final List<ProductSize> availableSizes; // Added available sizes
  final List<ColorOption>
  availableColors; // Added available colors for easier filtering
  final DateTime createdAt;
  final DateTime updatedAt;

  ProductDetailModel({
    required this.id,
    required this.name,
    required this.images,
    required this.price,
    this.compareAtPrice,
    required this.description,
    required this.subDescription,
    required this.isAvailable,
    required this.stockQuantity,
    this.averageRating = 0.0,
    this.reviewCount = 0,
    required this.brand,
    required this.sku,
    required this.variants,
    this.tags = const [],
    this.attributes = const {},
    required this.availableSizes,
    required this.availableColors,
    required this.createdAt,
    required this.updatedAt,
  });
}

class ProductVariant {
  final String id;
  final String name;
  final double price;
  final String? image;
  final int stockQuantity;
  final bool isAvailable;
  final String sku;
  final Map<String, String> options; // Color, Size, etc.
  final Map<String, dynamic>
  additionalInfo; // For any extra variant-specific data

  ProductVariant({
    required this.id,
    required this.name,
    required this.price,
    this.image,
    required this.stockQuantity,
    required this.isAvailable,
    required this.sku,
    required this.options,
    this.additionalInfo = const {},
  });
}

// Optional: Specific option types for better type safety
enum ProductSize { XS, S, M, L, XL, XXL, XXXL }

class ColorOption {
  final String name;
  final Color hexCode;
  final String? imageUrl;

  ColorOption({required this.name, required this.hexCode, this.imageUrl});
}
