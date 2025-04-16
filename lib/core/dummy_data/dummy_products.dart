// Helper function to create dummy data
import 'dart:ui';

import 'package:intuji_infogrid/core/constants/image_constants.dart';
import 'package:intuji_infogrid/feature/dashboard/domain/entities/product_entity.dart';

List<ProductDetailModel> getDummyProducts() {
  return [
    ProductDetailModel(
      id: 'PD001',
      name: 'Premium Cotton T-Shirt',
      images: [
        AppImages.product1Png,
        AppImages.product2Png,
        AppImages.product3Png,
      ],
      price: 29.99,
      compareAtPrice: 39.99,
      description: 'Ultra-soft premium cotton t-shirt with a modern fit.',
      subDescription: 'Perfect for everyday wear with breathable fabric.',
      isAvailable: true,
      stockQuantity: 150,
      averageRating: 4.5,
      reviewCount: 128,
      brand: 'StyleCraft',
      sku: 'TSH-PREM-001',
      availableSizes: [
        ProductSize.S,
        ProductSize.M,
        ProductSize.L,
        ProductSize.XL,
      ],
      availableColors: [
        ColorOption(name: 'White', hexCode: Color(0xFFFFFFFF)),
        ColorOption(name: 'Black', hexCode: Color(0xFF000000)),
        ColorOption(name: 'Navy', hexCode: Color(0xFF000080)),
        ColorOption(name: 'Grey', hexCode: Color(0xFF808080)),
      ],
      variants: [
        ProductVariant(
          id: 'VAR001',
          name: 'White - Small',
          price: 29.99,
          image: AppImages.product1Png,
          stockQuantity: 45,
          isAvailable: true,
          sku: 'TSH-PREM-001-WH-S',
          options: {'color': 'White', 'size': 'S'},
          additionalInfo: {'weight': '200g', 'material': '100% Cotton'},
        ),
        ProductVariant(
          id: 'VAR002',
          name: 'White - Medium',
          price: 29.99,
          image: AppImages.product1Png,
          stockQuantity: 55,
          isAvailable: true,
          sku: 'TSH-PREM-001-WH-M',
          options: {'color': 'White', 'size': 'M'},
          additionalInfo: {'weight': '220g', 'material': '100% Cotton'},
        ),
        ProductVariant(
          id: 'VAR003',
          name: 'Black - Small',
          price: 31.99,
          image: AppImages.product1Png,
          stockQuantity: 30,
          isAvailable: true,
          sku: 'TSH-PREM-001-BL-S',
          options: {'color': 'Black', 'size': 'S'},
          additionalInfo: {'weight': '200g', 'material': '100% Cotton'},
        ),
      ],
      tags: ['Clothing', 'T-Shirt', 'Premium', 'Bestseller'],
      attributes: {
        'material': ['100% Cotton', 'Pre-shrunk'],
        'care': ['Machine wash cold', 'Tumble dry low'],
        'features': ['Breathable', 'Comfortable fit', 'Durable stitching'],
      },
      createdAt: DateTime(2024, 1, 1),
      updatedAt: DateTime(2024, 3, 15),
    ),

    // Second Product
    ProductDetailModel(
      id: 'PD002',
      name: 'Smart Fitness Watch Pro',
      images: [AppImages.product4Png, AppImages.product5Png],
      price: 199.99,
      compareAtPrice: 249.99,
      description: 'Advanced fitness tracking with heart rate monitoring.',
      subDescription: 'Water-resistant up to 50m with 7-day battery life.',
      isAvailable: true,
      stockQuantity: 75,
      averageRating: 4.8,
      reviewCount: 256,
      brand: 'TechFit',
      sku: 'WTC-PRO-002',
      availableSizes: [ProductSize.S, ProductSize.L, ProductSize.XL],
      availableColors: [
        ColorOption(name: 'Black', hexCode: Color(0xFF000000)),
        ColorOption(name: 'Silver', hexCode: Color(0xFFC0C0C0)),
      ],
      variants: [
        ProductVariant(
          id: 'VAR004',
          name: 'Black - 42mm',
          price: 199.99,
          image: AppImages.product4Png,
          stockQuantity: 25,
          isAvailable: true,
          sku: 'WTC-PRO-002-BL-42',
          options: {'color': 'Black', 'size': '42mm'},
          additionalInfo: {'batteryLife': '7 days', 'waterResistance': '50m'},
        ),
        ProductVariant(
          id: 'VAR005',
          name: 'Silver - 42mm',
          price: 209.99,
          image: AppImages.product4Png,
          stockQuantity: 20,
          isAvailable: true,
          sku: 'WTC-PRO-002-SL-42',
          options: {'color': 'Silver', 'size': '42mm'},
          additionalInfo: {'batteryLife': '7 days', 'waterResistance': '50m'},
        ),
      ],
      tags: ['Electronics', 'Fitness', 'Smartwatch', 'Featured'],
      attributes: {
        'features': [
          'Heart Rate Monitor',
          'Sleep Tracking',
          'GPS',
          'Bluetooth 5.0',
        ],
        'compatibility': ['iOS 12+', 'Android 8+'],
        'sensors': ['Accelerometer', 'Gyroscope', 'Heart Rate'],
      },
      createdAt: DateTime(2024, 2, 1),
      updatedAt: DateTime(2024, 3, 15),
    ),
  ];
}
