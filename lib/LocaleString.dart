import 'package:get/get.dart';

class LocaleString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {'Login': 'Login', 'Recommend': 'Recommend', 'Game': 'Game'},
        'th_TH': {
          'Login': 'เข้าสู่ระบบ',
          'Recommend': 'รายการแนะนำ',
          'Game': 'เกม'
        }
      };
}
