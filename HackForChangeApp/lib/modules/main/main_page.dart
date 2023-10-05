import 'package:caminho_da_esperanca_hackaton_fiap_alura/core/colors.dart';
import 'package:caminho_da_esperanca_hackaton_fiap_alura/core/components/button.dart';
import 'package:caminho_da_esperanca_hackaton_fiap_alura/core/components/image_svg.dart';
import 'package:caminho_da_esperanca_hackaton_fiap_alura/core/extension.dart';
import 'package:caminho_da_esperanca_hackaton_fiap_alura/core/fonts.dart';
import 'package:caminho_da_esperanca_hackaton_fiap_alura/core/imagens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../core/components/scaffold_app.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldApp(
      body: [
        SizedBox(
          width: 960.ws,
          height: 330.hs,
          child: const ImageSvg(imageUrl: Images.logo),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () => Get.toNamed('/studentForm'),
              child: Container(
                width: 350.ws,
                height: 126.hs,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: ColorsTheme.mainColor),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text('Aluno', style: FontStyles.i.poppinsMedium),
              ),
            ),
            InkWell(
              onTap: () => Get.toNamed('/classes'),
              child: Container(
                width: 350.ws,
                height: 126.hs,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ColorsTheme.mainColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'Mentor',
                  style: FontStyles.i.poppinsMedium
                      .copyWith(color: ColorsTheme.white),
                ),
              ),
            )
          ],
        ),
        const Spacer(),
        Buttons(
          text: 'Aulas agendadas',
          onPressed: () {
            Get.toNamed('/scheduledClasses');
          },
        )
      ],
    );
  }
}
