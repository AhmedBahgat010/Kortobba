import 'package:flutter/cupertino.dart';

abstract class AppTextStyles {
  /// - size: 14
  /// - size: 16
  /// - size: 18
  /// - size: 20
  /// - size: 22
  static TextStyle boldTitles =
      const TextStyle(fontWeight: FontWeight.w700, fontSize: 20, height: 1.7);

  static TextStyle bold = const TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 20,
  );

  /// - weight: w300
  static TextStyle w300 = const TextStyle(fontWeight: FontWeight.w300, fontSize: 30);

  /// - weight: w400
  static TextStyle hitText =
      const TextStyle(fontWeight: FontWeight.w400, fontSize: 14);

  /// - weight: w500
  static TextStyle smTitles =
      const TextStyle(fontWeight: FontWeight.w300, fontSize: 20);

  /// - weight: w700
  static TextStyle w600 = const TextStyle(fontWeight: FontWeight.w700,fontSize: 16);

  /// - weight: w700
  static TextStyle lrTitles =
      const TextStyle(fontWeight: FontWeight.w500, fontSize: 22);

  /// - weight: w800
  static TextStyle w800 = const TextStyle(fontWeight: FontWeight.w800);

  /// - weight: w900
  static TextStyle textSmbold =
      const TextStyle(fontWeight: FontWeight.w100, fontSize: 16,);
}
