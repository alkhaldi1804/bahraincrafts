import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'more_info.dart'; // 👈 ربط الصفحة الجديدة

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final List<String> productImages = [
    "assets/images/food.png",
    "assets/images/fakhar.jpg",
    "assets/images/scarf.jpg",
    "assets/images/dates.jpg",
  ];

  final List<String> productNames = [
    "مأكولات بحرينية",
    "فخار تقليدي",
    "أوشحة",
    "تمر بحريني",
  ];

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _navbar(),
            _hero(),
            _categories(),
            _products(),
            _whySection(),
          ],
        ),
      ),
    );
  }

  // 🔴 Navbar
  Widget _navbar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("صُنع في البحرين",
              style: GoogleFonts.tajawal(
                  fontSize: 22, fontWeight: FontWeight.bold)),
          Row(
            children: const [
              Text("الرئيسية"),
              SizedBox(width: 15),
              Text("المنتجات"),
              SizedBox(width: 15),
              Text("الخدمات"),
              SizedBox(width: 15),
              Text("تواصل"),
            ],
          )
        ],
      ),
    );
  }

  // 🖼 Hero
  Widget _hero() {
    return FadeTransition(
      opacity: _controller,
      child: Stack(
        children: [
          Image.network(
            "https://images.unsplash.com/photo-1582719471384-894fbb16e074",
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            height: 300,
            color: Colors.white.withOpacity(0.75),
          ),
          Positioned(
            left: 30,
            top: 80,
            child: SlideTransition(
              position: Tween<Offset>(
                      begin: const Offset(-1, 0), end: const Offset(0, 0))
                  .animate(_controller),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("اكتشف منتجات", style: TextStyle(fontSize: 26)),
                  const Text(
                    "صُنعت بكل فخر في البحرين",
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFC8102E)),
                  ),
                  const SizedBox(height: 10),
                  const Text("منصة لدعم المشاريع المحلية"),
                  const SizedBox(height: 20),

                  // 🔥 Buttons
                  Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFC8102E),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {},
                        child: const Text("تسوق الآن"),
                      ),
                      const SizedBox(width: 10),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 12),
                          side: const BorderSide(color: Color(0xFFC8102E)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MoreInfoPage(),
                            ),
                          );
                        },
                        child: const Text("اكتشف المزيد",
                            style: TextStyle(color: Color(0xFFC8102E))),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  // 🧩 Categories
  Widget _categories() {
    final items = ["حرف", "خدمات", "عطور", "منزل", "ملابس", "أطعمة"];

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Wrap(
        spacing: 10,
        children: items
            .map((e) => Chip(
                  label: Text(e),
                  backgroundColor: Colors.white,
                  elevation: 2,
                ))
            .toList(),
      ),
    );
  }

  // 🛍 Products
  Widget _products() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("منتجات مميزة",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                  productImages.length, (index) => _productCard(index)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _productCard(int index) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
          )
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              productImages[index],
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(productNames[index]),
                const SizedBox(height: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFFC8102E),
                    elevation: 0,
                    side: const BorderSide(color: Color(0xFFC8102E)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {},
                  child: const Text("شراء الآن"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  // 🔴 Why Section
  Widget _whySection() {
    return Container(
      padding: const EdgeInsets.all(25),
      color: const Color(0xFFC8102E),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Icon(Icons.favorite, color: Colors.white),
          Icon(Icons.security, color: Colors.white),
          Icon(Icons.shopping_cart, color: Colors.white),
        ],
      ),
    );
  }
}
