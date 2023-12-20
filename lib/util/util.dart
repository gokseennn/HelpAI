// ideal ekran genişliği ortalama 1000 alındı
import 'package:get/get.dart';

double getSize(
  double idealSize, {
  double? currentScreenSize,
  double tolerance = 4,
  double maxScreenSize = 1600,
  double minScreenSize = 325,
}) {
  /*if ((width ?? Get.width) > idealWidth) {
    return fontSize + ((width ?? Get.width) / maxScreenSize * tolerance);
  } else {
    return fontSize - ((minScreenSize / (width ?? Get.width)) * tolerance);
  }*/

  if ((currentScreenSize ?? Get.width) > maxScreenSize) {
    return idealSize + tolerance;
  } else if ((currentScreenSize ?? Get.width) < minScreenSize) {
    return idealSize - tolerance;
  } else {
    return (idealSize - tolerance) +
        ((((currentScreenSize ?? Get.width) - minScreenSize) /
                (maxScreenSize - minScreenSize)) *
            2 *
            tolerance);
  }
}
