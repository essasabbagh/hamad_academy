import 'package:flutter/material.dart';

class AppColors {
  // Brand Colors (mapped to primaryColor, with Brand 700 as the base/500 shade)
  static const Color primaryColor = Color(0xFF6A4099); // Brand 700 (Base)
  static const Color primary25 = Color(0xFFF7F5F9);
  static const Color primary50 = Color(0xFFF0EAF8);
  static const Color primary100 = Color(0xFFD9CDEE);
  static const Color primary200 = Color(0xFFB89EDC);
  static const Color primary300 = Color(0xFF9770CA);
  // static const Color primary400 = Color(0xFF7F52BD);
  static const Color primary500 = primaryColor; // Base: Brand 700
  static const Color primary600 = Color(0xFF543787);
  static const Color primary700 = Color(0xFF6A4099);

  static const Color primary800 = Color(0xFF55317C);
  static const Color primary900 = Color(0xFF2B1947);
  static const Color primary950 = Color(0xFF1F1133);
  static const Color primary1000 = Color(0xFF0F081A);

  // Accent Colors (with Accent 600 as the base/500 shade)
  static const Color accentColor = Color(0xFFFBCD09); // Accent 600 (Base)
  static const Color accent25 = Color(0xFFFCFAF3);
  // static const Color accent50 = Color(0xFFFFF8E5);
  // static const Color accent100 = Color(0xFFFFF0CC);
  // static const Color accent200 = Color(0xFFFFE599);
  // static const Color accent300 = Color(0xFFFFDB66);
  // static const Color accent400 = Color(0xFFFFD133);
  static const Color accent500 = accentColor; // Base: Accent 600
  static const Color accent600 = Color(0xFFFBCD09);

  static const Color accent700 = Color(0xFFD6AD00);
  static const Color accent800 = Color(0xFFB38606);
  static const Color accent900 = Color(0xFF996D05);
  static const Color accent950 = Color(0xFF805404);
  static const Color accent1000 = Color(0xFF663B03);

  // Secondary Colors
  static const Color secondaryColor = Color(0xFF22a4e1);
  static const Color secondary50 = Color(0xFFE5F5FC);
  static const Color secondary100 = Color(0xFFBFE5F7);
  static const Color secondary200 = Color(0xFF94D3F2);
  static const Color secondary300 = Color(0xFF69C1ED);
  static const Color secondary400 = Color(0xFF4FB5E9);
  static const Color secondary500 = secondaryColor; // base
  static const Color secondary600 = Color(0xFF1F94CB);
  static const Color secondary700 = Color(0xFF1A7EB0);
  static const Color secondary800 = Color(0xFF156995);
  static const Color secondary900 = Color(0xFF0C496B);

  // Neutral Colors (with Neutral 500 as the base shade)
  static const Color neutralColor = Color(
    0xFF808080,
  ); // Neutral 500 (Base - visually estimated)
  static const Color neutral25 = Color(0xFFFDFDFD);
  static const Color neutral50 = Color(0xFFF8F8F8);
  static const Color neutral100 = Color(0xFFF0F0F0);
  static const Color neutral200 = Color(0xFFE0E0E0);
  static const Color neutral300 = Color(0xFFC0C0C0);
  static const Color neutral400 = Color(0xFFA0A0A0);
  static const Color neutral500 = neutralColor; // Base: Neutral 500
  static const Color neutral600 = Color(0xFF606060);
  static const Color neutral700 = Color(0xFF404040);
  static const Color neutral800 = Color(0xFF303030);
  static const Color neutral900 = Color(0xFF202020);
  static const Color neutral950 = Color(0xFF101010);
  static const Color neutral1000 = Color(0xFF000000);

  // Success Colors (with Success 600 as the base/500 shade)
  static const Color successColor = Color(0xFF48BB78); // Success 600 (Base)
  // static const Color success25 = Color(0xFFF7FCF9);
  // static const Color success50 = Color(0xFFEDF8F1);
  // static const Color success100 = Color(0xFFD9F0E3);
  // static const Color success200 = Color(0xFFB3E0C7);
  // static const Color success300 = Color(0xFF8CD1AB);
  // static const Color success400 = Color(0xFF66C28F);
  // static const Color success500 = successColor; // Base: Success 600
  static const Color success600 = Color(0xFF3DA368);
  static const Color success700 = Color(0xFF389F63);
  static const Color successAlpha = Color(0x1A48BB78);

  // static const Color success800 = Color(0xFF27734A);
  // static const Color success900 = Color(0xFF1C5A3B);
  // static const Color success950 = Color(0xFF11422C);
  // static const Color success1000 = Color(0xFF06291D);

