import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/blocs/home/product_cubit.dart';
import 'package:learn_flutter/blocs/home/product_state.dart';

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
    _priceController.text = state.price == 0 ? '' : state.price.toString();
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

        final proCubit = context.read<ProductCubit>();

        return AlertDialog(
          title: Text("Thêm sản phẩm"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: "Name"),
                  onChanged: proCubit.onNameChanged,
                ),
                TextField(
                  controller: _priceController,
                  decoration: const InputDecoration(labelText: "Price"),
                  onChanged: (v) => proCubit.onPriceChanged(v),
                ),
                TextField(
                  controller: _quantityController,
                  decoration: const InputDecoration(labelText: "Quantity"),
                  keyboardType: TextInputType.number,
                  onChanged: (v) =>
                      proCubit.onQuantityChanged(int.tryParse(v) ?? 0),
                ),
                TextField(
                  controller: _imageController,
                  decoration: const InputDecoration(labelText: "Image link"),
                  onChanged: proCubit.onImageChanged,
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: "Description"),
                  onChanged: proCubit.onDescriptionChanged,
                ),
                TextField(
                  controller: _categoryController,
                  decoration: const InputDecoration(labelText: "Category"),
                  onChanged: proCubit.onCategoryChanged,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () => proCubit.submitProduct(),
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }
}
