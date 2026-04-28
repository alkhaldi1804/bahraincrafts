import 'package:flutter/material.dart';

class MoreInfoPage extends StatelessWidget {
  const MoreInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // 🖼 Header Image
          Stack(
            children: [
              Image.asset(
                "assets/images/header_bh.jpeg",
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              // 🔙 Back Button
              Positioned(
                top: 40,
                left: 20,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back,
                      color: Colors.white, size: 28),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),

          // 📄 Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "عن منصة صُنع في البحرين",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "منصة 'صُنع في البحرين' هي مبادرة رقمية تهدف إلى دعم المشاريع والصناعات المحلية في مملكة البحرين، من خلال توفير مساحة حديثة لعرض المنتجات والخدمات بطريقة سهلة وجذابة.",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "نسعى من خلال هذه المنصة إلى تمكين رواد الأعمال وأصحاب المشاريع الصغيرة من الوصول إلى جمهور أوسع، وتعزيز الهوية الوطنية للمنتجات البحرينية في السوق الرقمي.",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "تجمع المنصة بين الجودة، الأصالة، والابتكار، حيث يمكن للمستخدمين استكشاف مجموعة متنوعة من المنتجات مثل الأطعمة المحلية، الحرف اليدوية، الملابس، والخدمات المختلفة.",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "هدفنا هو بناء مجتمع رقمي يدعم الاقتصاد المحلي ويشجع على الإبداع والاستثمار في المشاريع الوطنية.",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
