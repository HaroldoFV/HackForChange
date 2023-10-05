import 'package:caminho_da_esperanca_hackaton_fiap_alura/modules/classes/scheduled_classes_routes.dart';
import 'package:caminho_da_esperanca_hackaton_fiap_alura/modules/main/main_page.dart';
import 'package:caminho_da_esperanca_hackaton_fiap_alura/modules/mentor/infra/mentor_routes.dart';
import 'package:caminho_da_esperanca_hackaton_fiap_alura/modules/student/student_routes.dart';
import 'package:get/get.dart';

List<GetPage> routes = [
  GetPage(
    name: '/login',
    page: () => const Login(),
  ),
  ...scheduledClassesRoutes,
  ...mentorRoutes,
  ...studentRoutes,
];
