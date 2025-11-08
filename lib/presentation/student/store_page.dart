import 'package:flutter/material.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  int _selectedCategory = 0;
  final List<String> _categories = ['All', 'Books', 'Uniforms', 'Stationery', 'Sports'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF8E24AA),
        elevation: 4,
        shadowColor: Colors.black26,
        title: const Text(
          'School Store',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Container(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search products...',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Color(0xFF7F8C8D)),
                ),
              ),
            ),
          ),
          
          // Categories
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 12),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCategory = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      decoration: BoxDecoration(
                        color: _selectedCategory == index 
                            ? const Color(0xFF3498DB) 
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        _categories[index],
                        style: TextStyle(
                          color: _selectedCategory == index 
                              ? Colors.white 
                              : const Color(0xFF2C3E50),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Products Grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: _getProductsForCategory().length,
                itemBuilder: (context, index) {
                  final product = _getProductsForCategory()[index];
                  return _buildProductCard(product);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: product['color'].withOpacity(0.1),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Center(
                child: Icon(
                  product['icon'],
                  size: 50,
                  color: product['color'],
                ),
              ),
            ),
          ),
          
          // Product Info
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['name'],
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C3E50),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product['description'],
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF7F8C8D),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product['price'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF27AE60),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: const Color(0xFF3498DB),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> _getProductsForCategory() {
    final allProducts = [
      // Books
      {
        'name': 'Mathematics Book',
        'description': 'Grade 10',
        'price': 'PKR 500',
        'icon': Icons.book,
        'color': const Color(0xFF3498DB),
        'category': 'Books',
      },
      {
        'name': 'English Literature',
        'description': 'Grade 10',
        'price': 'PKR 450',
        'icon': Icons.book,
        'color': const Color(0xFF9B59B6),
        'category': 'Books',
      },
      {
        'name': 'Science Book',
        'description': 'Grade 10',
        'price': 'PKR 600',
        'icon': Icons.science,
        'color': const Color(0xFFE74C3C),
        'category': 'Books',
      },
      
      // Uniforms
      {
        'name': 'School Shirt',
        'description': 'Size M',
        'price': 'PKR 800',
        'icon': Icons.checkroom,
        'color': const Color(0xFF2ECC71),
        'category': 'Uniforms',
      },
      {
        'name': 'School Pants',
        'description': 'Size M',
        'price': 'PKR 1,200',
        'icon': Icons.checkroom,
        'color': const Color(0xFF34495E),
        'category': 'Uniforms',
      },
      {
        'name': 'School Tie',
        'description': 'Official',
        'price': 'PKR 300',
        'icon': Icons.checkroom,
        'color': const Color(0xFF8E44AD),
        'category': 'Uniforms',
      },
      
      // Stationery
      {
        'name': 'Notebook Set',
        'description': '5 Pack',
        'price': 'PKR 200',
        'icon': Icons.note,
        'color': const Color(0xFFF39C12),
        'category': 'Stationery',
      },
      {
        'name': 'Pen Set',
        'description': 'Blue & Black',
        'price': 'PKR 150',
        'icon': Icons.edit,
        'color': const Color(0xFF1ABC9C),
        'category': 'Stationery',
      },
      {
        'name': 'Calculator',
        'description': 'Scientific',
        'price': 'PKR 1,500',
        'icon': Icons.calculate,
        'color': const Color(0xFFE67E22),
        'category': 'Stationery',
      },
      
      // Sports
      {
        'name': 'Football',
        'description': 'Official Size',
        'price': 'PKR 2,000',
        'icon': Icons.sports_soccer,
        'color': const Color(0xFF27AE60),
        'category': 'Sports',
      },
      {
        'name': 'Cricket Bat',
        'description': 'Willow Wood',
        'price': 'PKR 3,500',
        'icon': Icons.sports_cricket,
        'color': const Color(0xFF8B4513),
        'category': 'Sports',
      },
      {
        'name': 'Sports Kit',
        'description': 'Complete Set',
        'price': 'PKR 1,800',
        'icon': Icons.sports,
        'color': const Color(0xFF2980B9),
        'category': 'Sports',
      },
    ];

    if (_selectedCategory == 0) {
      return allProducts;
    } else {
      return allProducts.where((product) => 
        product['category'] == _categories[_selectedCategory]
      ).toList();
    }
  }
}
