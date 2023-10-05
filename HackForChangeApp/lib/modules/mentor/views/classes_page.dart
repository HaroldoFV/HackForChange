import 'package:caminho_da_esperanca_hackaton_fiap_alura/core/colors.dart';
import 'package:caminho_da_esperanca_hackaton_fiap_alura/core/components/modal_app.dart';
import 'package:caminho_da_esperanca_hackaton_fiap_alura/core/extension.dart';
import 'package:caminho_da_esperanca_hackaton_fiap_alura/core/fonts.dart';
import 'package:caminho_da_esperanca_hackaton_fiap_alura/core/imagens.dart';
import 'package:caminho_da_esperanca_hackaton_fiap_alura/modules/mentor/infra/mentor_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Classes extends StatelessWidget {
  Classes({super.key});

  final controller = Get.find<MentorController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
        body: Obx(
          () => controller.classes.value.isEmpty
              ? Center(
                  child: Text(
                    'Crie uma aula e ajude uma pessoa',
                    style: FontStyles.i.poppinsSemiBold
                        .copyWith(fontSize: 24, color: Colors.black38),
                    textAlign: TextAlign.center,
                  ),
                )
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(118, 40, 70, 180),
                            borderRadius: BorderRadius.circular(4)),
                        child: Text('Aulas agendadas ',
                            style: FontStyles.i.poppinsSemiBold),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: ListView.builder(
                          itemCount: controller.classes.value.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 100.hs,
                              margin: const EdgeInsets.only(bottom: 20),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: ColorsTheme.mainColor, width: 2),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.classes.value[index].theme,
                                        style: FontStyles.i.poppinsMedium,
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Text(
                                            '${controller.classes.value[index].mentorName} - ',
                                            style: FontStyles.i.poppinsMedium,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            controller.classes.value[index]
                                                .schoolYear,
                                            style: FontStyles.i.poppinsMedium,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Text(
                                    '${controller.classes.value[index].day} - ',
                                    style: FontStyles.i.poppinsMedium,
                                  ),
                                  Text(
                                    controller.classes.value[index].hour,
                                    style: FontStyles.i.poppinsMedium,
                                  ),
                                  const SizedBox(width: 6),
                                  const VerticalDivider(
                                    width: 20,
                                    thickness: 1,
                                    indent: 10,
                                    endIndent: 10,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 6),
                                  InkWell(
                                    onTap: () => ModalApp.showActionsModal(
                                      content: 'Deseja excluir essa aula ?',
                                      onPressedConfirm: () {
                                        controller.classes.value.removeWhere(
                                          (el) =>
                                              el.theme ==
                                              controller
                                                  .classes.value[index].theme,
                                        );

                                        controller.classes.refresh();
                                        Get.back();
                                      },
                                      onPressedDeny: () {
                                        Get.back();
                                      },
                                    ),
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.red[200],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed('/mentorForm');
          },
          backgroundColor: ColorsTheme.mainColor,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
