import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';

abstract class LicensePlate extends StatelessWidget {
  final String plate;
  final double? width;
  final double? height;
  final String? locality;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;

  final PlateCategory? category;
  const LicensePlate(
    this.plate, {
    super.key,
    this.width,
    this.height,
    this.locality = 'BRASIL',
    this.category,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
  });
  Color getBackgroundColor();

  Color getBorderColor();

  Color gettextColor();

  static PlateCategory? categoryFromPlate(String plate, dynamic value) {
    if (MercosulPlate.isValidPlate(plate)) {
      return MercosulPlateCategory.fromValue(value);
    } else if (ThreeLettersPlate.isValidPlate(plate)) {
      return ThreeLettersPlateCategory.fromValue(value);
    } else if (TwoLettersPlate.isValidPlate(plate)) {
      return TwoLettersPlateCategory.fromValue(value);
    } else if (value is ThreeLettersPlateCategory || value is TwoLettersPlateCategory || value is MercosulPlateCategory || value is PlateCategory) {
      return value;
    }
    return null;
  }

  /// Converts an old plate [String] to the Mercosul standard.
  ///
  /// The old card must be in "AAA9999" format.
  ///
  /// Returns the new plate in the Mercosur pattern.
  static String convertToMercosulPlate(String? oldPlate) {
    if (oldPlate == null) {
      throw ArgumentError.notNull('oldPlate');
    }

    String cleanPlate = oldPlate.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '');

    RegExp oldPlateRegex = RegExp(r'^([A-Z]{3})(\d{4})$');
    if (!oldPlateRegex.hasMatch(cleanPlate)) {
      throw const FormatException('Invalid old plate format.');
    }

    String newPlate = cleanPlate.replaceAllMapped(oldPlateRegex, (match) => '${match[1]}${match[2]![0]}${match[1]![2]}${match[2]!.substring(1)}');

    return newPlate.toUpperCase();
  }

  /// Converts a [String] from Mercosul license plate to the old standard.
  ///
  /// The Mercosul license plate must be in the "AAA1A11" format.
  ///
  /// Returns the new plate in the old pattern.
  static String convertToThreeLettersPlate(String? newPlate) {
    if (newPlate == null) {
      throw ArgumentError.notNull('newPlate');
    }

    String cleanPlate = newPlate.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '');

    RegExp newPlateRegex = RegExp(r'^([A-Z]{3})(\d)([A-Z]{1})(\d{2})$');
    if (!newPlateRegex.hasMatch(cleanPlate)) {
      throw const FormatException('Invalid mercosul format.');
    }

    String oldPlate = cleanPlate.replaceAllMapped(newPlateRegex, (match) => '${match[1]}${match[3]}${match[4]}');

    return oldPlate.toUpperCase();
  }

  /// Create a [TwoLettersPlate], [ThreeLettersPlate] or [MercosulPlate] from [String]. The plate type is auto-selected by [category] or by format of [String].
  /// If [category] is not provided, the plate type is auto-selected by the format of [plate].
  /// If [category] is not provided and plate is not a valid plate number, return a [MercosulPlate] with [MercosulPlateCategory].
  /// Colors can be customized by passing the [backgroundColor], [borderColor], [textColor] and [topBarColor] parameters.
  static LicensePlate create(
    String plate, {
    double? width,
    double? height,
    String? locality,
    PlateCategory? category,
    Color? backgroundColor,
    Color? borderColor,
    Color? textColor,
    Color? topBarColor,
  }) {
    category ??= categoryFromPlate(plate, "particular") ?? MercosulPlateCategory.particular;

    if (category is ThreeLettersPlateCategory) {
      return ThreeLettersPlate(
        plate,
        height: height,
        width: width,
        locality: locality ?? "",
        category: category,
        backgroundColor: backgroundColor,
        borderColor: borderColor,
        textColor: textColor,
      );
    } else if (category is MercosulPlateCategory) {
      return MercosulPlate(
        plate,
        height: height,
        width: width,
        category: category,
        locality: locality ?? "",
        backgroundColor: backgroundColor,
        borderColor: borderColor,
        textColor: textColor,
        topBarColor: topBarColor,
      );
    } else if (category is TwoLettersPlateCategory) {
      return TwoLettersPlate(
        plate,
        height: height,
        width: width,
        locality: locality ?? "",
        showLocality: locality.isNotBlank,
        category: category,
        backgroundColor: backgroundColor,
        borderColor: borderColor,
        textColor: textColor,
      );
    }
    throw Exception('Invalid category');
  }
}

/// A widget that draws a Mercosul plate on the screen.
class MercosulPlate extends StatelessWidget implements LicensePlate {
  /// Relation between width and height
  static const double _heightRelation = 250 / 800;

  /// Relation between the width of the left border and the entire plate width.
  static const double _leftBorderRelation = 15 / 724;

