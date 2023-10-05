import 'package:caminho_da_esperanca_hackaton_fiap_alura/modules/mentor/infra/mentor_binding.dart';
import 'package:caminho_da_esperanca_hackaton_fiap_alura/modules/mentor/views/classes_page.dart';
import 'package:caminho_da_esperanca_hackaton_fiap_alura/modules/mentor/views/mentor_form.dart';
import 'package:get/get.dart';


List<GetPage> mentorRoutes = [
  GetPage(
    name: '/classes',
    page: () => Classes(),
    binding: MentorBinding(),
  ),
  GetPage(
    name: '/mentorForm',
    page: () => MentorForm(),
  ),
];
