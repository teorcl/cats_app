import 'package:cats_app/design/widgets/cat_card.dart';
import 'package:cats_app/design/widgets/custom_decoration.dart';
import 'package:cats_app/injection_container.dart';
import 'package:cats_app/presentation/home/cubit/cat_cubit.dart';
import 'package:cats_app/presentation/home/cubit/cat_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {

  static const String name = 'home_page';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CatsApp'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) {
          final cubit = serviceLocator<CatCubit>();
          Future.microtask(() => cubit.getData());
          return cubit;
        },
        child: BlocBuilder<CatCubit, CatState>(
          buildWhen: (previous, current) =>
          previous.status != CatStatus.loaded &&
              current.status == CatStatus.loaded,
          builder: (context, state) {
            return state.cats != null
                ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) {
                      BlocProvider.of<CatCubit>(context).searchCat(value, context);
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Breed Cat',
                      enabledBorder: CustomDecoration.outlineInputBorder,
                      focusedBorder: CustomDecoration.outlineInputBorder,
                      filled: true,
                      fillColor: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Flexible(
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.cats?.length ?? 0,
                      itemBuilder: (context, index) {
                        final item = state.cats![index];
                        return GestureDetector(
                          onTap: () {
                            context.push('/detail', extra: item);
                          },
                          child: CatCard(
                            countryOrigin: item.origin,
                            imageUrl: item.imageUrl,
                            intelligence: item.intelligence,
                            nameBreed: item.name,
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10,),
                ],
              ),
            )
                : const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