  /// Relation between the width of the right border and the entire plate width.
  static const double _rightBorderRelation = 13 / 724;

  /// Relation between the height of top and bottom borders
  /// and the entire plate height.
  static const double _verticalBorderRelation = 14 / 250;

  /// Relation between the height of the locality header container and the entire
  /// plate height.
  static const double _localityContainerHeightRelation = 55 / 250;

  /// Relation between the height of the locality header text font and the entire
  /// plate height.
  static const double _localityContainerLettersRelation = 28 / 250;

  /// Relation between the height of the letters of the license plate and the entire
  /// license plate height.
  static const double _lettersHeightRelation = 130 / 250;

  // Default plate width if neither width or height values were provided for the
  // class constructor
  static const double _defaultWidth = 300;

  /// The letters and numbers drawn in the licence plate
  @override
  final String plate;

  /// The width that the whole widget will take. If null, the width value
  /// will be infered from the height value. If height is null, then the
  /// _defaultWidth value will be considered.
  @override
  final double? width;

  /// The height that the whole widget will take. If left null, then the original
  /// proportion factor will be used to calculate this value from the width.
  @override
  final double? height;

  // The following constants are the proportion factors from the sizes of a
  // real car license plate.

  /// The plate's category which determines the default color set
  @override
  final MercosulPlateCategory category;

  /// The string that represents the text which will be positioned at the top
  /// of the licence plate, generally the name of the country.
  /// Always converted to uppercase.
  /// Defaults to "BRASIL"
  @override
  final String locality;

  /// The two letters printed at the bottom left position.
  /// Always converted to uppercase.
  /// Defaults to "BR"
  final String countryAcronymLetters;

  /// The name of the image asset that will be placed in the top right corner.
  /// Considers a relative path from the root of the `assets` folder.
  /// Defaults to `brazil.png`
  final ImageProvider? countryFlag;

  /// The path of the logo asset that will be placed in the top left corner.
  /// Considers a relative path from the root of the `assets` folder.
  /// Defaults to `merco.png`
  final ImageProvider? mercosulLogo;

  @override
  final Color? backgroundColor;

  @override
  final Color? borderColor;

  @override
  final Color? textColor;

  final Color? topBarColor;

  /// Class constructor. To obtain the original aspect ratio  of a real
  /// license plate, only provide a value for width
  /// OR height, so it will keep the original proportion automatically.
  /// If a value is provided for these two properties, then the original
  /// aspect ratio will not be take in account.
  /// If neither are provided, the value of _defaultWidth will be used.
  const MercosulPlate(
    this.plate, {
    super.key,
    this.width,
    this.height,
    this.category = MercosulPlateCategory.particular,
    this.locality = 'BRASIL',
    this.countryAcronymLetters = 'BR',
    this.countryFlag,
    this.mercosulLogo,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.topBarColor,
  });

  /// Evaluates the real height that will be considered
  /// while drawing the widget.
  /// If a height value was explicitly passed to object's
  /// constructor, then this value will be used.
  /// Otherwise, it infers a value for height from the width property,
  /// consering the original proportional factor.
  double get realHeight {
    if (height != null) {
      return height!;
    } else {
      return realWidth * _heightRelation;
    }
  }

  /// Evaluates the width value that will be used to draw the widget.
  /// If a value is passed to the constructor, then this value will be used.
  /// Otherwise, it checks if a value has been passed to height and calculates
  /// the width using the original proportion factor. If both width and height are
  /// nulls, then the value setted for _defaultWidth will be used.
  double get realWidth {
    if (width != null) {
      return width!;
    } else {
      if (height == null) {
        return _defaultWidth;
      } else {
        return height! * 1 / _heightRelation;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: context.theme.copyWith(
        typography: Typography.material2014(),
      ),
      child: _externalWrapper(
        child: _internalWrapper(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _countryTopBar(),
              _charactersContent(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Color getBackgroundColor() => backgroundColor ?? category.backgroundColor;

  @override
  Color getBorderColor() => borderColor ?? textColor ?? category.borderColor;

  @override
  Color gettextColor() => textColor ?? borderColor ?? category.textColor;

  /// Draws the area in which will be printed the main license plate characters.
  Widget _charactersContent() {
    return SizedBox(
      height: realHeight * _lettersHeightRelation,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _getPlateChars(plate, realHeight * _lettersHeightRelation),
        ],
      ),
    );
  }

  /// Draws the header which contains the country name and flags.
  Widget _countryTopBar() {
    final double flagBorderRadius = 3 * (realWidth / 500);
    final double flagPadding = 2 * (realWidth / 500);
    return Container(
        width: double.infinity,
        height: realHeight * _localityContainerHeightRelation,
        decoration: BoxDecoration(
          color: topBarColor ?? const Color(0xFF003399),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 5 * (realWidth / 500),
              child: Container(
                color: Colors.transparent,
                height: realHeight * _localityContainerHeightRelation * 0.8,
                child: Image(
                  image: mercosulLogo ?? const AssetImage('assets/images/merco.png', package: 'innerlibs'),
                  color: topBarColor ?? const Color(0xFF003399),
                  colorBlendMode: BlendMode.lighten,
                ),
              ),
            ),
            Text(
              locality.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.9,
                fontSize: realHeight * _localityContainerLettersRelation,
                fontWeight: FontWeight.bold,
                color: topBarColor?.getContrastColor(100) ?? Colors.white,
              ),
            ),
            Positioned(
              right: 5 * (realWidth / 500),
              child: Container(
                height: realHeight * _localityContainerHeightRelation * 0.8,
                padding: EdgeInsets.all(flagPadding),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(flagBorderRadius),
                ),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(flagBorderRadius),
                  ),
                  child: Image(
                    image: countryFlag ?? const AssetImage('assets/images/brazil.png', package: 'innerlibs'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            )
          ],
        ));
  }

  /// Draws the outer borders.
  Widget _externalWrapper({required Widget child}) {
    return Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(15 * (realWidth / 500)),
          color: getBorderColor(),
        ),
        width: realWidth,
        height: realHeight,
        padding: EdgeInsets.fromLTRB(
          realWidth * _leftBorderRelation,
          realHeight * _verticalBorderRelation,
          realWidth * _rightBorderRelation,
          realHeight * _verticalBorderRelation,
        ),
        child: child);
  }

