import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/blocs/home/home_cubit.dart';
import 'package:learn_flutter/blocs/home/home_state.dart';
import 'package:learn_flutter/blocs/home/product_cubit.dart';
import 'package:learn_flutter/pages/home/widgets/product_dialog.dart';
import 'package:learn_flutter/pages/home/widgets/product_item.dart';
import 'package:learn_flutter/services/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(ApiService())..refreshAll(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(title: const Text("Products")),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                final result = await showDialog(
                  context: context,
                  builder: (_) => BlocProvider(
                    create: (_) => ProductCubit(ApiService())..openAdd(),
                    child: const ProductDialog(),
                  ),
                );

                if (result == true) {
                  context.read<HomeCubit>().refreshAll();
                }
              },
              child: const Icon(Icons.add),
            ),
            body: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                final homeCubit = context.read<HomeCubit>();

                if (state.status == Status.error) {
                  return const Center(child: Text("Có lỗi xảy ra"));
                }

                return Stack(
                  children: [
                    RefreshIndicator(
                      onRefresh: () async {
                        await homeCubit.refreshAll();
                      },
                      child: ListView.builder(
                        controller: _scrollController,
                        physics: const AlwaysScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(12),
                        itemCount: state.products.length,
                        itemBuilder: (context, index) {
                          final product = state.products[index];

                          return ProductItem(
                            product: product,
                            onTap: () async {
                              final result = await showDialog(
                                context: context,
                                builder: (_) => BlocProvider(
                                  create: (_) =>
                                      ProductCubit(ApiService())
                                        ..openEdit(product),
                                  child: const ProductDialog(),
                                ),
                              );

                              if (result == true) {
                                context.read<HomeCubit>().refreshAll();
                              }
                            },
                          );
                        },
                      ),
                    ),

                    if (state.status == Status.loading)
                      Container(
                        color: Colors.black.withAlpha(76),
                        child: const Center(child: CircularProgressIndicator()),
                      ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