  // Error Colors (with Error 600 as the base/500 shade)
  static const Color errorColor = Color(0xFFDC3545); // Error 600 (Base)
  static const Color error25 = Color(0xFFFDF7F8);
  static const Color error50 = Color(0xFFFBECEE);
  static const Color error100 = Color(0xFFF7D9DD);
  static const Color error200 = Color(0xFFEFB3BA);
  static const Color error300 = Color(0xFFE78C97);
  static const Color error400 = Color(0xFFDF6674);
  static const Color error500 = errorColor; // Base: Error 600
  static const Color error600 = Color(0xFFDC3545);
  static const Color error700 = Color(0xFFAE2936);
  static const Color error800 = Color(0xFF98232F);
  static const Color error900 = Color(0xFF821D28);
  static const Color error950 = Color(0xFF6B1720);
  static const Color error1000 = Color(0xFF551119);

  // Warning Colors (with Warning 600 as the base/500 shade)
  static const Color warningColor = Color(0xFFFFC107); // Warning 600 (Base)
  static const Color warning25 = Color(0xFFFFFDF2);
  static const Color warning50 = Color(0xFFFFF8E5);
  static const Color warning100 = Color(0xFFFFF0CC);
  static const Color warning200 = Color(0xFFFFE599);
  static const Color warning300 = Color(0xFFFFDB66);
  static const Color warning400 = Color(0xFFFFD133);
  static const Color warning500 = warningColor; // Base: Warning 600
  static const Color warning600 = Color(0xFFE6AD06);
  static const Color warning700 = Color(0xFFCC9905);
  static const Color warning800 = Color(0xFFB38504);
  static const Color warning900 = Color(0xFF997103);
  static const Color warning950 = Color(0xFF805D02);
  static const Color warning1000 = Color(0xFF664901);

  // Alpha Shades for primaryColor (0xFF6A4099)
  // static const Color primaryAlpha95 = Color(0xF26A4099);
  // static const Color primaryAlpha90 = Color(0xE66A4099);
  // static const Color primaryAlpha85 = Color(0xD96A4099);
  // static const Color primaryAlpha80 = Color(0xCC6A4099);
  // static const Color primaryAlpha75 = Color(0xBF6A4099);
  // static const Color primaryAlpha70 = Color(0xB36A4099);
  // static const Color primaryAlpha65 = Color(0xA66A4099);
  // static const Color primaryAlpha60 = Color(0x996A4099);
  // static const Color primaryAlpha55 = Color(0x8C6A4099);
  // static const Color primaryAlpha50 = Color(0x806A4099);
  // static const Color primaryAlpha45 = Color(0x736A4099);
  // static const Color primaryAlpha40 = Color(0x666A4099);
  // static const Color primaryAlpha35 = Color(0x596A4099);
  // static const Color primaryAlpha30 = Color(0x4D6A4099);
  // static const Color primaryAlpha25 = Color(0x406A4099);
  // static const Color primaryAlpha20 = Color(0x336A4099);
  // static const Color primaryAlpha15 = Color(0x266A4099);
  // static const Color primaryAlpha10 = Color(0x1A6A4099);
  // static const Color primaryAlpha9 = Color(0x176A4099);
  // static const Color primaryAlpha8 = Color(0x146A4099);
  // static const Color primaryAlpha7 = Color(0x126A4099);
  // static const Color primaryAlpha6 = Color(0x0F6A4099);
  // static const Color primaryAlpha5 = Color(0x0D6A4099);
  // static const Color primaryAlpha4 = Color(0x0A6A4099);
  // static const Color primaryAlpha3 = Color(0x086A4099);
  // static const Color primaryAlpha2 = Color(0x056A4099);
  // static const Color primaryAlpha1 = Color(0x036A4099);

  static const Color lightPrimaryColor = Color(0xffE6F7FD);

  static const Color backgroundColor = Color(0xFFF7F9FD);

  static const Color ratingColor = Color(0xFFFFC107);

  static const Color lightColor = Color(0xFFE6ECF1);

  static const Color white = Color(0xFFFFFFFF);
  static const Color whiteShade = Color(0xFFFAFAFA);

  static const Color textPrimary = Color(0xff001930);

  static const Color textSecondary = Color(0xff003769);

  static const Color textHint = Color(0xff91919F);

  static const Color hintColor = Color(0xffB9B9B9);

  static const Color borderColor = Color(0xFFDEE2E6);

  static const Color primaryDark = Color(0xFF004080);

  static const Color primaryLight = Color(0xFF80BFFF);

  static const Color shadowColor = Color(0x132C4A0F);

  static const Color color2 = Color(0xFFEF4C66);
  static final Color color2Background = color2.withValues(alpha: .06);

  static const Color blue = Color(0xFF007AFF);
  static final Color blueBackground = blue.withValues(alpha: .1);

  static const Color cardColor = Color(0xFFF8F9FA);
  static const Color surfaceColor = Color(0xFFF8F8F8);
  static const Color blackColor = Color(0xFF131313);
}