  /// Styles the main license plate characters
  Text _getPlateChars(String chars, [double fontSize = 40]) {
    if (ThreeLettersPlate.isValidPlate(chars)) {
      chars = LicensePlate.convertToMercosulPlate(chars);
    }
    return Text(
      chars.toUpperCase(),
      style: TextStyle(
        fontSize: fontSize,
        letterSpacing: 2 * (fontSize / 98),
        fontFamily: 'fe',
        package: 'innerlibs',
        color: gettextColor(),
      ),
      textAlign: TextAlign.center,
    );
  }

  /// Draws the inner content wrapper and places the two letter acronym
  /// in the bottom left corner.
  Widget _internalWrapper({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: getBackgroundColor(),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: -10 * (realWidth / 1000),
            left: 0,
            child: Text(countryAcronymLetters.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 50 * (realWidth / 1000),
                  color: getBackgroundColor().getContrastColor(100),
                )),
          ),
          child,
        ],
      ),
    );
  }

  /// Validate if [String] is a valid [MercosulPlate]
  static isValidPlate(String plate) => RegExp(r'^[A-Z]{3}[0-9][A-Z][0-9]{2}$').hasMatch(plate);
}

enum MercosulPlateCategory implements PlateCategory {
  particular(0, Colors.white, Colors.black, Colors.black, 'Particular'),
  comercial(1, Colors.white, Colors.red, Colors.red, 'Comercial'),
  especial(2, Colors.white, Colors.green, Colors.green, 'Especial'),
  oficial(3, Colors.white, Colors.blue, Colors.blue, 'Oficial'),
  diplomatico(4, Colors.white, Color(0xffdaa520), Color(0xffdaa520), 'Diplomático'),
  colecionador(5, Colors.white, Colors.grey, Colors.grey, 'Colecionador'),
  colecionadorNacional(6, Colors.black, Colors.white, Colors.white, 'Colecionador Nacional');

  @override
  final int value;
  @override
  final Color backgroundColor;
  @override
  final Color borderColor;
  @override
  final Color textColor;

  @override
  final String name;

  const MercosulPlateCategory(this.value, this.backgroundColor, this.borderColor, this.textColor, this.name);

  factory MercosulPlateCategory.fromInt(int value) {
    switch (value) {
      case 0:
        return MercosulPlateCategory.particular;
      case 1:
        return MercosulPlateCategory.comercial;
      case 2:
        return MercosulPlateCategory.especial;
      case 3:
        return MercosulPlateCategory.oficial;
      case 4:
        return MercosulPlateCategory.diplomatico;
      case 5:
        return MercosulPlateCategory.colecionador;
      case 6:
        return MercosulPlateCategory.colecionadorNacional;
      default:
        throw Exception('Invalid value');
    }
  }

  factory MercosulPlateCategory.fromString(string value) {
    if (value.isNumber) {
      return MercosulPlateCategory.fromInt(value.toInt!);
    }
    switch (generateKeyword(value)) {
      case 'particular':
        return MercosulPlateCategory.particular;

      case 'comercial':
        return MercosulPlateCategory.comercial;

      case 'especial':
        return MercosulPlateCategory.especial;

      case 'oficial':
        return MercosulPlateCategory.oficial;

      case 'diplomatico':
        return MercosulPlateCategory.diplomatico;

      case 'colecionador':
        return MercosulPlateCategory.colecionador;
      case 'colecionadornacional':
        return MercosulPlateCategory.colecionadorNacional;
      default:
        throw Exception('Invalid value');
    }
  }

