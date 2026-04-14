import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/blocs/home/home_cubit.dart';
import 'package:learn_flutter/blocs/home/home_state.dart';
import 'package:learn_flutter/blocs/home/product_cubit.dart';
import 'package:learn_flutter/flavors.dart';
import 'package:learn_flutter/pages/home/widgets/confirm_dialog.dart';
import 'package:learn_flutter/pages/home/widgets/product_dialog.dart';
import 'package:learn_flutter/pages/home/widgets/product_item.dart';

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
      create: (_) => HomeCubit()..refreshAll(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            // appBar: AppBar(title: const Text("Products")),
            appBar: AppBar(title: Text("App ${F.title}")),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                final homeCubit = context.read<HomeCubit>();
                final result = await showDialog(
                  context: context,
                  builder: (_) => BlocProvider(
                    create: (_) => ProductCubit()..openAdd(),
                    child: const ProductDialog(),
                  ),
                );

                if (result == true && context.mounted) {
                  homeCubit.refreshAll();
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
                                      ProductCubit()..openEdit(product),
                                  child: const ProductDialog(),
                                ),
                              );

                              if (result == true) {
                                homeCubit.refreshAll();
                              }
                            },
                            onTapDelete: () async {
                              final confirm = await showConfirmDialog(
                                context: context,
                                title: "Xóa sản phẩm",
                                content:
                                    "Bạn có chắc chắn muốn xóa sản phẩm này không?",
                                confirmText: "Xóa",
                                cancelText: "Hủy",
                              );

                              if (confirm) {
                                final productCubit = ProductCubit();
                                await productCubit.deleteProduct(
                                  product.id ?? "",
                                );
                                homeCubit.refreshAll();

                                if (!context.mounted) {
                                  return;
                                }
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Đã xóa sản phẩm"),
                                  ),
                                );
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
