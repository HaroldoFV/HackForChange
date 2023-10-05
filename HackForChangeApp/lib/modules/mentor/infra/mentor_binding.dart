import 'package:caminho_da_esperanca_hackaton_fiap_alura/modules/mentor/infra/mentor_controller.dart';
import 'package:get/get.dart';

class MentorBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MentorController());
  }
}
