import 'package:buddthist_date_time_and_date_picker/buddthist_date_time.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('test thaiFullDateTime', () {
    final dt = DateTime(2024, 10, 27, 14, 42);
    String dtf = DateFormatThai.thaiFullDateTime(dt);
    expect(dtf, 'วันอาทิตย์ 27 ตุลาคม 2567 เวลา 14:42 น.');
  });

  test('test thaiFullDate', () {
    final dt = DateTime(2024, 10, 27, 14, 42);
    String dtf = DateFormatThai.thaiFullDate(dt);
    expect(dtf, 'อา. 27 ตุลาคม 2567');
  });
}
