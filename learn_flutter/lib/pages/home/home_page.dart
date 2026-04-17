import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/blocs/home/home_cubit.dart';
import 'package:learn_flutter/blocs/home/home_state.dart';
import 'package:learn_flutter/blocs/home/product_cubit.dart';
import 'package:learn_flutter/cores/l10n/app_localizations.dart';
import 'package:learn_flutter/di.dart';
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
      create: (_) => getIt<HomeCubit>()..refreshAll(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            // appBar: AppBar(title: const Text("Products")),
            appBar: AppBar(title: Text("App ${F.title}")),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => MultiBlocProvider(
                    providers: [
                      BlocProvider.value(value: context.read<HomeCubit>()),
                      BlocProvider(
                        create: (_) => getIt<ProductCubit>()..openAdd(),
                      ),
                    ],
                    child: const ProductDialog(),
                  ),
                );
              },
              child: const Icon(Icons.add),
            ),
            body: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                final l10n = AppLocalizations.of(context)!;
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
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (_) => MultiBlocProvider(
                                  providers: [
                                    BlocProvider.value(
                                      value: context.read<HomeCubit>(),
                                    ),
                                    BlocProvider(
                                      create: (_) =>
                                          getIt<ProductCubit>()
                                            ..openEdit(product),
                                    ),
                                  ],
                                  child: const ProductDialog(),
                                ),
                              );
                            },
                            onTapDelete: () {
                              showConfirmDialog(
                                context: context,
                                title: l10n.deleteProductTitle,
                                content: l10n.deleteProductConfirmMessage,
                                onConfirm: () {
                                  final id = product.id;
                                  if (id == null) return;

                                  context.read<HomeCubit>().deleteProduct(id);
                                },
                              );
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
