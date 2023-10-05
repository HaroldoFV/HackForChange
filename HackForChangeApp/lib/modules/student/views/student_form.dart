import 'package:caminho_da_esperanca_hackaton_fiap_alura/core/components/button.dart';
import 'package:caminho_da_esperanca_hackaton_fiap_alura/core/components/dropdown_app.dart';
import 'package:caminho_da_esperanca_hackaton_fiap_alura/core/components/scaffold_app.dart';
import 'package:caminho_da_esperanca_hackaton_fiap_alura/core/extension.dart';
import 'package:caminho_da_esperanca_hackaton_fiap_alura/core/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../core/colors.dart';
import '../../../core/components/input_text.dart';
import '../../../core/imagens.dart';

class StudentForm extends StatelessWidget {
  StudentForm({super.key});

  final TextEditingController studentName = TextEditingController();
  final TextEditingController studentAge = TextEditingController();
  String schoolYear = '';
  String difficultyTopic = '';
  String classTime = '';
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldApp(
      appbar: AppBar(
        title: const Text('Caminho da esperança'),
        centerTitle: true,
        backgroundColor: ColorsTheme.mainColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Image.asset(Images.logoSecundario),
          ),
        ],
      ),
      body: [
        SizedBox(height: 25.hs),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: ColorsTheme.mainColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            'Formulário',
            style: FontStyles.i.poppinsSemiBold
                .copyWith(color: ColorsTheme.white, fontSize: 18),
          ),
        ),
        SizedBox(height: 25.hs),
        Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InputText(
                mainLabel: 'Nome',
                hintText: 'Nome',
                controller: studentName,
                validator: (name) {
                  if (name == null) {
                    return "É necessário informar um nome";
                  } else if (name.isEmpty) {
                    return "É necessário informar um nome";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.hs),
              InputText(
                mainLabel: 'Idade',
                hintText: 'Idade',
                controller: studentAge,
                validator: (age) {
                  if (age == null) {
                    return "É necessário informar uma idade";
                  } else if (age.isEmpty) {
                    return "É necessário informar uma idade";
                  }
                  return null;
                },
                inputType: TextInputType.number,
              ),
              SizedBox(height: 10.hs),
              DropdownApp(
                items: const ['8 ano', '9 ano', '1 ano Medio', '2 ano Medio'],
                selectedItem:
                    schoolYear.isNotEmpty ? schoolYear : 'Selecione uma serie',
                validator: (schoolYear) {
                  if (schoolYear == null) {
                    return "É necessário informar uma serie";
                  } else if (schoolYear.isEmpty) {
                    return "É necessário informar uma serie";
                  } else if (schoolYear == 'Selecione uma serie') {
                    return "É necessário informar uma serie";
                  }
                  return null;
                },
                label: 'Selecione sua serie',
                onChanged: (schoolYearValue) {
                  schoolYear = schoolYearValue;
                },
              ),
              SizedBox(height: 20.hs),
              DropdownApp(
                items: const [
                  'Matemática Básica',
                  'Historia do Brasil',
                  'Biologia molecular'
                ],
                selectedItem: difficultyTopic.isNotEmpty
                    ? difficultyTopic
                    : 'Selecione um tópico',
                validator: (difficultyTopic) {
                  if (difficultyTopic == null) {
                    return "É necessário informar uma tópico";
                  } else if (difficultyTopic.isEmpty) {
                    return "É necessário informar um tópico";
                  } else if (difficultyTopic == 'Selecione um tópico') {
                    return "É necessário informar um tópico";
                  }
                  return null;
                },
                onChanged: (difficultyTopicValue) {
                  difficultyTopic = difficultyTopic;
                },
                label: 'Selecione o tópico de dificuldade',
              ),
              SizedBox(height: 20.hs),
              DropdownApp(
                items: const ['9h', '12h', '13h', '19h'],
                selectedItem:
                    classTime.isNotEmpty ? classTime : 'Selecione um horário',
                validator: (classTime) {
                  if (classTime == null) {
                    return "É necessário informar um horário";
                  } else if (classTime.isEmpty) {
                    return "É necessário informar um horário";
                  } else if (classTime == 'Selecione um horário') {
                    return "É necessário informar um horário";
                  }
                  return null;
                },
                onChanged: (classTimeValue) {
                  classTime = classTimeValue;
                },
                label: 'Horário para assistir a aula',
              ),
            ],
          ),
        ),
        SizedBox(height: 45.hs),
        Buttons(
          text: 'Enviar',
          onPressed: () {
            if (formKey.currentState!.validate()) {
              Get.toNamed('/studentFormSent');
            }
          },
        )
      ],
    );
  }
}
