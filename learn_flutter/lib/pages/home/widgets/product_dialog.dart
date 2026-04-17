import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/blocs/home/home_cubit.dart';
import 'package:learn_flutter/blocs/home/product_cubit.dart';
import 'package:learn_flutter/blocs/home/product_state.dart';
import 'package:learn_flutter/cores/l10n/app_localizations.dart';

class ProductDialog extends StatefulWidget {
  const ProductDialog({super.key});

  @override
  State<ProductDialog> createState() => _ProductDialogState();
}

class _ProductDialogState extends State<ProductDialog> {
  late final TextEditingController _nameCtrl;
  late final TextEditingController _priceCtrl;
  late final TextEditingController _quantityCtrl;
  late final TextEditingController _imageCtrl;
  late final TextEditingController _descCtrl;
  late final TextEditingController _categoryCtrl;

  @override
  void initState() {
    super.initState();
    final state = context.read<ProductCubit>().state;
    _nameCtrl = TextEditingController(text: state.name);
    _priceCtrl = TextEditingController(text: state.price);
    _quantityCtrl = TextEditingController(
      text: state.quantity == 0 ? '' : state.quantity.toString(),
    );
    _imageCtrl = TextEditingController(text: state.image);
    _descCtrl = TextEditingController(text: state.description);
    _categoryCtrl = TextEditingController(text: state.category);
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _priceCtrl.dispose();
    _quantityCtrl.dispose();
    _imageCtrl.dispose();
    _descCtrl.dispose();
    _categoryCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productCubit = context.read<ProductCubit>();
    final l10n = AppLocalizations.of(context)!;

    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {
        if (state.status == ProductDialogStatus.success) {
          context.read<HomeCubit>().refreshAll();
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return AlertDialog(
          title: Text(
            state.mode == ProductDialogMode.add
                ? l10n.addProduct
                : l10n.editProduct,
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _field(
                  label: l10n.name,
                  controller: _nameCtrl,
                  onChanged: productCubit.onNameChanged,
                ),
                _field(
                  label: l10n.price,
                  controller: _priceCtrl,
                  onChanged: productCubit.onPriceChanged,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                ),
                _field(
                  label: l10n.quantity,
                  controller: _quantityCtrl,
                  onChanged: (v) =>
                      productCubit.onQuantityChanged(int.tryParse(v) ?? 0),
                  keyboardType: TextInputType.number,
                ),
                _field(
                  label: l10n.imageUrl,
                  controller: _imageCtrl,
                  onChanged: productCubit.onImageChanged,
                ),
                _field(
                  label: l10n.description,
                  controller: _descCtrl,
                  onChanged: productCubit.onDescriptionChanged,
                ),
                _field(
                  label: l10n.category,
                  controller: _categoryCtrl,
                  onChanged: productCubit.onCategoryChanged,
                ),
                if (state.status == ProductDialogStatus.error &&
                    state.errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      state.errorMessage!,
                      style: const TextStyle(color: Colors.red, fontSize: 13),
                      softWrap: true,
                      maxLines: null,
                      overflow: TextOverflow.visible,
                    ),
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
              onPressed: state.isValid
                  ? () => productCubit.submitProduct()
                  : null,
              child: state.status == ProductDialogStatus.loading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
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

  Widget _field({
    required String label,
    required TextEditingController controller,
    required Function(String) onChanged,
    TextInputType? keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
