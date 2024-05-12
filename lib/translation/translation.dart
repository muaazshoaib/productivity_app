import 'package:get/get.dart';
import 'package:fyp/translation/en_us.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': EnUs().messages,
      };
}
