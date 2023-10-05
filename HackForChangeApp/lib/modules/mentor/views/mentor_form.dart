import 'package:caminho_da_esperanca_hackaton_fiap_alura/core/colors.dart';
import 'package:caminho_da_esperanca_hackaton_fiap_alura/core/components/button.dart';
import 'package:caminho_da_esperanca_hackaton_fiap_alura/core/components/dropdown_app.dart';
import 'package:caminho_da_esperanca_hackaton_fiap_alura/core/components/input_text.dart';
import 'package:caminho_da_esperanca_hackaton_fiap_alura/core/components/scaffold_app.dart';
import 'package:caminho_da_esperanca_hackaton_fiap_alura/core/extension.dart';
import 'package:caminho_da_esperanca_hackaton_fiap_alura/core/fonts.dart';
import 'package:caminho_da_esperanca_hackaton_fiap_alura/core/imagens.dart';
import 'package:caminho_da_esperanca_hackaton_fiap_alura/models/class.dart';
import 'package:caminho_da_esperanca_hackaton_fiap_alura/modules/mentor/infra/mentor_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MentorForm extends StatelessWidget {
  MentorForm({super.key});

  final controller = Get.find<MentorController>();
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
                controller: controller.mentorName,
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
                controller: controller.mentorAge,
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
                selectedItem: controller.schoolYear.isNotEmpty
                    ? controller.schoolYear
                    : 'Selecione uma serie',
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
                  controller.schoolYear = schoolYearValue;
                },
              ),
              SizedBox(height: 10.hs),
              DropdownApp(
                items: const [
                  'Matemática Básica',
                  'Historia do Brasil',
                  'Biologia molecular'
                ],
                selectedItem: controller.topicToTeach.isNotEmpty
                    ? controller.topicToTeach
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
                  controller.topicToTeach = difficultyTopicValue;
                },
                label: 'Qual tópico você quer ensinar',
              ),
              SizedBox(height: 10.hs),
              DropdownApp(
                items: const ['Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sab'],
                selectedItem: controller.classDay.isNotEmpty
                    ? controller.classDay
                    : 'Selecione um dia',
                validator: (classDay) {
                  if (classDay == null) {
                    return "É necessário informar um dia";
                  } else if (classDay.isEmpty) {
                    return "É necessário informar um dia";
                  } else if (classDay == 'Selecione um dia') {
                    return "É necessário informar um dia";
                  }
                  return null;
                },
                onChanged: (classDayValue) {
                  controller.classDay = classDayValue;
                },
                label: 'Selecione o dia da aula',
              ),
              SizedBox(height: 20.hs),
              DropdownApp(
                items: const ['9h', '12h', '13h', '19h'],
                selectedItem: controller.classTime.isNotEmpty
                    ? controller.classTime
                    : 'Selecione um horário',
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
                  controller.classTime = classTimeValue;
                },
                label: 'Horário para assistir a aula',
              ),
            ],
          ),
        ),
        SizedBox(height: 45.hs),
        Buttons(
          text: 'Criar',
          onPressed: () {
            if (formKey.currentState!.validate()) {
              controller.classes.value.add(
                Class(
                  theme: controller.topicToTeach,
                  mentorName: controller.mentorName.text,
                  schoolYear: controller.schoolYear,
                  day: controller.classDay,
                  hour: controller.classTime,
                ),
              );
              controller.classes.refresh();
              controller.cleanField();

              Get.back();
            }
          },
        )
      ],
    );
  }
}
