import 'package:caminho_da_esperanca_hackaton_fiap_alura/core/colors.dart';
import 'package:caminho_da_esperanca_hackaton_fiap_alura/core/components/button.dart';
import 'package:caminho_da_esperanca_hackaton_fiap_alura/core/components/input_text.dart';
import 'package:caminho_da_esperanca_hackaton_fiap_alura/core/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ModalApp {
  ModalApp._internal();

  static Future<void> showLoading() async {
    await Get.dialog(
      barrierDismissible: false,
      SimpleDialog(
        backgroundColor: Colors.white,
        children: [
          Center(
            child: Column(
              children: const [
                CircularProgressIndicator(color: Colors.green),
                SizedBox(height: 10),
                Text(
                  "Aguarde....",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 19.0,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  static Future<void> showActionsModal(
      {String? title,
      required String content,
      required void Function()? onPressedConfirm,
      required void Function()? onPressedDeny,
      String? textConfirm,
      String? textDeny}) async {
    Get.dialog(
      barrierDismissible: false,
      AlertDialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 5),
        title: title != null
            ? Text(
                title,
                textAlign: TextAlign.center,
              )
            : null,
        content: Text(content),
        actions: [
          ElevatedButton(
            onPressed: onPressedConfirm,
            style: ElevatedButton.styleFrom(
                backgroundColor: ColorsTheme.mainColor),
            child: Text(textConfirm ?? 'Sim'),
          ),
          ElevatedButton(
            onPressed: onPressedDeny,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: Text(textDeny ?? "Não"),
          ),
        ],
      ),
    );
  }

  static Future<void> createClassModal({
    required void Function() onPressed,
    required TextEditingController textEditingTheme,
    required TextEditingController textEditingHour,
    required String textButton,
  }) async {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    Get.dialog(
      LayoutBuilder(
        builder: (context, constraints) {
          return AlertDialog(
            insetPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            content: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              width: containerSize(Get.context!, constraints),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputText(
                      controller: textEditingTheme,
                      mainLabel: 'Tema',
                      useMainLabel: false,
                      hintText: 'Tema',
                      validator: (item) => item!.isNotEmpty
                          ? null
                          : "É necessário informar um tema",
                      textStyle: FontStyles.i.poppinsMedium
                          .copyWith(color: ColorsTheme.mainColor),
                      onSaved: (item) {
                        textEditingTheme.text = item ?? '';
                      },
                    ),
                    const SizedBox(height: 5),
                    InputText(
                      controller: textEditingHour,
                      mainLabel: 'Dia',
                      useMainLabel: false,
                      hintText: 'Dia',
                      suffixIcon: IconButton(
                        onPressed: () async {
                          DateTime? pickDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(3000),
                          );

                          if (pickDate != null) {
                            String formattedDate =
                                DateFormat('dd/MM/yyyy').format(pickDate);
                            textEditingHour.text = formattedDate;
                          }
                        },
                        icon: const Icon(Icons.calendar_month_outlined),
                        color: ColorsTheme.mainColor,
                      ),
                      inputType: TextInputType.number,
                      inputFormatters: [
                        MaskTextInputFormatter(
                          mask: "##/##/####",
                          filter: {"#": RegExp(r'[0-9]')},
                        )
                      ],
                      onSaved: (item) {
                        textEditingHour.text = item ?? '';
                      },
                      validator: (String? value) {
                        var date = value?.split('/') ?? [];

                        if (value?.length == 10) {
                          // Pegar o dia
                          var day = int.tryParse(date[0]) ?? 00;

                          // Pegar o mês
                          var month = int.tryParse(date[1]) ?? 00;

                          // Pegar o ano
                          var year = int.tryParse(date[2]) ?? 0000;
                          var yearNow = DateTime.now();

                          if (value == null) {
                            return 'Uma data precisa ser selecionada';
                          } else if (day > 31) {
                            return 'Data inválida';
                          } else if ((month % 2 == 0 &&
                                  month != 08 &&
                                  month != 10 &&
                                  month != 12) &&
                              day > 30) {
                            return 'Data inválida';
                          } else if (year < yearNow.year || month > 12) {
                            return 'Data inválida';
                          } else if ((month == 9 || month == 11) && day > 30) {
                            return 'Data inválida';
                          } else if (month == 02 &&
                              day > 28 &&
                              !(year % 4 == 0)) {
                            return 'Data inválida';
                          } else if (month == 02 && day > 29 && year % 4 == 0) {
                            return 'Data inválida';
                          }

                          return null;
                        }

                        return 'Data inválida';
                      },
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5, right: 10),
                child: Buttons(
                  width: 550,
                  height: 60,
                  text: 'Criar',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      onPressed();
                    }
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  static double containerSize(
      BuildContext context, BoxConstraints constraints) {
    double width = constraints.maxWidth;

    if (width > 1366) {
      return MediaQuery.of(Get.context!).size.width * 0.30;
    } else if (width < 1366 && width >= 768) {
      return MediaQuery.of(Get.context!).size.width * 0.30;
    } else {
      return MediaQuery.of(Get.context!).size.width * 0.90;
    }
  }
}
