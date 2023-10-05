import 'package:caminho_da_esperanca_hackaton_fiap_alura/modules/classes/scheduled_classes_page.dart';
import 'package:caminho_da_esperanca_hackaton_fiap_alura/modules/mentor/infra/mentor_binding.dart';
import 'package:get/get.dart';

List<GetPage> scheduledClassesRoutes = [
  GetPage(
    name: '/scheduledClasses',
    page: () => ScheduledClassesPage(),
    binding: MentorBinding(),
  ),
];
