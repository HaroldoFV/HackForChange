import 'package:caminho_da_esperanca_hackaton_fiap_alura/core/colors.dart';
import 'package:caminho_da_esperanca_hackaton_fiap_alura/core/fonts.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class DropdownApp extends StatelessWidget {
  final List<dynamic> items;
  final String? Function(dynamic)? validator;
  final void Function(dynamic)? onChanged;
  final String label;
  final dynamic selectedItem;

  const DropdownApp({
    super.key,
    required this.items,
    required this.validator,
    required this.onChanged,
    required this.label,
    this.selectedItem,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: FontStyles.i.poppinsMedium.copyWith(
            color: ColorsTheme.mainColor,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: DropdownSearch(
            items: items,
            popupProps: const PopupProps.modalBottomSheet(fit: FlexFit.loose),
            validator: validator,
            onChanged: onChanged,
            selectedItem: selectedItem,
            
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                contentPadding: const EdgeInsets.only(
                    left: 16, right: 8, bottom: 18, top: 18),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                hintStyle: FontStyles.i.poppinsMedium.copyWith(
                  color: Colors.grey[400],
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
