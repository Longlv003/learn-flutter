import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/blocs/home/product_cubit.dart';
import 'package:learn_flutter/blocs/home/product_state.dart';
import 'package:learn_flutter/cores/l10n/app_localizations.dart';
import 'package:learn_flutter/pages/home/widgets/confirm_dialog.dart';

class ProductDialog extends StatefulWidget {
  const ProductDialog({super.key});

  @override
  State<ProductDialog> createState() => _ProductDialog();
}

class _ProductDialog extends State<ProductDialog> {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _quantityController = TextEditingController();
  final _imageController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _categoryController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _quantityController.dispose();
    _imageController.dispose();
    _descriptionController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  void _bindState(ProductState state) {
    _nameController.text = state.name;
    _priceController.text = state.price;
    _quantityController.text = state.quantity == 0
        ? ''
        : state.quantity.toString();
    _imageController.text = state.image;
    _descriptionController.text = state.description;
    _categoryController.text = state.category;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {
        if (state.status == ProductDialogStatus.success) {
          Navigator.pop(context, true);
        }

        if (state.status == ProductDialogStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage ?? "Error")),
          );
        }
      },
      builder: (context, state) {
        _bindState(state);
        final l10n = AppLocalizations.of(context)!;
        final proCubit = context.read<ProductCubit>();

        return AlertDialog(
          title: Text(
            state.mode == ProductDialogMode.add
                ? l10n.addProduct
                : state.mode == ProductDialogMode.edit
                ? l10n.editProduct
                : l10n.productDetail,
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: l10n.name),
                  onChanged: proCubit.onNameChanged,
                ),
                TextField(
                  controller: _priceController,
                  decoration: InputDecoration(labelText: l10n.price),
                  onChanged: (v) => proCubit.onPriceChanged(v),
                ),
                TextField(
                  controller: _quantityController,
                  decoration: InputDecoration(labelText: l10n.quantity),
                  keyboardType: TextInputType.number,
                  onChanged: (v) =>
                      proCubit.onQuantityChanged(int.tryParse(v) ?? 0),
                ),
                TextField(
                  controller: _imageController,
                  decoration: InputDecoration(labelText: l10n.imageUrl),
                  onChanged: proCubit.onImageChanged,
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(labelText: l10n.description),
                  onChanged: proCubit.onDescriptionChanged,
                ),
                TextField(
                  controller: _categoryController,
                  decoration: InputDecoration(labelText: l10n.category),
                  onChanged: proCubit.onCategoryChanged,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(l10n.cancelText),
            ),
            ElevatedButton(
              onPressed: state.status == ProductDialogStatus.loading
                  ? null
                  : () async {
                      final confirm = await showConfirmDialog(
                        context: context,
                        title: state.mode == ProductDialogMode.add
                            ? l10n.confirmAdd
                            : l10n.confirmUpdate,
                        content: state.mode == ProductDialogMode.add
                            ? l10n.confirmAddProductMessage
                            : l10n.confirmUpdateProductMessage,
                      );

                      if (confirm) {
                        proCubit.submitProduct();
                      }
                    },
              child: state.status == ProductDialogStatus.loading
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(
                      state.mode == ProductDialogMode.add
                          ? l10n.add
                          : l10n.update,
                    ),
            ),
          ],
        );
      },
    );
  }
}
