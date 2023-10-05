import 'package:caminho_da_esperanca_hackaton_fiap_alura/core/colors.dart';
import 'package:caminho_da_esperanca_hackaton_fiap_alura/core/components/button.dart';
import 'package:caminho_da_esperanca_hackaton_fiap_alura/core/components/scaffold_app.dart';
import 'package:caminho_da_esperanca_hackaton_fiap_alura/core/fonts.dart';
import 'package:caminho_da_esperanca_hackaton_fiap_alura/core/imagens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class StudentFormSent extends StatelessWidget {
  const StudentFormSent({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: ScaffoldApp(
        appbar: AppBar(
          title: const Text('Caminho da esperança'),
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Image.asset(Images.logoSecundario),
          ),
          backgroundColor: ColorsTheme.mainColor,
        ),
        crossAxisAlignment: CrossAxisAlignment.center,
        body: [
          Text(
            'Formulário enviado com sucesso',
            style: FontStyles.i.poppinsSemiBold.copyWith(
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          const Icon(
            Icons.check_circle_rounded,
            color: ColorsTheme.feedbackSuccessful,
            size: 200,
          ),
          const Spacer(),
          Buttons(
            text: 'Finalizar',
            onPressed: () {
              Get.offAllNamed('/login');
            },
          )
        ],
      ),
    );
  }
}