  factory MercosulPlateCategory.fromThreeLetters(ThreeLettersPlateCategory category) => category.convertToMercosul;

  factory MercosulPlateCategory.fromValue(dynamic value) {
    if (value is int) {
      return MercosulPlateCategory.fromInt(value);
    } else if (value is String) {
      return MercosulPlateCategory.fromString(value);
    } else if (value is MercosulPlateCategory) {
      return value;
    } else if (value is ThreeLettersPlateCategory) {
      return MercosulPlateCategory.fromThreeLetters(value);
    } else {
      throw Exception('Invalid value: $value');
    }
  }

  ThreeLettersPlateCategory get convertToThreeLetters {
    switch (this) {
      case MercosulPlateCategory.comercial:
        return ThreeLettersPlateCategory.comercial;
      case MercosulPlateCategory.especial:
        return ThreeLettersPlateCategory.especial;
      case MercosulPlateCategory.oficial:
        return ThreeLettersPlateCategory.oficial;
      case MercosulPlateCategory.diplomatico:
        return ThreeLettersPlateCategory.diplomatico;
      case MercosulPlateCategory.colecionador:
      case MercosulPlateCategory.colecionadorNacional:
        return ThreeLettersPlateCategory.colecionador;
      case MercosulPlateCategory.particular:
      default:
        return ThreeLettersPlateCategory.particular;
    }
  }

  @override
  String toString() {
    switch (this) {
      case MercosulPlateCategory.particular:
        return 'Particular';
      case MercosulPlateCategory.comercial:
        return 'Comercial';
      case MercosulPlateCategory.especial:
        return 'Especial';
      case MercosulPlateCategory.oficial:
        return 'Oficial';
      case MercosulPlateCategory.diplomatico:
        return 'Diplomático';
      case MercosulPlateCategory.colecionador:
        return 'Colecionador';
      case MercosulPlateCategory.colecionadorNacional:
        return 'Colecionador Nacional';
    }
  }
}

abstract class PlateCategory {
  final int value;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final String name;

  const PlateCategory(this.value, this.backgroundColor, this.borderColor, this.textColor, this.name);

  factory PlateCategory.fromInt(int value) => throw UnimplementedError();
  factory PlateCategory.fromString(String value) => throw UnimplementedError();
  factory PlateCategory.fromValue(dynamic value) => throw UnimplementedError();
}

/// A widget that prints a license plate in the
///  "three letters pattern" on the screen.
class ThreeLettersPlate extends StatelessWidget implements LicensePlate {
  /// Relation between width and height
  static const double _heightRelation = 400 / 1400;

  /// Relation between the width of the left border and the entire plate width.
  static const double _leftBorderRelation = 28 / 1400;

  /// Relation between the width of the right border and the entire plate width.
  static const double _rightBorderRelation = 20 / 1400;

  /// Relation between the height of top and bottom borders
  /// and the entire plate height.
  static const double _verticalBorderRelation = 20 / 400;

  /// Relation between the width of the locality header container and the entire
  /// plate width.
  static const double _localityContainerWidthRelation = 974 / 1400;

  /// Relation between the height of the locality header container and the entire
  /// plate height.
  static const double _localityContainerHeightRelation = 77 / 400;

  /// Relation between the height of the locality header text font and the entire
  /// plate height.
  static const double _localityContainerLettersRelation = 50 / 400;

  /// The relation between the height of the top border of the main letters and
  /// the entire plate height.
  static const double _lettersBorderTop = 15 / 400;

  /// Relation between the height of the letters of the license plate and the entire
  /// license plate height.
  static const double _lettersHeightRelation = 220 / 400;

  /// The relation between the interpunct height and the height of the entire plate.
  static const double _dotHeightRelation = 32 / 400;

  /// Default plate width if neither width or height values were provided for the
  /// class constructor
  static const double _defaultWidth = 300;

  /// Default font family
  static const String _fontFamily = 'Mandatory';

  /// The letters and numbers drawn in the licence plate
  @override
  final String plate;

  // The city name and state acronym printed in locality header
  @override
  final String? locality;

  /// The width that the whole widget will take. If null, the width value
  /// will be infered from the height value. If height is null, then the
  /// _defaultWidth value will be considered.

  @override
  final double? width;

  /// The height that the whole widget will take. If left null, then the original
  /// proportion factor will be used to calculate this value from the width.

  @override
  final double? height;

  /// The plate's category which determines the default color set
  @override
  final ThreeLettersPlateCategory category;

  @override
  final Color? backgroundColor;

  @override
  final Color? borderColor;

  @override
  final Color? textColor;

