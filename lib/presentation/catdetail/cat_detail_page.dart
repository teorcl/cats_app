import 'package:cats_app/design/widgets/cat_image.dart';
import 'package:cats_app/design/widgets/v_space.dart';
import 'package:cats_app/domain/entities/cat_entity.dart';
import 'package:flutter/material.dart';

class CatDetailPage extends StatelessWidget {

  static const String name = 'detail_page';

  final CatEntity cat;

  const CatDetailPage({
    super.key,
    required this.cat,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cat.name.toUpperCase()),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CatImage(
              imageUrl: cat.imageUrl,
            ),
          ),
          const VSpace(),
          const VSpace(),

          Expanded(
              child: SingleChildScrollView(
                child: _InfoCat(cat),
              ),
          )

        ],
      ),
    );
  }
}

class _InfoCat extends StatelessWidget {
  
  final CatEntity cat;
  
  const _InfoCat(this.cat);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          Text(
            cat.description,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          const Divider(
            color: Color(0xFF155263),
            thickness: 5,
            endIndent: 200,
            height: 20,
          ),
          Row(
            children: [
              const Icon(Icons.map_rounded),
              Text(
                'Origin: ${cat.origin}',
              )
            ],
          ),
          Row(
            children: [
              const Icon(Icons.menu_book_rounded),
              Text(
                'Intelligence: ${cat.intelligence}',
              )
            ],
          ),
          Row(
            children: [
              const Icon(Icons.local_fire_department_outlined),
              Text(
                'Adaptability: ${cat.adaptability}',
              )
            ],
          ),
          Row(
            children: [
              const Icon(Icons.timer_sharp),
              Text(
                'Life Span: ${cat.lifeSpan}',

              )
            ],
          ),
          const Divider(
            color: Color(0xFF155263),
            thickness: 5,
            endIndent: 200,
            height: 20,
          ),
          const SizedBox(height: 50)
        ],
      ),
    );
  }
}
