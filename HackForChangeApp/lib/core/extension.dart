import 'package:get/get.dart';

extension PercentSized on num {
  double get ws => (Get.width * (this / 1000));
  double get hs => (Get.height * (this / 1000));
}