  /// Class constructor. To obtain the original aspect ratio  of a real
  /// license plate, only provide a value for width
  /// OR height, so it will keep the original proportion automatically.
  /// If a value is provided for these two properties, then the original
  /// aspect ratio will not be take in account.
  /// If neither are provided, the value of _defaultWidth will be used.
  const ThreeLettersPlate(
    this.plate, {
    super.key,
    this.width,
    this.height,
    this.locality = 'BRASIL',
    this.category = ThreeLettersPlateCategory.particular,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
  });

  /// Evaluates the real height that will be considered
  /// while drawing the widget.
  /// If a height value was explicitly passed to object's
  /// constructor, then this value will be used.
  /// Otherwise, it infers a value for height from the width property,
  /// consering the original proportional factor.
  double get realHeight {
    if (height != null) {
      return height!;
    } else {
      return realWidth * _heightRelation;
    }
  }

  /// Evaluates the width value that will be used to draw the widget.
  /// If a value is passed to the constructor, then this value will be used.
  /// Otherwise, it checks if a value has been passed to height and calculates
  /// the width using the original proportion factor. If both width and height are
  /// nulls, then the value setted for _defaultWidth will be used.
  double get realWidth {
    if (width != null) {
      return width!;
    } else {
      if (height == null) {
        return _defaultWidth;
      } else {
        return height! * 1 / _heightRelation;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: context.theme.copyWith(
          typography: Typography.material2014(),
        ),
        child: _externalWrapper(child: _internalWrapper(child: _charactersContent())));
  }

  @override
  Color getBackgroundColor() => backgroundColor ?? borderColor ?? category.backgroundColor;

  @override
  Color getBorderColor() => borderColor ?? backgroundColor ?? category.borderColor;

  @override
  Color gettextColor() => textColor ?? (backgroundColor ?? borderColor)?.getContrastColor(100) ?? category.textColor;

  /// Draws the area in which will be printed the main license plate characters.
  Widget _charactersContent() {
    final String letters = plate.replaceAll("-", "").substring(0, 3);
    final String numbers = plate.replaceAll("-", "").substring(3, 7);

    return SizedBox(
      height: realHeight * _lettersHeightRelation,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (category == ThreeLettersPlateCategory.representacao) ...[
            Image.asset(
              'assets/images/brasaoOficial.png',
              package: 'innerlibs',
              fit: BoxFit.contain,
            ),
          ],
          _getPlateChars(letters, realHeight * _lettersHeightRelation * category.lettersHeightRelation),
          SizedBox(
            width: 4 * (realWidth / 500),
          ),
          FittedBox(
            child: Container(
              width: realHeight * _dotHeightRelation,
              height: realHeight * _dotHeightRelation,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 2 * (realWidth / 1000),
                    offset: Offset(2 * (realWidth / 1000), 2 * (realWidth / 1000)),
                  ),
                ],
                borderRadius: BorderRadius.circular(5 * (realWidth / 1000)),
                color: gettextColor(),
              ),
            ),
          ),
          SizedBox(
            width: 4 * (realWidth / 500),
          ),
          _getPlateChars(numbers, realHeight * _lettersHeightRelation * category.lettersHeightRelation),
        ],
      ),
    );
  }

  /// Draws the header which contains the country name and flags.
  List<Widget> _countryTopBar() {
    return [
      SizedBox(
        height: 10 * (realWidth / 1000),
      ),
      Container(
          width: realWidth * _localityContainerWidthRelation,
          height: realHeight * _localityContainerHeightRelation,
          decoration: BoxDecoration(border: Border.all()),
          child: Text(
            locality?.toUpperCase() ?? "",
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 1.2,
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 2 * (realWidth / 1000),
                  offset: Offset(2 * (realWidth / 1000), 2 * (realWidth / 1000)),
                ),
              ],
              fontSize: realHeight * _localityContainerLettersRelation,
              fontFamily: _fontFamily,
              package: 'innerlibs',
              color: gettextColor(),
            ),
          )),
      SizedBox(
        height: realHeight * _lettersBorderTop,
      )
    ];
  }

  /// Draws the outer borders.
  Widget _externalWrapper({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5 * (realWidth / 300),
            blurRadius: 7 * (realWidth / 300),
            offset: Offset(0, 3 * (realWidth / 300)),
          ),
        ],
        borderRadius: BorderRadius.circular(15 * (realWidth / 500)),
        color: getBorderColor(),
      ),
      width: realWidth,
      height: realHeight,
      padding: EdgeInsets.fromLTRB(
        realWidth * _leftBorderRelation,
        realHeight * _verticalBorderRelation,
        realWidth * _rightBorderRelation,
        realHeight * _verticalBorderRelation,
      ),
      child: _internalWrapper(child: _charactersContent()),
    );
  }

  /// Styles the main license plate characters
  Text _getPlateChars(String chars, [double fontSize = 40]) {
    if (MercosulPlate.isValidPlate(chars)) {
      chars = LicensePlate.convertToThreeLettersPlate(chars);
    }
    return Text(
      chars.toUpperCase(),
      style: TextStyle(
        height: 1.03,
        fontSize: fontSize * 1.1,
        letterSpacing: 4 * (fontSize / 98),
        fontFamily: _fontFamily,
        package: 'innerlibs',
        color: gettextColor(),
        shadows: [
          Shadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 2 * (fontSize / 98),
            offset: Offset(2 * (fontSize / 98), 2 * (fontSize / 98)),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }

  /// Draws the inner content wrapper and places the two letter acronym
  /// in the bottom left corner.
  Widget _internalWrapper({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: getBackgroundColor(),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [if (locality != null) ..._countryTopBar(), child],
      ),
    );
  }

  /// Validate if [String] is a valid [ThreeLettersPlate]
  static bool isValidPlate(String plate) => RegExp(r'^[A-Z]{3}[-]?\d{4}$').hasMatch(plate);
}

enum ThreeLettersPlateCategory implements PlateCategory {
  particular(0, Colors.grey, Colors.grey, Colors.black, 'Particular'),
  comercial(1, Color(0xFFD32F2F), Color(0xFFB71C1C), Colors.white, 'Comercial'),
  especial(2, Color(0xFF388E3C), Color(0xFF1B5E20), Colors.white, 'Especial'),
  oficial(3, Color(0xFFFFFFFF), Color(0xFFececec), Colors.black, 'Oficial'),
  diplomatico(4, Color(0xFF1976D2), Color(0xFF0D47A1), Colors.white, 'Diplomático'),
  colecionador(5, Color(0xFF353535), Color(0xFF242424), Colors.white, 'Colecionador'),
  aprendizagem(6, Color(0xFFFFFFFF), Color(0xFFececec), Color(0xFFD32F2F), 'Aprendizagem'),
  representacao(7, Color(0xFF353535), Color(0xFF242424), Color(0xffdaa520), 'Representação');

  @override
  final int value;
  @override
  final Color backgroundColor;
  @override
  final Color borderColor;
  @override
  final Color textColor;
  @override
  final String name;

  const ThreeLettersPlateCategory(this.value, this.backgroundColor, this.borderColor, this.textColor, this.name);

  factory ThreeLettersPlateCategory.fromInt(int value) {
    switch (value) {
      case 0:
        return ThreeLettersPlateCategory.particular;
      case 1:
        return ThreeLettersPlateCategory.comercial;
      case 2:
        return ThreeLettersPlateCategory.especial;
      case 3:
        return ThreeLettersPlateCategory.oficial;
      case 4:
        return ThreeLettersPlateCategory.diplomatico;
      case 5:
        return ThreeLettersPlateCategory.colecionador;
      case 6:
        return ThreeLettersPlateCategory.aprendizagem;
      case 7:
        return ThreeLettersPlateCategory.representacao;
      default:
        throw Exception('Invalid value');
    }
  }

  factory ThreeLettersPlateCategory.fromMercosul(MercosulPlateCategory category) => category.convertToThreeLetters;

  factory ThreeLettersPlateCategory.fromString(String value) {
    if (value.isNumber) {
      return ThreeLettersPlateCategory.fromInt(value.toInt!);
    }
    switch (generateKeyword(value)) {
      case 'particular':
        return ThreeLettersPlateCategory.particular;

      case 'comercial':
        return ThreeLettersPlateCategory.comercial;

      case 'especial':
        return ThreeLettersPlateCategory.especial;

      case 'oficial':
        return ThreeLettersPlateCategory.oficial;

      case 'diplomatico':
        return ThreeLettersPlateCategory.diplomatico;

      case 'colecionador':
        return ThreeLettersPlateCategory.colecionador;

      case 'aprendizagem':
        return ThreeLettersPlateCategory.aprendizagem;

      case 'representacao':
        return ThreeLettersPlateCategory.representacao;
      default:
        throw Exception('Invalid value');
    }
  }

  factory ThreeLettersPlateCategory.fromValue(dynamic value) {
    if (value is int) {
      return ThreeLettersPlateCategory.fromInt(value);
    } else if (value is String) {
      return ThreeLettersPlateCategory.fromString(value);
    } else if (value is ThreeLettersPlateCategory) {
      return value;
    } else if (value is MercosulPlateCategory) {
      return ThreeLettersPlateCategory.fromMercosul(value);
    } else {
      throw Exception('Invalid value: $value');
    }
  }

  /// Return the equivalent [MercosulPlateCategory] of this [ThreeLettersPlateCategory]
  MercosulPlateCategory get convertToMercosul {
    switch (this) {
      case ThreeLettersPlateCategory.aprendizagem:
      case ThreeLettersPlateCategory.comercial:
        return MercosulPlateCategory.comercial;
      case ThreeLettersPlateCategory.especial:
        return MercosulPlateCategory.especial;
      case ThreeLettersPlateCategory.oficial:
        return MercosulPlateCategory.oficial;
      case ThreeLettersPlateCategory.diplomatico:
        return MercosulPlateCategory.diplomatico;
      case ThreeLettersPlateCategory.colecionador:
        return MercosulPlateCategory.colecionador;
      case ThreeLettersPlateCategory.representacao:
        return MercosulPlateCategory.diplomatico;
      case ThreeLettersPlateCategory.particular:
      default:
        return MercosulPlateCategory.particular;
    }
  }

  double get lettersHeightRelation {
    if (this == ThreeLettersPlateCategory.representacao) {
      return 0.8;
    }

    return 1.0;
  }

  @override
  String toString() {
    switch (this) {
      case ThreeLettersPlateCategory.particular:
        return 'Particular';
      case ThreeLettersPlateCategory.comercial:
        return 'Comercial';
      case ThreeLettersPlateCategory.especial:
        return 'Especial';
      case ThreeLettersPlateCategory.oficial:
        return 'Oficial';
      case ThreeLettersPlateCategory.diplomatico:
        return 'Diplomático';
      case ThreeLettersPlateCategory.colecionador:
        return 'Colecionador';
      case ThreeLettersPlateCategory.aprendizagem:
        return 'Aprendizagem';
      case ThreeLettersPlateCategory.representacao:
        return 'Representação';
    }
  }
}

/// A widget that prints a license plate in
///  the "two letters pattern" on the screen.
class TwoLettersPlate extends StatelessWidget implements LicensePlate {
  /// Relation between width and height
  static const double _heightRelation = 215 / 497;

  /// Relation between the width of the left border and the entire plate width.
  static const double _leftBorderRelation = 12 / 497;

  /// Relation between the width of the right border and the entire plate width.
  static const double _rightBorderRelation = 11 / 497;

  /// Relation between the height of top and bottom borders
  /// and the entire plate height.
  static const double _verticalBorderRelation = 11 / 215;

  /// Relation between the width of the locality header container and the entire
  /// plate width.
  static const double _localityContainerWidthRelation = 470 / 497;

  /// Relation between the height of the locality header container and the entire
  /// plate height.
  static const double _localityContainerHeightRelation = 42 / 215;

  /// Relation between the height of the locality header text font and the entire
  /// plate height.
  static const double _localityContainerLettersRelation = 36 / 215;

  /// The relation between the height of the top border of the main letters and
  /// the entire plate height.
  static const double _lettersBorderTop = 0 / 215;

  /// Relation between the height of the letters of the license plate and the entire
  /// license plate height.
  static const double _lettersHeightRelation = 144 / 215;

  // Default plate width if neither width or height values were provided for the
  // class constructor
  static const double _defaultWidth = 300;

  /// The default font family
  static const String _fontFamily = 'Xanh';

  /// The letters and numbers drawn in the licence plate
  @override
  final String plate;

  /// The city name and state acronym printed in locality header
  @override
  final String locality;

  /// The width that the whole widget will take. If null, the width value
  /// will be infered from the height value. If height is null, then the
  /// _defaultWidth value will be considered.
  @override
  final double? width;

  /// The height that the whole widget will take. If left null, then the original
  /// proportion factor will be used to calculate this value from the width.
  @override
  final double? height;

  /// Whether to show the locality header
  final bool showLocality;

  /// The plate's category which determines the default color set
  @override
  final TwoLettersPlateCategory category;

  @override
  final Color? backgroundColor;

  @override
  final Color? borderColor;

  @override
  final Color? textColor;

  /// Class constructor. To obtain the original aspect ratio  of a real
  /// license plate, only provide a value for width
  /// OR height, so it will keep the original proportion automatically.
  /// If a value is provided for these two properties, then the original
  /// aspect ratio will not be take in account.
  /// If neither are provided, the value of _defaultWidth will be used.
  const TwoLettersPlate(
    this.plate, {
    super.key,
    this.width,
    this.height,
    this.showLocality = true,
    this.locality = 'BRASIL',
    this.category = TwoLettersPlateCategory.particular,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
  });

  /// Evaluates the real height that will be considered
  /// while drawing the widget.
  /// If a height value was explicitly passed to object's
  /// constructor, then this value will be used.
  /// Otherwise, it infers a value for height from the width property,
  /// consering the original proportional factor.
  double get realHeight {
    if (height != null) {
      return height!;
    } else {
      return realWidth * _heightRelation;
    }
  }

  /// Evaluates the width value that will be used to draw the widget.
  /// If a value is passed to the constructor, then this value will be used.
  /// Otherwise, it checks if a value has been passed to height and calculates
  /// the width using the original proportion factor. If both width and height are
  /// nulls, then the value setted for _defaultWidth will be used.
  double get realWidth {
    if (width != null) {
      return width!;
    } else {
      if (height == null) {
        return _defaultWidth;
      } else {
        return height! * 1 / _heightRelation;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: context.theme.copyWith(
          typography: Typography.material2014(),
        ),
        child: _externalWrapper(child: _internalWrapper(child: _charactersContent())));
  }

  @override
  Color getBackgroundColor() => backgroundColor ?? borderColor ?? category.backgroundColor;

  @override
  Color getBorderColor() => borderColor ?? backgroundColor ?? category.borderColor;

  @override
  Color gettextColor() => textColor ?? (backgroundColor ?? borderColor)?.getContrastColor(100) ?? category.textColor;

  /// Draws the area in which will be printed the main license plate characters.
  Widget _charactersContent() {
    return SizedBox(
      height: realHeight * _lettersHeightRelation,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _getPlateChars(plate, realHeight * _lettersHeightRelation),
        ],
      ),
    );
  }

  /// Draws the header which contains the country name and flags.
  List<Widget> _countryTopBar() {
    return [
      SizedBox(
        height: 10 * (realWidth / 1000),
      ),
      SizedBox(
          width: realWidth * _localityContainerWidthRelation,
          height: realHeight * _localityContainerHeightRelation,
          child: Text(
            locality.toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
              shadows: [Shadow(color: Colors.black.withOpacity(0.5), blurRadius: 1, offset: Offset(1 * (realWidth / 1000), 1 * (realWidth / 1000)))],
              fontSize: realHeight * _localityContainerLettersRelation,
              fontFamily: _fontFamily,
              package: 'innerlibs',
              color: gettextColor(),
            ),
          )),
      SizedBox(
        height: realHeight * _lettersBorderTop,
      )
    ];
  }

  /// Draws the outer borders.
  Widget _externalWrapper({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5 * (realWidth / 300),
            blurRadius: 7 * (realWidth / 300),
            offset: Offset(0, 3 * (realWidth / 300)),
          ),
        ],
        borderRadius: BorderRadius.circular(15 * (realWidth / 500)),
        color: getBorderColor(),
      ),
      width: realWidth,
      height: realHeight,
      padding: EdgeInsets.fromLTRB(
        realWidth * _leftBorderRelation,
        realHeight * _verticalBorderRelation,
        realWidth * _rightBorderRelation,
        realHeight * _verticalBorderRelation,
      ),
      child: _internalWrapper(child: _charactersContent()),
    );
  }

  /// Styles the main license plate characters
  Text _getPlateChars(String chars, [double fontSize = 40]) {
    return Text(
      chars.toUpperCase(),
      style: TextStyle(
        height: 1,
        fontSize: fontSize * 1.05,
        fontFamily: _fontFamily,
        package: 'innerlibs',
        color: gettextColor(),
        shadows: [
          Shadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 1 * (fontSize / 98),
            offset: Offset(1 * (fontSize / 98), 1 * (fontSize / 98)),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }

  /// Draws the inner content wrapper and places the two letter acronym
  /// in the bottom left corner.
  Widget _internalWrapper({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: getBackgroundColor(),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [if (showLocality) ..._countryTopBar(), child],
      ),
    );
  }

  static bool isValidPlate(String plate) {
    return RegExp(r'^[A-Z]{2}[-]?\d{4}$').hasMatch(plate);
  }
}

enum TwoLettersPlateCategory implements PlateCategory {
  particular(0, Colors.amber, Color(0xFFFFB300), Colors.black, 'Particular'),
  comercial(1, Color(0xFFC62828), Color(0xFFB71C1C), Colors.white, 'Comercial');

  @override
  final int value;
  @override
  final Color backgroundColor;
  @override
  final Color borderColor;
  @override
  final Color textColor;
  @override
  final String name;

  const TwoLettersPlateCategory(this.value, this.backgroundColor, this.borderColor, this.textColor, this.name);

  factory TwoLettersPlateCategory.fromInt(int value) {
    switch (value) {
      case 0:
        return TwoLettersPlateCategory.particular;
      case 1:
        return TwoLettersPlateCategory.comercial;
      default:
        throw Exception('Invalid value');
    }
  }

  factory TwoLettersPlateCategory.fromString(String value) {
    if (value.isNumber) {
      return TwoLettersPlateCategory.fromInt(value.toInt!);
    }
    switch (generateKeyword(value)) {
      case 'particular':
        return TwoLettersPlateCategory.particular;

      case 'comercial':
        return TwoLettersPlateCategory.comercial;
      default:
        throw Exception('Invalid value');
    }
  }

  factory TwoLettersPlateCategory.fromValue(dynamic value) {
    if (value is int) {
      return TwoLettersPlateCategory.fromInt(value);
    } else if (value is String) {
      return TwoLettersPlateCategory.fromString(value);
    } else if (value is TwoLettersPlateCategory) {
      return value;
    } else {
      throw Exception('Invalid value: $value');
    }
  }

  @override
  String toString() {
    switch (this) {
      case TwoLettersPlateCategory.particular:
        return 'Particular';
      case TwoLettersPlateCategory.comercial:
        return 'Comercial';
    }
  }
}
