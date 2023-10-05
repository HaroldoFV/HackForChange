import 'package:caminho_da_esperanca_hackaton_fiap_alura/modules/student/views/student_form.dart';
import 'package:caminho_da_esperanca_hackaton_fiap_alura/modules/student/views/student_form_sent.dart';
import 'package:get/get.dart';


List<GetPage> studentRoutes = [
  GetPage(
    name: '/studentForm',
    page: () => StudentForm(),
  ),
  GetPage(
    name: '/studentFormSent',
    page: () => const StudentFormSent(),
  )
];
