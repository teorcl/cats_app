import 'package:cats_app/domain/entities/cat_entity.dart';
import 'package:cats_app/presentation/catdetail/cat_detail_page.dart';
import 'package:cats_app/presentation/home/home_page.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: HomePage.name,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/detail',
        name: CatDetailPage.name,
        builder: (context, state) {
          final cat = state.extra as CatEntity;
          return CatDetailPage(cat: cat);
        }
      ),
    ]

);