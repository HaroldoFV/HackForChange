import 'package:caminho_da_esperanca_hackaton_fiap_alura/models/class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MentorController extends GetxController {
  // variables
  Rx<List<Class>> classes = Rx<List<Class>>([]);

  final TextEditingController mentorName = TextEditingController();
  final TextEditingController mentorAge = TextEditingController();
  String schoolYear = '';
  String topicToTeach = '';
  String classTime = '';
  String classDay = '';

  // methods
  void cleanField() {
    mentorName.clear();
    mentorAge.clear();
    topicToTeach = '';
    classTime = '';
    classDay = '';
  }
}
