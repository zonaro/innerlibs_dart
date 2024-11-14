import 'dart:ui';

import 'package:innerlibs/innerlibs.dart';

/// A Enum containing all the named colors.

typedef NamedColors = NamedColor;

/// A Enum containing all the named colors. Also implements the [Color] interface, so it can be used as a [Color].
enum NamedColor implements Color {
  /// A color named "Absolute Zero" with hexadecimal value <a href='https://www.colorhexa.com/0048BA' />#0048BA</a> <br><img src="https://www.colorhexa.com/0048BA.png" width="50" height='50' />
  absoluteZero("#0048BA", "Absolute Zero"),

  /// A color named "Acid Green" with hexadecimal value <a href='https://www.colorhexa.com/B0BF1A' />#B0BF1A</a> <br><img src="https://www.colorhexa.com/B0BF1A.png" width="50" height='50' />
  acidGreen("#B0BF1A", "Acid green"),

  /// A color named "Aero" with hexadecimal value <a href='https://www.colorhexa.com/7CB9E8' />#7CB9E8</a> <br><img src="https://www.colorhexa.com/7CB9E8.png" width="50" height='50' />
  aero("#7CB9E8", "Aero"),

  /// A color named "Aero Blue" with hexadecimal value <a href='https://www.colorhexa.com/C0E8D5' />#C0E8D5</a> <br><img src="https://www.colorhexa.com/C0E8D5.png" width="50" height='50' />
  aeroBlue("#C0E8D5", "Aero blue"),

  /// A color named "African Violet" with hexadecimal value <a href='https://www.colorhexa.com/B284BE' />#B284BE</a> <br><img src="https://www.colorhexa.com/B284BE.png" width="50" height='50' />
  africanViolet("#B284BE", "African violet"),

  /// A color named "Air Superiority Blue" with hexadecimal value <a href='https://www.colorhexa.com/72A0C1' />#72A0C1</a> <br><img src="https://www.colorhexa.com/72A0C1.png" width="50" height='50' />
  airSuperiorityBlue("#72A0C1", "Air superiority blue"),

  /// A color named "Alabaster" with hexadecimal value <a href='https://www.colorhexa.com/EDEAE0' />#EDEAE0</a> <br><img src="https://www.colorhexa.com/EDEAE0.png" width="50" height='50' />
  alabaster("#EDEAE0", "Alabaster"),

  /// A color named "Alice Blue" with hexadecimal value <a href='https://www.colorhexa.com/F0F8FF' />#F0F8FF</a> <br><img src="https://www.colorhexa.com/F0F8FF.png" width="50" height='50' />
  aliceBlue('#F0F8FF', 'Alice Blue'),

  /// A color named "Alloy Orange" with hexadecimal value <a href='https://www.colorhexa.com/C46210' />#C46210</a> <br><img src="https://www.colorhexa.com/C46210.png" width="50" height='50' />
  alloyOrange("#C46210", "Alloy orange"),

  /// A color named "Almond" with hexadecimal value <a href='https://www.colorhexa.com/EFDECD' />#EFDECD</a> <br><img src="https://www.colorhexa.com/EFDECD.png" width="50" height='50' />
  almond("#EFDECD", "Almond"),

  /// A color named "Amaranth" with hexadecimal value <a href='https://www.colorhexa.com/E52B50' />#E52B50</a> <br><img src="https://www.colorhexa.com/E52B50.png" width="50" height='50' />
  amaranth("#E52B50", "Amaranth"),

  /// A color named "Amaranth (M&P)" with hexadecimal value <a href='https://www.colorhexa.com/9F2B68' />#9F2B68</a> <br><img src="https://www.colorhexa.com/9F2B68.png" width="50" height='50' />
  amaranthMP("#9F2B68", "Amaranth (M&P)"),

  /// A color named "Amaranth Pink" with hexadecimal value <a href='https://www.colorhexa.com/F19CBB' />#F19CBB</a> <br><img src="https://www.colorhexa.com/F19CBB.png" width="50" height='50' />
  amaranthPink("#F19CBB", "Amaranth pink"),

  /// A color named "Amaranth Purple" with hexadecimal value <a href='https://www.colorhexa.com/AB274F' />#AB274F</a> <br><img src="https://www.colorhexa.com/AB274F.png" width="50" height='50' />
  amaranthPurple("#AB274F", "Amaranth purple"),

  /// A color named "Amaranth Red" with hexadecimal value <a href='https://www.colorhexa.com/D3212D' />#D3212D</a> <br><img src="https://www.colorhexa.com/D3212D.png" width="50" height='50' />
  amaranthRed("#D3212D", "Amaranth red"),

  /// A color named "Amazon" with hexadecimal value <a href='https://www.colorhexa.com/3B7A57' />#3B7A57</a> <br><img src="https://www.colorhexa.com/3B7A57.png" width="50" height='50' />
  amazon("#3B7A57", "Amazon"),

  /// A color named "Amber" with hexadecimal value <a href='https://www.colorhexa.com/FFBF00' />#FFBF00</a> <br><img src="https://www.colorhexa.com/FFBF00.png" width="50" height='50' />
  amber("#FFBF00", "Amber"),

  /// A color named "Amber (SAE/ECE)" with hexadecimal value <a href='https://www.colorhexa.com/FF7E00' />#FF7E00</a> <br><img src="https://www.colorhexa.com/FF7E00.png" width="50" height='50' />
  amberSAEECE("#FF7E00", "Amber (SAE/ECE)"),

  /// A color named "Amethyst" with hexadecimal value <a href='https://www.colorhexa.com/9966CC' />#9966CC</a> <br><img src="https://www.colorhexa.com/9966CC.png" width="50" height='50' />
  amethyst("#9966CC", "Amethyst"),

  /// A color named "Android Green" with hexadecimal value <a href='https://www.colorhexa.com/3DDC84' />#3DDC84</a> <br><img src="https://www.colorhexa.com/3DDC84.png" width="50" height='50' />
  androidGreen("#3DDC84", "Android green"),

  /// A color named "Antique Brass" with hexadecimal value <a href='https://www.colorhexa.com/CD9575' />#CD9575</a> <br><img src="https://www.colorhexa.com/CD9575.png" width="50" height='50' />
  antiqueBrass("#CD9575", "Antique brass"),

  /// A color named "Antique Bronze" with hexadecimal value <a href='https://www.colorhexa.com/665D1E' />#665D1E</a> <br><img src="https://www.colorhexa.com/665D1E.png" width="50" height='50' />
  antiqueBronze("#665D1E", "Antique bronze"),

  /// A color named "Antique Fuchsia" with hexadecimal value <a href='https://www.colorhexa.com/915C83' />#915C83</a> <br><img src="https://www.colorhexa.com/915C83.png" width="50" height='50' />
  antiqueFuchsia("#915C83", "Antique fuchsia"),

  /// A color named "Antique Ruby" with hexadecimal value <a href='https://www.colorhexa.com/841B2D' />#841B2D</a> <br><img src="https://www.colorhexa.com/841B2D.png" width="50" height='50' />
  antiqueRuby("#841B2D", "Antique ruby"),

  /// A color named "Antique White" with hexadecimal value <a href='https://www.colorhexa.com/FAEBD7' />#FAEBD7</a> <br><img src="https://www.colorhexa.com/FAEBD7.png" width="50" height='50' />
  antiqueWhite('#FAEBD7', 'Antique White'),

  /// A color named "Ao" with hexadecimal value <a href='https://www.colorhexa.com/008000' />#008000</a> <br><img src="https://www.colorhexa.com/008000.png" width="50" height='50' />
  ao("#008000", "Ao"),

  /// A color named "Apple Green" with hexadecimal value <a href='https://www.colorhexa.com/8DB600' />#8DB600</a> <br><img src="https://www.colorhexa.com/8DB600.png" width="50" height='50' />
  appleGreen("#8DB600", "Apple green"),

  /// A color named "Apricot" with hexadecimal value <a href='https://www.colorhexa.com/FBCEB1' />#FBCEB1</a> <br><img src="https://www.colorhexa.com/FBCEB1.png" width="50" height='50' />
  apricot("#FBCEB1", "Apricot"),

  /// A color named "Aqua" with hexadecimal value <a href='https://www.colorhexa.com/00FFFF' />#00FFFF</a> <br><img src="https://www.colorhexa.com/00FFFF.png" width="50" height='50' />
  aqua('#00FFFF', 'Aqua'),

  /// A color named "Aquamarine" with hexadecimal value <a href='https://www.colorhexa.com/7FFFD4' />#7FFFD4</a> <br><img src="https://www.colorhexa.com/7FFFD4.png" width="50" height='50' />
  aquamarine('#7FFFD4', 'Aquamarine'),

  /// A color named "Arctic Lime" with hexadecimal value <a href='https://www.colorhexa.com/D0FF14' />#D0FF14</a> <br><img src="https://www.colorhexa.com/D0FF14.png" width="50" height='50' />
  arcticLime("#D0FF14", "Arctic lime"),

  /// A color named "Army Green" with hexadecimal value <a href='https://www.colorhexa.com/4B5320' />#4B5320</a> <br><img src="https://www.colorhexa.com/4B5320.png" width="50" height='50' />
  armyGreen("#4B5320", "Army green"),

  /// A color named "Artichoke" with hexadecimal value <a href='https://www.colorhexa.com/8F9779' />#8F9779</a> <br><img src="https://www.colorhexa.com/8F9779.png" width="50" height='50' />
  artichoke("#8F9779", "Artichoke"),

  /// A color named "Arylide Yellow" with hexadecimal value <a href='https://www.colorhexa.com/E9D66B' />#E9D66B</a> <br><img src="https://www.colorhexa.com/E9D66B.png" width="50" height='50' />
  arylideYellow("#E9D66B", "Arylide yellow"),

  /// A color named "Ash Gray" with hexadecimal value <a href='https://www.colorhexa.com/B2BEB5' />#B2BEB5</a> <br><img src="https://www.colorhexa.com/B2BEB5.png" width="50" height='50' />
  ashGray("#B2BEB5", "Ash gray"),

  /// A color named "Asparagus" with hexadecimal value <a href='https://www.colorhexa.com/87A96B' />#87A96B</a> <br><img src="https://www.colorhexa.com/87A96B.png" width="50" height='50' />
  asparagus("#87A96B", "Asparagus"),

  /// A color named "Atomic Tangerine" with hexadecimal value <a href='https://www.colorhexa.com/FF9966' />#FF9966</a> <br><img src="https://www.colorhexa.com/FF9966.png" width="50" height='50' />
  atomicTangerine("#FF9966", "Atomic tangerine"),

  /// A color named "Auburn" with hexadecimal value <a href='https://www.colorhexa.com/A52A2A' />#A52A2A</a> <br><img src="https://www.colorhexa.com/A52A2A.png" width="50" height='50' />
  auburn("#A52A2A", "Auburn"),

  /// A color named "Aureolin" with hexadecimal value <a href='https://www.colorhexa.com/FDEE00' />#FDEE00</a> <br><img src="https://www.colorhexa.com/FDEE00.png" width="50" height='50' />
  aureolin("#FDEE00", "Aureolin"),

  /// A color named "Avocado" with hexadecimal value <a href='https://www.colorhexa.com/568203' />#568203</a> <br><img src="https://www.colorhexa.com/568203.png" width="50" height='50' />
  avocado("#568203", "Avocado"),

  /// A color named "Azure" with hexadecimal value <a href='https://www.colorhexa.com/F0FFFF' />#F0FFFF</a> <br><img src="https://www.colorhexa.com/F0FFFF.png" width="50" height='50' />
  azure('#F0FFFF', 'Azure'),

  /// A color named "Azure (X11/web color)" with hexadecimal value <a href='https://www.colorhexa.com/F0FFFF' />#F0FFFF</a> <br><img src="https://www.colorhexa.com/F0FFFF.png" width="50" height='50' />
  azureX11WebColor("#F0FFFF", "Azure (X11/web color)"),

  /// A color named "Baby Blue" with hexadecimal value <a href='https://www.colorhexa.com/89CFF0' />#89CFF0</a> <br><img src="https://www.colorhexa.com/89CFF0.png" width="50" height='50' />
  babyBlue("#89CFF0", "Baby blue"),

  /// A color named "Baby Blue Eyes" with hexadecimal value <a href='https://www.colorhexa.com/A1CAF1' />#A1CAF1</a> <br><img src="https://www.colorhexa.com/A1CAF1.png" width="50" height='50' />
  babyBlueEyes("#A1CAF1", "Baby blue eyes"),

  /// A color named "Baby Pink" with hexadecimal value <a href='https://www.colorhexa.com/F4C2C2' />#F4C2C2</a> <br><img src="https://www.colorhexa.com/F4C2C2.png" width="50" height='50' />
  babyPink("#F4C2C2", "Baby pink"),

  /// A color named "Baby Powder" with hexadecimal value <a href='https://www.colorhexa.com/FEFEFA' />#FEFEFA</a> <br><img src="https://www.colorhexa.com/FEFEFA.png" width="50" height='50' />
  babyPowder("#FEFEFA", "Baby powder"),

  /// A color named "Baker Miller Pink" with hexadecimal value <a href='https://www.colorhexa.com/FF91AF' />#FF91AF</a> <br><img src="https://www.colorhexa.com/FF91AF.png" width="50" height='50' />
  bakerMillerPink("#FF91AF", "Baker Miller pink"),

  /// A color named "Banana Mania" with hexadecimal value <a href='https://www.colorhexa.com/FAE7B5' />#FAE7B5</a> <br><img src="https://www.colorhexa.com/FAE7B5.png" width="50" height='50' />
  bananaMania("#FAE7B5", "Banana Mania"),

  /// A color named "Barbie Pink" with hexadecimal value <a href='https://www.colorhexa.com/DA1884' />#DA1884</a> <br><img src="https://www.colorhexa.com/DA1884.png" width="50" height='50' />
  barbiePink("#DA1884", "Barbie Pink"),

  /// A color named "Barn Red" with hexadecimal value <a href='https://www.colorhexa.com/7C0A02' />#7C0A02</a> <br><img src="https://www.colorhexa.com/7C0A02.png" width="50" height='50' />
  barnRed("#7C0A02", "Barn red"),

  /// A color named "Battleship Grey" with hexadecimal value <a href='https://www.colorhexa.com/848482' />#848482</a> <br><img src="https://www.colorhexa.com/848482.png" width="50" height='50' />
  battleshipGrey("#848482", "Battleship grey"),

  /// A color named "B'dazzled Blue" with hexadecimal value <a href='https://www.colorhexa.com/2E5894' />#2E5894</a> <br><img src="https://www.colorhexa.com/2E5894.png" width="50" height='50' />
  bdazzledBlue("#2E5894", "B'dazzled blue"),

  /// A color named "Beau Blue" with hexadecimal value <a href='https://www.colorhexa.com/BCD4E6' />#BCD4E6</a> <br><img src="https://www.colorhexa.com/BCD4E6.png" width="50" height='50' />
  beauBlue("#BCD4E6", "Beau blue"),

  /// A color named "Beaver" with hexadecimal value <a href='https://www.colorhexa.com/9F8170' />#9F8170</a> <br><img src="https://www.colorhexa.com/9F8170.png" width="50" height='50' />
  beaver("#9F8170", "Beaver"),

  /// A color named "Beige" with hexadecimal value <a href='https://www.colorhexa.com/F5F5DC' />#F5F5DC</a> <br><img src="https://www.colorhexa.com/F5F5DC.png" width="50" height='50' />
  beige('#F5F5DC', 'Beige'),

  /// A color named "Big Dip O Ruby" with hexadecimal value <a href='https://www.colorhexa.com/9C2542' />#9C2542</a> <br><img src="https://www.colorhexa.com/9C2542.png" width="50" height='50' />
  bigDipORuby("#9C2542", "Big dip o ruby"),

  /// A color named "Bisque" with hexadecimal value <a href='https://www.colorhexa.com/FFE4C4' />#FFE4C4</a> <br><img src="https://www.colorhexa.com/FFE4C4.png" width="50" height='50' />
  bisque('#FFE4C4', 'Bisque'),

  /// A color named "Bistre" with hexadecimal value <a href='https://www.colorhexa.com/3D2B1F' />#3D2B1F</a> <br><img src="https://www.colorhexa.com/3D2B1F.png" width="50" height='50' />
  bistre("#3D2B1F", "Bistre"),

  /// A color named "Bistre Brown" with hexadecimal value <a href='https://www.colorhexa.com/967117' />#967117</a> <br><img src="https://www.colorhexa.com/967117.png" width="50" height='50' />
  bistreBrown("#967117", "Bistre brown"),

  /// A color named "Bitter Lemon" with hexadecimal value <a href='https://www.colorhexa.com/CAE00D' />#CAE00D</a> <br><img src="https://www.colorhexa.com/CAE00D.png" width="50" height='50' />
  bitterLemon("#CAE00D", "Bitter lemon"),

  /// A color named "Bitter Lime" with hexadecimal value <a href='https://www.colorhexa.com/BFFF00' />#BFFF00</a> <br><img src="https://www.colorhexa.com/BFFF00.png" width="50" height='50' />
  bitterLime("#BFFF00", "Bitter lime"),

  /// A color named "Bittersweet" with hexadecimal value <a href='https://www.colorhexa.com/FE6F5E' />#FE6F5E</a> <br><img src="https://www.colorhexa.com/FE6F5E.png" width="50" height='50' />
  bittersweet("#FE6F5E", "Bittersweet"),

  /// A color named "Bittersweet Shimmer" with hexadecimal value <a href='https://www.colorhexa.com/BF4F51' />#BF4F51</a> <br><img src="https://www.colorhexa.com/BF4F51.png" width="50" height='50' />
  bittersweetShimmer("#BF4F51", "Bittersweet shimmer"),

  /// A color named "Black" with hexadecimal value <a href='https://www.colorhexa.com/000000' />#000000</a> <br><img src="https://www.colorhexa.com/000000.png" width="50" height='50' />
  black('#000000', 'Black'),

  /// A color named "Black Bean" with hexadecimal value <a href='https://www.colorhexa.com/3D0C02' />#3D0C02</a> <br><img src="https://www.colorhexa.com/3D0C02.png" width="50" height='50' />
  blackBean("#3D0C02", "Black bean"),

  /// A color named "Black Chocolate" with hexadecimal value <a href='https://www.colorhexa.com/1B1811' />#1B1811</a> <br><img src="https://www.colorhexa.com/1B1811.png" width="50" height='50' />
  blackChocolate("#1B1811", "Black chocolate"),

  /// A color named "Black Coffee" with hexadecimal value <a href='https://www.colorhexa.com/3B2F2F' />#3B2F2F</a> <br><img src="https://www.colorhexa.com/3B2F2F.png" width="50" height='50' />
  blackCoffee("#3B2F2F", "Black coffee"),

  /// A color named "Black Coral" with hexadecimal value <a href='https://www.colorhexa.com/54626F' />#54626F</a> <br><img src="https://www.colorhexa.com/54626F.png" width="50" height='50' />
  blackCoral("#54626F", "Black coral"),

  /// A color named "Black Olive" with hexadecimal value <a href='https://www.colorhexa.com/3B3C36' />#3B3C36</a> <br><img src="https://www.colorhexa.com/3B3C36.png" width="50" height='50' />
  blackOlive("#3B3C36", "Black olive"),

  /// A color named "Black Shadows" with hexadecimal value <a href='https://www.colorhexa.com/BFAFB2' />#BFAFB2</a> <br><img src="https://www.colorhexa.com/BFAFB2.png" width="50" height='50' />
  blackShadows("#BFAFB2", "Black Shadows"),

  /// A color named "Blanched Almond" with hexadecimal value <a href='https://www.colorhexa.com/FFEBCD' />#FFEBCD</a> <br><img src="https://www.colorhexa.com/FFEBCD.png" width="50" height='50' />
  blanchedAlmond('#FFEBCD', 'Blanched Almond'),

  /// A color named "Blast Off Bronze" with hexadecimal value <a href='https://www.colorhexa.com/A57164' />#A57164</a> <br><img src="https://www.colorhexa.com/A57164.png" width="50" height='50' />
  blastOffBronze("#A57164", "Blast off bronze"),

  /// A color named "Bleu De France" with hexadecimal value <a href='https://www.colorhexa.com/318CE7' />#318CE7</a> <br><img src="https://www.colorhexa.com/318CE7.png" width="50" height='50' />
  bleuDeFrance("#318CE7", "Bleu de France"),

  /// A color named "Blizzard Blue" with hexadecimal value <a href='https://www.colorhexa.com/ACE5EE' />#ACE5EE</a> <br><img src="https://www.colorhexa.com/ACE5EE.png" width="50" height='50' />
  blizzardBlue("#ACE5EE", "Blizzard blue"),

  /// A color named "Blond" with hexadecimal value <a href='https://www.colorhexa.com/FAF0BE' />#FAF0BE</a> <br><img src="https://www.colorhexa.com/FAF0BE.png" width="50" height='50' />
  blond("#FAF0BE", "Blond"),

  /// A color named "Blood Red" with hexadecimal value <a href='https://www.colorhexa.com/660000' />#660000</a> <br><img src="https://www.colorhexa.com/660000.png" width="50" height='50' />
  bloodRed("#660000", "Blood red"),

  /// A color named "Blue" with hexadecimal value <a href='https://www.colorhexa.com/0000FF' />#0000FF</a> <br><img src="https://www.colorhexa.com/0000FF.png" width="50" height='50' />
  blueColor('#0000FF', 'Blue'),

  /// A color named "Blue Bell" with hexadecimal value <a href='https://www.colorhexa.com/A2A2D0' />#A2A2D0</a> <br><img src="https://www.colorhexa.com/A2A2D0.png" width="50" height='50' />
  blueBell("#A2A2D0", "Blue bell"),

  /// A color named "Blue (Crayola)" with hexadecimal value <a href='https://www.colorhexa.com/1F75FE' />#1F75FE</a> <br><img src="https://www.colorhexa.com/1F75FE.png" width="50" height='50' />
  blueCrayola("#1F75FE", "Blue (Crayola)"),

  /// A color named "Blue Gray" with hexadecimal value <a href='https://www.colorhexa.com/6699CC' />#6699CC</a> <br><img src="https://www.colorhexa.com/6699CC.png" width="50" height='50' />
  blueGray("#6699CC", "Blue gray"),

  /// A color named "Blue Green" with hexadecimal value <a href='https://www.colorhexa.com/0D98BA' />#0D98BA</a> <br><img src="https://www.colorhexa.com/0D98BA.png" width="50" height='50' />
  blueGreen("#0D98BA", "Blue green"),

  /// A color named "Blue Green (Color Wheel)" with hexadecimal value <a href='https://www.colorhexa.com/064E40' />#064E40</a> <br><img src="https://www.colorhexa.com/064E40.png" width="50" height='50' />
  blueGreenColorWheel("#064E40", "Blue green (Color Wheel)"),

  /// A color named "Blue Jeans" with hexadecimal value <a href='https://www.colorhexa.com/5DADEC' />#5DADEC</a> <br><img src="https://www.colorhexa.com/5DADEC.png" width="50" height='50' />
  blueJeans("#5DADEC", "Blue jeans"),

  /// A color named "Blue (Munsell)" with hexadecimal value <a href='https://www.colorhexa.com/0093AF' />#0093AF</a> <br><img src="https://www.colorhexa.com/0093AF.png" width="50" height='50' />
  blueMunsell("#0093AF", "Blue (Munsell)"),

  /// A color named "Blue (NCS)" with hexadecimal value <a href='https://www.colorhexa.com/0087BD' />#0087BD</a> <br><img src="https://www.colorhexa.com/0087BD.png" width="50" height='50' />
  blueNCS("#0087BD", "Blue (NCS)"),

  /// A color named "Blue (Pantone)" with hexadecimal value <a href='https://www.colorhexa.com/0018A8' />#0018A8</a> <br><img src="https://www.colorhexa.com/0018A8.png" width="50" height='50' />
  bluePantone("#0018A8", "Blue (Pantone)"),

  /// A color named "Blue (Pigment)" with hexadecimal value <a href='https://www.colorhexa.com/333399' />#333399</a> <br><img src="https://www.colorhexa.com/333399.png" width="50" height='50' />
  bluePigment("#333399", "Blue (pigment)"),

  /// A color named "Blue (RYB)" with hexadecimal value <a href='https://www.colorhexa.com/0247FE' />#0247FE</a> <br><img src="https://www.colorhexa.com/0247FE.png" width="50" height='50' />
  blueRYB("#0247FE", "Blue (RYB)"),

  /// A color named "Blue Sapphire" with hexadecimal value <a href='https://www.colorhexa.com/126180' />#126180</a> <br><img src="https://www.colorhexa.com/126180.png" width="50" height='50' />
  blueSapphire("#126180", "Blue sapphire"),

  /// A color named "Bluetiful" with hexadecimal value <a href='https://www.colorhexa.com/3C69E7' />#3C69E7</a> <br><img src="https://www.colorhexa.com/3C69E7.png" width="50" height='50' />
  bluetiful("#3C69E7", "Bluetiful"),

  /// A color named "Blue Violet" with hexadecimal value <a href='https://www.colorhexa.com/8A2BE2' />#8A2BE2</a> <br><img src="https://www.colorhexa.com/8A2BE2.png" width="50" height='50' />
  blueViolet('#8A2BE2', 'Blue Violet'),

  /// A color named "Blue Violet (Color Wheel)" with hexadecimal value <a href='https://www.colorhexa.com/4D1A7F' />#4D1A7F</a> <br><img src="https://www.colorhexa.com/4D1A7F.png" width="50" height='50' />
  blueVioletColorWheel("#4D1A7F", "Blue violet (Color Wheel)"),

  /// A color named "Blue Violet (Crayola)" with hexadecimal value <a href='https://www.colorhexa.com/7366BD' />#7366BD</a> <br><img src="https://www.colorhexa.com/7366BD.png" width="50" height='50' />
  blueVioletCrayola("#7366BD", "Blue violet (Crayola)"),

  /// A color named "Blue Yonder" with hexadecimal value <a href='https://www.colorhexa.com/5072A7' />#5072A7</a> <br><img src="https://www.colorhexa.com/5072A7.png" width="50" height='50' />
  blueYonder("#5072A7", "Blue yonder"),

  /// A color named "Blush" with hexadecimal value <a href='https://www.colorhexa.com/DE5D83' />#DE5D83</a> <br><img src="https://www.colorhexa.com/de5d83.png" width="50" height='50' />
  blush("#DE5D83", "Blush"),

  /// A color named "Bole" with hexadecimal value <a href='https://www.colorhexa.com/79443B' />#79443B</a> <br><img src="https://www.colorhexa.com/79443b.png" width="50" height='50' />
  bole("#79443B", "Bole"),

  /// A color named "Bone" with hexadecimal value <a href='https://www.colorhexa.com/E3DAC9' />#E3DAC9</a> <br><img src="https://www.colorhexa.com/e3dac9.png" width="50" height='50' />
  bone("#E3DAC9", "Bone"),

  /// A color named "Bottle Green" with hexadecimal value <a href='https://www.colorhexa.com/006A4E' />#006A4E</a> <br><img src="https://www.colorhexa.com/006a4e.png" width="50" height='50' />
  bottleGreen("#006A4E", "Bottle green"),

  /// A color named "Brandy" with hexadecimal value <a href='https://www.colorhexa.com/87413F' />#87413F</a> <br><img src="https://www.colorhexa.com/87413f.png" width="50" height='50' />
  brandy("#87413F", "Brandy"),

  /// A color named "Brick Red" with hexadecimal value <a href='https://www.colorhexa.com/CB4154' />#CB4154</a> <br><img src="https://www.colorhexa.com/cb4154.png" width="50" height='50' />
  brickRed("#CB4154", "Brick red"),

  /// A color named "Bright Green" with hexadecimal value <a href='https://www.colorhexa.com/66FF00' />#66FF00</a> <br><img src="https://www.colorhexa.com/66ff00.png" width="50" height='50' />
  brightGreen("#66FF00", "Bright green"),

  /// A color named "Bright Lilac" with hexadecimal value <a href='https://www.colorhexa.com/D891EF' />#D891EF</a> <br><img src="https://www.colorhexa.com/d891ef.png" width="50" height='50' />
  brightLilac("#D891EF", "Bright lilac"),

  /// A color named "Bright Maroon" with hexadecimal value <a href='https://www.colorhexa.com/C32148' />#C32148</a> <br><img src="https://www.colorhexa.com/c32148.png" width="50" height='50' />
  brightMaroon("#C32148", "Bright maroon"),

  /// A color named "Bright Navy Blue" with hexadecimal value <a href='https://www.colorhexa.com/1974D2' />#1974D2</a> <br><img src="https://www.colorhexa.com/1974d2.png" width="50" height='50' />
  brightNavyBlue("#1974D2", "Bright navy blue"),

  /// A color named "Bright Yellow (Crayola)" with hexadecimal value <a href='https://www.colorhexa.com/FFAA1D' />#FFAA1D</a> <br><img src="https://www.colorhexa.com/ffaa1d.png" width="50" height='50' />
  brightYellowCrayola("#FFAA1D", "Bright yellow (Crayola)"),

  /// A color named "Brilliant Rose" with hexadecimal value <a href='https://www.colorhexa.com/FF55A3' />#FF55A3</a> <br><img src="https://www.colorhexa.com/ff55a3.png" width="50" height='50' />
  brilliantRose("#FF55A3", "Brilliant rose"),

  /// A color named "Brink Pink" with hexadecimal value <a href='https://www.colorhexa.com/FB607F' />#FB607F</a> <br><img src="https://www.colorhexa.com/fb607f.png" width="50" height='50' />
  brinkPink("#FB607F", "Brink pink"),

  /// A color named "British Racing Green" with hexadecimal value <a href='https://www.colorhexa.com/004225' />#004225</a> <br><img src="https://www.colorhexa.com/004225.png" width="50" height='50' />
  britishRacingGreen("#004225", "British racing green"),

  /// A color named "Bronze" with hexadecimal value <a href='https://www.colorhexa.com/CD7F32' />#CD7F32</a> <br><img src="https://www.colorhexa.com/cd7f32.png" width="50" height='50' />
  bronze("#CD7F32", "Bronze"),

  /// A color named "Brown" with hexadecimal value <a href='https://www.colorhexa.com/A52A2A' />#A52A2A</a> <br><img src="https://www.colorhexa.com/a52a2a.png" width="50" height='50' />
  brown('#A52A2A', 'Brown'),

  /// A color named "Brown Sugar" with hexadecimal value <a href='https://www.colorhexa.com/AF6E4D' />#AF6E4D</a> <br><img src="https://www.colorhexa.com/af6e4d.png" width="50" height='50' />
  brownSugar("#AF6E4D", "Brown sugar"),

  /// A color named "Brunswick Green" with hexadecimal value <a href='https://www.colorhexa.com/1B4D3E' />#1B4D3E</a> <br><img src="https://www.colorhexa.com/1b4d3e.png" width="50" height='50' />
  brunswickGreen("#1B4D3E", "Brunswick green"),

  /// A color named "Bud Green" with hexadecimal value <a href='https://www.colorhexa.com/7BB661' />#7BB661</a> <br><img src="https://www.colorhexa.com/7bb661.png" width="50" height='50' />
  budGreen("#7BB661", "Bud green"),

  /// A color named "Buff" with hexadecimal value <a href='https://www.colorhexa.com/FFC680' />#FFC680</a> <br><img src="https://www.colorhexa.com/ffc680.png" width="50" height='50' />
  buff("#FFC680", "Buff"),

  /// A color named "Burgundy" with hexadecimal value <a href='https://www.colorhexa.com/800020' />#800020</a> <br><img src="https://www.colorhexa.com/800020.png" width="50" height='50' />
  burgundy("#800020", "Burgundy"),

  /// A color named "Burlywood" with hexadecimal value <a href='https://www.colorhexa.com/DEB887' />#DEB887</a> <br><img src="https://www.colorhexa.com/deb887.png" width="50" height='50' />
  burlyWood('#DEB887', 'Burly Wood'),

  /// A color named "Burnished Brown" with hexadecimal value <a href='https://www.colorhexa.com/A17A74' />#A17A74</a> <br><img src="https://www.colorhexa.com/a17a74.png" width="50" height='50' />
  burnishedBrown("#A17A74", "Burnished brown"),

  /// A color named "Burnt Orange" with hexadecimal value <a href='https://www.colorhexa.com/CC5500' />#CC5500</a> <br><img src="https://www.colorhexa.com/cc5500.png" width="50" height='50' />
  burntOrange("#CC5500", "Burnt orange"),

  /// A color named "Burnt Sienna" with hexadecimal value <a href='https://www.colorhexa.com/E97451' />#E97451</a> <br><img src="https://www.colorhexa.com/e97451.png" width="50" height='50' />
  burntSienna("#E97451", "Burnt sienna"),

  /// A color named "Burnt Umber" with hexadecimal value <a href='https://www.colorhexa.com/8A3324' />#8A3324</a> <br><img src="https://www.colorhexa.com/8a3324.png" width="50" height='50' />
  burntUmber("#8A3324", "Burnt umber"),

  /// A color named "Byzantine" with hexadecimal value <a href='https://www.colorhexa.com/BD33A4' />#BD33A4</a> <br><img src="https://www.colorhexa.com/bd33a4.png" width="50" height='50' />
  byzantine("#BD33A4", "Byzantine"),

  /// A color named "Byzantium" with hexadecimal value <a href='https://www.colorhexa.com/702963' />#702963</a> <br><img src="https://www.colorhexa.com/702963.png" width="50" height='50' />
  byzantium("#702963", "Byzantium"),

  /// A color named "Cadet" with hexadecimal value <a href='https://www.colorhexa.com/536872' />#536872</a> <br><img src="https://www.colorhexa.com/536872.png" width="50" height='50' />
  cadet("#536872", "Cadet"),

  /// A color named "Cadet Blue" with hexadecimal value <a href='https://www.colorhexa.com/5F9EA0' />#5F9EA0</a> <br><img src="https://www.colorhexa.com/5f9ea0.png" width="50" height='50' />
  cadetBlue('#5F9EA0', 'Cadet Blue'),

  /// A color named "Cadet Grey" with hexadecimal value <a href='https://www.colorhexa.com/91A3B0' />#91A3B0</a> <br><img src="https://www.colorhexa.com/91a3b0.png" width="50" height='50' />
  cadetBlueCrayola("#A9B2C3", "Cadet blue (Crayola)"),

  /// A color named "Cadet Grey" with hexadecimal value <a href='https://www.colorhexa.com/91A3B0' />#91A3B0</a> <br><img src="https://www.colorhexa.com/91a3b0.png" width="50" height='50' />
  cadetGrey("#91A3B0", "Cadet grey"),

  /// A color named "Cadmium Green" with hexadecimal value <a href='https://www.colorhexa.com/006B3C' />#006B3C</a> <br><img src="https://www.colorhexa.com/006b3c.png" width="50" height='50' />
  cadmiumGreen("#006B3C", "Cadmium green"),

  /// A color named "Cadmium Orange" with hexadecimal value <a href='https://www.colorhexa.com/ED872D' />#ED872D</a> <br><img src="https://www.colorhexa.com/ed872d.png" width="50" height='50' />
  cadmiumOrange("#ED872D", "Cadmium orange"),

  /// A color named "Cadmium Red" with hexadecimal value <a href='https://www.colorhexa.com/E30022' />#E30022</a> <br><img src="https://www.colorhexa.com/e30022.png" width="50" height='50' />
  cadmiumRed("#E30022", "Cadmium red"),

  /// A color named "Cadmium Yellow" with hexadecimal value <a href='https://www.colorhexa.com/FFF600' />#FFF600</a> <br><img src="https://www.colorhexa.com/fff600.png" width="50" height='50' />
  cadmiumYellow("#FFF600", "Cadmium yellow"),

  /// A color named "Café Au Lait" with hexadecimal value <a href='https://www.colorhexa.com/A67B5B' />#A67B5B</a> <br><img src="https://www.colorhexa.com/A67B5B.png" width="50" height='50' />
  cafeAuLait("#A67B5B", "Café au lait"),

  /// A color named "Café Noir" with hexadecimal value <a href='https://www.colorhexa.com/4B3621' />#4B3621</a> <br><img src="https://www.colorhexa.com/4B3621.png" width="50" height='50' />
  cafeNoir("#4B3621", "Café noir"),

  /// A color named "Cambridge Blue" with hexadecimal value <a href='https://www.colorhexa.com/A3C1AD' />#A3C1AD</a> <br><img src="https://www.colorhexa.com/A3C1AD.png" width="50" height='50' />
  cambridgeBlue("#A3C1AD", "Cambridge blue"),

  /// A color named "Camel" with hexadecimal value <a href='https://www.colorhexa.com/C19A6B' />#C19A6B</a> <br><img src="https://www.colorhexa.com/C19A6B.png" width="50" height='50' />
  camel("#C19A6B", "Camel"),

  /// A color named "Cameo Pink" with hexadecimal value <a href='https://www.colorhexa.com/EFBBCC' />#EFBBCC</a> <br><img src="https://www.colorhexa.com/EFBBCC.png" width="50" height='50' />
  cameoPink("#EFBBCC", "Cameo pink"),

  /// A color named "Canary" with hexadecimal value <a href='https://www.colorhexa.com/FFFF99' />#FFFF99</a> <br><img src="https://www.colorhexa.com/FFFF99.png" width="50" height='50' />
  canary("#FFFF99", "Canary"),

  /// A color named "Canary Yellow" with hexadecimal value <a href='https://www.colorhexa.com/FFEF00' />#FFEF00</a> <br><img src="https://www.colorhexa.com/FFEF00.png" width="50" height='50' />
  canaryYellow("#FFEF00", "Canary yellow"),

  /// A color named "Candy Apple Red" with hexadecimal value <a href='https://www.colorhexa.com/FF0800' />#FF0800</a> <br><img src="https://www.colorhexa.com/FF0800.png" width="50" height='50' />
  candyAppleRed("#FF0800", "Candy apple red"),

  /// A color named "Candy Pink" with hexadecimal value <a href='https://www.colorhexa.com/E4717A' />#E4717A</a> <br><img src="https://www.colorhexa.com/E4717A.png" width="50" height='50' />
  candyPink("#E4717A", "Candy pink"),

  /// A color named "Capri" with hexadecimal value <a href='https://www.colorhexa.com/00BFFF' />#00BFFF</a> <br><img src="https://www.colorhexa.com/00BFFF.png" width="50" height='50' />
  capri("#00BFFF", "Capri"),

  /// A color named "Caput Mortuum" with hexadecimal value <a href='https://www.colorhexa.com/592720' />#592720</a> <br><img src="https://www.colorhexa.com/592720.png" width="50" height='50' />
  caputMortuum("#592720", "Caput mortuum"),

  /// A color named "Cardinal" with hexadecimal value <a href='https://www.colorhexa.com/C41E3A' />#C41E3A</a> <br><img src="https://www.colorhexa.com/C41E3A.png" width="50" height='50' />
  cardinal("#C41E3A", "Cardinal"),

  /// A color named "Caribbean Green" with hexadecimal value <a href='https://www.colorhexa.com/00CC99' />#00CC99</a> <br><img src="https://www.colorhexa.com/00CC99.png" width="50" height='50' />
  caribbeanGreen("#00CC99", "Caribbean green"),

  /// A color named "Carmine" with hexadecimal value <a href='https://www.colorhexa.com/960018' />#960018</a> <br><img src="https://www.colorhexa.com/960018.png" width="50" height='50' />
  carmine("#960018", "Carmine"),

  /// A color named "Carmine (M&P)" with hexadecimal value <a href='https://www.colorhexa.com/D70040' />#D70040</a> <br><img src="https://www.colorhexa.com/D70040.png" width="50" height='50' />
  carmineMP("#D70040", "Carmine (M&P)"),

  /// A color named "Carnation Pink" with hexadecimal value <a href='https://www.colorhexa.com/FFA6C9' />#FFA6C9</a> <br><img src="https://www.colorhexa.com/FFA6C9.png" width="50" height='50' />
  carnationPink("#FFA6C9", "Carnation pink"),

  /// A color named "Carnelian" with hexadecimal value <a href='https://www.colorhexa.com/B31B1B' />#B31B1B</a> <br><img src="https://www.colorhexa.com/B31B1B.png" width="50" height='50' />
  carnelian("#B31B1B", "Carnelian"),

  /// A color named "Carolina Blue" with hexadecimal value <a href='https://www.colorhexa.com/56A0D3' />#56A0D3</a> <br><img src="https://www.colorhexa.com/56A0D3.png" width="50" height='50' />
  carolinaBlue("#56A0D3", "Carolina blue"),

  /// A color named "Carrot Orange" with hexadecimal value <a href='https://www.colorhexa.com/ED9121' />#ED9121</a> <br><img src="https://www.colorhexa.com/ED9121.png" width="50" height='50' />
  carrotOrange("#ED9121", "Carrot orange"),

  /// A color named "Castleton Green" with hexadecimal value <a href='https://www.colorhexa.com/00563F' />#00563F</a> <br><img src="https://www.colorhexa.com/00563F.png" width="50" height='50' />
  castletonGreen("#00563F", "Castleton green"),

  /// A color named "Catawba" with hexadecimal value <a href='https://www.colorhexa.com/703642' />#703642</a> <br><img src="https://www.colorhexa.com/703642.png" width="50" height='50' />
  catawba("#703642", "Catawba"),

  /// A color named "Cedar Chest" with hexadecimal value <a href='https://www.colorhexa.com/C95A49' />#C95A49</a> <br><img src="https://www.colorhexa.com/C95A49.png" width="50" height='50' />
  cedarChest("#C95A49", "Cedar Chest"),

  /// A color named "Celadon" with hexadecimal value <a href='https://www.colorhexa.com/ACE1AF' />#ACE1AF</a> <br><img src="https://www.colorhexa.com/ACE1AF.png" width="50" height='50' />
  celadon("#ACE1AF", "Celadon"),

  /// A color named "Celadon Blue" with hexadecimal value <a href='https://www.colorhexa.com/007BA7' />#007BA7</a> <br><img src="https://www.colorhexa.com/007BA7.png" width="50" height='50' />
  celadonBlue("#007BA7", "Celadon blue"),

  /// A color named "Celadon Green" with hexadecimal value <a href='https://www.colorhexa.com/2F847C' />#2F847C</a> <br><img src="https://www.colorhexa.com/2F847C.png" width="50" height='50' />
  celadonGreen("#2F847C", "Celadon green"),

  /// A color named "Celeste" with hexadecimal value <a href='https://www.colorhexa.com/B2FFFF' />#B2FFFF</a> <br><img src="https://www.colorhexa.com/B2FFFF.png" width="50" height='50' />
  celeste("#B2FFFF", "Celeste"),

  /// A color named "Celtic Blue" with hexadecimal value <a href='https://www.colorhexa.com/246BCE' />#246BCE</a> <br><img src="https://www.colorhexa.com/246BCE.png" width="50" height='50' />
  celticBlue("#246BCE", "Celtic blue"),

  /// A color named "Cerise" with hexadecimal value <a href='https://www.colorhexa.com/DE3163' />#DE3163</a> <br><img src="https://www.colorhexa.com/DE3163.png" width="50" height='50' />
  cerise("#DE3163", "Cerise"),

  /// A color named "Cerulean" with hexadecimal value <a href='https://www.colorhexa.com/007BA7' />#007BA7</a> <br><img src="https://www.colorhexa.com/007BA7.png" width="50" height='50' />
  cerulean("#007BA7", "Cerulean"),

  /// A color named "Cerulean Blue" with hexadecimal value <a href='https://www.colorhexa.com/2A52BE' />#2A52BE</a> <br><img src="https://www.colorhexa.com/2A52BE.png" width="50" height='50' />
  ceruleanBlue("#2A52BE", "Cerulean blue"),

  /// A color named "Cerulean Crayola" with hexadecimal value <a href='https://www.colorhexa.com/1DACD6' />#1DACD6</a> <br><img src="https://www.colorhexa.com/1DACD6.png" width="50" height='50' />
  ceruleanCrayola("#1DACD6", "Cerulean (Crayola)"),

  /// A color named "Cerulean Frost" with hexadecimal value <a href='https://www.colorhexa.com/6D9BC3' />#6D9BC3</a> <br><img src="https://www.colorhexa.com/6D9BC3.png" width="50" height='50' />
  ceruleanFrost("#6D9BC3", "Cerulean frost"),

  /// A color named "CG Blue" with hexadecimal value <a href='https://www.colorhexa.com/007AA5' />#007AA5</a> <br><img src="https://www.colorhexa.com/007AA5.png" width="50" height='50' />
  cgBlue("#007AA5", "CG blue"),

  /// A color named "CG Red" with hexadecimal value <a href='https://www.colorhexa.com/E03C31' />#E03C31</a> <br><img src="https://www.colorhexa.com/E03C31.png" width="50" height='50' />
  cgRed("#E03C31", "CG red"),

  /// A color named "Champagne" with hexadecimal value <a href='https://www.colorhexa.com/F7E7CE' />#F7E7CE</a> <br><img src="https://www.colorhexa.com/F7E7CE.png" width="50" height='50' />
  champagne("#F7E7CE", "Champagne"),

  /// A color named "Champagne Pink" with hexadecimal value <a href='https://www.colorhexa.com/F1DDCF' />#F1DDCF</a> <br><img src="https://www.colorhexa.com/F1DDCF.png" width="50" height='50' />
  champagnePink("#F1DDCF", "Champagne pink"),

  /// A color named "Charcoal" with hexadecimal value <a href='https://www.colorhexa.com/36454F' />#36454F</a> <br><img src="https://www.colorhexa.com/36454F.png" width="50" height='50' />
  charcoal("#36454F", "Charcoal"),

  /// A color named "Charleston Green" with hexadecimal value <a href='https://www.colorhexa.com/232B2B' />#232B2B</a> <br><img src="https://www.colorhexa.com/232B2B.png" width="50" height='50' />
  charlestonGreen("#232B2B", "Charleston green"),

  /// A color named "Charm Pink" with hexadecimal value <a href='https://www.colorhexa.com/E68FAC' />#E68FAC</a> <br><img src="https://www.colorhexa.com/E68FAC.png" width="50" height='50' />
  charmPink("#E68FAC", "Charm pink"),

  /// A color named "Chartreuse" with hexadecimal value <a href='https://www.colorhexa.com/7FFF00' />#7FFF00</a> <br><img src="https://www.colorhexa.com/7FFF00.png" width="50" height='50' />
  chartreuse('#7FFF00', 'Chartreuse'),

  /// A color named "Chartreuse Traditional" with hexadecimal value <a href='https://www.colorhexa.com/DFFF00' />#DFFF00</a> <br><img src="https://www.colorhexa.com/DFFF00.png" width="50" height='50' />
  chartreuseTraditional("#DFFF00", "Chartreuse (traditional)"),

  /// A color named "Chartreuse Web" with hexadecimal value <a href='https://www.colorhexa.com/7FFF00' />#7FFF00</a> <br><img src="https://www.colorhexa.com/7FFF00.png" width="50" height='50' />
  chartreuseWeb("#7FFF00", "Chartreuse (web)"),

  /// A color named "Cherry Blossom Pink" with hexadecimal value <a href='https://www.colorhexa.com/FFB7C5' />#FFB7C5</a> <br><img src="https://www.colorhexa.com/FFB7C5.png" width="50" height='50' />
  cherryBlossomPink("#FFB7C5", "Cherry blossom pink"),

  /// A color named "Chestnut" with hexadecimal value <a href='https://www.colorhexa.com/954535' />#954535</a> <br><img src="https://www.colorhexa.com/954535.png" width="50" height='50' />
  chestnut("#954535", "Chestnut"),

  /// A color named "Chili Red" with hexadecimal value <a href='https://www.colorhexa.com/E23D28' />#E23D28</a> <br><img src="https://www.colorhexa.com/E23D28.png" width="50" height='50' />
  chiliRed("#E23D28", "Chili red"),

  /// A color named "China Pink" with hexadecimal value <a href='https://www.colorhexa.com/DE6FA1' />#DE6FA1</a> <br><img src="https://www.colorhexa.com/DE6FA1.png" width="50" height='50' />
  chinaPink("#DE6FA1", "China pink"),

  /// A color named "China Rose" with hexadecimal value <a href='https://www.colorhexa.com/A8516E' />#A8516E</a> <br><img src="https://www.colorhexa.com/A8516E.png" width="50" height='50' />
  chinaRose("#A8516E", "China rose"),

  /// A color named "Chinese Red" with hexadecimal value <a href='https://www.colorhexa.com/AA381E' />#AA381E</a> <br><img src="https://www.colorhexa.com/AA381E.png" width="50" height='50' />
  chineseRed("#AA381E", "Chinese red"),

  /// A color named "Chinese Violet" with hexadecimal value <a href='https://www.colorhexa.com/856088' />#856088</a> <br><img src="https://www.colorhexa.com/856088.png" width="50" height='50' />
  chineseViolet("#856088", "Chinese violet"),

  /// A color named "Chinese Yellow" with hexadecimal value <a href='https://www.colorhexa.com/FFB200' />#FFB200</a> <br><img src="https://www.colorhexa.com/FFB200.png" width="50" height='50' />
  chineseYellow("#FFB200", "Chinese yellow"),

  /// A color named "Chocolate" with hexadecimal value <a href='https://www.colorhexa.com/D2691E' />#D2691E</a> <br><img src="https://www.colorhexa.com/D2691E.png" width="50" height='50' />
  chocolate('#D2691E', 'Chocolate'),

  /// A color named "Chocolate Cosmos" with hexadecimal value <a href='https://www.colorhexa.com/58111A' />#58111A</a> <br><img src="https://www.colorhexa.com/58111A.png" width="50" height='50' />
  chocolateCosmos("#58111A", "Chocolate Cosmos"),

  /// A color named "Chocolate Traditional" with hexadecimal value <a href='https://www.colorhexa.com/7B3F00' />#7B3F00</a> <br><img src="https://www.colorhexa.com/7B3F00.png" width="50" height='50' />
  chocolateTraditional("#7B3F00", "Chocolate (traditional)"),

  /// A color named "Chocolate Web" with hexadecimal value <a href='https://www.colorhexa.com/D2691E' />#D2691E</a> <br><img src="https://www.colorhexa.com/D2691E.png" width="50" height='50' />
  chocolateWeb("#D2691E", "Chocolate (web)"),

  /// A color named "Chrome Yellow" with hexadecimal value <a href='https://www.colorhexa.com/FFA700' />#FFA700</a> <br><img src="https://www.colorhexa.com/FFA700.png" width="50" height='50' />
  chromeYellow("#FFA700", "Chrome yellow"),

  /// A color named "Cinereous" with hexadecimal value <a href='https://www.colorhexa.com/98817B' />#98817B</a> <br><img src="https://www.colorhexa.com/98817B.png" width="50" height='50' />
  cinereous("#98817B", "Cinereous"),

  /// A color named "Cinnabar" with hexadecimal value <a href='https://www.colorhexa.com/E34234' />#E34234</a> <br><img src="https://www.colorhexa.com/E34234.png" width="50" height='50' />
  cinnabar("#E34234", "Cinnabar"),

  /// A color named "Cinnamon Satin" with hexadecimal value <a href='https://www.colorhexa.com/CD607E' />#CD607E</a> <br><img src="https://www.colorhexa.com/CD607E.png" width="50" height='50' />
  cinnamonSatin("#CD607E", "Cinnamon Satin"),

  /// A color named "Citrine" with hexadecimal value <a href='https://www.colorhexa.com/E4D00A' />#E4D00A</a> <br><img src="https://www.colorhexa.com/E4D00A.png" width="50" height='50' />
  citrine("#E4D00A", "Citrine"),

  /// A color named "Citron" with hexadecimal value <a href='https://www.colorhexa.com/9FA91F' />#9FA91F</a> <br><img src="https://www.colorhexa.com/9FA91F.png" width="50" height='50' />
  citron("#9FA91F", "Citron"),

  /// A color named "Claret" with hexadecimal value <a href='https://www.colorhexa.com/7F1734' />#7F1734</a> <br><img src="https://www.colorhexa.com/7F1734.png" width="50" height='50' />
  claret("#7F1734", "Claret"),

  /// A color named "Cobalt Blue" with hexadecimal value <a href='https://www.colorhexa.com/0047AB' />#0047AB</a> <br><img src="https://www.colorhexa.com/0047AB.png" width="50" height='50' />
  cobaltBlue("#0047AB", "Cobalt blue"),

  /// A color named "Cocoa Brown" with hexadecimal value <a href='https://www.colorhexa.com/D2691E' />#D2691E</a> <br><img src="https://www.colorhexa.com/D2691E.png" width="50" height='50' />
  cocoaBrown("#D2691E", "Cocoa brown"),

  /// A color named "Coffee" with hexadecimal value <a href='https://www.colorhexa.com/6F4E37' />#6F4E37</a> <br><img src="https://www.colorhexa.com/6F4E37.png" width="50" height='50' />
  coffee("#6F4E37", "Coffee"),

  /// A color named "Columbia Blue" with hexadecimal value <a href='https://www.colorhexa.com/B9D9EB' />#B9D9EB</a> <br><img src="https://www.colorhexa.com/B9D9EB.png" width="50" height='50' />
  columbiaBlue("#B9D9EB", "Columbia Blue"),

  /// A color named "Congo Pink" with hexadecimal value <a href='https://www.colorhexa.com/F88379' />#F88379</a> <br><img src="https://www.colorhexa.com/F88379.png" width="50" height='50' />
  congoPink("#F88379", "Congo pink"),

  /// A color named "Cool Grey" with hexadecimal value <a href='https://www.colorhexa.com/8C92AC' />#8C92AC</a> <br><img src="https://www.colorhexa.com/8C92AC.png" width="50" height='50' />
  coolGrey("#8C92AC", "Cool grey"),

  /// A color named "Copper" with hexadecimal value <a href='https://www.colorhexa.com/B87333' />#B87333</a> <br><img src="https://www.colorhexa.com/B87333.png" width="50" height='50' />
  copper("#B87333", "Copper"),

  /// A color named "Copper Crayola" with hexadecimal value <a href='https://www.colorhexa.com/DA8A67' />#DA8A67</a> <br><img src="https://www.colorhexa.com/DA8A67.png" width="50" height='50' />
  copperCrayola("#DA8A67", "Copper (Crayola)"),

  /// A color named "Copper Penny" with hexadecimal value <a href='https://www.colorhexa.com/AD6F69' />#AD6F69</a> <br><img src="https://www.colorhexa.com/AD6F69.png" width="50" height='50' />
  copperPenny("#AD6F69", "Copper penny"),

  /// A color named "Copper Red" with hexadecimal value <a href='https://www.colorhexa.com/CB6D51' />#CB6D51</a> <br><img src="https://www.colorhexa.com/CB6D51.png" width="50" height='50' />
  copperRed("#CB6D51", "Copper red"),

  /// A color named "Copper Rose" with hexadecimal value <a href='https://www.colorhexa.com/996666' />#996666</a> <br><img src="https://www.colorhexa.com/996666.png" width="50" height='50' />
  copperRose("#996666", "Copper rose"),

  /// A color named "Coquelicot" with hexadecimal value <a href='https://www.colorhexa.com/FF3800' />#FF3800</a> <br><img src="https://www.colorhexa.com/FF3800.png" width="50" height='50' />
  coquelicot("#FF3800", "Coquelicot"),

  /// A color named "Coral" with hexadecimal value <a href='https://www.colorhexa.com/FF7F50' />#FF7F50</a> <br><img src="https://www.colorhexa.com/FF7F50.png" width="50" height='50' />
  coral('#FF7F50', 'Coral'),

  /// A color named "Coral Pink" with hexadecimal value <a href='https://www.colorhexa.com/F88379' />#F88379</a> <br><img src="https://www.colorhexa.com/F88379.png" width="50" height='50' />
  coralPink("#F88379", "Coral pink"),

  /// A color named "Cordovan" with hexadecimal value <a href='https://www.colorhexa.com/893F45' />#893F45</a> <br><img src="https://www.colorhexa.com/893F45.png" width="50" height='50' />
  cordovan("#893F45", "Cordovan"),

  /// A color named "Corn" with hexadecimal value <a href='https://www.colorhexa.com/FBEC5D' />#FBEC5D</a> <br><img src="https://www.colorhexa.com/FBEC5D.png" width="50" height='50' />
  corn("#FBEC5D", "Corn"),

  /// A color named "Cornell Red" with hexadecimal value <a href='https://www.colorhexa.com/B31B1B' />#B31B1B</a> <br><img src="https://www.colorhexa.com/B31B1B.png" width="50" height='50' />
  cornellRed("#B31B1B", "Cornell red"),

  /// A color named "Cornflower Blue" with hexadecimal value <a href='https://www.colorhexa.com/6495ED' />#6495ED</a> <br><img src="https://www.colorhexa.com/6495ED.png" width="50" height='50' />
  cornflowerBlue('#6495ED', 'Cornflower Blue'),

  /// A color named "Cornsilk" with hexadecimal value <a href='https://www.colorhexa.com/FFF8DC' />#FFF8DC</a> <br><img src="https://www.colorhexa.com/FFF8DC.png" width="50" height='50' />
  cornsilk('#FFF8DC', 'Cornsilk'),

  /// A color named "Cosmic Cobalt" with hexadecimal value <a href='https://www.colorhexa.com/2E2D88' />#2E2D88</a> <br><img src="https://www.colorhexa.com/2E2D88.png" width="50" height='50' />
  cosmicCobalt("#2E2D88", "Cosmic cobalt"),

  /// A color named "Cosmic Latte" with hexadecimal value <a href='https://www.colorhexa.com/FFF8E7' />#FFF8E7</a> <br><img src="https://www.colorhexa.com/FFF8E7.png" width="50" height='50' />
  cosmicLatte("#FFF8E7", "Cosmic latte"),

  /// A color named "Cotton Candy" with hexadecimal value <a href='https://www.colorhexa.com/FFBCD9' />#FFBCD9</a> <br><img src="https://www.colorhexa.com/FFBCD9.png" width="50" height='50' />
  cottonCandy("#FFBCD9", "Cotton candy"),

  /// A color named "Coyote Brown" with hexadecimal value <a href='https://www.colorhexa.com/81613C' />#81613C</a> <br><img src="https://www.colorhexa.com/81613C.png" width="50" height='50' />
  coyoteBrown("#81613C", "Coyote brown"),

  /// A color named "Cream" with hexadecimal value <a href='https://www.colorhexa.com/FFFDD0' />#FFFDD0</a> <br><img src="https://www.colorhexa.com/FFFDD0.png" width="50" height='50' />
  cream("#FFFDD0", "Cream"),

  /// A color named "Crimson" with hexadecimal value <a href='https://www.colorhexa.com/DC143C' />#DC143C</a> <br><img src="https://www.colorhexa.com/DC143C.png" width="50" height='50' />
  crimson('#DC143C', 'Crimson'),

  /// A color named "Crimson UA" with hexadecimal value <a href='https://www.colorhexa.com/9E1B32' />#9E1B32</a> <br><img src="https://www.colorhexa.com/9E1B32.png" width="50" height='50' />
  crimsonUA("#9E1B32", "Crimson (UA)"),

  /// A color named "Crystal" with hexadecimal value <a href='https://www.colorhexa.com/A7D8DE' />#A7D8DE</a> <br><img src="https://www.colorhexa.com/A7D8DE.png" width="50" height='50' />
  crystal("#A7D8DE", "Crystal"),

  /// A color named "Cultured" with hexadecimal value <a href='https://www.colorhexa.com/F5F5F5' />#F5F5F5</a> <br><img src="https://www.colorhexa.com/F5F5F5.png" width="50" height='50' />
  cultured("#F5F5F5", "Cultured"),

  /// A color named "Cyan" with hexadecimal value <a href='https://www.colorhexa.com/00FFFF' />#00FFFF</a> <br><img src="https://www.colorhexa.com/00FFFF.png" width="50" height='50' />
  cyan('#00FFFF', 'Cyan'),

  /// A color named "Cyan Process" with hexadecimal value <a href='https://www.colorhexa.com/00B7EB' />#00B7EB</a> <br><img src="https://www.colorhexa.com/00B7EB.png" width="50" height='50' />
  cyanProcess("#00B7EB", "Cyan (process)"),

  /// A color named "Cyber Grape" with hexadecimal value <a href='https://www.colorhexa.com/58427C' />#58427C</a> <br><img src="https://www.colorhexa.com/58427C.png" width="50" height='50' />
  cyberGrape("#58427C", "Cyber grape"),

  /// A color named "Cyber Yellow" with hexadecimal value <a href='https://www.colorhexa.com/FFD300' />#FFD300</a> <br><img src="https://www.colorhexa.com/FFD300.png" width="50" height='50' />
  cyberYellow("#FFD300", "Cyber yellow"),

  /// A color named "Cyclamen" with hexadecimal value <a href='https://www.colorhexa.com/F56FA1' />#F56FA1</a> <br><img src="https://www.colorhexa.com/F56FA1.png" width="50" height='50' />
  cyclamen("#F56FA1", "Cyclamen"),

  /// A color named "Dark Blue" with hexadecimal value <a href='https://www.colorhexa.com/00008B' />#00008B</a> <br><img src="https://www.colorhexa.com/00008B.png" width="50" height='50' />
  darkBlue('#00008B', 'Dark Blue'),

  /// A color named "Dark Blue Gray" with hexadecimal value <a href='https://www.colorhexa.com/666699' />#666699</a> <br><img src="https://www.colorhexa.com/666699.png" width="50" height='50' />
  darkBlueGray("#666699", "Dark blue gray"),

  /// A color named "Dark Brown" with hexadecimal value <a href='https://www.colorhexa.com/654321' />#654321</a> <br><img src="https://www.colorhexa.com/654321.png" width="50" height='50' />
  darkBrown("#654321", "Dark brown"),

  /// A color named "Dark Byzantium" with hexadecimal value <a href='https://www.colorhexa.com/5D3954' />#5D3954</a> <br><img src="https://www.colorhexa.com/5D3954.png" width="50" height='50' />
  darkByzantium("#5D3954", "Dark byzantium"),

  /// A color named "Dark Cornflower Blue" with hexadecimal value <a href='https://www.colorhexa.com/26428B' />#26428B</a> <br><img src="https://www.colorhexa.com/26428B.png" width="50" height='50' />
  darkCornflowerBlue("#26428B", "Dark cornflower blue"),

  /// A color named "Dark Cyan" with hexadecimal value <a href='https://www.colorhexa.com/008B8B' />#008B8B</a> <br><img src="https://www.colorhexa.com/008B8B.png" width="50" height='50' />
  darkCyan('#008B8B', 'Dark Cyan'),

  /// A color named "Dark Electric Blue" with hexadecimal value <a href='https://www.colorhexa.com/536878' />#536878</a> <br><img src="https://www.colorhexa.com/536878.png" width="50" height='50' />
  darkElectricBlue("#536878", "Dark electric blue"),

  /// A color named "Dark Goldenrod" with hexadecimal value <a href='https://www.colorhexa.com/B8860B' />#B8860B</a> <br><img src="https://www.colorhexa.com/B8860B.png" width="50" height='50' />
  darkGoldenrod("#B8860B", "Dark goldenrod"),

  /// A color named "Dark Gray" with hexadecimal value <a href='https://www.colorhexa.com/A9A9A9' />#A9A9A9</a> <br><img src="https://www.colorhexa.com/A9A9A9.png" width="50" height='50' />
  darkGray('#A9A9A9', 'Dark Gray'),

  /// A color named "Dark Green" with hexadecimal value <a href='https://www.colorhexa.com/006400' />#006400</a> <br><img src="https://www.colorhexa.com/006400.png" width="50" height='50' />
  darkGreen('#006400', 'Dark Green'),

  /// A color named "Dark Green (X11)" with hexadecimal value <a href='https://www.colorhexa.com/006400' />#006400</a> <br><img src="https://www.colorhexa.com/006400.png" width="50" height='50' />
  darkGreenX11("#006400", "Dark green (X11)"),

  /// A color named "Dark Jungle Green" with hexadecimal value <a href='https://www.colorhexa.com/1A2421' />#1A2421</a> <br><img src="https://www.colorhexa.com/1A2421.png" width="50" height='50' />
  darkJungleGreen("#1A2421", "Dark jungle green"),

  /// A color named "Dark Khaki" with hexadecimal value <a href='https://www.colorhexa.com/BDB76B' />#BDB76B</a> <br><img src="https://www.colorhexa.com/BDB76B.png" width="50" height='50' />
  darkKhaki('#BDB76B', 'Dark Khaki'),

  /// A color named "Dark Lava" with hexadecimal value <a href='https://www.colorhexa.com/483C32' />#483C32</a> <br><img src="https://www.colorhexa.com/483C32.png" width="50" height='50' />
  darkLava("#483C32", "Dark lava"),

  /// A color named "Dark Liver" with hexadecimal value <a href='https://www.colorhexa.com/534B4F' />#534B4F</a> <br><img src="https://www.colorhexa.com/534B4F.png" width="50" height='50' />
  darkLiver("#534B4F", "Dark liver"),

  /// A color named "Dark Liver (Horses)" with hexadecimal value <a href='https://www.colorhexa.com/543D37' />#543D37</a> <br><img src="https://www.colorhexa.com/543D37.png" width="50" height='50' />
  darkLiverHorses("#543D37", "Dark liver (horses)"),

  /// A color named "Dark Magenta" with hexadecimal value <a href='https://www.colorhexa.com/8B008B' />#8B008B</a> <br><img src="https://www.colorhexa.com/8B008B.png" width="50" height='50' />
  darkMagenta('#8B008B', 'Dark Magenta'),

  /// A color named "Dark Moss Green" with hexadecimal value <a href='https://www.colorhexa.com/4A5D23' />#4A5D23</a> <br><img src="https://www.colorhexa.com/4A5D23.png" width="50" height='50' />
  darkMossGreen("#4A5D23", "Dark moss green"),

  /// A color named "Dark Olive Green" with hexadecimal value <a href='https://www.colorhexa.com/556B2F' />#556B2F</a> <br><img src="https://www.colorhexa.com/556B2F.png" width="50" height='50' />
  darkOliveGreen('#556B2F', 'Dark Olive Green'),

  /// A color named "Dark Orange" with hexadecimal value <a href='https://www.colorhexa.com/FF8C00' />#FF8C00</a> <br><img src="https://www.colorhexa.com/FF8C00.png" width="50" height='50' />
  darkOrange('#FF8C00', 'Dark Orange'),

  /// A color named "Dark Orchid" with hexadecimal value <a href='https://www.colorhexa.com/9932CC' />#9932CC</a> <br><img src="https://www.colorhexa.com/9932CC.png" width="50" height='50' />
  darkOrchid('#9932CC', 'Dark Orchid'),

  /// A color named "Dark Pastel Green" with hexadecimal value <a href='https://www.colorhexa.com/03C03C' />#03C03C</a> <br><img src="https://www.colorhexa.com/03C03C.png" width="50" height='50' />
  darkPastelGreen("#03C03C", "Dark pastel green"),

  /// A color named "Dark Purple" with hexadecimal value <a href='https://www.colorhexa.com/301934' />#301934</a> <br><img src="https://www.colorhexa.com/301934.png" width="50" height='50' />
  darkPurple("#301934", "Dark purple"),

  /// A color named "Dark Red" with hexadecimal value <a href='https://www.colorhexa.com/8B0000' />#8B0000</a> <br><img src="https://www.colorhexa.com/8B0000.png" width="50" height='50' />
  darkRed('#8B0000', 'Dark Red'),

  /// A color named "Dark Salmon" with hexadecimal value <a href='https://www.colorhexa.com/E9967A' />#E9967A</a> <br><img src="https://www.colorhexa.com/E9967A.png" width="50" height='50' />
  darkSalmon('#E9967A', 'Dark Salmon'),

  /// A color named "Dark Sea Green" with hexadecimal value <a href='https://www.colorhexa.com/8FBC8F' />#8FBC8F</a> <br><img src="https://www.colorhexa.com/8FBC8F.png" width="50" height='50' />
  darkSeaGreen('#8FBC8F', 'Dark Sea Green'),

  /// A color named "Dark Sienna" with hexadecimal value <a href='https://www.colorhexa.com/3C1414' />#3C1414</a> <br><img src="https://www.colorhexa.com/3C1414.png" width="50" height='50' />
  darkSienna("#3C1414", "Dark sienna"),

  /// A color named "Dark Sky Blue" with hexadecimal value <a href='https://www.colorhexa.com/8CBED6' />#8CBED6</a> <br><img src="https://www.colorhexa.com/8CBED6.png" width="50" height='50' />
  darkSkyBlue("#8CBED6", "Dark sky blue"),

  /// A color named "Dark Slate Blue" with hexadecimal value <a href='https://www.colorhexa.com/483D8B' />#483D8B</a> <br><img src="https://www.colorhexa.com/483D8B.png" width="50" height='50' />
  darkSlateBlue('#483D8B', 'Dark Slate Blue'),

  /// A color named "Dark Slate Gray" with hexadecimal value <a href='https://www.colorhexa.com/2F4F4F' />#2F4F4F</a> <br><img src="https://www.colorhexa.com/2F4F4F.png" width="50" height='50' />
  darkSlateGray('#2F4F4F', 'Dark Slate Gray'),

  /// A color named "Dark Spring Green" with hexadecimal value <a href='https://www.colorhexa.com/177245' />#177245</a> <br><img src="https://www.colorhexa.com/177245.png" width="50" height='50' />
  darkSpringGreen("#177245", "Dark spring green"),

  /// A color named "Dark Turquoise" with hexadecimal value <a href='https://www.colorhexa.com/00CED1' />#00CED1</a> <br><img src="https://www.colorhexa.com/00CED1.png" width="50" height='50' />
  darkTurquoise('#00CED1', 'Dark Turquoise'),

  /// A color named "Dark Violet" with hexadecimal value <a href='https://www.colorhexa.com/9400D3' />#9400D3</a> <br><img src="https://www.colorhexa.com/9400D3.png" width="50" height='50' />
  darkViolet('#9400D3', 'Dark Violet'),

  /// A color named "Dartmouth Green" with hexadecimal value <a href='https://www.colorhexa.com/00703C' />#00703C</a> <br><img src="https://www.colorhexa.com/00703C.png" width="50" height='50' />
  dartmouthGreen("#00703C", "Dartmouth green"),

  /// A color named "Davy's Grey" with hexadecimal value <a href='https://www.colorhexa.com/555555' />#555555</a> <br><img src="https://www.colorhexa.com/555555.png" width="50" height='50' />
  davysGrey("#555555", "Davy's grey"),

  /// A color named "Deep Cerise" with hexadecimal value <a href='https://www.colorhexa.com/DA3287' />#DA3287</a> <br><img src="https://www.colorhexa.com/DA3287.png" width="50" height='50' />
  deepCerise("#DA3287", "Deep cerise"),

  /// A color named "Deep Champagne" with hexadecimal value <a href='https://www.colorhexa.com/FAD6A5' />#FAD6A5</a> <br><img src="https://www.colorhexa.com/FAD6A5.png" width="50" height='50' />
  deepChampagne("#FAD6A5", "Deep champagne"),

  /// A color named "Deep Chestnut" with hexadecimal value <a href='https://www.colorhexa.com/B94E48' />#B94E48</a> <br><img src="https://www.colorhexa.com/B94E48.png" width="50" height='50' />
  deepChestnut("#B94E48", "Deep chestnut"),

  /// A color named "Deep Jungle Green" with hexadecimal value <a href='https://www.colorhexa.com/004B49' />#004B49</a> <br><img src="https://www.colorhexa.com/004B49.png" width="50" height='50' />
  deepJungleGreen("#004B49", "Deep jungle green"),

  /// A color named "Deep Pink" with hexadecimal value <a href='https://www.colorhexa.com/FF1493' />#FF1493</a> <br><img src="https://www.colorhexa.com/FF1493.png" width="50" height='50' />
  deepPink('#FF1493', 'Deep Pink'),

  /// A color named "Deep Saffron" with hexadecimal value <a href='https://www.colorhexa.com/FF9933' />#FF9933</a> <br><img src="https://www.colorhexa.com/FF9933.png" width="50" height='50' />
  deepSaffron("#FF9933", "Deep saffron"),

  /// A color named "Deep Sky Blue" with hexadecimal value <a href='https://www.colorhexa.com/00BFFF' />#00BFFF</a> <br><img src="https://www.colorhexa.com/00BFFF.png" width="50" height='50' />
  deepSkyBlue('#00BFFF', 'Deep Sky Blue'),

  /// A color named "Deep Space Sparkle" with hexadecimal value <a href='https://www.colorhexa.com/4A646C' />#4A646C</a> <br><img src="https://www.colorhexa.com/4A646C.png" width="50" height='50' />
  deepSpaceSparkle("#4A646C", "Deep Space Sparkle"),

  /// A color named "Deep Taupe" with hexadecimal value <a href='https://www.colorhexa.com/7E5E60' />#7E5E60</a> <br><img src="https://www.colorhexa.com/7E5E60.png" width="50" height='50' />
  deepTaupe("#7E5E60", "Deep taupe"),

  /// A color named "Denim" with hexadecimal value <a href='https://www.colorhexa.com/1560BD' />#1560BD</a> <br><img src="https://www.colorhexa.com/1560BD.png" width="50" height='50' />
  denim("#1560BD", "Denim"),

  /// A color named "Denim Blue" with hexadecimal value <a href='https://www.colorhexa.com/2243B6' />#2243B6</a> <br><img src="https://www.colorhexa.com/2243B6.png" width="50" height='50' />
  denimBlue("#2243B6", "Denim blue"),

  /// A color named "Desert" with hexadecimal value <a href='https://www.colorhexa.com/C19A6B' />#C19A6B</a> <br><img src="https://www.colorhexa.com/C19A6B.png" width="50" height='50' />
  desert("#C19A6B", "Desert"),

  /// A color named "Desert Sand" with hexadecimal value <a href='https://www.colorhexa.com/EDC9AF' />#EDC9AF</a> <br><img src="https://www.colorhexa.com/EDC9AF.png" width="50" height='50' />
  desertSand("#EDC9AF", "Desert sand"),

  /// A color named "Dodger Blue" with hexadecimal value <a href='https://www.colorhexa.com/1E90FF' />#1E90FF</a> <br><img src="https://www.colorhexa.com/1E90FF.png" width="50" height='50' />
  dodgerBlue('#1E90FF', 'Dodger Blue'),

  /// A color named "Dogwood Rose" with hexadecimal value <a href='https://www.colorhexa.com/D71868' />#D71868</a> <br><img src="https://www.colorhexa.com/D71868.png" width="50" height='50' />
  dogwoodRose("#D71868", "Dogwood rose"),

  /// A color named "Drab" with hexadecimal value <a href='https://www.colorhexa.com/967117' />#967117</a> <br><img src="https://www.colorhexa.com/967117.png" width="50" height='50' />
  drab("#967117", "Drab"),

  /// A color named "Duke Blue" with hexadecimal value <a href='https://www.colorhexa.com/00009C' />#00009C</a> <br><img src="https://www.colorhexa.com/00009C.png" width="50" height='50' />
  dukeBlue("#00009C", "Duke blue"),

  /// A color named "Dutch White" with hexadecimal value <a href='https://www.colorhexa.com/EFDFBB' />#EFDFBB</a> <br><img src="https://www.colorhexa.com/EFDFBB.png" width="50" height='50' />
  dutchWhite("#EFDFBB", "Dutch white"),

  /// A color named "Earth Yellow" with hexadecimal value <a href='https://www.colorhexa.com/E1A95F' />#E1A95F</a> <br><img src="https://www.colorhexa.com/E1A95F.png" width="50" height='50' />
  earthYellow("#E1A95F", "Earth yellow"),

  /// A color named "Ebony" with hexadecimal value <a href='https://www.colorhexa.com/555D50' />#555D50</a> <br><img src="https://www.colorhexa.com/555D50.png" width="50" height='50' />
  ebony("#555D50", "Ebony"),

  /// A color named "Ecru" with hexadecimal value <a href='https://www.colorhexa.com/C2B280' />#C2B280</a> <br><img src="https://www.colorhexa.com/C2B280.png" width="50" height='50' />
  ecru("#C2B280", "Ecru"),

  /// A color named "Eerie Black" with hexadecimal value <a href='https://www.colorhexa.com/1B1B1B' />#1B1B1B</a> <br><img src="https://www.colorhexa.com/1B1B1B.png" width="50" height='50' />
  eerieBlack("#1B1B1B", "Eerie black"),

  /// A color named "Eggplant" with hexadecimal value <a href='https://www.colorhexa.com/614051' />#614051</a> <br><img src="https://www.colorhexa.com/614051.png" width="50" height='50' />
  eggplant("#614051", "Eggplant"),

  /// A color named "Eggshell" with hexadecimal value <a href='https://www.colorhexa.com/F0EAD6' />#F0EAD6</a> <br><img src="https://www.colorhexa.com/F0EAD6.png" width="50" height='50' />
  eggshell("#F0EAD6", "Eggshell"),

  /// A color named "Egyptian Blue" with hexadecimal value <a href='https://www.colorhexa.com/1034A6' />#1034A6</a> <br><img src="https://www.colorhexa.com/1034A6.png" width="50" height='50' />
  egyptianBlue("#1034A6", "Egyptian blue"),

  /// A color named "Eigengrau" with hexadecimal value <a href='https://www.colorhexa.com/16161D' />#16161D</a> <br><img src="https://www.colorhexa.com/16161D.png" width="50" height='50' />
  eigengrau("#16161D", "Eigengrau"),

  /// A color named "Electric Blue" with hexadecimal value <a href='https://www.colorhexa.com/7DF9FF' />#7DF9FF</a> <br><img src="https://www.colorhexa.com/7DF9FF.png" width="50" height='50' />
  electricBlue("#7DF9FF", "Electric blue"),

  /// A color named "Electric Green" with hexadecimal value <a href='https://www.colorhexa.com/00FF00' />#00FF00</a> <br><img src="https://www.colorhexa.com/00FF00.png" width="50" height='50' />
  electricGreen("#00FF00", "Electric green"),

  /// A color named "Electric Indigo" with hexadecimal value <a href='https://www.colorhexa.com/6F00FF' />#6F00FF</a> <br><img src="https://www.colorhexa.com/6F00FF.png" width="50" height='50' />
  electricIndigo("#6F00FF", "Electric indigo"),

  /// A color named "Electric Lime" with hexadecimal value <a href='https://www.colorhexa.com/CCFF00' />#CCFF00</a> <br><img src="https://www.colorhexa.com/CCFF00.png" width="50" height='50' />
  electricLime("#CCFF00", "Electric lime"),

  /// A color named "Electric Purple" with hexadecimal value <a href='https://www.colorhexa.com/BF00FF' />#BF00FF</a> <br><img src="https://www.colorhexa.com/BF00FF.png" width="50" height='50' />
  electricPurple("#BF00FF", "Electric purple"),

  /// A color named "Electric Violet" with hexadecimal value <a href='https://www.colorhexa.com/8F00FF' />#8F00FF</a> <br><img src="https://www.colorhexa.com/8F00FF.png" width="50" height='50' />
  electricViolet("#8F00FF", "Electric violet"),

  /// A color named "Emerald" with hexadecimal value <a href='https://www.colorhexa.com/50C878' />#50C878</a> <br><img src="https://www.colorhexa.com/50C878.png" width="50" height='50' />
  emerald("#50C878", "Emerald"),

  /// A color named "Eminence" with hexadecimal value <a href='https://www.colorhexa.com/6C3082' />#6C3082</a> <br><img src="https://www.colorhexa.com/6C3082.png" width="50" height='50' />
  eminence("#6C3082", "Eminence"),

  /// A color named "English Green" with hexadecimal value <a href='https://www.colorhexa.com/1B4D3E' />#1B4D3E</a> <br><img src="https://www.colorhexa.com/1B4D3E.png" width="50" height='50' />
  englishGreen("#1B4D3E", "English green"),

  /// A color named "English Lavender" with hexadecimal value <a href='https://www.colorhexa.com/B48395' />#B48395</a> <br><img src="https://www.colorhexa.com/B48395.png" width="50" height='50' />
  englishLavender("#B48395", "English lavender"),

  /// A color named "English Red" with hexadecimal value <a href='https://www.colorhexa.com/AB4B52' />#AB4B52</a> <br><img src="https://www.colorhexa.com/AB4B52.png" width="50" height='50' />
  englishRed("#AB4B52", "English red"),

  /// A color named "English Vermillion" with hexadecimal value <a href='https://www.colorhexa.com/CC474B' />#CC474B</a> <br><img src="https://www.colorhexa.com/CC474B.png" width="50" height='50' />
  englishVermillion("#CC474B", "English vermillion"),

  /// A color named "English Violet" with hexadecimal value <a href='https://www.colorhexa.com/563C5C' />#563C5C</a> <br><img src="https://www.colorhexa.com/563C5C.png" width="50" height='50' />
  englishViolet("#563C5C", "English violet"),

  /// A color named "Erin" with hexadecimal value <a href='https://www.colorhexa.com/00FF40' />#00FF40</a> <br><img src="https://www.colorhexa.com/00FF40.png" width="50" height='50' />
  erin("#00FF40", "Erin"),

  /// A color named "Eton Blue" with hexadecimal value <a href='https://www.colorhexa.com/96C8A2' />#96C8A2</a> <br><img src="https://www.colorhexa.com/96C8A2.png" width="50" height='50' />
  etonBlue("#96C8A2", "Eton blue"),

  /// A color named "Fallow" with hexadecimal value <a href='https://www.colorhexa.com/C19A6B' />#C19A6B</a> <br><img src="https://www.colorhexa.com/C19A6B.png" width="50" height='50' />
  fallow("#C19A6B", "Fallow"),

  /// A color named "Falu Red" with hexadecimal value <a href='https://www.colorhexa.com/801818' />#801818</a> <br><img src="https://www.colorhexa.com/801818.png" width="50" height='50' />
  faluRed("#801818", "Falu red"),

  /// A color named "Fandango" with hexadecimal value <a href='https://www.colorhexa.com/B53389' />#B53389</a> <br><img src="https://www.colorhexa.com/B53389.png" width="50" height='50' />
  fandango("#B53389", "Fandango"),

  /// A color named "Fandango Pink" with hexadecimal value <a href='https://www.colorhexa.com/DE5285' />#DE5285</a> <br><img src="https://www.colorhexa.com/DE5285.png" width="50" height='50' />
  fandangoPink("#DE5285", "Fandango pink"),

  /// A color named "Fashion Fuchsia" with hexadecimal value <a href='https://www.colorhexa.com/F400A1' />#F400A1</a> <br><img src="https://www.colorhexa.com/F400A1.png" width="50" height='50' />
  fashionFuchsia("#F400A1", "Fashion fuchsia"),

  /// A color named "Fawn" with hexadecimal value <a href='https://www.colorhexa.com/E5AA70' />#E5AA70</a> <br><img src="https://www.colorhexa.com/E5AA70.png" width="50" height='50' />
  fawn("#E5AA70", "Fawn"),

  /// A color named "Feldgrau" with hexadecimal value <a href='https://www.colorhexa.com/4D5D53' />#4D5D53</a> <br><img src="https://www.colorhexa.com/4D5D53.png" width="50" height='50' />
  feldgrau("#4D5D53", "Feldgrau"),

  /// A color named "Feldspar" with hexadecimal value <a href='https://www.colorhexa.com/FDD5B1' />#FDD5B1</a> <br><img src="https://www.colorhexa.com/FDD5B1.png" width="50" height='50' />
  feldspar("#FDD5B1", "Feldspar"),

  /// A color named "Fern Green" with hexadecimal value <a href='https://www.colorhexa.com/4F7942' />#4F7942</a> <br><img src="https://www.colorhexa.com/4F7942.png" width="50" height='50' />
  fernGreen("#4F7942", "Fern green"),

  /// A color named "Ferrari Red" with hexadecimal value <a href='https://www.colorhexa.com/FF2800' />#FF2800</a> <br><img src="https://www.colorhexa.com/FF2800.png" width="50" height='50' />
  ferrariRed("#FF2800", "Ferrari red"),

  /// A color named "Field Drab" with hexadecimal value <a href='https://www.colorhexa.com/6C541E' />#6C541E</a> <br><img src="https://www.colorhexa.com/6C541E.png" width="50" height='50' />
  fieldDrab("#6C541E", "Field drab"),

  /// A color named "Firebrick" with hexadecimal value <a href='https://www.colorhexa.com/B22222' />#B22222</a> <br><img src="https://www.colorhexa.com/B22222.png" width="50" height='50' />
  firebrick("#B22222", "Firebrick"),

  /// A color named "Fire Brick" with hexadecimal value <a href='https://www.colorhexa.com/B22222' />#B22222</a> <br><img src="https://www.colorhexa.com/B22222.png" width="50" height='50' />
  fireBrick('#B22222', 'Fire Brick'),

  /// A color named "Fire Engine Red" with hexadecimal value <a href='https://www.colorhexa.com/CE2029' />#CE2029</a> <br><img src="https://www.colorhexa.com/CE2029.png" width="50" height='50' />
  fireEngineRed("#CE2029", "Fire engine red"),

  /// A color named "Flame" with hexadecimal value <a href='https://www.colorhexa.com/E25822' />#E25822</a> <br><img src="https://www.colorhexa.com/E25822.png" width="50" height='50' />
  flame("#E25822", "Flame"),

  /// A color named "Flamingo Pink" with hexadecimal value <a href='https://www.colorhexa.com/FC8EAC' />#FC8EAC</a> <br><img src="https://www.colorhexa.com/FC8EAC.png" width="50" height='50' />
  flamingoPink("#FC8EAC", "Flamingo pink"),

  /// A color named "Flattery" with hexadecimal value <a href='https://www.colorhexa.com/6B4423' />#6B4423</a> <br><img src="https://www.colorhexa.com/6B4423.png" width="50" height='50' />
  flattery("#6B4423", "Flattery"),

  /// A color named "Flavescent" with hexadecimal value <a href='https://www.colorhexa.com/F7E98E' />#F7E98E</a> <br><img src="https://www.colorhexa.com/F7E98E.png" width="50" height='50' />
  flavescent("#F7E98E", "Flavescent"),

  /// A color named "Flax" with hexadecimal value <a href='https://www.colorhexa.com/EEDC82' />#EEDC82</a> <br><img src="https://www.colorhexa.com/EEDC82.png" width="50" height='50' />
  flax("#EEDC82", "Flax"),

  /// A color named "Flirt" with hexadecimal value <a href='https://www.colorhexa.com/A2006D' />#A2006D</a> <br><img src="https://www.colorhexa.com/A2006D.png" width="50" height='50' />
  flirt("#A2006D", "Flirt"),

  /// A color named "Floral White" with hexadecimal value <a href='https://www.colorhexa.com/FFFAF0' />#FFFAF0</a> <br><img src="https://www.colorhexa.com/FFFAF0.png" width="50" height='50' />
  floralWhite('#FFFAF0', 'Floral White'),

  /// A color named "Fluorescent Orange" with hexadecimal value <a href='https://www.colorhexa.com/FFBF00' />#FFBF00</a> <br><img src="https://www.colorhexa.com/FFBF00.png" width="50" height='50' />
  fluorescentOrange("#FFBF00", "Fluorescent orange"),

  /// A color named "Fluorescent Pink" with hexadecimal value <a href='https://www.colorhexa.com/FF1493' />#FF1493</a> <br><img src="https://www.colorhexa.com/FF1493.png" width="50" height='50' />
  fluorescentPink("#FF1493", "Fluorescent pink"),

  /// A color named "Fluorescent Yellow" with hexadecimal value <a href='https://www.colorhexa.com/CCFF00' />#CCFF00</a> <br><img src="https://www.colorhexa.com/CCFF00.png" width="50" height='50' />
  fluorescentYellow("#CCFF00", "Fluorescent yellow"),

  /// A color named "Folly" with hexadecimal value <a href='https://www.colorhexa.com/FF004F' />#FF004F</a> <br><img src="https://www.colorhexa.com/FF004F.png" width="50" height='50' />
  folly("#FF004F", "Folly"),

  /// A color named "Forest Green" with hexadecimal value <a href='https://www.colorhexa.com/228B22' />#228B22</a> <br><img src="https://www.colorhexa.com/228B22.png" width="50" height='50' />
  forestGreen('#228B22', 'Forest Green'),

  /// A color named "French Beige" with hexadecimal value <a href='https://www.colorhexa.com/A67B5B' />#A67B5B</a> <br><img src="https://www.colorhexa.com/A67B5B.png" width="50" height='50' />
  frenchBeige("#A67B5B", "French beige"),

  /// A color named "French Bistre" with hexadecimal value <a href='https://www.colorhexa.com/856D4D' />#856D4D</a> <br><img src="https://www.colorhexa.com/856D4D.png" width="50" height='50' />
  frenchBistre("#856D4D", "French bistre"),

  /// A color named "French Blue" with hexadecimal value <a href='https://www.colorhexa.com/0072BB' />#0072BB</a> <br><img src="https://www.colorhexa.com/0072BB.png" width="50" height='50' />
  frenchBlue("#0072BB", "French blue"),

  /// A color named "French Fuchsia" with hexadecimal value <a href='https://www.colorhexa.com/FD3F92' />#FD3F92</a> <br><img src="https://www.colorhexa.com/FD3F92.png" width="50" height='50' />
  frenchFuchsia("#FD3F92", "French fuchsia"),

  /// A color named "French Lilac" with hexadecimal value <a href='https://www.colorhexa.com/86608E' />#86608E</a> <br><img src="https://www.colorhexa.com/86608E.png" width="50" height='50' />
  frenchLilac("#86608E", "French lilac"),

  /// A color named "French Lime" with hexadecimal value <a href='https://www.colorhexa.com/9EFD38' />#9EFD38</a> <br><img src="https://www.colorhexa.com/9EFD38.png" width="50" height='50' />
  frenchLime("#9EFD38", "French lime"),

  /// A color named "French Mauve" with hexadecimal value <a href='https://www.colorhexa.com/D473D4' />#D473D4</a> <br><img src="https://www.colorhexa.com/D473D4.png" width="50" height='50' />
  frenchMauve("#D473D4", "French mauve"),

  /// A color named "French Pink" with hexadecimal value <a href='https://www.colorhexa.com/FD6C9E' />#FD6C9E</a> <br><img src="https://www.colorhexa.com/FD6C9E.png" width="50" height='50' />
  frenchPink("#FD6C9E", "French pink"),

  /// A color named "French Plum" with hexadecimal value <a href='https://www.colorhexa.com/811453' />#811453</a> <br><img src="https://www.colorhexa.com/811453.png" width="50" height='50' />
  frenchPlum("#811453", "French plum"),

  /// A color named "French Puce" with hexadecimal value <a href='https://www.colorhexa.com/4E1609' />#4E1609</a> <br><img src="https://www.colorhexa.com/4E1609.png" width="50" height='50' />
  frenchPuce("#4E1609", "French puce"),

  /// A color named "French Raspberry" with hexadecimal value <a href='https://www.colorhexa.com/C72C48' />#C72C48</a> <br><img src="https://www.colorhexa.com/C72C48.png" width="50" height='50' />
  frenchRaspberry("#C72C48", "French raspberry"),

  /// A color named "French Rose" with hexadecimal value <a href='https://www.colorhexa.com/F64A8A' />#F64A8A</a> <br><img src="https://www.colorhexa.com/F64A8A.png" width="50" height='50' />
  frenchRose("#F64A8A", "French rose"),

  /// A color named "French Sky Blue" with hexadecimal value <a href='https://www.colorhexa.com/77B5FE' />#77B5FE</a> <br><img src="https://www.colorhexa.com/77B5FE.png" width="50" height='50' />
  frenchSkyBlue("#77B5FE", "French sky blue"),

  /// A color named "French Violet" with hexadecimal value <a href='https://www.colorhexa.com/8806CE' />#8806CE</a> <br><img src="https://www.colorhexa.com/8806CE.png" width="50" height='50' />
  frenchViolet("#8806CE", "French violet"),

  /// A color named "French Wine" with hexadecimal value <a href='https://www.colorhexa.com/AC1E44' />#AC1E44</a> <br><img src="https://www.colorhexa.com/AC1E44.png" width="50" height='50' />
  frenchWine("#AC1E44", "French wine"),

  /// A color named "Fresh Air" with hexadecimal value <a href='https://www.colorhexa.com/A6E7FF' />#A6E7FF</a> <br><img src="https://www.colorhexa.com/A6E7FF.png" width="50" height='50' />
  freshAir("#A6E7FF", "Fresh air"),

  /// A color named "Frosted Mint" with hexadecimal value <a href='https://www.colorhexa.com/DBFFF8' />#DBFFF8</a> <br><img src="https://www.colorhexa.com/DBFFF8.png" width="50" height='50' />
  frostedMint("#DBFFF8", "Frosted mint"),

  /// A color named "Fuchsia" with hexadecimal value <a href='https://www.colorhexa.com/FF00FF' />#FF00FF</a> <br><img src="https://www.colorhexa.com/FF00FF.png" width="50" height='50' />
  fuchsia('#FF00FF', 'Fuchsia'),

  /// A color named "Fuchsia Crayola" with hexadecimal value <a href='https://www.colorhexa.com/C154C1' />#C154C1</a> <br><img src="https://www.colorhexa.com/C154C1.png" width="50" height='50' />
  fuchsiaCrayola("#C154C1", "Fuchsia (Crayola)"),

  /// A color named "Fuchsia Purple" with hexadecimal value <a href='https://www.colorhexa.com/CC397B' />#CC397B</a> <br><img src="https://www.colorhexa.com/CC397B.png" width="50" height='50' />
  fuchsiaPurple("#CC397B", "Fuchsia purple"),

  /// A color named "Fuchsia Rose" with hexadecimal value <a href='https://www.colorhexa.com/C74375' />#C74375</a> <br><img src="https://www.colorhexa.com/C74375.png" width="50" height='50' />
  fuchsiaRose("#C74375", "Fuchsia rose"),

  /// A color named "Fulvous" with hexadecimal value <a href='https://www.colorhexa.com/E48400' />#E48400</a> <br><img src="https://www.colorhexa.com/E48400.png" width="50" height='50' />
  fulvous("#E48400", "Fulvous"),

  /// A color named "Fuzzy Wuzzy" with hexadecimal value <a href='https://www.colorhexa.com/CC6666' />#CC6666</a> <br><img src="https://www.colorhexa.com/CC6666.png" width="50" height='50' />
  fuzzyWuzzy("#CC6666", "Fuzzy Wuzzy"),

  /// A color named "Gainsboro" with hexadecimal value <a href='https://www.colorhexa.com/DCDCDC' />#DCDCDC</a> <br><img src="https://www.colorhexa.com/DCDCDC.png" width="50" height='50' />
  gainsboro('#DCDCDC', 'Gainsboro'),

  /// A color named "Gamboge" with hexadecimal value <a href='https://www.colorhexa.com/E49B0F' />#E49B0F</a> <br><img src="https://www.colorhexa.com/E49B0F.png" width="50" height='50' />
  gamboge("#E49B0F", "Gamboge"),

  /// A color named "Generic Viridian" with hexadecimal value <a href='https://www.colorhexa.com/007F66' />#007F66</a> <br><img src="https://www.colorhexa.com/007F66.png" width="50" height='50' />
  genericViridian("#007F66", "Generic viridian"),

  /// A color named "Ghost White" with hexadecimal value <a href='https://www.colorhexa.com/F8F8FF' />#F8F8FF</a> <br><img src="https://www.colorhexa.com/F8F8FF.png" width="50" height='50' />
  ghostWhite('#F8F8FF', 'Ghost White'),

  /// A color named "Giants Orange" with hexadecimal value <a href='https://www.colorhexa.com/FE5A1D' />#FE5A1D</a> <br><img src="https://www.colorhexa.com/FE5A1D.png" width="50" height='50' />
  giantsOrange("#FE5A1D", "Giants orange"),

  /// A color named "Glaucous" with hexadecimal value <a href='https://www.colorhexa.com/6082B6' />#6082B6</a> <br><img src="https://www.colorhexa.com/6082B6.png" width="50" height='50' />
  glaucous("#6082B6", "Glaucous"),

  /// A color named "Glitter" with hexadecimal value <a href='https://www.colorhexa.com/E6E8FA' />#E6E8FA</a> <br><img src="https://www.colorhexa.com/E6E8FA.png" width="50" height='50' />
  glitter("#E6E8FA", "Glitter"),

  /// A color named "Glossy Grape" with hexadecimal value <a href='https://www.colorhexa.com/AB92B3' />#AB92B3</a> <br><img src="https://www.colorhexa.com/AB92B3.png" width="50" height='50' />
  glossyGrape("#AB92B3", "Glossy grape"),

  /// A color named "Go Green" with hexadecimal value <a href='https://www.colorhexa.com/00AB66' />#00AB66</a> <br><img src="https://www.colorhexa.com/00AB66.png" width="50" height='50' />
  goGreen("#00AB66", "GO green"),

  /// A color named "Gold" with hexadecimal value <a href='https://www.colorhexa.com/FFD700' />#FFD700</a> <br><img src="https://www.colorhexa.com/FFD700.png" width="50" height='50' />
  gold('#FFD700', 'Gold'),

  /// A color named "Golden Brown" with hexadecimal value <a href='https://www.colorhexa.com/996515' />#996515</a> <br><img src="https://www.colorhexa.com/996515.png" width="50" height='50' />
  goldenBrown("#996515", "Golden brown"),

  /// A color named "Golden Poppy" with hexadecimal value <a href='https://www.colorhexa.com/FCC200' />#FCC200</a> <br><img src="https://www.colorhexa.com/FCC200.png" width="50" height='50' />
  goldenPoppy("#FCC200", "Golden poppy"),

  /// A color named "Goldenrod" with hexadecimal value <a href='https://www.colorhexa.com/DAA520' />#DAA520</a> <br><img src="https://www.colorhexa.com/DAA520.png" width="50" height='50' />
  goldenrod("#DAA520", "Goldenrod"),

  /// A color named "Golden Rod" with hexadecimal value <a href='https://www.colorhexa.com/DAA520' />#DAA520</a> <br><img src="https://www.colorhexa.com/DAA520.png" width="50" height='50' />
  goldenRod('#DAA520', 'Golden Rod'),

  /// A color named "Golden Yellow" with hexadecimal value <a href='https://www.colorhexa.com/FFDF00' />#FFDF00</a> <br><img src="https://www.colorhexa.com/FFDF00.png" width="50" height='50' />
  goldenYellow("#FFDF00", "Golden yellow"),

  /// A color named "Gold Fusion" with hexadecimal value <a href='https://www.colorhexa.com/85754E' />#85754E</a> <br><img src="https://www.colorhexa.com/85754E.png" width="50" height='50' />
  goldFusion("#85754E", "Gold Fusion"),

  /// A color named "Granite Gray" with hexadecimal value <a href='https://www.colorhexa.com/676767' />#676767</a> <br><img src="https://www.colorhexa.com/676767.png" width="50" height='50' />
  graniteGray("#676767", "Granite gray"),

  /// A color named "Granny Smith Apple" with hexadecimal value <a href='https://www.colorhexa.com/A8E4A0' />#A8E4A0</a> <br><img src="https://www.colorhexa.com/A8E4A0.png" width="50" height='50' />
  grannySmithApple("#A8E4A0", "Granny Smith apple"),

  /// A color named "Grape" with hexadecimal value <a href='https://www.colorhexa.com/6F2DA8' />#6F2DA8</a> <br><img src="https://www.colorhexa.com/6F2DA8.png" width="50" height='50' />
  grape("#6F2DA8", "Grape"),

  /// A color named "Gray" with hexadecimal value <a href='https://www.colorhexa.com/808080' />#808080</a> <br><img src="https://www.colorhexa.com/808080.png" width="50" height='50' />
  gray('#808080', 'Gray'),

  /// A color named "Gray Asparagus" with hexadecimal value <a href='https://www.colorhexa.com/465945' />#465945</a> <br><img src="https://www.colorhexa.com/465945.png" width="50" height='50' />
  grayAsparagus("#465945", "Gray asparagus"),

  /// A color named "Gray Blue" with hexadecimal value <a href='https://www.colorhexa.com/8C92AC' />#8C92AC</a> <br><img src="https://www.colorhexa.com/8C92AC.png" width="50" height='50' />
  grayBlue("#8C92AC", "Gray blue"),

  /// A color named "Green" with hexadecimal value <a href='https://www.colorhexa.com/008000' />#008000</a> <br><img src="https://www.colorhexa.com/008000.png" width="50" height='50' />
  greenColor('#008000', 'Green'),

  /// A color named "Green Blue" with hexadecimal value <a href='https://www.colorhexa.com/1164B4' />#1164B4</a> <br><img src="https://www.colorhexa.com/1164B4.png" width="50" height='50' />
  greenBlue("#1164B4", "Green blue"),

  /// A color named "Green Crayola" with hexadecimal value <a href='https://www.colorhexa.com/1CAC78' />#1CAC78</a> <br><img src="https://www.colorhexa.com/1CAC78.png" width="50" height='50' />
  greenCrayola("#1CAC78", "Green (Crayola)"),

  /// A color named "Green Cyan" with hexadecimal value <a href='https://www.colorhexa.com/009966' />#009966</a> <br><img src="https://www.colorhexa.com/009966.png" width="50" height='50' />
  greenCyan("#009966", "Green cyan"),

  /// A color named "Green Lizard" with hexadecimal value <a href='https://www.colorhexa.com/A7F432' />#A7F432</a> <br><img src="https://www.colorhexa.com/A7F432.png" width="50" height='50' />
  greenLizard("#A7F432", "Green lizard"),

  /// A color named "Green Munsell" with hexadecimal value <a href='https://www.colorhexa.com/00A877' />#00A877</a> <br><img src="https://www.colorhexa.com/00A877.png" width="50" height='50' />
  greenMunsell("#00A877", "Green (Munsell)"),

  /// A color named "Green NCS" with hexadecimal value <a href='https://www.colorhexa.com/009F6B' />#009F6B</a> <br><img src="https://www.colorhexa.com/009F6B.png" width="50" height='50' />
  greenNCS("#009F6B", "Green (NCS)"),

  /// A color named "Green Pantone" with hexadecimal value <a href='https://www.colorhexa.com/00AD43' />#00AD43</a> <br><img src="https://www.colorhexa.com/00AD43.png" width="50" height='50' />
  greenPantone("#00AD43", "Green (Pantone)"),

  /// A color named "Green Pigment" with hexadecimal value <a href='https://www.colorhexa.com/00A550' />#00A550</a> <br><img src="https://www.colorhexa.com/00A550.png" width="50" height='50' />
  greenPigment("#00A550", "Green (pigment)"),

  /// A color named "Green RYB" with hexadecimal value <a href='https://www.colorhexa.com/66B032' />#66B032</a> <br><img src="https://www.colorhexa.com/66B032.png" width="50" height='50' />
  greenRYB("#66B032", "Green (RYB)"),

  /// A color named "Green Sheen" with hexadecimal value <a href='https://www.colorhexa.com/6EAEA1' />#6EAEA1</a> <br><img src="https://www.colorhexa.com/6EAEA1.png" width="50" height='50' />
  greenSheen("#6EAEA1", "Green sheen"),

  /// A color named "Green Yellow" with hexadecimal value <a href='https://www.colorhexa.com/ADFF2F' />#ADFF2F</a> <br><img src="https://www.colorhexa.com/ADFF2F.png" width="50" height='50' />
  greenYellow('#ADFF2F', 'Green Yellow'),

  /// A color named "Grullo" with hexadecimal value <a href='https://www.colorhexa.com/A99A86' />#A99A86</a> <br><img src="https://www.colorhexa.com/A99A86.png" width="50" height='50' />
  grullo("#A99A86", "Grullo"),

  /// A color named "Gunmetal" with hexadecimal value <a href='https://www.colorhexa.com/2A3439' />#2A3439</a> <br><img src="https://www.colorhexa.com/2A3439.png" width="50" height='50' />
  gunmetal("#2a3439", "Gunmetal"),

  /// A color named "Guppie Green" with hexadecimal value <a href='https://www.colorhexa.com/00FF7F' />#00FF7F</a> <br><img src="https://www.colorhexa.com/00FF7F.png" width="50" height='50' />
  guppieGreen("#00FF7F", "Guppie green"),

  /// A color named "Halaya Ube" with hexadecimal value <a href='https://www.colorhexa.com/663854' />#663854</a> <br><img src="https://www.colorhexa.com/663854.png" width="50" height='50' />
  halayaUbe("#663854", "Halayà úbe"),

  /// A color named "Han Blue" with hexadecimal value <a href='https://www.colorhexa.com/446CCF' />#446CCF</a> <br><img src="https://www.colorhexa.com/446CCF.png" width="50" height='50' />
  hanBlue("#446CCF", "Han blue"),

  /// A color named "Han Purple" with hexadecimal value <a href='https://www.colorhexa.com/5218FA' />#5218FA</a> <br><img src="https://www.colorhexa.com/5218FA.png" width="50" height='50' />
  hanPurple("#5218FA", "Han purple"),

  /// A color named "Hansa Yellow" with hexadecimal value <a href='https://www.colorhexa.com/E9D66B' />#E9D66B</a> <br><img src="https://www.colorhexa.com/E9D66B.png" width="50" height='50' />
  hansaYellow("#E9D66B", "Hansa yellow"),

  /// A color named "Harlequin" with hexadecimal value <a href='https://www.colorhexa.com/3FFF00' />#3FFF00</a> <br><img src="https://www.colorhexa.com/3FFF00.png" width="50" height='50' />
  harlequin("#3FFF00", "Harlequin"),

  /// A color named "Harlequin Green" with hexadecimal value <a href='https://www.colorhexa.com/46CB18' />#46CB18</a> <br><img src="https://www.colorhexa.com/46CB18.png" width="50" height='50' />
  harlequinGreen("#46CB18", "Harlequin green"),

  /// A color named "Harvard Crimson" with hexadecimal value <a href='https://www.colorhexa.com/C90016' />#C90016</a> <br><img src="https://www.colorhexa.com/C90016.png" width="50" height='50' />
  harvardCrimson("#C90016", "Harvard crimson"),

  /// A color named "Harvest Gold" with hexadecimal value <a href='https://www.colorhexa.com/DA9100' />#DA9100</a> <br><img src="https://www.colorhexa.com/DA9100.png" width="50" height='50' />
  harvestGold("#DA9100", "Harvest gold"),

  /// A color named "Heart Gold" with hexadecimal value <a href='https://www.colorhexa.com/808000' />#808000</a> <br><img src="https://www.colorhexa.com/808000.png" width="50" height='50' />
  heartGold("#808000", "Heart gold"),

  /// A color named "Heat Wave" with hexadecimal value <a href='https://www.colorhexa.com/FF7A00' />#FF7A00</a> <br><img src="https://www.colorhexa.com/FF7A00.png" width="50" height='50' />
  heatWave("#FF7A00", "Heat Wave"),

  /// A color named "Heliotrope" with hexadecimal value <a href='https://www.colorhexa.com/DF73FF' />#DF73FF</a> <br><img src="https://www.colorhexa.com/DF73FF.png" width="50" height='50' />
  heliotrope("#DF73FF", "Heliotrope"),

  /// A color named "Heliotrope Gray" with hexadecimal value <a href='https://www.colorhexa.com/AA98A9' />#AA98A9</a> <br><img src="https://www.colorhexa.com/AA98A9.png" width="50" height='50' />
  heliotropeGray("#AA98A9", "Heliotrope gray"),

  /// A color named "Heliotrope Magenta" with hexadecimal value <a href='https://www.colorhexa.com/AA00BB' />#AA00BB</a> <br><img src="https://www.colorhexa.com/AA00BB.png" width="50" height='50' />
  heliotropeMagenta("#AA00BB", "Heliotrope magenta"),

  /// A color named "Hollywood Cerise" with hexadecimal value <a href='https://www.colorhexa.com/F400A1' />#F400A1</a> <br><img src="https://www.colorhexa.com/F400A1.png" width="50" height='50' />
  hollywoodCerise("#F400A1", "Hollywood cerise"),

  /// A color named "Honey Dew" with hexadecimal value <a href='https://www.colorhexa.com/F0FFF0' />#F0FFF0</a> <br><img src="https://www.colorhexa.com/F0FFF0.png" width="50" height='50' />
  honeyDew('#F0FFF0', 'Honey Dew'),

  /// A color named "Honolulu Blue" with hexadecimal value <a href='https://www.colorhexa.com/006DB0' />#006DB0</a> <br><img src="https://www.colorhexa.com/006DB0.png" width="50" height='50' />
  honoluluBlue("#006DB0", "Honolulu blue"),

  /// A color named "Hooker Green" with hexadecimal value <a href='https://www.colorhexa.com/49796B' />#49796B</a> <br><img src="https://www.colorhexa.com/49796B.png" width="50" height='50' />
  hookerGreen("#49796B", "Hooker green"),

  /// A color named "Hot Magenta" with hexadecimal value <a href='https://www.colorhexa.com/FF1DCE' />#FF1DCE</a> <br><img src="https://www.colorhexa.com/FF1DCE.png" width="50" height='50' />
  hotMagenta("#FF1DCE", "Hot magenta"),

  /// A color named "Hot Pink" with hexadecimal value <a href='https://www.colorhexa.com/FF69B4' />#FF69B4</a> <br><img src="https://www.colorhexa.com/FF69B4.png" width="50" height='50' />
  hotPink('#FF69B4', 'Hot Pink'),

  /// A color named "Hunter Green" with hexadecimal value <a href='https://www.colorhexa.com/355E3B' />#355E3B</a> <br><img src="https://www.colorhexa.com/355E3B.png" width="50" height='50' />
  hunterGreen("#355E3B", "Hunter green"),

  /// A color named "Iceberg" with hexadecimal value <a href='https://www.colorhexa.com/71A6D2' />#71A6D2</a> <br><img src="https://www.colorhexa.com/71A6D2.png" width="50" height='50' />
  iceberg("#71A6D2", "Iceberg"),

  /// A color named "Icterine" with hexadecimal value <a href='https://www.colorhexa.com/FCF75E' />#FCF75E</a> <br><img src="https://www.colorhexa.com/FCF75E.png" width="50" height='50' />
  icterine("#FCF75E", "Icterine"),

  /// A color named "Illuminating Emerald" with hexadecimal value <a href='https://www.colorhexa.com/319177' />#319177</a> <br><img src="https://www.colorhexa.com/319177.png" width="50" height='50' />
  illuminatingEmerald("#319177", "Illuminating emerald"),

  /// A color named "Imperial" with hexadecimal value <a href='https://www.colorhexa.com/602F6B' />#602F6B</a> <br><img src="https://www.colorhexa.com/602F6B.png" width="50" height='50' />
  imperial("#602F6B", "Imperial"),

  /// A color named "Imperial Blue" with hexadecimal value <a href='https://www.colorhexa.com/002395' />#002395</a> <br><img src="https://www.colorhexa.com/002395.png" width="50" height='50' />
  imperialBlue("#002395", "Imperial blue"),

  /// A color named "Imperial Purple" with hexadecimal value <a href='https://www.colorhexa.com/66023C' />#66023C</a> <br><img src="https://www.colorhexa.com/66023C.png" width="50" height='50' />
  imperialPurple("#66023C", "Imperial purple"),

  /// A color named "Imperial Red" with hexadecimal value <a href='https://www.colorhexa.com/ED2939' />#ED2939</a> <br><img src="https://www.colorhexa.com/ED2939.png" width="50" height='50' />
  imperialRed("#ED2939", "Imperial red"),

  /// A color named "Inchworm" with hexadecimal value <a href='https://www.colorhexa.com/B2EC5D' />#B2EC5D</a> <br><img src="https://www.colorhexa.com/B2EC5D.png" width="50" height='50' />
  inchworm("#B2EC5D", "Inchworm"),

  /// A color named "Independence" with hexadecimal value <a href='https://www.colorhexa.com/4C516D' />#4C516D</a> <br><img src="https://www.colorhexa.com/4C516D.png" width="50" height='50' />
  independence("#4C516D", "Independence"),

  /// A color named "India Green" with hexadecimal value <a href='https://www.colorhexa.com/138808' />#138808</a> <br><img src="https://www.colorhexa.com/138808.png" width="50" height='50' />
  indiaGreen("#138808", "India green"),

  /// A color named "Indian Red" with hexadecimal value <a href='https://www.colorhexa.com/CD5C5C' />#CD5C5C</a> <br><img src="https://www.colorhexa.com/CD5C5C.png" width="50" height='50' />
  indianRed('#CD5C5C', 'Indian Red'),

  /// A color named "Indian Yellow" with hexadecimal value <a href='https://www.colorhexa.com/E3A857' />#E3A857</a> <br><img src="https://www.colorhexa.com/E3A857.png" width="50" height='50' />
  indianYellow("#E3A857", "Indian yellow"),

  /// A color named "Indigo" with hexadecimal value <a href='https://www.colorhexa.com/4B0082' />#4B0082</a> <br><img src="https://www.colorhexa.com/4B0082.png" width="50" height='50' />
  indigo('#4B0082', 'Indigo'),

  /// A color named "Indigo Dye" with hexadecimal value <a href='https://www.colorhexa.com/091F92' />#091F92</a> <br><img src="https://www.colorhexa.com/091F92.png" width="50" height='50' />
  indigoDye("#091F92", "Indigo dye"),

  /// A color named "Indigo Web" with hexadecimal value <a href='https://www.colorhexa.com/4B0082' />#4B0082</a> <br><img src="https://www.colorhexa.com/4B0082.png" width="50" height='50' />
  indigoWeb("#4B0082", "Indigo (web)"),

  /// A color named "Infrared" with hexadecimal value <a href='https://www.colorhexa.com/FF496C' />#FF496C</a> <br><img src="https://www.colorhexa.com/FF496C.png" width="50" height='50' />
  infrared("#FF496C", "Infrared"),

  /// A color named "Interdimensional Blue" with hexadecimal value <a href='https://www.colorhexa.com/360CCC' />#360CCC</a> <br><img src="https://www.colorhexa.com/360CCC.png" width="50" height='50' />
  interdimensionalBlue("#360CCC", "Interdimensional blue"),

  /// A color named "International Klein Blue" with hexadecimal value <a href='https://www.colorhexa.com/002FA7' />#002FA7</a> <br><img src="https://www.colorhexa.com/002FA7.png" width="50" height='50' />
  internationalKleinBlue("#002FA7", "International Klein Blue"),

  /// A color named "International Orange Aerospace" with hexadecimal value <a href='https://www.colorhexa.com/FF4F00' />#FF4F00</a> <br><img src="https://www.colorhexa.com/FF4F00.png" width="50" height='50' />
  internationalOrangeAerospace("#FF4F00", "International orange (aerospace)"),

  /// A color named "International Orange Engineering" with hexadecimal value <a href='https://www.colorhexa.com/BA160C' />#BA160C</a> <br><img src="https://www.colorhexa.com/BA160C.png" width="50" height='50' />
  internationalOrangeEngineering("#BA160C", "International orange (engineering)"),

  /// A color named "International Orange Golden Gate Bridge" with hexadecimal value <a href='https://www.colorhexa.com/C0362C' />#C0362C</a> <br><img src="https://www.colorhexa.com/C0362C.png" width="50" height='50' />
  internationalOrangeGoldenGateBridge("#C0362C", "International orange (Golden Gate Bridge)"),

  /// A color named "Iris" with hexadecimal value <a href='https://www.colorhexa.com/5A4FCF' />#5A4FCF</a> <br><img src="https://www.colorhexa.com/5A4FCF.png" width="50" height='50' />
  iris("#5A4FCF", "Iris"),

  /// A color named "Irresistible" with hexadecimal value <a href='https://www.colorhexa.com/B3446C' />#B3446C</a> <br><img src="https://www.colorhexa.com/B3446C.png" width="50" height='50' />
  irresistible("#B3446C", "Irresistible"),

  /// A color named "Isabelline" with hexadecimal value <a href='https://www.colorhexa.com/F4F0EC' />#F4F0EC</a> <br><img src="https://www.colorhexa.com/F4F0EC.png" width="50" height='50' />
  isabelline("#F4F0EC", "Isabelline"),

  /// A color named "Islamic Green" with hexadecimal value <a href='https://www.colorhexa.com/009000' />#009000</a> <br><img src="https://www.colorhexa.com/009000.png" width="50" height='50' />
  islamicGreen("#009000", "Islamic green"),

  /// A color named "Italian Sky Blue" with hexadecimal value <a href='https://www.colorhexa.com/B2FFFF' />#B2FFFF</a> <br><img src="https://www.colorhexa.com/B2FFFF.png" width="50" height='50' />
  italianSkyBlue("#B2FFFF", "Italian sky blue"),

  /// A color named "Ivory" with hexadecimal value <a href='https://www.colorhexa.com/FFFFF0' />#FFFFF0</a> <br><img src="https://www.colorhexa.com/FFFFF0.png" width="50" height='50' />
  ivory('#FFFFF0', 'Ivory'),

  /// A color named "Jade" with hexadecimal value <a href='https://www.colorhexa.com/00A86B' />#00A86B</a> <br><img src="https://www.colorhexa.com/00A86B.png" width="50" height='50' />
  jade("#00A86B", "Jade"),

  /// A color named "Japanese Carmine" with hexadecimal value <a href='https://www.colorhexa.com/9D2933' />#9D2933</a> <br><img src="https://www.colorhexa.com/9D2933.png" width="50" height='50' />
  japaneseCarmine("#9D2933", "Japanese carmine"),

  /// A color named "Japanese Indigo" with hexadecimal value <a href='https://www.colorhexa.com/264348' />#264348</a> <br><img src="https://www.colorhexa.com/264348.png" width="50" height='50' />
  japaneseIndigo("#264348", "Japanese indigo"),

  /// A color named "Japanese Laurel" with hexadecimal value <a href='https://www.colorhexa.com/0A6906' />#0A6906</a> <br><img src="https://www.colorhexa.com/0A6906.png" width="50" height='50' />
  japaneseLaurel("#0A6906", "Japanese laurel"),

  /// A color named "Japanese Violet" with hexadecimal value <a href='https://www.colorhexa.com/5B3256' />#5B3256</a> <br><img src="https://www.colorhexa.com/5B3256.png" width="50" height='50' />
  japaneseViolet("#5B3256", "Japanese violet"),

  /// A color named "Jasmine" with hexadecimal value <a href='https://www.colorhexa.com/F8DE7E' />#F8DE7E</a> <br><img src="https://www.colorhexa.com/F8DE7E.png" width="50" height='50' />
  jasmine("#F8DE7E", "Jasmine"),

  /// A color named "Jasper" with hexadecimal value <a href='https://www.colorhexa.com/D73B3E' />#D73B3E</a> <br><img src="https://www.colorhexa.com/D73B3E.png" width="50" height='50' />
  jasper("#D73B3E", "Jasper"),

  /// A color named "Jazzberry Jam" with hexadecimal value <a href='https://www.colorhexa.com/A50B5E' />#A50B5E</a> <br><img src="https://www.colorhexa.com/A50B5E.png" width="50" height='50' />
  jazzberryJam("#A50B5E", "Jazzberry jam"),

  /// A color named "Jelly Bean" with hexadecimal value <a href='https://www.colorhexa.com/DA614E' />#DA614E</a> <br><img src="https://www.colorhexa.com/DA614E.png" width="50" height='50' />
  jellyBean("#DA614E", "Jelly bean"),

  /// A color named "Jet" with hexadecimal value <a href='https://www.colorhexa.com/343434' />#343434</a> <br><img src="https://www.colorhexa.com/343434.png" width="50" height='50' />
  jet("#343434", "Jet"),

  /// A color named "Jonquil" with hexadecimal value <a href='https://www.colorhexa.com/F4CA16' />#F4CA16</a> <br><img src="https://www.colorhexa.com/F4CA16.png" width="50" height='50' />
  jonquil("#F4CA16", "Jonquil"),

  /// A color named "Jordy Blue" with hexadecimal value <a href='https://www.colorhexa.com/8AB9F1' />#8AB9F1</a> <br><img src="https://www.colorhexa.com/8AB9F1.png" width="50" height='50' />
  jordyBlue("#8AB9F1", "Jordy blue"),

  /// A color named "June Bud" with hexadecimal value <a href='https://www.colorhexa.com/BDDA57' />#BDDA57</a> <br><img src="https://www.colorhexa.com/BDDA57.png" width="50" height='50' />
  juneBud("#BDDA57", "June bud"),

  /// A color named "Jungle Green" with hexadecimal value <a href='https://www.colorhexa.com/29AB87' />#29AB87</a> <br><img src="https://www.colorhexa.com/29AB87.png" width="50" height='50' />
  jungleGreen("#29AB87", "Jungle green"),

  /// A color named "Kelly Green" with hexadecimal value <a href='https://www.colorhexa.com/4CBB17' />#4CBB17</a> <br><img src="https://www.colorhexa.com/4CBB17.png" width="50" height='50' />
  kellyGreen("#4CBB17", "Kelly green"),

  /// A color named "Kenyan Copper" with hexadecimal value <a href='https://www.colorhexa.com/7C1C05' />#7C1C05</a> <br><img src="https://www.colorhexa.com/7C1C05.png" width="50" height='50' />
  kenyanCopper("#7C1C05", "Kenyan copper"),

  /// A color named "Keppel" with hexadecimal value <a href='https://www.colorhexa.com/3AB09E' />#3AB09E</a> <br><img src="https://www.colorhexa.com/3AB09E.png" width="50" height='50' />
  keppel("#3AB09E", "Keppel"),

  /// A color named "Key Lime" with hexadecimal value <a href='https://www.colorhexa.com/E8F48C' />#E8F48C</a> <br><img src="https://www.colorhexa.com/E8F48C.png" width="50" height='50' />
  keyLime("#E8F48C", "Key lime"),

  /// A color named "Khaki" with hexadecimal value <a href='https://www.colorhexa.com/F0E68C' />#F0E68C</a> <br><img src="https://www.colorhexa.com/F0E68C.png" width="50" height='50' />
  khaki('#F0E68C', 'Khaki'),

  /// A color named "Khaki (X11)" with hexadecimal value <a href='https://www.colorhexa.com/F0E68C' />#F0E68C</a> <br><img src="https://www.colorhexa.com/F0E68C.png" width="50" height='50' />
  khakiX11("#F0E68C", "Khaki (X11)"),

  /// A color named "Kiwi" with hexadecimal value <a href='https://www.colorhexa.com/8EE53F' />#8EE53F</a> <br><img src="https://www.colorhexa.com/8EE53F.png" width="50" height='50' />
  kiwi("#8EE53F", "Kiwi"),

  /// A color named "Kobe" with hexadecimal value <a href='https://www.colorhexa.com/882D17' />#882D17</a> <br><img src="https://www.colorhexa.com/882D17.png" width="50" height='50' />
  kobe("#882D17", "Kobe"),

  /// A color named "Kobi" with hexadecimal value <a href='https://www.colorhexa.com/E79FC4' />#E79FC4</a> <br><img src="https://www.colorhexa.com/E79FC4.png" width="50" height='50' />
  kobi("#E79FC4", "Kobi"),

  /// A color named "Kombu Green" with hexadecimal value <a href='https://www.colorhexa.com/354230' />#354230</a> <br><img src="https://www.colorhexa.com/354230.png" width="50" height='50' />
  kombuGreen("#354230", "Kombu green"),

  /// A color named "KU Crimson" with hexadecimal value <a href='https://www.colorhexa.com/E8000D' />#E8000D</a> <br><img src="https://www.colorhexa.com/E8000D.png" width="50" height='50' />
  kuCrimson("#E8000D", "KU crimson"),

  /// A color named "Languid Lavender" with hexadecimal value <a href='https://www.colorhexa.com/D6CADD' />#D6CADD</a> <br><img src="https://www.colorhexa.com/D6CADD.png" width="50" height='50' />
  languidLavender("#D6CADD", "Languid lavender"),

  /// A color named "Lapis Lazuli" with hexadecimal value <a href='https://www.colorhexa.com/26619C' />#26619C</a> <br><img src="https://www.colorhexa.com/26619C.png" width="50" height='50' />
  lapisLazuli("#26619C", "Lapis lazuli"),

  /// A color named "La Salle Green" with hexadecimal value <a href='https://www.colorhexa.com/087830' />#087830</a> <br><img src="https://www.colorhexa.com/087830.png" width="50" height='50' />
  laSalleGreen("#087830", "La Salle green"),

  /// A color named "Laser Lemon" with hexadecimal value <a href='https://www.colorhexa.com/FFFF66' />#FFFF66</a> <br><img src="https://www.colorhexa.com/FFFF66.png" width="50" height='50' />
  laserLemon("#FFFF66", "Laser lemon"),

  /// A color named "Laurel Green" with hexadecimal value <a href='https://www.colorhexa.com/A9BA9D' />#A9BA9D</a> <br><img src="https://www.colorhexa.com/A9BA9D.png" width="50" height='50' />
  laurelGreen("#A9BA9D", "Laurel green"),

  /// A color named "Lava" with hexadecimal value <a href='https://www.colorhexa.com/CF1020' />#CF1020</a> <br><img src="https://www.colorhexa.com/CF1020.png" width="50" height='50' />
  lava("#CF1020", "Lava"),

  /// A color named "Lavender" with hexadecimal value <a href='https://www.colorhexa.com/E6E6FA' />#E6E6FA</a> <br><img src="https://www.colorhexa.com/E6E6FA.png" width="50" height='50' />
  lavender('#E6E6FA', 'Lavender'),

  /// A color named "Lavender Blue" with hexadecimal value <a href='https://www.colorhexa.com/CCCCFF' />#CCCCFF</a> <br><img src="https://www.colorhexa.com/CCCCFF.png" width="50" height='50' />
  lavenderBlue("#CCCCFF", "Lavender blue"),

  /// A color named "Lavender Blush" with hexadecimal value <a href='https://www.colorhexa.com/FFF0F5' />#FFF0F5</a> <br><img src="https://www.colorhexa.com/FFF0F5.png" width="50" height='50' />
  lavenderBlush('#FFF0F5', 'Lavender Blush'),

  /// A color named "Lavender (Floral)" with hexadecimal value <a href='https://www.colorhexa.com/B57EDC' />#B57EDC</a> <br><img src="https://www.colorhexa.com/B57EDC.png" width="50" height='50' />
  lavenderFloral("#B57EDC", "Lavender (floral)"),

  /// A color named "Lavender Gray" with hexadecimal value <a href='https://www.colorhexa.com/C4C3D0' />#C4C3D0</a> <br><img src="https://www.colorhexa.com/C4C3D0.png" width="50" height='50' />
  lavenderGray("#C4C3D0", "Lavender gray"),

  /// A color named "Lavender Indigo" with hexadecimal value <a href='https://www.colorhexa.com/9457EB' />#9457EB</a> <br><img src="https://www.colorhexa.com/9457EB.png" width="50" height='50' />
  lavenderIndigo("#9457EB", "Lavender indigo"),

  /// A color named "Lavender Magenta" with hexadecimal value <a href='https://www.colorhexa.com/EE82EE' />#EE82EE</a> <br><img src="https://www.colorhexa.com/EE82EE.png" width="50" height='50' />
  lavenderMagenta("#EE82EE", "Lavender magenta"),

  /// A color named "Lavender Mist" with hexadecimal value <a href='https://www.colorhexa.com/E6E6FA' />#E6E6FA</a> <br><img src="https://www.colorhexa.com/E6E6FA.png" width="50" height='50' />
  lavenderMist("#E6E6FA", "Lavender mist"),

  /// A color named "Lavender Pink" with hexadecimal value <a href='https://www.colorhexa.com/FBAED2' />#FBAED2</a> <br><img src="https://www.colorhexa.com/FBAED2.png" width="50" height='50' />
  lavenderPink("#FBAED2", "Lavender pink"),

  /// A color named "Lavender Purple" with hexadecimal value <a href='https://www.colorhexa.com/967BB6' />#967BB6</a> <br><img src="https://www.colorhexa.com/967BB6.png" width="50" height='50' />
  lavenderPurple("#967BB6", "Lavender purple"),

  /// A color named "Lavender Rose" with hexadecimal value <a href='https://www.colorhexa.com/FBA0E3' />#FBA0E3</a> <br><img src="https://www.colorhexa.com/FBA0E3.png" width="50" height='50' />
  lavenderRose("#FBA0E3", "Lavender rose"),

  /// A color named "Lawn Green" with hexadecimal value <a href='https://www.colorhexa.com/7CFC00' />#7CFC00</a> <br><img src="https://www.colorhexa.com/7CFC00.png" width="50" height='50' />
  lawnGreen('#7CFC00', 'Lawn Green'),

  /// A color named "Lemon" with hexadecimal value <a href='https://www.colorhexa.com/FFF700' />#FFF700</a> <br><img src="https://www.colorhexa.com/FFF700.png" width="50" height='50' />
  lemon("#FFF700", "Lemon"),

  /// A color named "Lemon Chiffon" with hexadecimal value <a href='https://www.colorhexa.com/FFFACD' />#FFFACD</a> <br><img src="https://www.colorhexa.com/FFFACD.png" width="50" height='50' />
  lemonChiffon('#FFFACD', 'Lemon Chiffon'),

  /// A color named "Lemon Curry" with hexadecimal value <a href='https://www.colorhexa.com/CCA01D' />#CCA01D</a> <br><img src="https://www.colorhexa.com/CCA01D.png" width="50" height='50' />
  lemonCurry("#CCA01D", "Lemon curry"),

  /// A color named "Lemon Glacier" with hexadecimal value <a href='https://www.colorhexa.com/FDFF00' />#FDFF00</a> <br><img src="https://www.colorhexa.com/FDFF00.png" width="50" height='50' />
  lemonGlacier("#FDFF00", "Lemon glacier"),

  /// A color named "Lemon Lime" with hexadecimal value <a href='https://www.colorhexa.com/E3FF00' />#E3FF00</a> <br><img src="https://www.colorhexa.com/E3FF00.png" width="50" height='50' />
  lemonLime("#E3FF00", "Lemon lime"),

  /// A color named "Lemon Meringue" with hexadecimal value <a href='https://www.colorhexa.com/F6EABE' />#F6EABE</a> <br><img src="https://www.colorhexa.com/F6EABE.png" width="50" height='50' />
  lemonMeringue("#F6EABE", "Lemon meringue"),

  /// A color named "Lemon Yellow" with hexadecimal value <a href='https://www.colorhexa.com/FFF44F' />#FFF44F</a> <br><img src="https://www.colorhexa.com/FFF44F.png" width="50" height='50' />
  lemonYellow("#FFF44F", "Lemon yellow"),

  /// A color named "Liberty" with hexadecimal value <a href='https://www.colorhexa.com/545AA7' />#545AA7</a> <br><img src="https://www.colorhexa.com/545AA7.png" width="50" height='50' />
  liberty("#545AA7", "Liberty"),

  /// A color named "Licorice" with hexadecimal value <a href='https://www.colorhexa.com/1A1110' />#1A1110</a> <br><img src="https://www.colorhexa.com/1A1110.png" width="50" height='50' />
  licorice("#1A1110", "Licorice"),

  /// A color named "Light Apricot" with hexadecimal value <a href='https://www.colorhexa.com/FDD5B1' />#FDD5B1</a> <br><img src="https://www.colorhexa.com/FDD5B1.png" width="50" height='50' />
  lightApricot("#FDD5B1", "Light apricot"),

  /// A color named "Light Blue" with hexadecimal value <a href='https://www.colorhexa.com/ADD8E6' />#ADD8E6</a> <br><img src="https://www.colorhexa.com/ADD8E6.png" width="50" height='50' />
  lightBlue('#ADD8E6', 'Light Blue'),

  /// A color named "Light Brown" with hexadecimal value <a href='https://www.colorhexa.com/B5651D' />#B5651D</a> <br><img src="https://www.colorhexa.com/B5651D.png" width="50" height='50' />
  lightBrown("#B5651D", "Light brown"),

  /// A color named "Light Carmine Pink" with hexadecimal value <a href='https://www.colorhexa.com/E66771' />#E66771</a> <br><img src="https://www.colorhexa.com/E66771.png" width="50" height='50' />
  lightCarminePink("#E66771", "Light carmine pink"),

  /// A color named "Light Coral" with hexadecimal value <a href='https://www.colorhexa.com/F08080' />#F08080</a> <br><img src="https://www.colorhexa.com/F08080.png" width="50" height='50' />
  lightCoral('#F08080', 'Light Coral'),

  /// A color named "Light Cornflower Blue" with hexadecimal value <a href='https://www.colorhexa.com/93CCEA' />#93CCEA</a> <br><img src="https://www.colorhexa.com/93CCEA.png" width="50" height='50' />
  lightCornflowerBlue("#93CCEA", "Light cornflower blue"),

  /// A color named "Light Crimson" with hexadecimal value <a href='https://www.colorhexa.com/F56991' />#F56991</a> <br><img src="https://www.colorhexa.com/F56991.png" width="50" height='50' />
  lightCrimson("#F56991", "Light crimson"),

  /// A color named "Light Cyan" with hexadecimal value <a href='https://www.colorhexa.com/E0FFFF' />#E0FFFF</a> <br><img src="https://www.colorhexa.com/E0FFFF.png" width="50" height='50' />
  lightCyan('#E0FFFF', 'Light Cyan'),

  /// A color named "Light Deep Pink" with hexadecimal value <a href='https://www.colorhexa.com/FF5CCD' />#FF5CCD</a> <br><img src="https://www.colorhexa.com/FF5CCD.png" width="50" height='50' />
  lightDeepPink("#FF5CCD", "Light deep pink"),

  /// A color named "Light French Beige" with hexadecimal value <a href='https://www.colorhexa.com/C8AD7F' />#C8AD7F</a> <br><img src="https://www.colorhexa.com/C8AD7F.png" width="50" height='50' />
  lightFrenchBeige("#C8AD7F", "Light French beige"),

  /// A color named "Light Fuchsia Pink" with hexadecimal value <a href='https://www.colorhexa.com/F984EF' />#F984EF</a> <br><img src="https://www.colorhexa.com/F984EF.png" width="50" height='50' />
  lightFuchsiaPink("#F984EF", "Light fuchsia pink"),

  /// A color named "Light Goldenrod Yellow" with hexadecimal value <a href='https://www.colorhexa.com/FAFAD2' />#FAFAD2</a> <br><img src="https://www.colorhexa.com/FAFAD2.png" width="50" height='50' />
  lightGoldenrodYellow("#FAFAD2", "Light goldenrod yellow"),

  /// A color named "Light Golden Rod Yellow" with hexadecimal value <a href='https://www.colorhexa.com/FAFAD2' />#FAFAD2</a> <br><img src="https://www.colorhexa.com/FAFAD2.png" width="50" height='50' />
  lightGoldenRodYellow('#FAFAD2', 'Light Golden Rod Yellow'),

  /// A color named "Light Gray" with hexadecimal value <a href='https://www.colorhexa.com/D3D3D3' />#D3D3D3</a> <br><img src="https://www.colorhexa.com/D3D3D3.png" width="50" height='50' />
  lightGray('#D3D3D3', 'Light Gray'),

  /// A color named "Light Green" with hexadecimal value <a href='https://www.colorhexa.com/90EE90' />#90EE90</a> <br><img src="https://www.colorhexa.com/90EE90.png" width="50" height='50' />
  lightGreen('#90EE90', 'Light Green'),

  /// A color named "Light Hot Pink" with hexadecimal value <a href='https://www.colorhexa.com/FFB3DE' />#FFB3DE</a> <br><img src="https://www.colorhexa.com/FFB3DE.png" width="50" height='50' />
  lightHotPink("#FFB3DE", "Light hot pink"),

  /// A color named "Light Khaki" with hexadecimal value <a href='https://www.colorhexa.com/F0E68C' />#F0E68C</a> <br><img src="https://www.colorhexa.com/F0E68C.png" width="50" height='50' />
  lightKhaki("#F0E68C", "Light khaki"),

  /// A color named "Light Medium Orchid" with hexadecimal value <a href='https://www.colorhexa.com/D39BCB' />#D39BCB</a> <br><img src="https://www.colorhexa.com/D39BCB.png" width="50" height='50' />
  lightMediumOrchid("#D39BCB", "Light medium orchid"),

  /// A color named "Light Moss Green" with hexadecimal value <a href='https://www.colorhexa.com/ADDFAD' />#ADDFAD</a> <br><img src="https://www.colorhexa.com/ADDFAD.png" width="50" height='50' />
  lightMossGreen("#ADDFAD", "Light moss green"),

  /// A color named "Light Orchid" with hexadecimal value <a href='https://www.colorhexa.com/E6A8D7' />#E6A8D7</a> <br><img src="https://www.colorhexa.com/E6A8D7.png" width="50" height='50' />
  lightOrchid("#E6A8D7", "Light orchid"),

  /// A color named "Light Pastel Purple" with hexadecimal value <a href='https://www.colorhexa.com/B19CD9' />#B19CD9</a> <br><img src="https://www.colorhexa.com/B19CD9.png" width="50" height='50' />
  lightPastelPurple("#B19CD9", "Light pastel purple"),

  /// A color named "Light Pink" with hexadecimal value <a href='https://www.colorhexa.com/FFB6C1' />#FFB6C1</a> <br><img src="https://www.colorhexa.com/FFB6C1.png" width="50" height='50' />
  lightPink('#FFB6C1', 'Light Pink'),

  /// A color named "Light Red Ochre" with hexadecimal value <a href='https://www.colorhexa.com/E97451' />#E97451</a> <br><img src="https://www.colorhexa.com/E97451.png" width="50" height='50' />
  lightRedOchre("#E97451", "Light red ochre"),

  /// A color named "Light Salmon" with hexadecimal value <a href='https://www.colorhexa.com/FFA07A' />#FFA07A</a> <br><img src="https://www.colorhexa.com/FFA07A.png" width="50" height='50' />
  lightSalmon('#FFA07A', 'Light Salmon'),

  /// A color named "Light Salmon Pink" with hexadecimal value <a href='https://www.colorhexa.com/FF9999' />#FF9999</a> <br><img src="https://www.colorhexa.com/FF9999.png" width="50" height='50' />
  lightSalmonPink("#FF9999", "Light salmon pink"),

  /// A color named "Light Sea Green" with hexadecimal value <a href='https://www.colorhexa.com/20B2AA' />#20B2AA</a> <br><img src="https://www.colorhexa.com/20B2AA.png" width="50" height='50' />
  lightSeaGreen('#20B2AA', 'Light Sea Green'),

  /// A color named "Light Sky Blue" with hexadecimal value <a href='https://www.colorhexa.com/87CEFA' />#87CEFA</a> <br><img src="https://www.colorhexa.com/87CEFA.png" width="50" height='50' />
  lightSkyBlue('#87CEFA', 'Light Sky Blue'),

  /// A color named "Light Slate Gray" with hexadecimal value <a href='https://www.colorhexa.com/778899' />#778899</a> <br><img src="https://www.colorhexa.com/778899.png" width="50" height='50' />
  lightSlateGray('#778899', 'Light Slate Gray'),

  /// A color named "Light Steel Blue" with hexadecimal value <a href='https://www.colorhexa.com/B0C4DE' />#B0C4DE</a> <br><img src="https://www.colorhexa.com/B0C4DE.png" width="50" height='50' />
  lightSteelBlue('#B0C4DE', 'Light Steel Blue'),

  /// A color named "Light Taupe" with hexadecimal value <a href='https://www.colorhexa.com/B38B6D' />#B38B6D</a> <br><img src="https://www.colorhexa.com/B38B6D.png" width="50" height='50' />
  lightTaupe("#B38B6D", "Light taupe"),

  /// A color named "Light Thulian Pink" with hexadecimal value <a href='https://www.colorhexa.com/E68FAC' />#E68FAC</a> <br><img src="https://www.colorhexa.com/E68FAC.png" width="50" height='50' />
  lightThulianPink("#E68FAC", "Light Thulian pink"),

  /// A color named "Light Yellow" with hexadecimal value <a href='https://www.colorhexa.com/FFFFE0' />#FFFFE0</a> <br><img src="https://www.colorhexa.com/FFFFE0.png" width="50" height='50' />
  lightYellow('#FFFFE0', 'Light Yellow'),

  /// A color named "Lilac" with hexadecimal value <a href='https://www.colorhexa.com/C8A2C8' />#C8A2C8</a> <br><img src="https://www.colorhexa.com/C8A2C8.png" width="50" height='50' />
  lilac("#C8A2C8", "Lilac"),

  /// A color named "Lilac Luster" with hexadecimal value <a href='https://www.colorhexa.com/AE98AA' />#AE98AA</a> <br><img src="https://www.colorhexa.com/AE98AA.png" width="50" height='50' />
  lilacLuster("#AE98AA", "Lilac Luster"),

  /// A color named "Lime" with hexadecimal value <a href='https://www.colorhexa.com/00FF00' />#00FF00</a> <br><img src="https://www.colorhexa.com/00FF00.png" width="50" height='50' />
  lime('#00FF00', 'Lime'),

  /// A color named "Lime Green" with hexadecimal value <a href='https://www.colorhexa.com/32CD32' />#32CD32</a> <br><img src="https://www.colorhexa.com/32CD32.png" width="50" height='50' />
  limeGreen('#32CD32', 'Lime Green'),

  /// A color named "Limerick" with hexadecimal value <a href='https://www.colorhexa.com/9DC209' />#9DC209</a> <br><img src="https://www.colorhexa.com/9DC209.png" width="50" height='50' />
  limerick("#9DC209", "Limerick"),

  /// A color named "Lincoln Green" with hexadecimal value <a href='https://www.colorhexa.com/195905' />#195905</a> <br><img src="https://www.colorhexa.com/195905.png" width="50" height='50' />
  lincolnGreen("#195905", "Lincoln green"),

  /// A color named "Linen" with hexadecimal value <a href='https://www.colorhexa.com/FAF0E6' />#FAF0E6</a> <br><img src="https://www.colorhexa.com/FAF0E6.png" width="50" height='50' />
  linen('#FAF0E6', 'Linen'),

  /// A color named "Lion" with hexadecimal value <a href='https://www.colorhexa.com/C19A6B' />#C19A6B</a> <br><img src="https://www.colorhexa.com/C19A6B.png" width="50" height='50' />
  lion("#C19A6B", "Lion"),

  /// A color named "Liseran Purple" with hexadecimal value <a href='https://www.colorhexa.com/DE6FA1' />#DE6FA1</a> <br><img src="https://www.colorhexa.com/DE6FA1.png" width="50" height='50' />
  liseranPurple("#DE6FA1", "Liseran purple"),

  /// A color named "Little Boy Blue" with hexadecimal value <a href='https://www.colorhexa.com/6CA0DC' />#6CA0DC</a> <br><img src="https://www.colorhexa.com/6CA0DC.png" width="50" height='50' />
  littleBoyBlue("#6CA0DC", "Little boy blue"),

  /// A color named "Liver" with hexadecimal value <a href='https://www.colorhexa.com/674C47' />#674C47</a> <br><img src="https://www.colorhexa.com/674C47.png" width="50" height='50' />
  liver("#674C47", "Liver"),

  /// A color named "Liver Chestnut" with hexadecimal value <a href='https://www.colorhexa.com/987456' />#987456</a> <br><img src="https://www.colorhexa.com/987456.png" width="50" height='50' />
  liverChestnut("#987456", "Liver chestnut"),

  /// A color named "Liver Dogs" with hexadecimal value <a href='https://www.colorhexa.com/B86D29' />#B86D29</a> <br><img src="https://www.colorhexa.com/B86D29.png" width="50" height='50' />
  liverDogs("#B86D29", "Liver (dogs)"),

  /// A color named "Liver Organ" with hexadecimal value <a href='https://www.colorhexa.com/6C2E1F' />#6C2E1F</a> <br><img src="https://www.colorhexa.com/6C2E1F.png" width="50" height='50' />
  liverOrgan("#6C2E1F", "Liver (organ)"),

  /// A color named "Livid" with hexadecimal value <a href='https://www.colorhexa.com/6699CC' />#6699CC</a> <br><img src="https://www.colorhexa.com/6699CC.png" width="50" height='50' />
  livid("#6699CC", "Livid"),

  /// A color named "Lumber" with hexadecimal value <a href='https://www.colorhexa.com/FFE4CD' />#FFE4CD</a> <br><img src="https://www.colorhexa.com/FFE4CD.png" width="50" height='50' />
  lumber("#FFE4CD", "Lumber"),

  /// A color named "Lust" with hexadecimal value <a href='https://www.colorhexa.com/E62020' />#E62020</a> <br><img src="https://www.colorhexa.com/E62020.png" width="50" height='50' />
  lust("#E62020", "Lust"),

  /// A color named "Magenta" with hexadecimal value <a href='https://www.colorhexa.com/FF00FF' />#FF00FF</a> <br><img src="https://www.colorhexa.com/FF00FF.png" width="50" height='50' />
  magenta('#FF00FF', 'Magenta'),

  /// A color named "Magenta Crayola" with hexadecimal value <a href='https://www.colorhexa.com/FF55A3' />#FF55A3</a> <br><img src="https://www.colorhexa.com/FF55A3.png" width="50" height='50' />
  magentaCrayola("#FF55A3", "Magenta (Crayola)"),

  /// A color named "Magenta Dye" with hexadecimal value <a href='https://www.colorhexa.com/CA1F7B' />#CA1F7B</a> <br><img src="https://www.colorhexa.com/CA1F7B.png" width="50" height='50' />
  magentaDye("#CA1F7B", "Magenta (dye)"),

  /// A color named "Magenta Haze" with hexadecimal value <a href='https://www.colorhexa.com/9F4576' />#9F4576</a> <br><img src="https://www.colorhexa.com/9F4576.png" width="50" height='50' />
  magentaHaze("#9F4576", "Magenta haze"),

  /// A color named "Magenta Pantone" with hexadecimal value <a href='https://www.colorhexa.com/D0417E' />#D0417E</a> <br><img src="https://www.colorhexa.com/D0417E.png" width="50" height='50' />
  magentaPantone("#D0417E", "Magenta (Pantone)"),

  /// A color named "Magenta Process" with hexadecimal value <a href='https://www.colorhexa.com/FF0090' />#FF0090</a> <br><img src="https://www.colorhexa.com/FF0090.png" width="50" height='50' />
  magentaProcess("#FF0090", "Magenta (process)"),

  /// A color named "Magic Mint" with hexadecimal value <a href='https://www.colorhexa.com/AAF0D1' />#AAF0D1</a> <br><img src="https://www.colorhexa.com/AAF0D1.png" width="50" height='50' />
  magicMint("#AAF0D1", "Magic mint"),

  /// A color named "Magnolia" with hexadecimal value <a href='https://www.colorhexa.com/F8F4FF' />#F8F4FF</a> <br><img src="https://www.colorhexa.com/F8F4FF.png" width="50" height='50' />
  magnolia("#F8F4FF", "Magnolia"),

  /// A color named "Mahogany" with hexadecimal value <a href='https://www.colorhexa.com/C04000' />#C04000</a> <br><img src="https://www.colorhexa.com/C04000.png" width="50" height='50' />
  mahogany("#C04000", "Mahogany"),

  /// A color named "Maize" with hexadecimal value <a href='https://www.colorhexa.com/FBEC5D' />#FBEC5D</a> <br><img src="https://www.colorhexa.com/FBEC5D.png" width="50" height='50' />
  maize("#FBEC5D", "Maize"),

  /// A color named "Maize Crayola" with hexadecimal value <a href='https://www.colorhexa.com/F2C649' />#F2C649</a> <br><img src="https://www.colorhexa.com/F2C649.png" width="50" height='50' />
  maizeCrayola("#F2C649", "Maize (Crayola)"),

  /// A color named "Majorelle Blue" with hexadecimal value <a href='https://www.colorhexa.com/6050DC' />#6050DC</a> <br><img src="https://www.colorhexa.com/6050DC.png" width="50" height='50' />
  majorelleBlue("#6050DC", "Majorelle blue"),

  /// A color named "Malachite" with hexadecimal value <a href='https://www.colorhexa.com/0BDA51' />#0BDA51</a> <br><img src="https://www.colorhexa.com/0BDA51.png" width="50" height='50' />
  malachite("#0BDA51", "Malachite"),

  /// A color named "Manatee" with hexadecimal value <a href='https://www.colorhexa.com/979AAA' />#979AAA</a> <br><img src="https://www.colorhexa.com/979AAA.png" width="50" height='50' />
  manatee("#979AAA", "Manatee"),

  /// A color named "Mandarin" with hexadecimal value <a href='https://www.colorhexa.com/F37A48' />#F37A48</a> <br><img src="https://www.colorhexa.com/F37A48.png" width="50" height='50' />
  mandarin("#F37A48", "Mandarin"),

  /// A color named "Mango" with hexadecimal value <a href='https://www.colorhexa.com/FDBE02' />#FDBE02</a> <br><img src="https://www.colorhexa.com/FDBE02.png" width="50" height='50' />
  mango("#FDBE02", "Mango"),

  /// A color named "Mango Tango" with hexadecimal value <a href='https://www.colorhexa.com/FF8243' />#FF8243</a> <br><img src="https://www.colorhexa.com/FF8243.png" width="50" height='50' />
  mangoTango("#FF8243", "Mango Tango"),

  /// A color named "Mantis" with hexadecimal value <a href='https://www.colorhexa.com/74C365' />#74C365</a> <br><img src="https://www.colorhexa.com/74C365.png" width="50" height='50' />
  mantis("#74C365", "Mantis"),

  /// A color named "Mardi Gras" with hexadecimal value <a href='https://www.colorhexa.com/880085' />#880085</a> <br><img src="https://www.colorhexa.com/880085.png" width="50" height='50' />
  mardiGras("#880085", "Mardi Gras"),

  /// A color named "Marigold" with hexadecimal value <a href='https://www.colorhexa.com/EAA221' />#EAA221</a> <br><img src="https://www.colorhexa.com/EAA221.png" width="50" height='50' />
  marigold("#EAA221", "Marigold"),

  /// A color named "Maroon" with hexadecimal value <a href='https://www.colorhexa.com/800000' />#800000</a> <br><img src="https://www.colorhexa.com/800000.png" width="50" height='50' />
  maroon('#800000', 'Maroon'),

  /// A color named "Maroon Crayola" with hexadecimal value <a href='https://www.colorhexa.com/C32148' />#C32148</a> <br><img src="https://www.colorhexa.com/C32148.png" width="50" height='50' />
  maroonCrayola("#C32148", "Maroon (Crayola)"),

  /// A color named "Maroon HTML CSS" with hexadecimal value <a href='https://www.colorhexa.com/800000' />#800000</a> <br><img src="https://www.colorhexa.com/800000.png" width="50" height='50' />
  maroonHTMLCSS("#800000", "Maroon (HTML/CSS)"),

  /// A color named "Maroon X11" with hexadecimal value <a href='https://www.colorhexa.com/B03060' />#B03060</a> <br><img src="https://www.colorhexa.com/B03060.png" width="50" height='50' />
  maroonX11("#B03060", "Maroon (X11)"),

  /// A color named "Mauve" with hexadecimal value <a href='https://www.colorhexa.com/E0B0FF' />#E0B0FF</a> <br><img src="https://www.colorhexa.com/E0B0FF.png" width="50" height='50' />
  mauve("#E0B0FF", "Mauve"),

  /// A color named "Mauvelous" with hexadecimal value <a href='https://www.colorhexa.com/EF98AA' />#EF98AA</a> <br><img src="https://www.colorhexa.com/EF98AA.png" width="50" height='50' />
  mauvelous("#EF98AA", "Mauvelous"),

  /// A color named "Mauve Taupe" with hexadecimal value <a href='https://www.colorhexa.com/915F6D' />#915F6D</a> <br><img src="https://www.colorhexa.com/915F6D.png" width="50" height='50' />
  mauveTaupe("#915F6D", "Mauve taupe"),

  /// A color named "Maximum Blue" with hexadecimal value <a href='https://www.colorhexa.com/47ABCC' />#47ABCC</a> <br><img src="https://www.colorhexa.com/47ABCC.png" width="50" height='50' />
  maximumBlue("#47ABCC", "Maximum blue"),

  /// A color named "Maximum Blue Green" with hexadecimal value <a href='https://www.colorhexa.com/30BFBF' />#30BFBF</a> <br><img src="https://www.colorhexa.com/30BFBF.png" width="50" height='50' />
  maximumBlueGreen("#30BFBF", "Maximum blue green"),

  /// A color named "Maximum Blue Purple" with hexadecimal value <a href='https://www.colorhexa.com/ACACE6' />#ACACE6</a> <br><img src="https://www.colorhexa.com/ACACE6.png" width="50" height='50' />
  maximumBluePurple("#ACACE6", "Maximum blue purple"),

  /// A color named "Maximum Green" with hexadecimal value <a href='https://www.colorhexa.com/5E8C31' />#5E8C31</a> <br><img src="https://www.colorhexa.com/5E8C31.png" width="50" height='50' />
  maximumGreen("#5E8C31", "Maximum green"),

  /// A color named "Maximum Green Yellow" with hexadecimal value <a href='https://www.colorhexa.com/D9E650' />#D9E650</a> <br><img src="https://www.colorhexa.com/D9E650.png" width="50" height='50' />
  maximumGreenYellow("#D9E650", "Maximum green yellow"),

  /// A color named "Maximum Purple" with hexadecimal value <a href='https://www.colorhexa.com/733380' />#733380</a> <br><img src="https://www.colorhexa.com/733380.png" width="50" height='50' />
  maximumPurple("#733380", "Maximum purple"),

  /// A color named "Maximum Red" with hexadecimal value <a href='https://www.colorhexa.com/D92121' />#D92121</a> <br><img src="https://www.colorhexa.com/D92121.png" width="50" height='50' />
  maximumRed("#D92121", "Maximum red"),

  /// A color named "Maximum Red Purple" with hexadecimal value <a href='https://www.colorhexa.com/A63A79' />#A63A79</a> <br><img src="https://www.colorhexa.com/A63A79.png" width="50" height='50' />
  maximumRedPurple("#A63A79", "Maximum red purple"),

  /// A color named "Maximum Yellow" with hexadecimal value <a href='https://www.colorhexa.com/FAFA37' />#FAFA37</a> <br><img src="https://www.colorhexa.com/FAFA37.png" width="50" height='50' />
  maximumYellow("#FAFA37", "Maximum yellow"),

  /// A color named "Maximum Yellow Red" with hexadecimal value <a href='https://www.colorhexa.com/F2BA49' />#F2BA49</a> <br><img src="https://www.colorhexa.com/F2BA49.png" width="50" height='50' />
  maximumYellowRed("#F2BA49", "Maximum yellow red"),

  /// A color named "Maya Blue" with hexadecimal value <a href='https://www.colorhexa.com/73C2FB' />#73C2FB</a> <br><img src="https://www.colorhexa.com/73C2FB.png" width="50" height='50' />
  mayaBlue("#73C2FB", "Maya blue"),

  /// A color named "May Green" with hexadecimal value <a href='https://www.colorhexa.com/4C9141' />#4C9141</a> <br><img src="https://www.colorhexa.com/4C9141.png" width="50" height='50' />
  mayGreen("#4C9141", "May green"),

  /// A color named "Medium Aquamarine" with hexadecimal value <a href='https://www.colorhexa.com/66DDAA' />#66DDAA</a> <br><img src="https://www.colorhexa.com/66DDAA.png" width="50" height='50' />
  mediumAquamarine("#66DDAA", "Medium aquamarine"),

  /// A color named "Medium Aqua Marine" with hexadecimal value <a href='https://www.colorhexa.com/66CDAA' />#66CDAA</a> <br><img src="https://www.colorhexa.com/66CDAA.png" width="50" height='50' />
  mediumAquaMarine('#66CDAA', 'Medium Aqua Marine'),

  /// A color named "Medium Blue" with hexadecimal value <a href='https://www.colorhexa.com/0000CD' />#0000CD</a> <br><img src="https://www.colorhexa.com/0000CD.png" width="50" height='50' />
  mediumBlue('#0000CD', 'Medium Blue'),

  /// A color named "Medium Candy Apple Red" with hexadecimal value <a href='https://www.colorhexa.com/E2062C' />#E2062C</a> <br><img src="https://www.colorhexa.com/E2062C.png" width="50" height='50' />
  mediumCandyAppleRed("#E2062C", "Medium candy apple red"),

  /// A color named "Medium Carmine" with hexadecimal value <a href='https://www.colorhexa.com/AF4035' />#AF4035</a> <br><img src="https://www.colorhexa.com/AF4035.png" width="50" height='50' />
  mediumCarmine("#AF4035", "Medium carmine"),

  /// A color named "Medium Champagne" with hexadecimal value <a href='https://www.colorhexa.com/F3E5AB' />#F3E5AB</a> <br><img src="https://www.colorhexa.com/F3E5AB.png" width="50" height='50' />
  mediumChampagne("#F3E5AB", "Medium champagne"),

  /// A color named "Medium Electric Blue" with hexadecimal value <a href='https://www.colorhexa.com/035096' />#035096</a> <br><img src="https://www.colorhexa.com/035096.png" width="50" height='50' />
  mediumElectricBlue("#035096", "Medium electric blue"),

  /// A color named "Medium Jungle Green" with hexadecimal value <a href='https://www.colorhexa.com/1C352D' />#1C352D</a> <br><img src="https://www.colorhexa.com/1C352D.png" width="50" height='50' />
  mediumJungleGreen("#1C352D", "Medium jungle green"),

  /// A color named "Medium Lavender Magenta" with hexadecimal value <a href='https://www.colorhexa.com/DDA0DD' />#DDA0DD</a> <br><img src="https://www.colorhexa.com/DDA0DD.png" width="50" height='50' />
  mediumLavenderMagenta("#DDA0DD", "Medium lavender magenta"),

  /// A color named "Medium Orchid" with hexadecimal value <a href='https://www.colorhexa.com/BA55D3' />#BA55D3</a> <br><img src="https://www.colorhexa.com/BA55D3.png" width="50" height='50' />
  mediumOrchid('#BA55D3', 'Medium Orchid'),

  /// A color named "Medium Persian Blue" with hexadecimal value <a href='https://www.colorhexa.com/0067A5' />#0067A5</a> <br><img src="https://www.colorhexa.com/0067A5.png" width="50" height='50' />
  mediumPersianBlue("#0067A5", "Medium persian blue"),

  /// A color named "Medium Purple" with hexadecimal value <a href='https://www.colorhexa.com/9370DB' />#9370DB</a> <br><img src="https://www.colorhexa.com/9370DB.png" width="50" height='50' />
  mediumPurple('#9370DB', 'Medium Purple'),

  /// A color named "Medium Red Violet" with hexadecimal value <a href='https://www.colorhexa.com/BB3385' />#BB3385</a> <br><img src="https://www.colorhexa.com/BB3385.png" width="50" height='50' />
  mediumRedViolet("#BB3385", "Medium red violet"),

  /// A color named "Medium Ruby" with hexadecimal value <a href='https://www.colorhexa.com/AA4069' />#AA4069</a> <br><img src="https://www.colorhexa.com/AA4069.png" width="50" height='50' />
  mediumRuby("#AA4069", "Medium ruby"),

  /// A color named "Medium Sea Green" with hexadecimal value <a href='https://www.colorhexa.com/3CB371' />#3CB371</a> <br><img src="https://www.colorhexa.com/3CB371.png" width="50" height='50' />
  mediumSeaGreen('#3CB371', 'Medium Sea Green'),

  /// A color named "Medium Sky Blue" with hexadecimal value <a href='https://www.colorhexa.com/80DAEB' />#80DAEB</a> <br><img src="https://www.colorhexa.com/80DAEB.png" width="50" height='50' />
  mediumSkyBlue("#80DAEB", "Medium sky blue"),

  /// A color named "Medium Slate Blue" with hexadecimal value <a href='https://www.colorhexa.com/7B68EE' />#7B68EE</a> <br><img src="https://www.colorhexa.com/7B68EE.png" width="50" height='50' />
  mediumSlateBlue('#7B68EE', 'Medium Slate Blue'),

  /// A color named "Medium Spring Bud" with hexadecimal value <a href='https://www.colorhexa.com/C9DC87' />#C9DC87</a> <br><img src="https://www.colorhexa.com/C9DC87.png" width="50" height='50' />
  mediumSpringBud("#C9DC87", "Medium spring bud"),

  /// A color named "Medium Spring Green" with hexadecimal value <a href='https://www.colorhexa.com/00FA9A' />#00FA9A</a> <br><img src="https://www.colorhexa.com/00FA9A.png" width="50" height='50' />
  mediumSpringGreen('#00FA9A', 'Medium Spring Green'),

  /// A color named "Medium Taupe" with hexadecimal value <a href='https://www.colorhexa.com/674C47' />#674C47</a> <br><img src="https://www.colorhexa.com/674C47.png" width="50" height='50' />
  mediumTaupe("#674C47", "Medium taupe"),

  /// A color named "Medium Turquoise" with hexadecimal value <a href='https://www.colorhexa.com/48D1CC' />#48D1CC</a> <br><img src="https://www.colorhexa.com/48D1CC.png" width="50" height='50' />
  mediumTurquoise('#48D1CC', 'Medium Turquoise'),

  /// A color named "Medium Tuscan Red" with hexadecimal value <a href='https://www.colorhexa.com/79443B' />#79443B</a> <br><img src="https://www.colorhexa.com/79443B.png" width="50" height='50' />
  mediumTuscanRed("#79443B", "Medium tuscan red"),

  /// A color named "Medium Vermilion" with hexadecimal value <a href='https://www.colorhexa.com/D9603B' />#D9603B</a> <br><img src="https://www.colorhexa.com/D9603B.png" width="50" height='50' />
  mediumVermilion("#D9603B", "Medium vermilion"),

  /// A color named "Medium Violet Red" with hexadecimal value <a href='https://www.colorhexa.com/C71585' />#C71585</a> <br><img src="https://www.colorhexa.com/C71585.png" width="50" height='50' />
  mediumVioletRed('#C71585', 'Medium Violet Red'),

  /// A color named "Mellow Apricot" with hexadecimal value <a href='https://www.colorhexa.com/F8B878' />#F8B878</a> <br><img src="https://www.colorhexa.com/F8B878.png" width="50" height='50' />
  mellowApricot("#F8B878", "Mellow apricot"),

  /// A color named "Mellow Yellow" with hexadecimal value <a href='https://www.colorhexa.com/F8DE7E' />#F8DE7E</a> <br><img src="https://www.colorhexa.com/F8DE7E.png" width="50" height='50' />
  mellowYellow("#F8DE7E", "Mellow yellow"),

  /// A color named "Melon" with hexadecimal value <a href='https://www.colorhexa.com/FEBAAD' />#FEBAAD</a> <br><img src="https://www.colorhexa.com/FEBAAD.png" width="50" height='50' />
  melon("#FEBAAD", "Melon"),

  /// A color named "Metallic Seaweed" with hexadecimal value <a href='https://www.colorhexa.com/0A7E8C' />#0A7E8C</a> <br><img src="https://www.colorhexa.com/0A7E8C.png" width="50" height='50' />
  metallicSeaweed("#0A7E8C", "Metallic seaweed"),

  /// A color named "Metallic Sunburst" with hexadecimal value <a href='https://www.colorhexa.com/9C7C38' />#9C7C38</a> <br><img src="https://www.colorhexa.com/9C7C38.png" width="50" height='50' />
  metallicSunburst("#9C7C38", "Metallic sunburst"),

  /// A color named "Mexican Pink" with hexadecimal value <a href='https://www.colorhexa.com/E4007C' />#E4007C</a> <br><img src="https://www.colorhexa.com/E4007C.png" width="50" height='50' />
  mexicanPink("#E4007C", "Mexican pink"),

  /// A color named "Middle Blue" with hexadecimal value <a href='https://www.colorhexa.com/7ED4E6' />#7ED4E6</a> <br><img src="https://www.colorhexa.com/7ED4E6.png" width="50" height='50' />
  middleBlue("#7ED4E6", "Middle blue"),

  /// A color named "Middle Blue Green" with hexadecimal value <a href='https://www.colorhexa.com/8DD9CC' />#8DD9CC</a> <br><img src="https://www.colorhexa.com/8DD9CC.png" width="50" height='50' />
  middleBlueGreen("#8DD9CC", "Middle blue green"),

  /// A color named "Middle Blue Purple" with hexadecimal value <a href='https://www.colorhexa.com/8B72BE' />#8B72BE</a> <br><img src="https://www.colorhexa.com/8B72BE.png" width="50" height='50' />
  middleBluePurple("#8B72BE", "Middle blue purple"),

  /// A color named "Middle Green" with hexadecimal value <a href='https://www.colorhexa.com/4D8C57' />#4D8C57</a> <br><img src="https://www.colorhexa.com/4D8C57.png" width="50" height='50' />
  middleGreen("#4D8C57", "Middle green"),

  /// A color named "Middle Green Yellow" with hexadecimal value <a href='https://www.colorhexa.com/ACBF60' />#ACBF60</a> <br><img src="https://www.colorhexa.com/ACBF60.png" width="50" height='50' />
  middleGreenYellow("#ACBF60", "Middle green yellow"),

  /// A color named "Middle Grey" with hexadecimal value <a href='https://www.colorhexa.com/8B8680' />#8B8680</a> <br><img src="https://www.colorhexa.com/8B8680.png" width="50" height='50' />
  middleGrey("#8B8680", "Middle grey"),

  /// A color named "Middle Purple" with hexadecimal value <a href='https://www.colorhexa.com/D982B5' />#D982B5</a> <br><img src="https://www.colorhexa.com/D982B5.png" width="50" height='50' />
  middlePurple("#D982B5", "Middle purple"),

  /// A color named "Middle Red" with hexadecimal value <a href='https://www.colorhexa.com/E58E73' />#E58E73</a> <br><img src="https://www.colorhexa.com/E58E73.png" width="50" height='50' />
  middleRed("#E58E73", "Middle red"),

  /// A color named "Middle Red Purple" with hexadecimal value <a href='https://www.colorhexa.com/A55353' />#A55353</a> <br><img src="https://www.colorhexa.com/A55353.png" width="50" height='50' />
  middleRedPurple("#A55353", "Middle red purple"),

  /// A color named "Middle Yellow" with hexadecimal value <a href='https://www.colorhexa.com/FFEB00' />#FFEB00</a> <br><img src="https://www.colorhexa.com/FFEB00.png" width="50" height='50' />
  middleYellow("#FFEB00", "Middle yellow"),

  /// A color named "Middle Yellow Red" with hexadecimal value <a href='https://www.colorhexa.com/ECB176' />#ECB176</a> <br><img src="https://www.colorhexa.com/ECB176.png" width="50" height='50' />
  middleYellowRed("#ECB176", "Middle yellow red"),

  /// A color named "Midnight" with hexadecimal value <a href='https://www.colorhexa.com/702670' />#702670</a> <br><img src="https://www.colorhexa.com/702670.png" width="50" height='50' />
  midnight("#702670", "Midnight"),

  /// A color named "Midnight Blue" with hexadecimal value <a href='https://www.colorhexa.com/191970' />#191970</a> <br><img src="https://www.colorhexa.com/191970.png" width="50" height='50' />
  midnightBlue('#191970', 'Midnight Blue'),

  /// A color named "Midnight Green" with hexadecimal value <a href='https://www.colorhexa.com/004953' />#004953</a> <br><img src="https://www.colorhexa.com/004953.png" width="50" height='50' />
  midnightGreen("#004953", "Midnight green"),

  /// A color named "Mikado Yellow" with hexadecimal value <a href='https://www.colorhexa.com/FFC40C' />#FFC40C</a> <br><img src="https://www.colorhexa.com/FFC40C.png" width="50" height='50' />
  mikadoYellow("#FFC40C", "Mikado yellow"),

  /// A color named "Milk" with hexadecimal value <a href='https://www.colorhexa.com/FDFFF5' />#FDFFF5</a> <br><img src="https://www.colorhexa.com/FDFFF5.png" width="50" height='50' />
  milk("#FDFFF5", "Milk"),

  /// A color named "Mindaro" with hexadecimal value <a href='https://www.colorhexa.com/E3F988' />#E3F988</a> <br><img src="https://www.colorhexa.com/E3F988.png" width="50" height='50' />
  mindaro("#E3F988", "Mindaro"),

  /// A color named "Ming" with hexadecimal value <a href='https://www.colorhexa.com/36747D' />#36747D</a> <br><img src="https://www.colorhexa.com/36747D.png" width="50" height='50' />
  ming("#36747D", "Ming"),

  /// A color named "Minion Yellow" with hexadecimal value <a href='https://www.colorhexa.com/F5E050' />#F5E050</a> <br><img src="https://www.colorhexa.com/F5E050.png" width="50" height='50' />
  minionYellow("#F5E050", "Minion yellow"),

  /// A color named "Mint" with hexadecimal value <a href='https://www.colorhexa.com/3EB489' />#3EB489</a> <br><img src="https://www.colorhexa.com/3EB489.png" width="50" height='50' />
  mint("#3EB489", "Mint"),

  /// A color named "Mint Cream" with hexadecimal value <a href='https://www.colorhexa.com/F5FFFA' />#F5FFFA</a> <br><img src="https://www.colorhexa.com/F5FFFA.png" width="50" height='50' />
  mintCream('#F5FFFA', 'Mint Cream'),

  /// A color named "Mint Green" with hexadecimal value <a href='https://www.colorhexa.com/98FF98' />#98FF98</a> <br><img src="https://www.colorhexa.com/98FF98.png" width="50" height='50' />
  mintGreen("#98FF98", "Mint green"),

  /// A color named "Misty Moss" with hexadecimal value <a href='https://www.colorhexa.com/BBB477' />#BBB477</a> <br><img src="https://www.colorhexa.com/BBB477.png" width="50" height='50' />
  mistyMoss("#BBB477", "Misty moss"),

  /// A color named "Misty Rose" with hexadecimal value <a href='https://www.colorhexa.com/FFE4E1' />#FFE4E1</a> <br><img src="https://www.colorhexa.com/FFE4E1.png" width="50" height='50' />
  mistyRose('#FFE4E1', 'Misty Rose'),

  /// A color named "Moccasin" with hexadecimal value <a href='https://www.colorhexa.com/FFE4B5' />#FFE4B5</a> <br><img src="https://www.colorhexa.com/FFE4B5.png" width="50" height='50' />
  moccasin('#FFE4B5', 'Moccasin'),

  /// A color named "Mode Beige" with hexadecimal value <a href='https://www.colorhexa.com/967117' />#967117</a> <br><img src="https://www.colorhexa.com/967117.png" width="50" height='50' />
  modeBeige("#967117", "Mode beige"),

  /// A color named "Morning Blue" with hexadecimal value <a href='https://www.colorhexa.com/8DA399' />#8DA399</a> <br><img src="https://www.colorhexa.com/8DA399.png" width="50" height='50' />
  morningBlue("#8DA399", "Morning blue"),

  /// A color named "Moss Green" with hexadecimal value <a href='https://www.colorhexa.com/8A9A5B' />#8A9A5B</a> <br><img src="https://www.colorhexa.com/8A9A5B.png" width="50" height='50' />
  mossGreen("#8A9A5B", "Moss green"),

  /// A color named "Mountain Meadow" with hexadecimal value <a href='https://www.colorhexa.com/30BA8F' />#30BA8F</a> <br><img src="https://www.colorhexa.com/30BA8F.png" width="50" height='50' />
  mountainMeadow("#30BA8F", "Mountain meadow"),

  /// A color named "Mountbatten Pink" with hexadecimal value <a href='https://www.colorhexa.com/997A8D' />#997A8D</a> <br><img src="https://www.colorhexa.com/997A8D.png" width="50" height='50' />
  mountbattenPink("#997A8D", "Mountbatten pink"),

  /// A color named "MSU Green" with hexadecimal value <a href='https://www.colorhexa.com/18453B' />#18453B</a> <br><img src="https://www.colorhexa.com/18453B.png" width="50" height='50' />
  msuGreen("#18453B", "MSU green"),

  /// A color named "Mughal Green" with hexadecimal value <a href='https://www.colorhexa.com/306030' />#306030</a> <br><img src="https://www.colorhexa.com/306030.png" width="50" height='50' />
  mughalGreen("#306030", "Mughal green"),

  /// A color named "Mulberry" with hexadecimal value <a href='https://www.colorhexa.com/C54B8C' />#C54B8C</a> <br><img src="https://www.colorhexa.com/C54B8C.png" width="50" height='50' />
  mulberry("#C54B8C", "Mulberry"),

  /// A color named "Mummy's Tomb" with hexadecimal value <a href='https://www.colorhexa.com/828E84' />#828E84</a> <br><img src="https://www.colorhexa.com/828E84.png" width="50" height='50' />
  mummysTomb("#828E84", "Mummy's tomb"),

  /// A color named "Mustard" with hexadecimal value <a href='https://www.colorhexa.com/FFDB58' />#FFDB58</a> <br><img src="https://www.colorhexa.com/FFDB58.png" width="50" height='50' />
  mustard("#FFDB58", "Mustard"),

  /// A color named "Myrtle Green" with hexadecimal value <a href='https://www.colorhexa.com/317873' />#317873</a> <br><img src="https://www.colorhexa.com/317873.png" width="50" height='50' />
  myrtleGreen("#317873", "Myrtle green"),

  /// A color named "Nadeshiko Pink" with hexadecimal value <a href='https://www.colorhexa.com/F6ADC6' />#F6ADC6</a> <br><img src="https://www.colorhexa.com/F6ADC6.png" width="50" height='50' />
  nadeshikoPink("#F6ADC6", "Nadeshiko pink"),

  /// A color named "Napier Green" with hexadecimal value <a href='https://www.colorhexa.com/2A8000' />#2A8000</a> <br><img src="https://www.colorhexa.com/2A8000.png" width="50" height='50' />
  napierGreen("#2A8000", "Napier green"),

  /// A color named "Naples Yellow" with hexadecimal value <a href='https://www.colorhexa.com/FADA5E' />#FADA5E</a> <br><img src="https://www.colorhexa.com/FADA5E.png" width="50" height='50' />
  naplesYellow("#FADA5E", "Naples yellow"),

  /// A color named "Navajo White" with hexadecimal value <a href='https://www.colorhexa.com/FFDEAD' />#FFDEAD</a> <br><img src="https://www.colorhexa.com/FFDEAD.png" width="50" height='50' />
  navajoWhite('#FFDEAD', 'Navajo White'),

  /// A color named "Navy" with hexadecimal value <a href='https://www.colorhexa.com/000080' />#000080</a> <br><img src="https://www.colorhexa.com/000080.png" width="50" height='50' />
  navy('#000080', 'Navy'),

  /// A color named "Navy Purple" with hexadecimal value <a href='https://www.colorhexa.com/9457EB' />#9457EB</a> <br><img src="https://www.colorhexa.com/9457EB.png" width="50" height='50' />
  navyPurple("#9457EB", "Navy purple"),

  /// A color named "Neon Carrot" with hexadecimal value <a href='https://www.colorhexa.com/FFA343' />#FFA343</a> <br><img src="https://www.colorhexa.com/FFA343.png" width="50" height='50' />
  neonCarrot("#FFA343", "Neon carrot"),

  /// A color named "Neon Fuchsia" with hexadecimal value <a href='https://www.colorhexa.com/FE4164' />#FE4164</a> <br><img src="https://www.colorhexa.com/FE4164.png" width="50" height='50' />
  neonFuchsia("#FE4164", "Neon fuchsia"),

  /// A color named "Neon Green" with hexadecimal value <a href='https://www.colorhexa.com/39FF14' />#39FF14</a> <br><img src="https://www.colorhexa.com/39FF14.png" width="50" height='50' />
  neonGreen("#39FF14", "Neon green"),

  /// A color named "New York Pink" with hexadecimal value <a href='https://www.colorhexa.com/D7837F' />#D7837F</a> <br><img src="https://www.colorhexa.com/D7837F.png" width="50" height='50' />
  newYorkPink("#D7837F", "New York pink"),

  /// A color named "Nickel" with hexadecimal value <a href='https://www.colorhexa.com/727472' />#727472</a> <br><img src="https://www.colorhexa.com/727472.png" width="50" height='50' />
  nickel("#727472", "Nickel"),

  /// A color named "Non Photo Blue" with hexadecimal value <a href='https://www.colorhexa.com/A4DDED' />#A4DDED</a> <br><img src="https://www.colorhexa.com/A4DDED.png" width="50" height='50' />
  nonPhotoBlue("#A4DDED", "Non photo blue"),

  /// A color named "North Texas Green" with hexadecimal value <a href='https://www.colorhexa.com/059033' />#059033</a> <br><img src="https://www.colorhexa.com/059033.png" width="50" height='50' />
  northTexasGreen("#059033", "North Texas green"),

  /// A color named "Nyanza" with hexadecimal value <a href='https://www.colorhexa.com/E9FFDB' />#E9FFDB</a> <br><img src="https://www.colorhexa.com/E9FFDB.png" width="50" height='50' />
  nyanza("#E9FFDB", "Nyanza"),

  /// A color named "Ocean Blue" with hexadecimal value <a href='https://www.colorhexa.com/4F42B5' />#4F42B5</a> <br><img src="https://www.colorhexa.com/4F42B5.png" width="50" height='50' />
  oceanBlue("#4F42B5", "Ocean blue"),

  /// A color named "Ocean Green" with hexadecimal value <a href='https://www.colorhexa.com/48BF91' />#48BF91</a> <br><img src="https://www.colorhexa.com/48BF91.png" width="50" height='50' />
  oceanGreen("#48BF91", "Ocean green"),

  /// A color named "Ochre" with hexadecimal value <a href='https://www.colorhexa.com/CC7722' />#CC7722</a> <br><img src="https://www.colorhexa.com/CC7722.png" width="50" height='50' />
  ochre("#CC7722", "Ochre"),

  /// A color named "Office Green" with hexadecimal value <a href='https://www.colorhexa.com/008000' />#008000</a> <br><img src="https://www.colorhexa.com/008000.png" width="50" height='50' />
  officeGreen("#008000", "Office green"),

  /// A color named "Old Burgundy" with hexadecimal value <a href='https://www.colorhexa.com/43302E' />#43302E</a> <br><img src="https://www.colorhexa.com/43302E.png" width="50" height='50' />
  oldBurgundy("#43302E", "Old burgundy"),

  /// A color named "Old Gold" with hexadecimal value <a href='https://www.colorhexa.com/CFB53B' />#CFB53B</a> <br><img src="https://www.colorhexa.com/CFB53B.png" width="50" height='50' />
  oldGold("#CFB53B", "Old gold"),

  /// A color named "Old Heliotrope" with hexadecimal value <a href='https://www.colorhexa.com/563C5C' />#563C5C</a> <br><img src="https://www.colorhexa.com/563C5C.png" width="50" height='50' />
  oldHeliotrope("#563C5C", "Old heliotrope"),

  /// A color named "Old Lace" with hexadecimal value <a href='https://www.colorhexa.com/FDF5E6' />#FDF5E6</a> <br><img src="https://www.colorhexa.com/FDF5E6.png" width="50" height='50' />
  oldLace('#FDF5E6', 'Old Lace'),

  /// A color named "Old Lavender" with hexadecimal value <a href='https://www.colorhexa.com/796878' />#796878</a> <br><img src="https://www.colorhexa.com/796878.png" width="50" height='50' />
  oldLavender("#796878", "Old lavender"),

  /// A color named "Old Mauve" with hexadecimal value <a href='https://www.colorhexa.com/673147' />#673147</a> <br><img src="https://www.colorhexa.com/673147.png" width="50" height='50' />
  oldMauve("#673147", "Old mauve"),

  /// A color named "Old Moss Green" with hexadecimal value <a href='https://www.colorhexa.com/867E36' />#867E36</a> <br><img src="https://www.colorhexa.com/867E36.png" width="50" height='50' />
  oldMossGreen("#867E36", "Old moss green"),

  /// A color named "Old Rose" with hexadecimal value <a href='https://www.colorhexa.com/C08081' />#C08081</a> <br><img src="https://www.colorhexa.com/C08081.png" width="50" height='50' />
  oldRose("#C08081", "Old rose"),

  /// A color named "Old Silver" with hexadecimal value <a href='https://www.colorhexa.com/848482' />#848482</a> <br><img src="https://www.colorhexa.com/848482.png" width="50" height='50' />
  oldSilver("#848482", "Old silver"),

  /// A color named "Olive" with hexadecimal value <a href='https://www.colorhexa.com/808000' />#808000</a> <br><img src="https://www.colorhexa.com/808000.png" width="50" height='50' />
  olive('#808000', 'Olive'),

  /// A color named "Olive Drab" with hexadecimal value <a href='https://www.colorhexa.com/6B8E23' />#6B8E23</a> <br><img src="https://www.colorhexa.com/6B8E23.png" width="50" height='50' />
  oliveDrab('#6B8E23', 'Olive Drab'),

  /// A color named "Olive Green" with hexadecimal value <a href='https://www.colorhexa.com/B5B35C' />#B5B35C</a> <br><img src="https://www.colorhexa.com/B5B35C.png" width="50" height='50' />
  oliveGreen("#B5B35C", "Olive green"),

  /// A color named "Olivine" with hexadecimal value <a href='https://www.colorhexa.com/9AB973' />#9AB973</a> <br><img src="https://www.colorhexa.com/9AB973.png" width="50" height='50' />
  olivine("#9AB973", "Olivine"),

  /// A color named "Onyx" with hexadecimal value <a href='https://www.colorhexa.com/353839' />#353839</a> <br><img src="https://www.colorhexa.com/353839.png" width="50" height='50' />
  onyx("#353839", "Onyx"),

  /// A color named "Opal" with hexadecimal value <a href='https://www.colorhexa.com/A8C3BC' />#A8C3BC</a> <br><img src="https://www.colorhexa.com/A8C3BC.png" width="50" height='50' />
  opal("#A8C3BC", "Opal"),

  /// A color named "Opera Mauve" with hexadecimal value <a href='https://www.colorhexa.com/B784A7' />#B784A7</a> <br><img src="https://www.colorhexa.com/B784A7.png" width="50" height='50' />
  operaMauve("#B784A7", "Opera mauve"),

  /// A color named "Orange" with hexadecimal value <a href='https://www.colorhexa.com/FFA500' />#FFA500</a> <br><img src="https://www.colorhexa.com/FFA500.png" width="50" height='50' />
  orange('#FFA500', 'Orange'),

  /// A color named "Orange Peel" with hexadecimal value <a href='https://www.colorhexa.com/FF9F00' />#FF9F00</a> <br><img src="https://www.colorhexa.com/FF9F00.png" width="50" height='50' />
  orangePeel("#FF9F00", "Orange peel"),

  /// A color named "Orange Red" with hexadecimal value <a href='https://www.colorhexa.com/FF4500' />#FF4500</a> <br><img src="https://www.colorhexa.com/FF4500.png" width="50" height='50' />
  orangeRed('#FF4500', 'Orange Red'),

  /// A color named "Orange Soda" with hexadecimal value <a href='https://www.colorhexa.com/FA5B3D' />#FA5B3D</a> <br><img src="https://www.colorhexa.com/FA5B3D.png" width="50" height='50' />
  orangeSoda("#FA5B3D", "Orange soda"),

  /// A color named "Orange Yellow" with hexadecimal value <a href='https://www.colorhexa.com/F5BD1F' />#F5BD1F</a> <br><img src="https://www.colorhexa.com/F5BD1F.png" width="50" height='50' />
  orangeYellow("#F5BD1F", "Orange yellow"),

  /// A color named "Orchid" with hexadecimal value <a href='https://www.colorhexa.com/DA70D6' />#DA70D6</a> <br><img src="https://www.colorhexa.com/DA70D6.png" width="50" height='50' />
  orchid('#DA70D6', 'Orchid'),

  /// A color named "Orchid Pink" with hexadecimal value <a href='https://www.colorhexa.com/F2BDCD' />#F2BDCD</a> <br><img src="https://www.colorhexa.com/F2BDCD.png" width="50" height='50' />
  orchidPink("#F2BDCD", "Orchid pink"),

  /// A color named "Orioles Orange" with hexadecimal value <a href='https://www.colorhexa.com/FB4F14' />#FB4F14</a> <br><img src="https://www.colorhexa.com/FB4F14.png" width="50" height='50' />
  oriolesOrange("#FB4F14", "Orioles orange"),

  /// A color named "Otter Brown" with hexadecimal value <a href='https://www.colorhexa.com/654321' />#654321</a> <br><img src="https://www.colorhexa.com/654321.png" width="50" height='50' />
  otterBrown("#654321", "Otter brown"),

  /// A color named "OU Crimson Red" with hexadecimal value <a href='https://www.colorhexa.com/990000' />#990000</a> <br><img src="https://www.colorhexa.com/990000.png" width="50" height='50' />
  ouCrimsonRed("#990000", "OU crimson red"),

  /// A color named "Outer Space" with hexadecimal value <a href='https://www.colorhexa.com/414A4C' />#414A4C</a> <br><img src="https://www.colorhexa.com/414A4C.png" width="50" height='50' />
  outerSpace("#414A4C", "Outer space"),

  /// A color named "Outrageous Orange" with hexadecimal value <a href='https://www.colorhexa.com/FF6E4A' />#FF6E4A</a> <br><img src="https://www.colorhexa.com/FF6E4A.png" width="50" height='50' />
  outrageousOrange("#FF6E4A", "Outrageous orange"),

  /// A color named "Oxblood" with hexadecimal value <a href='https://www.colorhexa.com/4A0000' />#4A0000</a> <br><img src="https://www.colorhexa.com/4A0000.png" width="50" height='50' />
  oxblood("#4A0000", "Oxblood"),

  /// A color named "Oxford Blue" with hexadecimal value <a href='https://www.colorhexa.com/002147' />#002147</a> <br><img src="https://www.colorhexa.com/002147.png" width="50" height='50' />
  oxfordBlue("#002147", "Oxford blue"),

  /// A color named "Pacific Blue" with hexadecimal value <a href='https://www.colorhexa.com/1CA9C9' />#1CA9C9</a> <br><img src="https://www.colorhexa.com/1CA9C9.png" width="50" height='50' />
  pacificBlue("#1CA9C9", "Pacific blue"),

  /// A color named "Pakistan Green" with hexadecimal value <a href='https://www.colorhexa.com/006600' />#006600</a> <br><img src="https://www.colorhexa.com/006600.png" width="50" height='50' />
  pakistanGreen("#006600", "Pakistan green"),

  /// A color named "Palatinate Blue" with hexadecimal value <a href='https://www.colorhexa.com/273BE2' />#273BE2</a> <br><img src="https://www.colorhexa.com/273BE2.png" width="50" height='50' />
  palatinateBlue("#273BE2", "Palatinate blue"),

  /// A color named "Palatinate Purple" with hexadecimal value <a href='https://www.colorhexa.com/682860' />#682860</a> <br><img src="https://www.colorhexa.com/682860.png" width="50" height='50' />
  palatinatePurple("#682860", "Palatinate purple"),

  /// A color named "Pale Aqua" with hexadecimal value <a href='https://www.colorhexa.com/BCD4E6' />#BCD4E6</a> <br><img src="https://www.colorhexa.com/BCD4E6.png" width="50" height='50' />
  paleAqua("#BCD4E6", "Pale aqua"),

  /// A color named "Pale Blue" with hexadecimal value <a href='https://www.colorhexa.com/AFEEEE' />#AFEEEE</a> <br><img src="https://www.colorhexa.com/AFEEEE.png" width="50" height='50' />
  paleBlue("#AFEEEE", "Pale blue"),

  /// A color named "Pale Brown" with hexadecimal value <a href='https://www.colorhexa.com/987654' />#987654</a> <br><img src="https://www.colorhexa.com/987654.png" width="50" height='50' />
  paleBrown("#987654", "Pale brown"),

  /// A color named "Pale Carmine" with hexadecimal value <a href='https://www.colorhexa.com/AF4035' />#AF4035</a> <br><img src="https://www.colorhexa.com/AF4035.png" width="50" height='50' />
  paleCarmine("#AF4035", "Pale carmine"),

  /// A color named "Pale Cerulean" with hexadecimal value <a href='https://www.colorhexa.com/9BC4E2' />#9BC4E2</a> <br><img src="https://www.colorhexa.com/9BC4E2.png" width="50" height='50' />
  paleCerulean("#9BC4E2", "Pale cerulean"),

  /// A color named "Pale Chestnut" with hexadecimal value <a href='https://www.colorhexa.com/DDADAF' />#DDADAF</a> <br><img src="https://www.colorhexa.com/DDADAF.png" width="50" height='50' />
  paleChestnut("#DDADAF", "Pale chestnut"),

  /// A color named "Pale Copper" with hexadecimal value <a href='https://www.colorhexa.com/DA8A67' />#DA8A67</a> <br><img src="https://www.colorhexa.com/DA8A67.png" width="50" height='50' />
  paleCopper("#DA8A67", "Pale copper"),

  /// A color named "Pale Cornflower Blue" with hexadecimal value <a href='https://www.colorhexa.com/ABCDEF' />#ABCDEF</a> <br><img src="https://www.colorhexa.com/ABCDEF.png" width="50" height='50' />
  paleCornflowerBlue("#ABCDEF", "Pale cornflower blue"),

  /// A color named "Pale Cyan" with hexadecimal value <a href='https://www.colorhexa.com/87D3F8' />#87D3F8</a> <br><img src="https://www.colorhexa.com/87D3F8.png" width="50" height='50' />
  paleCyan("#87D3F8", "Pale cyan"),

  /// A color named "Pale Gold" with hexadecimal value <a href='https://www.colorhexa.com/E6BE8A' />#E6BE8A</a> <br><img src="https://www.colorhexa.com/E6BE8A.png" width="50" height='50' />
  paleGold("#E6BE8A", "Pale gold"),

  /// A color named "Pale Goldenrod" with hexadecimal value <a href='https://www.colorhexa.com/EEE8AA' />#EEE8AA</a> <br><img src="https://www.colorhexa.com/EEE8AA.png" width="50" height='50' />
  paleGoldenrod("#EEE8AA", "Pale goldenrod"),

  /// A color named "Pale Golden Rod" with hexadecimal value <a href='https://www.colorhexa.com/EEE8AA' />#EEE8AA</a> <br><img src="https://www.colorhexa.com/EEE8AA.png" width="50" height='50' />
  paleGoldenRod('#EEE8AA', 'Pale Golden Rod'),

  /// A color named "Pale Green" with hexadecimal value <a href='https://www.colorhexa.com/98FB98' />#98FB98</a> <br><img src="https://www.colorhexa.com/98FB98.png" width="50" height='50' />
  paleGreen('#98FB98', 'Pale Green'),

  /// A color named "Pale Lavender" with hexadecimal value <a href='https://www.colorhexa.com/DCD0FF' />#DCD0FF</a> <br><img src="https://www.colorhexa.com/DCD0FF.png" width="50" height='50' />
  paleLavender("#DCD0FF", "Pale lavender"),

  /// A color named "Pale Magenta" with hexadecimal value <a href='https://www.colorhexa.com/F984E5' />#F984E5</a> <br><img src="https://www.colorhexa.com/F984E5.png" width="50" height='50' />
  paleMagenta("#F984E5", "Pale magenta"),

  /// A color named "Pale Magenta Pink" with hexadecimal value <a href='https://www.colorhexa.com/FF99CC' />#FF99CC</a> <br><img src="https://www.colorhexa.com/FF99CC.png" width="50" height='50' />
  paleMagentaPink("#FF99CC", "Pale magenta pink"),

  /// A color named "Pale Pink" with hexadecimal value <a href='https://www.colorhexa.com/FADADD' />#FADADD</a> <br><img src="https://www.colorhexa.com/FADADD.png" width="50" height='50' />
  palePink("#FADADD", "Pale pink"),

  /// A color named "Pale Plum" with hexadecimal value <a href='https://www.colorhexa.com/DDA0DD' />#DDA0DD</a> <br><img src="https://www.colorhexa.com/DDA0DD.png" width="50" height='50' />
  palePlum("#DDA0DD", "Pale plum"),

  /// A color named "Pale Red Violet" with hexadecimal value <a href='https://www.colorhexa.com/DB7093' />#DB7093</a> <br><img src="https://www.colorhexa.com/DB7093.png" width="50" height='50' />
  paleRedViolet("#DB7093", "Pale red violet"),

  /// A color named "Pale Robin Egg Blue" with hexadecimal value <a href='https://www.colorhexa.com/96DED1' />#96DED1</a> <br><img src="https://www.colorhexa.com/96DED1.png" width="50" height='50' />
  paleRobinEggBlue("#96DED1", "Pale robin egg blue"),

  /// A color named "Pale Silver" with hexadecimal value <a href='https://www.colorhexa.com/C9C0BB' />#C9C0BB</a> <br><img src="https://www.colorhexa.com/C9C0BB.png" width="50" height='50' />
  paleSilver("#C9C0BB", "Pale silver"),

  /// A color named "Pale Spring Bud" with hexadecimal value <a href='https://www.colorhexa.com/ECEBBD' />#ECEBBD</a> <br><img src="https://www.colorhexa.com/ECEBBD.png" width="50" height='50' />
  paleSpringBud("#ECEBBD", "Pale spring bud"),

  /// A color named "Pale Taupe" with hexadecimal value <a href='https://www.colorhexa.com/BC987E' />#BC987E</a> <br><img src="https://www.colorhexa.com/BC987E.png" width="50" height='50' />
  paleTaupe("#BC987E", "Pale taupe"),

  /// A color named "Pale Turquoise" with hexadecimal value <a href='https://www.colorhexa.com/AFEEEE' />#AFEEEE</a> <br><img src="https://www.colorhexa.com/AFEEEE.png" width="50" height='50' />
  paleTurquoise('#AFEEEE', 'Pale Turquoise'),

  /// A color named "Pale Violet" with hexadecimal value <a href='https://www.colorhexa.com/CC99FF' />#CC99FF</a> <br><img src="https://www.colorhexa.com/CC99FF.png" width="50" height='50' />
  paleViolet("#CC99FF", "Pale violet"),

  /// A color named "Pale Violet Red" with hexadecimal value <a href='https://www.colorhexa.com/DB7093' />#DB7093</a> <br><img src="https://www.colorhexa.com/DB7093.png" width="50" height='50' />
  paleVioletRed('#DB7093', 'Pale Violet Red'),

  /// A color named "Pansy Purple" with hexadecimal value <a href='https://www.colorhexa.com/78184A' />#78184A</a> <br><img src="https://www.colorhexa.com/78184A.png" width="50" height='50' />
  pansyPurple("#78184A", "Pansy purple"),

  /// A color named "Paolo Veronese Green" with hexadecimal value <a href='https://www.colorhexa.com/009B7D' />#009B7D</a> <br><img src="https://www.colorhexa.com/009B7D.png" width="50" height='50' />
  paoloVeroneseGreen("#009B7D", "Paolo Veronese green"),

  /// A color named "Pastel Brown" with hexadecimal value <a href='https://www.colorhexa.com/836953' />#836953</a> <br><img src="https://www.colorhexa.com/836953.png" width="50" height='50' />
  pastelBrown("#836953", "Pastel brown"),

  /// A color named "Pastel Gray" with hexadecimal value <a href='https://www.colorhexa.com/CFCFC4' />#CFCFC4</a> <br><img src="https://www.colorhexa.com/CFCFC4.png" width="50" height='50' />
  pastelGray("#CFCFC4", "Pastel gray"),

  /// A color named "Pastel Green" with hexadecimal value <a href='https://www.colorhexa.com/77DD77' />#77DD77</a> <br><img src="https://www.colorhexa.com/77DD77.png" width="50" height='50' />
  pastelGreen("#77DD77", "Pastel green"),

  /// A color named "Pastel Magenta" with hexadecimal value <a href='https://www.colorhexa.com/F49AC2' />#F49AC2</a> <br><img src="https://www.colorhexa.com/F49AC2.png" width="50" height='50' />
  pastelMagenta("#F49AC2", "Pastel magenta"),

  /// A color named "Pastel Orange" with hexadecimal value <a href='https://www.colorhexa.com/FFB347' />#FFB347</a> <br><img src="https://www.colorhexa.com/FFB347.png" width="50" height='50' />
  pastelOrange("#FFB347", "Pastel orange"),

  /// A color named "Pastel Pink" with hexadecimal value <a href='https://www.colorhexa.com/FFD1DC' />#FFD1DC</a> <br><img src="https://www.colorhexa.com/FFD1DC.png" width="50" height='50' />
  pastelPink("#FFD1DC", "Pastel pink"),

  /// A color named "Pastel Purple" with hexadecimal value <a href='https://www.colorhexa.com/B39EB5' />#B39EB5</a> <br><img src="https://www.colorhexa.com/B39EB5.png" width="50" height='50' />
  pastelPurple("#B39EB5", "Pastel purple"),

  /// A color named "Pastel Red" with hexadecimal value <a href='https://www.colorhexa.com/FF6961' />#FF6961</a> <br><img src="https://www.colorhexa.com/FF6961.png" width="50" height='50' />
  pastelRed("#FF6961", "Pastel red"),

  /// A color named "Pastel Violet" with hexadecimal value <a href='https://www.colorhexa.com/CB99C9' />#CB99C9</a> <br><img src="https://www.colorhexa.com/CB99C9.png" width="50" height='50' />
  pastelViolet("#CB99C9", "Pastel violet"),

  /// A color named "Pastel Yellow" with hexadecimal value <a href='https://www.colorhexa.com/FDFD96' />#FDFD96</a> <br><img src="https://www.colorhexa.com/FDFD96.png" width="50" height='50' />
  pastelYellow("#FDFD96", "Pastel yellow"),

  /// A color named "Patriarch" with hexadecimal value <a href='https://www.colorhexa.com/800080' />#800080</a> <br><img src="https://www.colorhexa.com/800080.png" width="50" height='50' />
  patriarch("#800080", "Patriarch"),

  /// A color named "Payne's Grey" with hexadecimal value <a href='https://www.colorhexa.com/536878' />#536878</a> <br><img src="https://www.colorhexa.com/536878.png" width="50" height='50' />
  paynesGrey("#536878", "Payne's grey"),

  /// A color named "Peach" with hexadecimal value <a href='https://www.colorhexa.com/FFE5B4' />#FFE5B4</a> <br><img src="https://www.colorhexa.com/FFE5B4.png" width="50" height='50' />
  peach("#FFE5B4", "Peach"),

  /// A color named "Peach (Crayola)" with hexadecimal value <a href='https://www.colorhexa.com/FFCBA4' />#FFCBA4</a> <br><img src="https://www.colorhexa.com/FFCBA4.png" width="50" height='50' />
  peachCrayola("#FFCBA4", "Peach (Crayola)"),

  /// A color named "Peach Orange" with hexadecimal value <a href='https://www.colorhexa.com/FFCC99' />#FFCC99</a> <br><img src="https://www.colorhexa.com/FFCC99.png" width="50" height='50' />
  peachOrange("#FFCC99", "Peach orange"),

  /// A color named "Peach Puff" with hexadecimal value <a href='https://www.colorhexa.com/FFDAB9' />#FFDAB9</a> <br><img src="https://www.colorhexa.com/FFDAB9.png" width="50" height='50' />
  peachPuff('#FFDAB9', 'Peach Puff'),

  /// A color named "Peach Yellow" with hexadecimal value <a href='https://www.colorhexa.com/FADFAD' />#FADFAD</a> <br><img src="https://www.colorhexa.com/FADFAD.png" width="50" height='50' />
  peachYellow("#FADFAD", "Peach yellow"),

  /// A color named "Pear" with hexadecimal value <a href='https://www.colorhexa.com/D1E231' />#D1E231</a> <br><img src="https://www.colorhexa.com/D1E231.png" width="50" height='50' />
  pear("#D1E231", "Pear"),

  /// A color named "Pearl" with hexadecimal value <a href='https://www.colorhexa.com/EAE0C8' />#EAE0C8</a> <br><img src="https://www.colorhexa.com/EAE0C8.png" width="50" height='50' />
  pearl("#EAE0C8", "Pearl"),

  /// A color named "Pearl Aqua" with hexadecimal value <a href='https://www.colorhexa.com/88D8C0' />#88D8C0</a> <br><img src="https://www.colorhexa.com/88D8C0.png" width="50" height='50' />
  pearlAqua("#88D8C0", "Pearl aqua"),

  /// A color named "Pearly Purple" with hexadecimal value <a href='https://www.colorhexa.com/B768A2' />#B768A2</a> <br><img src="https://www.colorhexa.com/B768A2.png" width="50" height='50' />
  pearlyPurple("#B768A2", "Pearly purple"),

  /// A color named "Peridot" with hexadecimal value <a href='https://www.colorhexa.com/E6E200' />#E6E200</a> <br><img src="https://www.colorhexa.com/E6E200.png" width="50" height='50' />
  peridot("#E6E200", "Peridot"),

  /// A color named "Periwinkle" with hexadecimal value <a href='https://www.colorhexa.com/CCCCFF' />#CCCCFF</a> <br><img src="https://www.colorhexa.com/CCCCFF.png" width="50" height='50' />
  periwinkle("#CCCCFF", "Periwinkle"),

  /// A color named "Periwinkle (Crayola)" with hexadecimal value <a href='https://www.colorhexa.com/C3CDE6' />#C3CDE6</a> <br><img src="https://www.colorhexa.com/C3CDE6.png" width="50" height='50' />
  periwinkleCrayola("#C3CDE6", "Periwinkle (Crayola)"),

  /// A color named "Permanent Geranium Lake" with hexadecimal value <a href='https://www.colorhexa.com/E12C2C' />#E12C2C</a> <br><img src="https://www.colorhexa.com/E12C2C.png" width="50" height='50' />
  permanentGeraniumLake("#E12C2C", "Permanent geranium lake"),

  /// A color named "Persian Blue" with hexadecimal value <a href='https://www.colorhexa.com/1C39BB' />#1C39BB</a> <br><img src="https://www.colorhexa.com/1C39BB.png" width="50" height='50' />
  persianBlue("#1C39BB", "Persian blue"),

  /// A color named "Persian Green" with hexadecimal value <a href='https://www.colorhexa.com/00A693' />#00A693</a> <br><img src="https://www.colorhexa.com/00A693.png" width="50" height='50' />
  persianGreen("#00A693", "Persian green"),

  /// A color named "Persian Indigo" with hexadecimal value <a href='https://www.colorhexa.com/32127A' />#32127A</a> <br><img src="https://www.colorhexa.com/32127A.png" width="50" height='50' />
  persianIndigo("#32127A", "Persian indigo"),

  /// A color named "Persian Orange" with hexadecimal value <a href='https://www.colorhexa.com/D99058' />#D99058</a> <br><img src="https://www.colorhexa.com/D99058.png" width="50" height='50' />
  persianOrange("#D99058", "Persian orange"),

  /// A color named "Persian Pink" with hexadecimal value <a href='https://www.colorhexa.com/F77FBE' />#F77FBE</a> <br><img src="https://www.colorhexa.com/F77FBE.png" width="50" height='50' />
  persianPink("#F77FBE", "Persian pink"),

  /// A color named "Persian Plum" with hexadecimal value <a href='https://www.colorhexa.com/701C1C' />#701C1C</a> <br><img src="https://www.colorhexa.com/701C1C.png" width="50" height='50' />
  persianPlum("#701C1C", "Persian plum"),

  /// A color named "Persian Red" with hexadecimal value <a href='https://www.colorhexa.com/CC3333' />#CC3333</a> <br><img src="https://www.colorhexa.com/CC3333.png" width="50" height='50' />
  persianRed("#CC3333", "Persian red"),

  /// A color named "Persian Rose" with hexadecimal value <a href='https://www.colorhexa.com/FE28A2' />#FE28A2</a> <br><img src="https://www.colorhexa.com/FE28A2.png" width="50" height='50' />
  persianRose("#FE28A2", "Persian rose"),

  /// A color named "Persimmon" with hexadecimal value <a href='https://www.colorhexa.com/EC5800' />#EC5800</a> <br><img src="https://www.colorhexa.com/EC5800.png" width="50" height='50' />
  persimmon("#EC5800", "Persimmon"),

  /// A color named "Peru" with hexadecimal value <a href='https://www.colorhexa.com/CD853F' />#CD853F</a> <br><img src="https://www.colorhexa.com/CD853F.png" width="50" height='50' />
  peru('#CD853F', 'Peru'),

  /// A color named "Phlox" with hexadecimal value <a href='https://www.colorhexa.com/DF00FF' />#DF00FF</a> <br><img src="https://www.colorhexa.com/DF00FF.png" width="50" height='50' />
  phlox("#DF00FF", "Phlox"),

  /// A color named "Phthalo Blue" with hexadecimal value <a href='https://www.colorhexa.com/000F89' />#000F89</a> <br><img src="https://www.colorhexa.com/000F89.png" width="50" height='50' />
  phthaloBlue("#000F89", "Phthalo blue"),

  /// A color named "Phthalo Green" with hexadecimal value <a href='https://www.colorhexa.com/123524' />#123524</a> <br><img src="https://www.colorhexa.com/123524.png" width="50" height='50' />
  phthaloGreen("#123524", "Phthalo green"),

  /// A color named "Picton Blue" with hexadecimal value <a href='https://www.colorhexa.com/45B1E8' />#45B1E8</a> <br><img src="https://www.colorhexa.com/45B1E8.png" width="50" height='50' />
  pictonBlue("#45B1E8", "Picton blue"),

  /// A color named "Pictorial Carmine" with hexadecimal value <a href='https://www.colorhexa.com/C30B4E' />#C30B4E</a> <br><img src="https://www.colorhexa.com/C30B4E.png" width="50" height='50' />
  pictorialCarmine("#C30B4E", "Pictorial carmine"),

  /// A color named "Piggy Pink" with hexadecimal value <a href='https://www.colorhexa.com/FDDDE6' />#FDDDE6</a> <br><img src="https://www.colorhexa.com/FDDDE6.png" width="50" height='50' />
  piggyPink("#FDDDE6", "Piggy pink"),

  /// A color named "Pine Green" with hexadecimal value <a href='https://www.colorhexa.com/01796F' />#01796F</a> <br><img src="https://www.colorhexa.com/01796F.png" width="50" height='50' />
  pineGreen("#01796F", "Pine green"),

  /// A color named "Pine Tree" with hexadecimal value <a href='https://www.colorhexa.com/2A2F23' />#2A2F23</a> <br><img src="https://www.colorhexa.com/2A2F23.png" width="50" height='50' />
  pineTree("#2A2F23", "Pine tree"),

  /// A color named "Pink" with hexadecimal value <a href='https://www.colorhexa.com/FFC0CB' />#FFC0CB</a> <br><img src="https://www.colorhexa.com/FFC0CB.png" width="50" height='50' />
  pink('#FFC0CB', 'Pink'),

  /// A color named "Pink Flamingo" with hexadecimal value <a href='https://www.colorhexa.com/FC74FD' />#FC74FD</a> <br><img src="https://www.colorhexa.com/FC74FD.png" width="50" height='50' />
  pinkFlamingo("#FC74FD", "Pink flamingo"),

  /// A color named "Pink Lace" with hexadecimal value <a href='https://www.colorhexa.com/FFDDF4' />#FFDDF4</a> <br><img src="https://www.colorhexa.com/FFDDF4.png" width="50" height='50' />
  pinkLace("#FFDDF4", "Pink lace"),

  /// A color named "Pink Lavender" with hexadecimal value <a href='https://www.colorhexa.com/D8B2D1' />#D8B2D1</a> <br><img src="https://www.colorhexa.com/D8B2D1.png" width="50" height='50' />
  pinkLavender("#D8B2D1", "Pink lavender"),

  /// A color named "Pink Orange" with hexadecimal value <a href='https://www.colorhexa.com/FF9966' />#FF9966</a> <br><img src="https://www.colorhexa.com/FF9966.png" width="50" height='50' />
  pinkOrange("#FF9966", "Pink orange"),

  /// A color named "Pink Pearl" with hexadecimal value <a href='https://www.colorhexa.com/E7ACCF' />#E7ACCF</a> <br><img src="https://www.colorhexa.com/E7ACCF.png" width="50" height='50' />
  pinkPearl("#E7ACCF", "Pink pearl"),

  /// A color named "Pink Raspberry" with hexadecimal value <a href='https://www.colorhexa.com/980036' />#980036</a> <br><img src="https://www.colorhexa.com/980036.png" width="50" height='50' />
  pinkRaspberry("#980036", "Pink raspberry"),

  /// A color named "Pink Sherbet" with hexadecimal value <a href='https://www.colorhexa.com/F78FA7' />#F78FA7</a> <br><img src="https://www.colorhexa.com/F78FA7.png" width="50" height='50' />
  pinkSherbet("#F78FA7", "Pink sherbet"),

  /// A color named "Pistachio" with hexadecimal value <a href='https://www.colorhexa.com/93C572' />#93C572</a> <br><img src="https://www.colorhexa.com/93C572.png" width="50" height='50' />
  pistachio("#93C572", "Pistachio"),

  /// A color named "Platinum" with hexadecimal value <a href='https://www.colorhexa.com/E5E4E2' />#E5E4E2</a> <br><img src="https://www.colorhexa.com/E5E4E2.png" width="50" height='50' />
  platinum("#E5E4E2", "Platinum"),

  /// A color named "Plum" with hexadecimal value <a href='https://www.colorhexa.com/DDA0DD' />#DDA0DD</a> <br><img src="https://www.colorhexa.com/DDA0DD.png" width="50" height='50' />
  plum('#DDA0DD', 'Plum'),

  /// A color named "Plump Purple" with hexadecimal value <a href='https://www.colorhexa.com/5946B2' />#5946B2</a> <br><img src="https://www.colorhexa.com/5946B2.png" width="50" height='50' />
  plumpPurple("#5946B2", "Plump purple"),

  /// A color named "Plum (Web)" with hexadecimal value <a href='https://www.colorhexa.com/8E4585' />#8E4585</a> <br><img src="https://www.colorhexa.com/8E4585.png" width="50" height='50' />
  plumWeb("#8E4585", "Plum (web)"),

  /// A color named "Polished Pine" with hexadecimal value <a href='https://www.colorhexa.com/5DA493' />#5DA493</a> <br><img src="https://www.colorhexa.com/5DA493.png" width="
  puce("#CC8899", "Puce"),

  /// A color named "Puce Red" with hexadecimal value <a href='https://www.colorhexa.com/722F37' />#722F37</a> <br><img src="https://www.colorhexa.com/722F37.png" width="50" height='50' />
  puceRed("#722F37", "Puce red"),

  /// A color named "Pullman Brown" with hexadecimal value <a href='https://www.colorhexa.com/644117' />#644117</a> <br><img src="https://www.colorhexa.com/644117.png" width="50" height='50' />
  pullmanBrown("#644117", "Pullman brown"),

  /// A color named "Pullman Green" with hexadecimal value <a href='https://www.colorhexa.com/3B331C' />#3B331C</a> <br><img src="https://www.colorhexa.com/3B331C.png" width="50" height='50' />
  pullmanGreen("#3B331C", "Pullman green"),

  /// A color named "Pumpkin" with hexadecimal value <a href='https://www.colorhexa.com/FF7518' />#FF7518</a> <br><img src="https://www.colorhexa.com/FF7518.png" width="50" height='50' />
  pumpkin("#FF7518", "Pumpkin"),

  /// A color named "Purple" with hexadecimal value <a href='https://www.colorhexa.com/800080' />#800080</a> <br><img src="https://www.colorhexa.com/800080.png" width="50" height='50' />
  purple('#800080', 'Purple'),

  /// A color named "Purple 100" with hexadecimal value <a href='https://www.colorhexa.com/E1BEE7' />#E1BEE7</a> <br><img src="https://www.colorhexa.com/E1BEE7.png" width="50" height='50' />
  purple100("#E1BEE7", "Purple 100"),

  /// A color named "Purple 200" with hexadecimal value <a href='https://www.colorhexa.com/CE93D8' />#CE93D8</a> <br><img src="https://www.colorhexa.com/CE93D8.png" width="50" height='50' />
  purple200("#CE93D8", "Purple 200"),

  /// A color named "Purple 300" with hexadecimal value <a href='https://www.colorhexa.com/BA68C8' />#BA68C8</a> <br><img src="https://www.colorhexa.com/BA68C8.png" width="50" height='50' />
  purple300("#BA68C8", "Purple 300"),

  /// A color named "Purple 400" with hexadecimal value <a href='https://www.colorhexa.com/AB47BC' />#AB47BC</a> <br><img src="https://www.colorhexa.com/AB47BC.png" width="50" height='50' />
  purple400("#AB47BC", "Purple 400"),

  /// A color named "Purple 500" with hexadecimal value <a href='https://www.colorhexa.com/9C27B0' />#9C27B0</a> <br><img src="https://www.colorhexa.com/9C27B0.png" width="50" height='50' />
  purple500("#9C27B0", "Purple 500"),

  /// A color named "Purple 600" with hexadecimal value <a href='https://www.colorhexa.com/8E24AA' />#8E24AA</a> <br><img src="https://www.colorhexa.com/8E24AA.png" width="50" height='50' />
  purple600("#8E24AA", "Purple 600"),

  /// A color named "Purple 700" with hexadecimal value <a href='https://www.colorhexa.com/7B1FA2' />#7B1FA2</a> <br><img src="https://www.colorhexa.com/7B1FA2.png" width="50" height='50' />
  purple700("#7B1FA2", "Purple 700"),

  /// A color named "Purple 800" with hexadecimal value <a href='https://www.colorhexa.com/6A1B9A' />#6A1B9A</a> <br><img src="https://www.colorhexa.com/6A1B9A.png" width="50" height='50' />
  purple800("#6A1B9A", "Purple 800"),

  /// A color named "Purple 900" with hexadecimal value <a href='https://www.colorhexa.com/4A148C' />#4A148C</a> <br><img src="https://www.colorhexa.com/4A148C.png" width="50" height='50' />
  purple900("#4A148C", "Purple 900"),

  /// A color named "Purple A100" with hexadecimal value <a href='https://www.colorhexa.com/EA80FC' />#EA80FC</a> <br><img src="https://www.colorhexa.com/EA80FC.png" width="50" height='50' />
  purpleA100("#EA80FC", "Purple A100"),

  /// A color named "Purple A200" with hexadecimal value <a href='https://www.colorhexa.com/E040FB' />#E040FB</a> <br><img src="https://www.colorhexa.com/E040FB.png" width="50" height='50' />
  purpleA200("#E040FB", "Purple A200"),

  /// A color named "Purple A400" with hexadecimal value <a href='https://www.colorhexa.com/D500F9' />#D500F9</a> <br><img src="https://www.colorhexa.com/D500F9.png" width="50" height='50' />
  purpleA400("#D500F9", "Purple A400"),

  /// A color named "Purple A700" with hexadecimal value <a href='https://www.colorhexa.com/AA00FF' />#AA00FF</a> <br><img src="https://www.colorhexa.com/AA00FF.png" width="50" height='50' />
  purpleA700("#AA00FF", "Purple A700"),

  /// A color named "Purple Heart" with hexadecimal value <a href='https://www.colorhexa.com/69359C' />#69359C</a> <br><img src="https://www.colorhexa.com/69359C.png" width="50" height='50' />
  purpleHeart("#69359C", "Purple heart"),

  /// A color named "Purple Mountain Majesty" with hexadecimal value <a href='https://www.colorhexa.com/9678B6' />#9678B6</a> <br><img src="https://www.colorhexa.com/9678B6.png" width="50" height='50' />
  purpleMountainMajesty("#9678B6", "Purple mountain majesty"),

  /// A color named "Purple navy" with hexadecimal value <a href='https://www.colorhexa.com/4E5180' />#4E5180</a> <br><img src="https://www.colorhexa.com/4E5180.png" width="50" height='50' />
  purpleNavy("#4E5180", "Purple navy"),

  /// A color named "Purple Pizzazz" with hexadecimal value <a href='https://www.colorhexa.com/FE4EDA' />#FE4EDA</a> <br><img src="https://www.colorhexa.com/FE4EDA.png" width="50" height='50' />
  purplePizzazz("#FE4EDA", "Purple pizzazz"),

  /// A color named "Purple Plum" with hexadecimal value <a href='https://www.colorhexa.com/9C51B6' />#9C51B6</a> <br><img src="https://www.colorhexa.com/9C51B6.png" width="50" height='50' />
  purplePlum("#9C51B6", "Purple plum"),

  /// A color named "Purple Taupe" with hexadecimal value <a href='https://www.colorhexa.com/50404D' />#50404D</a> <br><img src="https://www.colorhexa.com/50404D.png" width="50" height='50' />
  purpleTaupe("#50404D", "Purple taupe"),

  /// A color named "Purpureus" with hexadecimal value <a href='https://www.colorhexa.com/9A4EAE' />#9A4EAE</a> <br><img src="https://www.colorhexa.com/9A4EAE.png" width="50" height='50' />
  purpureus("#9A4EAE", "Purpureus"),

  /// A color named "Quartz" with hexadecimal value <a href='https://www.colorhexa.com/51484F' />#51484F</a> <br><img src="https://www.colorhexa.com/51484F.png" width="50" height='50' />
  quartz("#51484F", "Quartz"),

  /// A color named "Queen Blue" with hexadecimal value <a href='https://www.colorhexa.com/436B95' />#436B95</a> <br><img src="https://www.colorhexa.com/436B95.png" width="50" height='50' />
  queenBlue("#436B95", "Queen blue"),

  /// A color named "Queen Pink" with hexadecimal value <a href='https://www.colorhexa.com/E8CCD7' />#E8CCD7</a> <br><img src="https://www.colorhexa.com/E8CCD7.png" width="50" height='50' />
  queenPink("#E8CCD7", "Queen pink"),

  /// A color named "Quinacridone Magenta" with hexadecimal value <a href='https://www.colorhexa.com/8E3A59' />#8E3A59</a> <br><img src="https://www.colorhexa.com/8E3A59.png" width="50" height='50' />
  quinacridoneMagenta("#8E3A59", "Quinacridone magenta"),

  /// A color named "Rackley" with hexadecimal value <a href='https://www.colorhexa.com/5D8AA8' />#5D8AA8</a> <br><img src="https://www.colorhexa.com/5D8AA8.png" width="50" height='50' />
  rackley("#5D8AA8", "Rackley"),

  /// A color named "Radical Red" with hexadecimal value <a href='https://www.colorhexa.com/FF355E' />#FF355E</a> <br><img src="https://www.colorhexa.com/FF355E.png" width="50" height='50' />
  radicalRed("#FF355E", "Radical red"),

  /// A color named "Rajah" with hexadecimal value <a href='https://www.colorhexa.com/FBAB60' />#FBAB60</a> <br><img src="https://www.colorhexa.com/FBAB60.png" width="50" height='50' />
  rajah("#FBAB60", "Rajah"),

  /// A color named "Raspberry" with hexadecimal value <a href='https://www.colorhexa.com/E30B5C' />#E30B5C</a> <br><img src="https://www.colorhexa.com/E30B5C.png" width="50" height='50' />
  raspberry("#E30B5C", "Raspberry"),

  /// A color named "Raspberry Glace" with hexadecimal value <a href='https://www.colorhexa.com/915F6D' />#915F6D</a> <br><img src="https://www.colorhexa.com/915F6D.png" width="50" height='50' />
  raspberryGlace("#915F6D", "Raspberry glacé"),

  /// A color named "Raspberry Pink" with hexadecimal value <a href='https://www.colorhexa.com/E25098' />#E25098</a> <br><img src="https://www.colorhexa.com/E25098.png" width="50" height='50' />
  raspberryPink("#E25098", "Raspberry pink"),

  /// A color named "Raspberry Rose" with hexadecimal value <a href='https://www.colorhexa.com/B3446C' />#B3446C</a> <br><img src="https://www.colorhexa.com/B3446C.png" width="50" height='50' />
  raspberryRose("#B3446C", "Raspberry rose"),

  /// A color named "Raw Sienna" with hexadecimal value <a href='https://www.colorhexa.com/D68A59' />#D68A59</a> <br><img src="https://www.colorhexa.com/D68A59.png" width="50" height='50' />
  rawSienna("#D68A59", "Raw sienna"),

  /// A color named "Raw Umber" with hexadecimal value <a href='https://www.colorhexa.com/826644' />#826644</a> <br><img src="https://www.colorhexa.com/826644.png" width="50" height='50' />
  rawUmber("#826644", "Raw umber"),

  /// A color named "Razzle Dazzle Rose" with hexadecimal value <a href='https://www.colorhexa.com/FF33CC' />#FF33CC</a> <br><img src="https://www.colorhexa.com/FF33CC.png" width="50" height='50' />
  razzleDazzleRose("#FF33CC", "Razzle dazzle rose"),

  /// A color named "Razzmatazz" with hexadecimal value <a href='https://www.colorhexa.com/E3256B' />#E3256B</a> <br><img src="https://www.colorhexa.com/E3256B.png" width="50" height='50' />
  razzmatazz("#E3256B", "Razzmatazz"),

  /// A color named "Razzmic Berry" with hexadecimal value <a href='https://www.colorhexa.com/8D4E85' />#8D4E85</a> <br><img src="https://www.colorhexa.com/8D4E85.png" width="50" height='50' />
  razzmicBerry("#8D4E85", "Razzmic berry"),

  /// A color named "Rebecca Purple" with hexadecimal value <a href='https://www.colorhexa.com/663399' />#663399</a> <br><img src="https://www.colorhexa.com/663399.png" width="50" height='50' />
  rebeccaPurple('#663399', 'Rebecca Purple'),

  /// A color named "Red" with hexadecimal value <a href='https://www.colorhexa.com/FF0000' />#FF0000</a> <br><img src="https://www.colorhexa.com/FF0000.png" width="50" height='50' />
  redColor('#FF0000', 'Red'),

  /// A color named "Red Brown" with hexadecimal value <a href='https://www.colorhexa.com/A52A2A' />#A52A2A</a> <br><img src="https://www.colorhexa.com/A52A2A.png" width="50" height='50' />
  redBrown("#A52A2A", "Red brown"),

  /// A color named "Red (Crayola)" with hexadecimal value <a href='https://www.colorhexa.com/EE204D' />#EE204D</a> <br><img src="https://www.colorhexa.com/EE204D.png" width="50" height='50' />
  redCrayola("#EE204D", "Red (Crayola)"),

  /// A color named "Red Devil" with hexadecimal value <a href='https://www.colorhexa.com/860111' />#860111</a> <br><img src="https://www.colorhexa.com/860111.png" width="50" height='50' />
  redDevil("#860111", "Red devil"),

  /// A color named "Red (Munsell)" with hexadecimal value <a href='https://www.colorhexa.com/F2003C' />#F2003C</a> <br><img src="https://www.colorhexa.com/F2003C.png" width="50" height='50' />
  redMunsell("#F2003C", "Red (Munsell)"),

  /// A color named "Red (NCS)" with hexadecimal value <a href='https://www.colorhexa.com/C40233' />#C40233</a> <br><img src="https://www.colorhexa.com/C40233.png" width="50" height='50' />
  redNcs("#C40233", "Red (NCS)"),

  /// A color named "Red Orange" with hexadecimal value <a href='https://www.colorhexa.com/FF5349' />#FF5349</a> <br><img src="https://www.colorhexa.com/FF5349.png" width="50" height='50' />
  redOrange("#FF5349", "Red orange"),

  /// A color named "Red (Pantone)" with hexadecimal value <a href='https://www.colorhexa.com/ED2939' />#ED2939</a> <br><img src="https://www.colorhexa.com/ED2939.png" width="50" height='50' />
  redPantone("#ED2939", "Red (Pantone)"),

  /// A color named "Red (Pigment)" with hexadecimal value <a href='https://www.colorhexa.com/ED1C24' />#ED1C24</a> <br><img src="https://www.colorhexa.com/ED1C24.png" width="50" height='50' />
  redPigment("#ED1C24", "Red (pigment)"),

  /// A color named "Red Purple" with hexadecimal value <a href='https://www.colorhexa.com/E40078' />#E40078</a> <br><img src="https://www.colorhexa.com/E40078.png" width="50" height='50' />
  redPurple("#E40078", "Red purple"),

  /// A color named "Red (RYB)" with hexadecimal value <a href='https://www.colorhexa.com/FE2712' />#FE2712</a> <br><img src="https://www.colorhexa.com/FE2712.png" width="50" height='50' />
  redRyb("#FE2712", "Red (RYB)"),

  /// A color named "Red Salsa" with hexadecimal value <a href='https://www.colorhexa.com/FD3A4A' />#FD3A4A</a> <br><img src="https://www.colorhexa.com/FD3A4A.png" width="50" height='50' />
  redSalsa("#FD3A4A", "Red salsa"),

  /// A color named "Red Violet" with hexadecimal value <a href='https://www.colorhexa.com/C71585' />#C71585</a> <br><img src="https://www.colorhexa.com/C71585.png" width="50" height='50' />
  redViolet("#C71585", "Red violet"),

  /// A color named "Red Wood" with hexadecimal value <a href='https://www.colorhexa.com/A45A52' />#A45A52</a> <br><img src="https://www.colorhexa.com/A45A52.png" width="50" height='50' />
  redwood("#A45A52", "Redwood"),

  /// A color named "Regalia" with hexadecimal value <a href='https://www.colorhexa.com/522D80' />#522D80</a> <br><img src="https://www.colorhexa.com/522D80.png" width="50" height='50' />
  regalia("#522D80", "Regalia"),

  /// A color named "Registration Black" with hexadecimal value <a href='https://www.colorhexa.com/000000' />#000000</a> <br><img src="https://www.colorhexa.com/000000.png" width="50" height='50' />
  registrationBlack("#000000", "Registration black"),

  /// A color named "Resolution Blue" with hexadecimal value <a href='https://www.colorhexa.com/002387' />#002387</a> <br><img src="https://www.colorhexa.com/002387.png" width="50" height='50' />
  resolutionBlue("#002387", "Resolution blue"),

  /// A color named "Rhythm" with hexadecimal value <a href='https://www.colorhexa.com/777696' />#777696</a> <br><img src="https://www.colorhexa.com/777696.png" width="50" height='50' />
  rhythm("#777696", "Rhythm"),

  /// A color named "Rich Black" with hexadecimal value <a href='https://www.colorhexa.com/004040' />#004040</a> <br><img src="https://www.colorhexa.com/004040.png" width="50" height='50' />
  richBlack("#004040", "Rich black"),

  /// A color named "Rich Black (FOGRA29)" with hexadecimal value <a href='https://www.colorhexa.com/010B13' />#010B13</a> <br><img src="https://www.colorhexa.com/010B13.png" width="50" height='50' />
  richBlackFogra29("#010B13", "Rich black (FOGRA29)"),

  /// A color named "Rich Black (FOGRA39)" with hexadecimal value <a href='https://www.colorhexa.com/010203' />#010203</a> <br><img src="https://www.colorhexa.com/010203.png" width="50" height='50' />
  richBlackFogra39("#010203", "Rich black (FOGRA39)"),

  /// A color named "Rich Brilliant Lavender" with hexadecimal value <a href='https://www.colorhexa.com/F1A7FE' />#F1A7FE</a> <br><img src="https://www.colorhexa.com/F1A7FE.png" width="50" height='50' />
  richBrilliantLavender("#F1A7FE", "Rich brilliant lavender"),

  /// A color named "Rich Carmine" with hexadecimal value <a href='https://www.colorhexa.com/D70040' />#D70040</a> <br><img src="https://www.colorhexa.com/D70040.png" width="50" height='50' />
  richCarmine("#D70040", "Rich carmine"),

  /// A color named "Rich Electric Blue" with hexadecimal value <a href='https://www.colorhexa.com/0892D0' />#0892D0</a> <br><img src="https://www.colorhexa.com/0892D0.png" width="50" height='50' />
  richElectricBlue("#0892D0", "Rich electric blue"),

  /// A color named "Rich Lavender" with hexadecimal value <a href='https://www.colorhexa.com/A76BCF' />#A76BCF</a> <br><img src="https://www.colorhexa.com/A76BCF.png" width="50" height='50' />
  richLavender("#A76BCF", "Rich lavender"),

  /// A color named "Rich Lilac" with hexadecimal value <a href='https://www.colorhexa.com/B666D2' />#B666D2</a> <br><img src="https://www.colorhexa.com/B666D2.png" width="50" height='50' />
  richLilac("#B666D2", "Rich lilac"),

  /// A color named "Rich Maroon" with hexadecimal value <a href='https://www.colorhexa.com/B03060' />#B03060</a> <br><img src="https://www.colorhexa.com/B03060.png" width="50" height='50' />
  richMaroon("#B03060", "Rich maroon"),

  /// A color named "Rifle Green" with hexadecimal value <a href='https://www.colorhexa.com/444C38' />#444C38</a> <br><img src="https://www.colorhexa.com/444C38.png" width="50" height='50' />
  rifleGreen("#444C38", "Rifle green"),

  /// A color named "Robin Egg Blue" with hexadecimal value <a href='https://www.colorhexa.com/00CCCC' />#00CCCC</a> <br><img src="https://www.colorhexa.com/00CCCC.png" width="50" height='50' />
  robinEggBlue("#00CCCC", "Robin egg blue"),

  /// A color named "Rocket Metallic" with hexadecimal value <a href='https://www.colorhexa.com/8A7F80' />#8A7F80</a> <br><img src="https://www.colorhexa.com/8A7F80.png" width="50" height='50' />
  rocketMetallic("#8A7F80", "Rocket metallic"),

  /// A color named "Roman Silver" with hexadecimal value <a href='https://www.colorhexa.com/838996' />#838996</a> <br><img src="https://www.colorhexa.com/838996.png" width="50" height='50' />
  romanSilver("#838996", "Roman silver"),

  /// A color named "Rose" with hexadecimal value <a href='https://www.colorhexa.com/FF007F' />#FF007F</a> <br><img src="https://www.colorhexa.com/FF007F.png" width="50" height='50' />
  rose("#FF007F", "Rose"),

  /// A color named "Rose Bonbon" with hexadecimal value <a href='https://www.colorhexa.com/F9429E' />#F9429E</a> <br><img src="https://www.colorhexa.com/F9429E.png" width="50" height='50' />
  roseBonbon("#F9429E", "Rose bonbon"),

  /// A color named "Rose Dust" with hexadecimal value <a href='https://www.colorhexa.com/9E5E6F' />#9E5E6F</a> <br><img src="https://www.colorhexa.com/9E5E6F.png" width="50" height='50' />
  roseDust("#9E5E6F", "Rose dust"),

  /// A color named "Rose Ebony" with hexadecimal value <a href='https://www.colorhexa.com/674846' />#674846</a> <br><img src="https://www.colorhexa.com/674846.png" width="50" height='50' />
  roseEbony("#674846", "Rose ebony"),

  /// A color named "Rose Gold" with hexadecimal value <a href='https://www.colorhexa.com/B76E79' />#B76E79</a> <br><img src="https://www.colorhexa.com/B76E79.png" width="50" height='50' />
  roseGold("#B76E79", "Rose gold"),

  /// A color named "Rose Madder" with hexadecimal value <a href='https://www.colorhexa.com/E32636' />#E32636</a> <br><img src="https://www.colorhexa.com/E32636.png" width="50" height='50' />
  roseMadder("#E32636", "Rose madder"),

  /// A color named "Rose Pink" with hexadecimal value <a href='https://www.colorhexa.com/FF66CC' />#FF66CC</a> <br><img src="https://www.colorhexa.com/FF66CC.png" width="50" height='50' />
  rosePink("#FF66CC", "Rose pink"),

  /// A color named "Rose Quartz" with hexadecimal value <a href='https://www.colorhexa.com/AA98A9' />#AA98A9</a> <br><img src="https://www.colorhexa.com/AA98A9.png" width="50" height='50' />
  roseQuartz("#AA98A9", "Rose quartz"),

  /// A color named "Rose Red" with hexadecimal value <a href='https://www.colorhexa.com/C21E56' />#C21E56</a> <br><img src="https://www.colorhexa.com/C21E56.png" width="50" height='50' />
  roseRed("#C21E56", "Rose red"),

  /// A color named "Rose Taupe" with hexadecimal value <a href='https://www.colorhexa.com/905D5D' />#905D5D</a> <br><img src="https://www.colorhexa.com/905D5D.png" width="50" height='50' />
  roseTaupe("#905D5D", "Rose taupe"),

  /// A color named "Rose Vale" with hexadecimal value <a href='https://www.colorhexa.com/AB4E52' />#AB4E52</a> <br><img src="https://www.colorhexa.com/AB4E52.png" width="50" height='50' />
  roseVale("#AB4E52", "Rose vale"),

  /// A color named "Rosewood" with hexadecimal value <a href='https://www.colorhexa.com/65000B' />#65000B</a> <br><img src="https://www.colorhexa.com/65000B.png" width="50" height='50' />
  rosewood("#65000B", "Rosewood"),

  /// A color named "Rosso Corsa" with hexadecimal value <a href='https://www.colorhexa.com/D40000' />#D40000</a> <br><img src="https://www.colorhexa.com/D40000.png" width="50" height='50' />
  rossoCorsa("#D40000", "Rosso corsa"),

  /// A color named "Rosy Brown" with hexadecimal value <a href='https://www.colorhexa.com/BC8F8F' />#BC8F8F</a> <br><img src="https://www.colorhexa.com/BC8F8F.png" width="50" height='50' />
  rosyBrown('#BC8F8F', 'Rosy Brown'),

  /// A color named "Royal Azure" with hexadecimal value <a href='https://www.colorhexa.com/0038A8' />#0038A8</a> <br><img src="https://www.colorhexa.com/0038A8.png" width="50" height='50' />
  royalAzure("#0038A8", "Royal azure"),

  /// A color named "Royal Blue" with hexadecimal value <a href='https://www.colorhexa.com/4169E1' />#4169E1</a> <br><img src="https://www.colorhexa.com/4169E1.png" width="50" height='50' />
  royalBlue('#4169E1', 'Royal Blue'),

  /// A color named "Royal Fuchsia" with hexadecimal value <a href='https://www.colorhexa.com/CA2C92' />#CA2C92</a> <br><img src="https://www.colorhexa.com/CA2C92.png" width="50" height='50' />
  royalFuchsia("#CA2C92", "Royal fuchsia"),

  /// A color named "Royal Purple" with hexadecimal value <a href='https://www.colorhexa.com/7851A9' />#7851A9</a> <br><img src="https://www.colorhexa.com/7851A9.png" width="50" height='50' />
  royalPurple("#7851A9", "Royal purple"),

  /// A color named "Royal Yellow" with hexadecimal value <a href='https://www.colorhexa.com/FADA5E' />#FADA5E</a> <br><img src="https://www.colorhexa.com/FADA5E.png" width="50" height='50' />
  royalYellow("#FADA5E", "Royal yellow"),

  /// A color named "Rubine Red" with hexadecimal value <a href='https://www.colorhexa.com/D10056' />#D10056</a> <br><img src="https://www.colorhexa.com/D10056.png" width="50" height='50' />
  rubineRed("#D10056", "Rubine red"),

  /// A color named "Ruby" with hexadecimal value <a href='https://www.colorhexa.com/E0115F' />#E0115F</a> <br><img src="https://www.colorhexa.com/E0115F.png" width="50" height='50' />
  ruby("#E0115F", "Ruby"),

  /// A color named "Ruby Red" with hexadecimal value <a href='https://www.colorhexa.com/9B111E' />#9B111E</a> <br><img src="https://www.colorhexa.com/9B111E.png" width="50" height='50' />
  rubyRed("#9B111E", "Ruby red"),

  /// A color named "Ruddy" with hexadecimal value <a href='https://www.colorhexa.com/FF0028' />#FF0028</a> <br><img src="https://www.colorhexa.com/FF0028.png" width="50" height='50' />
  ruddy("#FF0028", "Ruddy"),

  /// A color named "Ruddy Brown" with hexadecimal value <a href='https://www.colorhexa.com/BB6528' />#BB6528</a> <br><img src="https://www.colorhexa.com/BB6528.png" width="50" height='50' />
  ruddyBrown("#BB6528", "Ruddy brown"),

  /// A color named "Ruddy Pink" with hexadecimal value <a href='https://www.colorhexa.com/E18E96' />#E18E96</a> <br><img src="https://www.colorhexa.com/E18E96.png" width="50" height='50' />
  ruddyPink("#E18E96", "Ruddy pink"),

  /// A color named "Rufous" with hexadecimal value <a href='https://www.colorhexa.com/A81C07' />#A81C07</a> <br><img src="https://www.colorhexa.com/A81C07.png" width="50" height='50' />
  rufous("#A81C07", "Rufous"),

  /// A color named "Russet" with hexadecimal value <a href='https://www.colorhexa.com/80461B' />#80461B</a> <br><img src="https://www.colorhexa.com/80461B.png" width="50" height='50' />
  russet("#80461B", "Russet"),

  /// A color named "Russian Green" with hexadecimal value <a href='https://www.colorhexa.com/679267' />#679267</a> <br><img src="https://www.colorhexa.com/679267.png" width="50" height='50' />
  russianGreen("#679267", "Russian green"),

  /// A color named "Russian Violet" with hexadecimal value <a href='https://www.colorhexa.com/32174D' />#32174D</a> <br><img src="https://www.colorhexa.com/32174D.png" width="50" height='50' />
  russianViolet("#32174D", "Russian violet"),

  /// A color named "Rust" with hexadecimal value <a href='https://www.colorhexa.com/B7410E' />#B7410E</a> <br><img src="https://www.colorhexa.com/B7410E.png" width="50" height='50' />
  rust("#B7410E", "Rust"),

  /// A color named "Rusty Red" with hexadecimal value <a href='https://www.colorhexa.com/DA2C43' />#DA2C43</a> <br><img src="https://www.colorhexa.com/DA2C43.png" width="50" height='50' />
  rustyRed("#DA2C43", "Rusty red"),

  /// A color named "Sacramento State Green" with hexadecimal value <a href='https://www.colorhexa.com/043927' />#043927</a> <br><img src="https://www.colorhexa.com/043927.png" width="50" height='50' />
  sacramentoStateGreen("#043927", "Sacramento State green"),

  /// A color named "Saddle Brown" with hexadecimal value <a href='https://www.colorhexa.com/8B4513' />#8B4513</a> <br><img src="https://www.colorhexa.com/8B4513.png" width="50" height='50' />
  saddleBrown('#8B4513', 'Saddle Brown'),

  /// A color named "Safety Orange" with hexadecimal value <a href='https://www.colorhexa.com/FF7800' />#FF7800</a> <br><img src="https://www.colorhexa.com/FF7800.png" width="50" height='50' />
  safetyOrange("#FF7800", "Safety orange"),

  /// A color named "Safety Yellow" with hexadecimal value <a href='https://www.colorhexa.com/EED202' />#EED202</a> <br><img src="https://www.colorhexa.com/EED202.png" width="50" height='50' />
  safetyYellow("#EED202", "Safety yellow"),

  /// A color named "Saffron" with hexadecimal value <a href='https://www.colorhexa.com/F4C430' />#F4C430</a> <br><img src="https://www.colorhexa.com/F4C430.png" width="50" height='50' />
  saffron("#F4C430", "Saffron"),

  /// A color named "Salmon" with hexadecimal value <a href='https://www.colorhexa.com/FA8072' />#FA8072</a> <br><img src="https://www.colorhexa.com/FA8072.png" width="50" height='50' />
  salmon('#FA8072', 'Salmon'),

  /// A color named "Salmon Pink" with hexadecimal value <a href='https://www.colorhexa.com/FF91A4' />#FF91A4</a> <br><img src="https://www.colorhexa.com/FF91A4.png" width="50" height='50' />
  salmonPink("#FF91A4", "Salmon pink"),

  /// A color named "Sand" with hexadecimal value <a href='https://www.colorhexa.com/C2B280' />#C2B280</a> <br><img src="https://www.colorhexa.com/C2B280.png" width="50" height='50' />
  sand("#C2B280", "Sand"),

  /// A color named "Sand Dune" with hexadecimal value <a href='https://www.colorhexa.com/967117' />#967117</a> <br><img src="https://www.colorhexa.com/967117.png" width="50" height='50' />
  sandDune("#967117", "Sand dune"),

  /// A color named "Sandstorm" with hexadecimal value <a href='https://www.colorhexa.com/ECD540' />#ECD540</a> <br><img src="https://www.colorhexa.com/ECD540.png" width="50" height='50' />
  sandstorm("#ECD540", "Sandstorm"),

  /// A color named "Sandy Brown" with hexadecimal value <a href='https://www.colorhexa.com/F4A460' />#F4A460</a> <br><img src="https://www.colorhexa.com/F4A460.png" width="50" height='50' />
  sandyBrown('#F4A460', 'Sandy Brown'),

  /// A color named "Sandy Taupe" with hexadecimal value <a href='https://www.colorhexa.com/967117' />#967117</a> <br><img src="https://www.colorhexa.com/967117.png" width="50" height='50' />
  sandyTaupe("#967117", "Sandy taupe"),

  /// A color named "Sangria" with hexadecimal value <a href='https://www.colorhexa.com/92000A' />#92000A</a> <br><img src="https://www.colorhexa.com/92000A.png" width="50" height='50' />
  sangria("#92000A", "Sangria"),

  /// A color named "Sap Green" with hexadecimal value <a href='https://www.colorhexa.com/507D2A' />#507D2A</a> <br><img src="https://www.colorhexa.com/507D2A.png" width="50" height='50' />
  sapGreen("#507D2A", "Sap green"),

  /// A color named "Sapphire" with hexadecimal value <a href='https://www.colorhexa.com/0F52BA' />#0F52BA</a> <br><img src="https://www.colorhexa.com/0F52BA.png" width="50" height='50' />
  sapphire("#0F52BA", "Sapphire"),

  /// A color named "Sapphire Blue" with hexadecimal value <a href='https://www.colorhexa.com/0067A5' />#0067A5</a> <br><img src="https://www.colorhexa.com/0067A5.png" width="50" height='50' />
  sapphireBlue("#0067A5", "Sapphire blue"),

  /// A color named "Satin Sheen Gold" with hexadecimal value <a href='https://www.colorhexa.com/CBA135' />#CBA135</a> <br><img src="https://www.colorhexa.com/CBA135.png" width="50" height='50' />
  satinSheenGold("#CBA135", "Satin sheen gold"),

  /// A color named "Scarlet" with hexadecimal value <a href='https://www.colorhexa.com/FF2400' />#FF2400</a> <br><img src="https://www.colorhexa.com/FF2400.png" width="50" height='50' />
  scarlet("#FF2400", "Scarlet"),

  /// A color named "Scarlet Red" with hexadecimal value <a href='https://www.colorhexa.com/CD202C' />#CD202C</a> <br><img src="https://www.colorhexa.com/CD202C.png" width="50" height='50' />
  scarletRed("#CD202C", "Scarlet red"),

  /// A color named "Schauss Pink" with hexadecimal value <a href='https://www.colorhexa.com/FF91AF' />#FF91AF</a> <br><img src="https://www.colorhexa.com/FF91AF.png" width="50" height='50' />
  schaussPink("#FF91AF", "Schauss pink"),

  /// A color named "School Bus Yellow" with hexadecimal value <a href='https://www.colorhexa.com/FFD800' />#FFD800</a> <br><img src="https://www.colorhexa.com/FFD800.png" width="50" height='50' />
  schoolBusYellow("#FFD800", "School bus yellow"),

  /// A color named "Screamin' Green" with hexadecimal value <a href='https://www.colorhexa.com/66FF66' />#66FF66</a> <br><img src="https://www.colorhexa.com/66FF66.png" width="50" height='50' />
  screaminGreen("#66FF66", "Screamin' Green"),

  /// A color named "Sea Blue" with hexadecimal value <a href='https://www.colorhexa.com/006994' />#006994</a> <br><img src="https://www.colorhexa.com/006994.png" width="50" height='50' />
  seaBlue("#006994", "Sea blue"),

  /// A color named "Sea Green" with hexadecimal value <a href='https://www.colorhexa.com/2E8B57' />#2E8B57</a> <br><img src="https://www.colorhexa.com/2E8B57.png" width="50" height='50' />
  seaGreen('#2E8B57', 'Sea Green'),

  /// A color named "Seal Brown" with hexadecimal value <a href='https://www.colorhexa.com/59260B' />#59260B</a> <br><img src="https://www.colorhexa.com/59260B.png" width="50" height='50' />
  sealBrown("#59260B", "Seal brown"),

  /// A color named "Seashell" with hexadecimal value <a href='https://www.colorhexa.com/FFF5EE' />#FFF5EE</a> <br><img src="https://www.colorhexa.com/FFF5EE.png" width="50" height='50' />
  seashell("#FFF5EE", "Seashell"),

  /// A color named "Sea Shell" with hexadecimal value <a href='https://www.colorhexa.com/FFF5EE' />#FFF5EE</a> <br><img src="https://www.colorhexa.com/FFF5EE.png" width="50" height='50' />
  seaShell('#FFF5EE', 'Sea Shell'),

  /// A color named "Selective Yellow" with hexadecimal value <a href='https://www.colorhexa.com/FFBA00' />#FFBA00</a> <br><img src="https://www.colorhexa.com/FFBA00.png" width="50" height='50' />
  selectiveYellow("#FFBA00", "Selective yellow"),

  /// A color named "Sepia" with hexadecimal value <a href='https://www.colorhexa.com/704214' />#704214</a> <br><img src="https://www.colorhexa.com/704214.png" width="50" height='50' />
  sepia("#704214", "Sepia"),

  /// A color named "Shadow" with hexadecimal value <a href='https://www.colorhexa.com/8A795D' />#8A795D</a> <br><img src="https://www.colorhexa.com/8A795D.png" width="50" height='50' />
  shadow("#8A795D", "Shadow"),

  /// A color named "Shadow Blue" with hexadecimal value <a href='https://www.colorhexa.com/778BA5' />#778BA5</a> <br><img src="https://www.colorhexa.com/778BA5.png" width="50" height='50' />
  shadowBlue("#778BA5", "Shadow blue"),

  /// A color named "Shampoo" with hexadecimal value <a href='https://www.colorhexa.com/FFCFF1' />#FFCFF1</a> <br><img src="https://www.colorhexa.com/FFCFF1.png" width="50" height='50' />
  shampoo("#FFCFF1", "Shampoo"),

  /// A color named "Shamrock Green" with hexadecimal value <a href='https://www.colorhexa.com/009E60' />#009E60</a> <br><img src="https://www.colorhexa.com/009E60.png" width="50" height='50' />
  shamrockGreen("#009E60", "Shamrock green"),

  /// A color named "Sheen Green" with hexadecimal value <a href='https://www.colorhexa.com/8FD400' />#8FD400</a> <br><img src="https://www.colorhexa.com/8FD400.png" width="50" height='50' />
  sheenGreen("#8FD400", "Sheen green"),

  /// A color named "Shimmering Blush" with hexadecimal value <a href='https://www.colorhexa.com/D98695' />#D98695</a> <br><img src="https://www.colorhexa.com/D98695.png" width="50" height='50' />
  shimmeringBlush("#D98695", "Shimmering blush"),

  /// A color named "Shiny Shamrock" with hexadecimal value <a href='https://www.colorhexa.com/5FA778' />#5FA778</a> <br><img src="https://www.colorhexa.com/5FA778.png" width="50" height='50' />
  shinyShamrock("#5FA778", "Shiny shamrock"),

  /// A color named "Shocking Pink" with hexadecimal value <a href='https://www.colorhexa.com/FC0FC0' />#FC0FC0</a> <br><img src="https://www.colorhexa.com/FC0FC0.png" width="50" height='50' />
  shockingPink("#FC0FC0", "Shocking pink"),

  /// A color named "Shocking Pink Crayola" with hexadecimal value <a href='https://www.colorhexa.com/FF6FFF' />#FF6FFF</a> <br><img src="https://www.colorhexa.com/FF6FFF.png" width="50" height='50' />
  shockingPinkCrayola("#FF6FFF", "Shocking pink (Crayola)"),

  /// A color named "Sienna" with hexadecimal value <a href='https://www.colorhexa.com/A0522D' />#A0522D</a> <br><img src="https://www.colorhexa.com/A0522D.png" width="50" height='50' />
  sienna('#A0522D', 'Sienna'),

  /// A color named "Silver" with hexadecimal value <a href='https://www.colorhexa.com/C0C0C0' />#C0C0C0</a> <br><img src="https://www.colorhexa.com/C0C0C0.png" width="50" height='50' />
  silver('#C0C0C0', 'Silver'),

  /// A color named "Silver Chalice" with hexadecimal value <a href='https://www.colorhexa.com/ACACAC' />#ACACAC</a> <br><img src="https://www.colorhexa.com/ACACAC.png" width="50" height='50' />
  silverChalice("#ACACAC", "Silver chalice"),

  /// A color named "Silver Lake Blue" with hexadecimal value <a href='https://www.colorhexa.com/5D89BA' />#5D89BA</a> <br><img src="https://www.colorhexa.com/5D89BA.png" width="50" height='50' />
  silverLakeBlue("#5D89BA", "Silver lake blue"),

  /// A color named "Silver Pink" with hexadecimal value <a href='https://www.colorhexa.com/C4AEAD' />#C4AEAD</a> <br><img src="https://www.colorhexa.com/C4AEAD.png" width="50" height='50' />
  silverPink("#C4AEAD", "Silver pink"),

  /// A color named "Silver Sand" with hexadecimal value <a href='https://www.colorhexa.com/BFC1C2' />#BFC1C2</a> <br><img src="https://www.colorhexa.com/BFC1C2.png" width="50" height='50' />
  silverSand("#BFC1C2", "Silver sand"),

  /// A color named "Sinopia" with hexadecimal value <a href='https://www.colorhexa.com/CB410B' />#CB410B</a> <br><img src="https://www.colorhexa.com/CB410B.png" width="50" height='50' />
  sinopia("#CB410B", "Sinopia"),

  /// A color named "Skobeloff" with hexadecimal value <a href='https://www.colorhexa.com/007474' />#007474</a> <br><img src="https://www.colorhexa.com/007474.png" width="50" height='50' />
  skobeloff("#007474", "Skobeloff"),

  /// A color named "Sky Blue" with hexadecimal value <a href='https://www.colorhexa.com/87CEEB' />#87CEEB</a> <br><img src="https://www.colorhexa.com/87CEEB.png" width="50" height='50' />
  skyBlue('#87CEEB', 'Sky Blue'),

  /// A color named "Sky Magenta" with hexadecimal value <a href='https://www.colorhexa.com/CF71AF' />#CF71AF</a> <br><img src="https://www.colorhexa.com/CF71AF.png" width="50" height='50' />
  skyMagenta("#CF71AF", "Sky magenta"),

  /// A color named "Slate Blue" with hexadecimal value <a href='https://www.colorhexa.com/6A5ACD' />#6A5ACD</a> <br><img src="https://www.colorhexa.com/6A5ACD.png" width="50" height='50' />
  slateBlue('#6A5ACD', 'Slate Blue'),

  /// A color named "Slate Gray" with hexadecimal value <a href='https://www.colorhexa.com/708090' />#708090</a> <br><img src="https://www.colorhexa.com/708090.png" width="50" height='50' />
  slateGray('#708090', 'Slate Gray'),

  /// A color named "Smalt" with hexadecimal value <a href='https://www.colorhexa.com/003399' />#003399</a> <br><img src="https://www.colorhexa.com/003399.png" width="50" height='50' />
  smalt("#003399", "Smalt"),

  /// A color named "Smitten" with hexadecimal value <a href='https://www.colorhexa.com/C84186' />#C84186</a> <br><img src="https://www.colorhexa.com/C84186.png" width="50" height='50' />
  smitten("#C84186", "Smitten"),

  /// A color named "Smoky Black" with hexadecimal value <a href='https://www.colorhexa.com/100C08' />#100C08</a> <br><img src="https://www.colorhexa.com/100C08.png" width="50" height='50' />
  smokyBlack("#100C08", "Smoky black"),

  /// A color named "Snow" with hexadecimal value <a href='https://www.colorhexa.com/FFFAFA' />#FFFAFA</a> <br><img src="https://www.colorhexa.com/FFFAFA.png" width="50" height='50' />
  snow('#FFFAFA', 'Snow'),

  /// A color named "Soap" with hexadecimal value <a href='https://www.colorhexa.com/CEC8EF' />#CEC8EF</a> <br><img src="https://www.colorhexa.com/CEC8EF.png" width="50" height='50' />
  soap("#CEC8EF", "Soap"),

  /// A color named "Solid Pink" with hexadecimal value <a href='https://www.colorhexa.com/893843' />#893843</a> <br><img src="https://www.colorhexa.com/893843.png" width="50" height='50' />
  solidPink("#893843", "Solid pink"),

  /// A color named "Sonic Silver" with hexadecimal value <a href='https://www.colorhexa.com/757575' />#757575</a> <br><img src="https://www.colorhexa.com/757575.png" width="50" height='50' />
  sonicSilver("#757575", "Sonic silver"),

  /// A color named "Space Cadet" with hexadecimal value <a href='https://www.colorhexa.com/1D2951' />#1D2951</a> <br><img src="https://www.colorhexa.com/1D2951.png" width="50" height='50' />
  spaceCadet("#1D2951", "Space cadet"),

  /// A color named "Spanish Bistre" with hexadecimal value <a href='https://www.colorhexa.com/807532' />#807532</a> <br><img src="https://www.colorhexa.com/807532.png" width="50" height='50' />
  spanishBistre("#807532", "Spanish bistre"),

  /// A color named "Spanish Blue" with hexadecimal value <a href='https://www.colorhexa.com/0070B8' />#0070B8</a> <br><img src="https://www.colorhexa.com/0070B8.png" width="50" height='50' />
  spanishBlue("#0070B8", "Spanish blue"),

  /// A color named "Spanish Carmine" with hexadecimal value <a href='https://www.colorhexa.com/D10047' />#D10047</a> <br><img src="https://www.colorhexa.com/D10047.png" width="50" height='50' />
  spanishCarmine("#D10047", "Spanish carmine"),

  /// A color named "Spanish Crimson" with hexadecimal value <a href='https://www.colorhexa.com/E51A4C' />#E51A4C</a> <br><img src="https://www.colorhexa.com/E51A4C.png" width="50" height='50' />
  spanishCrimson("#E51A4C", "Spanish crimson"),

  /// A color named "Spanish Gray" with hexadecimal value <a href='https://www.colorhexa.com/989898' />#989898</a> <br><img src="https://www.colorhexa.com/989898.png" width="50" height='50' />
  spanishGray("#989898", "Spanish gray"),

  /// A color named "Spanish Green" with hexadecimal value <a href='https://www.colorhexa.com/009150' />#009150</a> <br><img src="https://www.colorhexa.com/009150.png" width="50" height='50' />
  spanishGreen("#009150", "Spanish green"),

  /// A color named "Spanish Orange" with hexadecimal value <a href='https://www.colorhexa.com/E86100' />#E86100</a> <br><img src="https://www.colorhexa.com/E86100.png" width="50" height='50' />
  spanishOrange("#E86100", "Spanish orange"),

  /// A color named "Spanish Pink" with hexadecimal value <a href='https://www.colorhexa.com/F7BFBE' />#F7BFBE</a> <br><img src="https://www.colorhexa.com/F7BFBE.png" width="50" height='50' />
  spanishPink("#F7BFBE", "Spanish pink"),

  /// A color named "Spanish Red" with hexadecimal value <a href='https://www.colorhexa.com/E60026' />#E60026</a> <br><img src="https://www.colorhexa.com/E60026.png" width="50" height='50' />
  spanishRed("#E60026", "Spanish red"),

  /// A color named "Spanish Sky Blue" with hexadecimal value <a href='https://www.colorhexa.com/00FFFF' />#00FFFF</a> <br><img src="https://www.colorhexa.com/00FFFF.png" width="50" height='50' />
  spanishSkyBlue("#00FFFF", "Spanish sky blue"),

  /// A color named "Spanish Violet" with hexadecimal value <a href='https://www.colorhexa.com/4C2882' />#4C2882</a> <br><img src="https://www.colorhexa.com/4C2882.png" width="50" height='50' />
  spanishViolet("#4C2882", "Spanish violet"),

  /// A color named "Spanish Viridian" with hexadecimal value <a href='https://www.colorhexa.com/007F5C' />#007F5C</a> <br><img src="https://www.colorhexa.com/007F5C.png" width="50" height='50' />
  spanishViridian("#007F5C", "Spanish viridian"),

  /// A color named "Spartan Crimson" with hexadecimal value <a href='https://www.colorhexa.com/9E1316' />#9E1316</a> <br><img src="https://www.colorhexa.com/9E1316.png" width="50" height='50' />
  spartanCrimson("#9E1316", "Spartan crimson"),

  /// A color named "Spicy Mix" with hexadecimal value <a href='https://www.colorhexa.com/8B5F4D' />#8B5F4D</a> <br><img src="https://www.colorhexa.com/8B5F4D.png" width="50" height='50' />
  spicyMix("#8B5f4D", "Spicy mix"),

  /// A color named "Spiro Disco Ball" with hexadecimal value <a href='https://www.colorhexa.com/0FC0FC' />#0FC0FC</a> <br><img src="https://www.colorhexa.com/0FC0FC.png" width="50" height='50' />
  spiroDiscoBall("#0FC0FC", "Spiro Disco Ball"),

  /// A color named "Spring Bud" with hexadecimal value <a href='https://www.colorhexa.com/A7FC00' />#A7FC00</a> <br><img src="https://www.colorhexa.com/A7FC00.png" width="50" height='50' />
  springBud("#A7FC00", "Spring bud"),

  /// A color named "Spring Green" with hexadecimal value <a href='https://www.colorhexa.com/00FF7F' />#00FF7F</a> <br><img src="https://www.colorhexa.com/00FF7F.png" width="50" height='50' />
  springGreen('#00FF7F', 'Spring Green'),

  /// A color named "Star Command Blue" with hexadecimal value <a href='https://www.colorhexa.com/007BB8' />#007BB8</a> <br><img src="https://www.colorhexa.com/007BB8.png" width="50" height='50' />
  starCommandBlue("#007BB8", "Star command blue"),

  /// A color named "Steel Blue" with hexadecimal value <a href='https://www.colorhexa.com/4682B4' />#4682B4</a> <br><img src="https://www.colorhexa.com/4682B4.png" width="50" height='50' />
  steelBlue('#4682B4', 'Steel Blue'),

  /// A color named "Steel Pink" with hexadecimal value <a href='https://www.colorhexa.com/CC33CC' />#CC33CC</a> <br><img src="https://www.colorhexa.com/CC33CC.png" width="50" height='50' />
  steelPink("#CC33CC", "Steel pink"),

  /// A color named "Stil De Grain Yellow" with hexadecimal value <a href='https://www.colorhexa.com/FADA5E' />#FADA5E</a> <br><img src="https://www.colorhexa.com/FADA5E.png" width="50" height='50' />
  stilDeGrainYellow("#FADA5E", "Stil de grain yellow"),

  /// A color named "Stizza" with hexadecimal value <a href='https://www.colorhexa.com/990000' />#990000</a> <br><img src="https://www.colorhexa.com/990000.png" width="50" height='50' />
  stizza("#990000", "Stizza"),

  /// A color named "Storm Cloud" with hexadecimal value <a href='https://www.colorhexa.com/4F666A' />#4F666A</a> <br><img src="https://www.colorhexa.com/4F666A.png" width="50" height='50' />
  stormcloud("#4F666A", "Stormcloud"),

  /// A color named "Straw" with hexadecimal value <a href='https://www.colorhexa.com/E4D96F' />#E4D96F</a> <br><img src="https://www.colorhexa.com/E4D96F.png" width="50" height='50' />
  straw("#E4D96F", "Straw"),

  /// A color named "Strawberry" with hexadecimal value <a href='https://www.colorhexa.com/FC5A8D' />#FC5A8D</a> <br><img src="https://www.colorhexa.com/FC5A8D.png" width="50" height='50' />
  strawberry("#FC5A8D", "Strawberry"),

  /// A color named "Sugar Plum" with hexadecimal value <a href='https://www.colorhexa.com/914E75' />#914E75</a> <br><img src="https://www.colorhexa.com/914E75.png" width="50" height='50' />
  sugarPlum("#914E75", "Sugar plum"),

  /// A color named "Sunset" with hexadecimal value <a href='https://www.colorhexa.com/FAD6A5' />#FAD6A5</a> <br><img src="https://www.colorhexa.com/FAD6A5.png" width="50" height='50' />
  sunset("#FAD6A5", "Sunset"),

  /// A color named "Sunset Orange" with hexadecimal value <a href='https://www.colorhexa.com/FD5E53' />#FD5E53</a> <br><img src="https://www.colorhexa.com/FD5E53.png" width="50" height='50' />
  sunsetOrange("#FD5E53", "Sunset orange"),

  /// A color named "Super Pink" with hexadecimal value <a href='https://www.colorhexa.com/CF6BA9' />#CF6BA9</a> <br><img src="https://www.colorhexa.com/CF6BA9.png" width="50" height='50' />
  superPink("#CF6BA9", "Super pink"),

  /// A color named "Tan" with hexadecimal value <a href='https://www.colorhexa.com/D2B48C' />#D2B48C</a> <br><img src="https://www.colorhexa.com/D2B48C.png" width="50" height='50' />
  tan('#D2B48C', 'Tan'),

  /// A color named "Tangelo" with hexadecimal value <a href='https://www.colorhexa.com/F94D00' />#F94D00</a> <br><img src="https://www.colorhexa.com/F94D00.png" width="50" height='50' />
  tangelo("#F94D00", "Tangelo"),

  /// A color named "Tangerine" with hexadecimal value <a href='https://www.colorhexa.com/F28500' />#F28500</a> <br><img src="https://www.colorhexa.com/F28500.png" width="50" height='50' />
  tangerine("#F28500", "Tangerine"),

  /// A color named "Tangerine Yellow" with hexadecimal value <a href='https://www.colorhexa.com/FFCC00' />#FFCC00</a> <br><img src="https://www.colorhexa.com/FFCC00.png" width="50" height='50' />
  tangerineYellow("#FFCC00", "Tangerine yellow"),

  /// A color named "Tango Pink" with hexadecimal value <a href='https://www.colorhexa.com/E4717A' />#E4717A</a> <br><img src="https://www.colorhexa.com/E4717A.png" width="50" height='50' />
  tangoPink("#E4717A", "Tango pink"),

  /// A color named "Taupe" with hexadecimal value <a href='https://www.colorhexa.com/483C32' />#483C32</a> <br><img src="https://www.colorhexa.com/483C32.png" width="50" height='50' />
  taupe("#483C32", "Taupe"),

  /// A color named "Taupe Gray" with hexadecimal value <a href='https://www.colorhexa.com/8B8589' />#8B8589</a> <br><img src="https://www.colorhexa.com/8B8589.png" width="50" height='50' />
  taupeGray("#8B8589", "Taupe gray"),

  /// A color named "Tea Green" with hexadecimal value <a href='https://www.colorhexa.com/D0F0C0' />#D0F0C0</a> <br><img src="https://www.colorhexa.com/D0F0C0.png" width="50" height='50' />
  teaGreen("#D0F0C0", "Tea green"),

  /// A color named "Teal" with hexadecimal value <a href='https://www.colorhexa.com/008080' />#008080</a> <br><img src="https://www.colorhexa.com/008080.png" width="50" height='50' />
  teal('#008080', 'Teal'),

  /// A color named "Teal Blue" with hexadecimal value <a href='https://www.colorhexa.com/367588' />#367588</a> <br><img src="https://www.colorhexa.com/367588.png" width="50" height='50' />
  tealBlue("#367588", "Teal blue"),

  /// A color named "Teal Deer" with hexadecimal value <a href='https://www.colorhexa.com/99E6B3' />#99E6B3</a> <br><img src="https://www.colorhexa.com/99E6B3.png" width="50" height='50' />
  tealDeer("#99E6B3", "Teal deer"),

  /// A color named "Teal Green" with hexadecimal value <a href='https://www.colorhexa.com/00827F' />#00827F</a> <br><img src="https://www.colorhexa.com/00827F.png" width="50" height='50' />
  tealGreen("#00827F", "Teal green"),

  /// A color named "Tea Rose" with hexadecimal value <a href='https://www.colorhexa.com/F88379' />#F88379</a> <br><img src="https://www.colorhexa.com/F88379.png" width="50" height='50' />
  teaRose("#F88379", "Tea rose"),

  /// A color named "Telemagenta" with hexadecimal value <a href='https://www.colorhexa.com/CF3476' />#CF3476</a> <br><img src="https://www.colorhexa.com/CF3476.png" width="50" height='50' />
  teleMagenta("#CF3476", "Telemagenta"),

  /// A color named "Tenné" with hexadecimal value <a href='https://www.colorhexa.com/CD5700' />#CD5700</a> <br><img src="https://www.colorhexa.com/CD5700.png" width="50" height='50' />
  tenne("#CD5700", "Tenné"),

  /// A color named "Terra Cotta" with hexadecimal value <a href='https://www.colorhexa.com/E2725B' />#E2725B</a> <br><img src="https://www.colorhexa.com/E2725B.png" width="50" height='50' />
  terraCotta("#E2725B", "Terra cotta"),

  /// A color named "Thistle" with hexadecimal value <a href='https://www.colorhexa.com/D8BFD8' />#D8BFD8</a> <br><img src="https://www.colorhexa.com/D8BFD8.png" width="50" height='50' />
  thistle('#D8BFD8', 'Thistle'),

  /// A color named "Thulian Pink" with hexadecimal value <a href='https://www.colorhexa.com/DE6FA1' />#DE6FA1</a> <br><img src="https://www.colorhexa.com/DE6FA1.png" width="50" height='50' />
  thulianPink("#DE6FA1", "Thulian pink"),

  /// A color named "Tickle Me Pink" with hexadecimal value <a href='https://www.colorhexa.com/FC89AC' />#FC89AC</a> <br><img src="https://www.colorhexa.com/FC89AC.png" width="50" height='50' />
  tickleMePink("#FC89AC", "Tickle Me Pink"),

  /// A color named "Tiffany Blue" with hexadecimal value <a href='https://www.colorhexa.com/0ABAB5' />#0ABAB5</a> <br><img src="https://www.colorhexa.com/0ABAB5.png" width="50" height='50' />
  tiffanyBlue("#0ABAB5", "Tiffany blue"),

  /// A color named "Tiger Eye" with hexadecimal value <a href='https://www.colorhexa.com/E08D3C' />#E08D3C</a> <br><img src="https://www.colorhexa.com/E08D3C.png" width="50" height='50' />
  tigerEye("#E08D3C", "Tiger eye"),

  /// A color named "Tiger Orange" with hexadecimal value <a href='https://www.colorhexa.com/FD6A02' />#FD6A02</a> <br><img src="https://www.colorhexa.com/FD6A02.png" width="50" height='50' />
  tigerOrange("#FD6A02", "Tiger orange"),

  /// A color named "Tiger's Eye" with hexadecimal value <a href='https://www.colorhexa.com/E08D3C' />#E08D3C</a> <br><img src="https://www.colorhexa.com/E08D3C.png" width="50" height='50' />
  tigersEye("#E08D3C", "Tiger's eye"),

  /// A color named "Timberwolf" with hexadecimal value <a href='https://www.colorhexa.com/DBD7D2' />#DBD7D2</a> <br><img src="https://www.colorhexa.com/DBD7D2.png" width="50" height='50' />
  timberwolf("#DBD7D2", "Timberwolf"),

  /// A color named "Titanium Yellow" with hexadecimal value <a href='https://www.colorhexa.com/EEE600' />#EEE600</a> <br><img src="https://www.colorhexa.com/EEE600.png" width="50" height='50' />
  titaniumYellow("#EEE600", "Titanium yellow"),

  /// A color named "Tomato" with hexadecimal value <a href='https://www.colorhexa.com/FF6347' />#FF6347</a> <br><img src="https://www.colorhexa.com/FF6347.png" width="50" height='50' />
  tomato('#FF6347', 'Tomato'),

  /// A color named "Toolbox" with hexadecimal value <a href='https://www.colorhexa.com/746CC0' />#746CC0</a> <br><img src="https://www.colorhexa.com/746CC0.png" width="50" height='50' />
  toolbox("#746CC0", "Toolbox"),

  /// A color named "Topaz" with hexadecimal value <a href='https://www.colorhexa.com/FFC87C' />#FFC87C</a> <br><img src="https://www.colorhexa.com/FFC87C.png" width="50" height='50' />
  topaz("#FFC87C", "Topaz"),

  /// A color named "Tractor Red" with hexadecimal value <a href='https://www.colorhexa.com/FD0E35' />#FD0E35</a> <br><img src="https://www.colorhexa.com/FD0E35.png" width="50" height='50' />
  tractorRed("#FD0E35", "Tractor red"),

  /// A color named "Transparent" with hexadecimal value <a href='https://www.colorhexa.com/FFFFFFFF' />#FFFFFFFF</a> <br><img src="https://www.colorhexa.com/FFFFFFFF.png" width="50" height='50' />
  transparent("#FFFFFFFF", "Transparent"),

  /// A color named "Trolley Grey" with hexadecimal value <a href='https://www.colorhexa.com/808080' />#808080</a> <br><img src="https://www.colorhexa.com/808080.png" width="50" height='50' />
  trolleyGrey("#808080", "Trolley grey"),

  /// A color named "Tropical Rain Forest" with hexadecimal value <a href='https://www.colorhexa.com/00755E' />#00755E</a> <br><img src="https://www.colorhexa.com/00755E.png" width="50" height='50' />
  tropicalRainForest("#00755E", "Tropical rain forest"),

  /// A color named "True Blue" with hexadecimal value <a href='https://www.colorhexa.com/0073CF' />#0073CF</a> <br><img src="https://www.colorhexa.com/0073CF.png" width="50" height='50' />
  trueBlue("#0073CF", "True blue"),

  /// A color named "Tufts Blue" with hexadecimal value <a href='https://www.colorhexa.com/417DC1' />#417DC1</a> <br><img src="https://www.colorhexa.com/417DC1.png" width="50" height='50' />
  tuftsBlue("#417DC1", "Tufts blue"),

  /// A color named "Tulip" with hexadecimal value <a href='https://www.colorhexa.com/FF878D' />#FF878D</a> <br><img src="https://www.colorhexa.com/FF878D.png" width="50" height='50' />
  tulip("#FF878D", "Tulip"),

  /// A color named "Tumbleweed" with hexadecimal value <a href='https://www.colorhexa.com/DEAA88' />#DEAA88</a> <br><img src="https://www.colorhexa.com/DEAA88.png" width="50" height='50' />
  tumbleweed("#DEAA88", "Tumbleweed"),

  /// A color named "Turkish Rose" with hexadecimal value <a href='https://www.colorhexa.com/B57281' />#B57281</a> <br><img src="https://www.colorhexa.com/B57281.png" width="50" height='50' />
  turkishRose("#B57281", "Turkish rose"),

  /// A color named "Turquoise" with hexadecimal value <a href='https://www.colorhexa.com/40E0D0' />#40E0D0</a> <br><img src="https://www.colorhexa.com/40E0D0.png" width="50" height='50' />
  turquoise('#40E0D0', 'Turquoise'),

  /// A color named "Turquoise Blue" with hexadecimal value <a href='https://www.colorhexa.com/00FFEF' />#00FFEF</a> <br><img src="https://www.colorhexa.com/00FFEF.png" width="50" height='50' />
  turquoiseBlue("#00FFEF", "Turquoise blue"),

  /// A color named "Turquoise Green" with hexadecimal value <a href='https://www.colorhexa.com/A0D6B4' />#A0D6B4</a> <br><img src="https://www.colorhexa.com/A0D6B4.png" width="50" height='50' />
  turquoiseGreen("#A0D6B4", "Turquoise green"),

  /// A color named "Tuscan" with hexadecimal value <a href='https://www.colorhexa.com/FAD6A5' />#FAD6A5</a> <br><img src="https://www.colorhexa.com/FAD6A5.png" width="50" height='50' />
  tuscan("#FAD6A5", "Tuscan"),

  /// A color named "Tuscan Brown" with hexadecimal value <a href='https://www.colorhexa.com/6F4E37' />#6F4E37</a> <br><img src="https://www.colorhexa.com/6F4E37.png" width="50" height='50' />
  tuscanBrown("#6F4E37", "Tuscan brown"),

  /// A color named "Tuscan Red" with hexadecimal value <a href='https://www.colorhexa.com/7C4848' />#7C4848</a> <br><img src="https://www.colorhexa.com/7C4848.png" width="50" height='50' />
  tuscanRed("#7C4848", "Tuscan red"),

  /// A color named "Tuscan Tan" with hexadecimal value <a href='https://www.colorhexa.com/A67B5B' />#A67B5B</a> <br><img src="https://www.colorhexa.com/A67B5B.png" width="50" height='50' />
  tuscanTan("#A67B5B", "Tuscan tan"),

  /// A color named "Tuscany" with hexadecimal value <a href='https://www.colorhexa.com/C09999' />#C09999</a> <br><img src="https://www.colorhexa.com/C09999.png" width="50" height='50' />
  tuscany("#C09999", "Tuscany"),

  /// A color named "Twilight Lavender" with hexadecimal value <a href='https://www.colorhexa.com/8A496B' />#8A496B</a> <br><img src="https://www.colorhexa.com/8A496B.png" width="50" height='50' />
  twilightLavender("#8A496B", "Twilight lavender"),

  /// A color named "Tyrian Purple" with hexadecimal value <a href='https://www.colorhexa.com/66023C' />#66023C</a> <br><img src="https://www.colorhexa.com/66023C.png" width="50" height='50' />
  tyrianPurple("#66023C", "Tyrian purple"),

  /// A color named "UA Blue" with hexadecimal value <a href='https://www.colorhexa.com/0033AA' />#0033AA</a> <br><img src="https://www.colorhexa.com/0033AA.png" width="50" height='50' />
  uaBlue("#0033AA", "UA blue"),

  /// A color named "UA Red" with hexadecimal value <a href='https://www.colorhexa.com/D9004C' />#D9004C</a> <br><img src="https://www.colorhexa.com/D9004C.png" width="50" height='50' />
  volt("#CEFF00", "Volt"),

  /// A color named "Warm Black" with hexadecimal value <a href='https://www.colorhexa.com/004242' />#004242</a> <br><img src="https://www.colorhexa.com/004242.png" width="50" height='50' />
  warmBlack("#004242", "Warm black"),

  /// A color named "Waterspout" with hexadecimal value <a href='https://www.colorhexa.com/A4F4F9' />#A4F4F9</a> <br><img src="https://www.colorhexa.com/A4F4F9.png" width="50" height='50' />
  waterspout("#A4F4F9", "Waterspout"),

  /// A color named "Wenge" with hexadecimal value <a href='https://www.colorhexa.com/645452' />#645452</a> <br><img src="https://www.colorhexa.com/645452.png" width="50" height='50' />
  wenge("#645452", "Wenge"),

  /// A color named "Wheat" with hexadecimal value <a href='https://www.colorhexa.com/F5DEB3' />#F5DEB3</a> <br><img src="https://www.colorhexa.com/F5DEB3.png" width="50" height='50' />
  wheat('#F5DEB3', 'Wheat'),

  /// A color named "White" with hexadecimal value <a href='https://www.colorhexa.com/FFFFFF' />#FFFFFF</a> <br><img src="https://www.colorhexa.com/FFFFFF.png" width="50" height='50' />
  white("#FFFFFF", "White"),

  /// A color named "White Smoke" with hexadecimal value <a href='https://www.colorhexa.com/F5F5F5' />#F5F5F5</a> <br><img src="https://www.colorhexa.com/F5F5F5.png" width="50" height='50' />
  whiteSmoke("#F5F5F5", "White smoke"),

  /// A color named "Wild Blue Yonder" with hexadecimal value <a href='https://www.colorhexa.com/A2ADD0' />#A2ADD0</a> <br><img src="https://www.colorhexa.com/A2ADD0.png" width="50" height='50' />
  wildBlueYonder("#A2ADD0", "Wild blue yonder"),

  /// A color named "Wild Orchid" with hexadecimal value <a href='https://www.colorhexa.com/D470A2' />#D470A2</a> <br><img src="https://www.colorhexa.com/D470A2.png" width="50" height='50' />
  wildOrchid("#D470A2", "Wild orchid"),

  /// A color named "Wild Strawberry" with hexadecimal value <a href='https://www.colorhexa.com/FF43A4' />#FF43A4</a> <br><img src="https://www.colorhexa.com/FF43A4.png" width="50" height='50' />
  wildStrawberry("#FF43A4", "Wild strawberry"),

  /// A color named "Wild Watermelon" with hexadecimal value <a href='https://www.colorhexa.com/FC6C85' />#FC6C85</a> <br><img src="https://www.colorhexa.com/FC6C85.png" width="50" height='50' />
  wildWatermelon("#FC6C85", "Wild watermelon"),

  /// A color named "Willpower Orange" with hexadecimal value <a href='https://www.colorhexa.com/FD5800' />#FD5800</a> <br><img src="https://www.colorhexa.com/FD5800.png" width="50" height='50' />
  willpowerOrange("#FD5800", "Willpower orange"),

  /// A color named "Windsor Tan" with hexadecimal value <a href='https://www.colorhexa.com/A75502' />#A75502</a> <br><img src="https://www.colorhexa.com/A75502.png" width="50" height='50' />
  windsorTan("#A75502", "Windsor tan"),

  /// A color named "Wine" with hexadecimal value <a href='https://www.colorhexa.com/722F37' />#722F37</a> <br><img src="https://www.colorhexa.com/722F37.png" width="50" height='50' />
  wine("#722F37", "Wine"),

  /// A color named "Wine Dregs" with hexadecimal value <a href='https://www.colorhexa.com/673147' />#673147</a> <br><img src="https://www.colorhexa.com/673147.png" width="50" height='50' />
  wineDregs("#673147", "Wine dregs"),

  /// A color named "Wintergreen Dream" with hexadecimal value <a href='https://www.colorhexa.com/56887D' />#56887D</a> <br><img src="https://www.colorhexa.com/56887D.png" width="50" height='50' />
  wintergreenDream("#56887D", "Wintergreen dream"),

  /// A color named "Winter Sky" with hexadecimal value <a href='https://www.colorhexa.com/FF007C' />#FF007C</a> <br><img src="https://www.colorhexa.com/FF007C.png" width="50" height='50' />
  winterSky("#FF007C", "Winter sky"),

  /// A color named "Winter Wizard" with hexadecimal value <a href='https://www.colorhexa.com/A0E6FF' />#A0E6FF</a> <br><img src="https://www.colorhexa.com/A0E6FF.png" width="50" height='50' />
  winterWizard("#A0E6FF", "Winter wizard"),

  /// A color named "Wisteria" with hexadecimal value <a href='https://www.colorhexa.com/C9A0DC' />#C9A0DC</a> <br><img src="https://www.colorhexa.com/C9A0DC.png" width="50" height='50' />
  wisteria("#C9A0DC", "Wisteria"),

  /// A color named "Wood Brown" with hexadecimal value <a href='https://www.colorhexa.com/C19A6B' />#C19A6B</a> <br><img src="https://www.colorhexa.com/C19A6B.png" width="50" height='50' />
  woodBrown("#C19A6B", "Wood brown"),

  /// A color named "Xanadu" with hexadecimal value <a href='https://www.colorhexa.com/738678' />#738678</a> <br><img src="https://www.colorhexa.com/738678.png" width="50" height='50' />
  xanadu("#738678", "Xanadu"),

  /// A color named "Yale Blue" with hexadecimal value <a href='https://www.colorhexa.com/0F4D92' />#0F4D92</a> <br><img src="https://www.colorhexa.com/0F4D92.png" width="50" height='50' />
  yaleBlue("#0F4D92", "Yale blue"),

  /// A color named "Yellow" with hexadecimal value <a href='https://www.colorhexa.com/FFFF00' />#FFFF00</a> <br><img src="https://www.colorhexa.com/FFFF00.png" width="50" height='50' />
  yellow("#FFFF00", "Yellow"),

  /// A color named "Yellow Green" with hexadecimal value <a href='https://www.colorhexa.com/9ACD32' />#9ACD32</a> <br><img src="https://www.colorhexa.com/9ACD32.png" width="50" height='50' />
  yellowGreen('#9ACD32', 'Yellow Green'),

  /// A color named "Yellow Orange" with hexadecimal value <a href='https://www.colorhexa.com/FFAE42' />#FFAE42</a> <br><img src="https://www.colorhexa.com/FFAE42.png" width="50" height='50' />
  yellowOrange("#FFAE42", "Yellow orange"),

  /// A color named "Yellow Rose" with hexadecimal value <a href='https://www.colorhexa.com/FFF000' />#FFF000</a> <br><img src="https://www.colorhexa.com/FFF000.png" width="50" height='50' />
  yellowRose("#FFF000", "Yellow rose"),

  /// A color named "Zaffre" with hexadecimal value <a href='https://www.colorhexa.com/0014A8' />#0014A8</a> <br><img src="https://www.colorhexa.com/0014A8.png" width="50" height='50' />
  zaffre("#0014A8", "Zaffre"),

  /// A color named "Zinnwaldite Brown" with hexadecimal value <a href='https://www.colorhexa.com/2C1608' />#2C1608</a> <br><img src="https://www.colorhexa.com/2C1608.png" width="50" height='50' />
  zinnwalditeBrown("#2C1608", "Zinnwaldite brown"),

  /// A color named "Zomp" with hexadecimal value <a href='https://www.colorhexa.com/39A78E' />#39A78E</a> <br><img src="https://www.colorhexa.com/39A78E.png" width="50" height='50' />
  zomp("#39A78E", "Zomp"),

  /// A color named "Air Force Blue" with hexadecimal value <a href='https://www.colorhexa.com/5D8AA8' />#5D8AA8</a> <br><img src="https://www.colorhexa.com/5D8AA8.png" width="50" height='50' />
  airForceBlue("#5d8aa8", "Air Force blue"),

  /// A color named "Alizarin Crimson" with hexadecimal value <a href='https://www.colorhexa.com/E32636' />#E32636</a> <br><img src="https://www.colorhexa.com/E32636.png" width="50" height='50' />
  alizarinCrimson("#e32636", "Alizarin crimson"),

  /// A color named "American Rose" with hexadecimal value <a href='https://www.colorhexa.com/FF033E' />#FF033E</a> <br><img src="https://www.colorhexa.com/FF033E.png" width="50" height='50' />
  americanRose("#ff033e", "American rose"),

  /// A color named "Anti Flash White" with hexadecimal value <a href='https://www.colorhexa.com/F2F3F4' />#F2F3F4</a> <br><img src="https://www.colorhexa.com/F2F3F4.png" width="50" height='50' />
  antiFlashWhite("#f2f3f4", "Anti-flash white"),

  /// A color named "Ash Grey" with hexadecimal value <a href='https://www.colorhexa.com/B2BEB5' />#B2BEB5</a> <br><img src="https://www.colorhexa.com/B2BEB5.png" width="50" height='50' />
  ashGrey("#b2beb5", "Ash grey"),

  /// A color named "Aurometalsaurus" with hexadecimal value <a href='https://www.colorhexa.com/6E7F80' />#6E7F80</a> <br><img src="https://www.colorhexa.com/6E7F80.png" width="50" height='50' />
  aurometalsaurus("#6e7f80", "AuroMetalSaurus"),

  /// A color named "Awesome" with hexadecimal value <a href='https://www.colorhexa.com/FF2052' />#FF2052</a> <br><img src="https://www.colorhexa.com/FF2052.png" width="50" height='50' />
  awesome("#ff2052", "Awesome"),

  /// A color named "Azure Mist/Web" with hexadecimal value <a href='https://www.colorhexa.com/F0FFFF' />#F0FFFF</a> <br><img src="https://www.colorhexa.com/F0FFFF.png" width="50" height='50' />
  azureMistWeb("#f0ffff", "Azure mist/web"),

  /// A color named "Ball Blue" with hexadecimal value <a href='https://www.colorhexa.com/21ABCD' />#21ABCD</a> <br><img src="https://www.colorhexa.com/21ABCD.png" width="50" height='50' />
  ballBlue("#21abcd", "Ball Blue"),

  /// A color named "Banana Yellow" with hexadecimal value <a href='https://www.colorhexa.com/FFE135' />#FFE135</a> <br><img src="https://www.colorhexa.com/FFE135.png" width="50" height='50' />
  bananaYellow("#ffe135", "Banana yellow"),

  /// A color named "Bazaar" with hexadecimal value <a href='https://www.colorhexa.com/98777B' />#98777B</a> <br><img src="https://www.colorhexa.com/98777B.png" width="50" height='50' />
  bazaar("#98777b", "Bazaar"),

  /// A color named "Blue Purple" with hexadecimal value <a href='https://www.colorhexa.com/8A2BE2' />#8A2BE2</a> <br><img src="https://www.colorhexa.com/8A2BE2.png" width="50" height='50' />
  bluePurple("#8a2be2", "Blue purple"),

  /// A color named "Bondi Blue" with hexadecimal value <a href='https://www.colorhexa.com/0095B6' />#0095B6</a> <br><img src="https://www.colorhexa.com/0095B6.png" width="50" height='50' />
  bondiBlue("#0095b6", "Bondi blue"),

  /// A color named "Boston University Red" with hexadecimal value <a href='https://www.colorhexa.com/CC0000' />#CC0000</a> <br><img src="https://www.colorhexa.com/CC0000.png" width="50" height='50' />
  bostonUniversityRed("#cc0000", "Boston University Red"),

  /// A color named "Boysenberry" with hexadecimal value <a href='https://www.colorhexa.com/873260' />#873260</a> <br><img src="https://www.colorhexa.com/873260.png" width="50" height='50' />
  boysenberry("#873260", "Boysenberry"),

  /// A color named "Brandeis Blue" with hexadecimal value <a href='https://www.colorhexa.com/0070FF' />#0070FF</a> <br><img src="https://www.colorhexa.com/0070FF.png" width="50" height='50' />
  brandeisBlue("#0070ff", "Brandeis blue"),

  /// A color named "Brass" with hexadecimal value <a href='https://www.colorhexa.com/B5A642' />#B5A642</a> <br><img src="https://www.colorhexa.com/B5A642.png" width="50" height='50' />
  brass("#b5a642", "Brass"),

  /// A color named "Bright Cerulean" with hexadecimal value <a href='https://www.colorhexa.com/1DACD6' />#1DACD6</a> <br><img src="https://www.colorhexa.com/1DACD6.png" width="50" height='50' />
  brightCerulean("#1dacd6", "Bright cerulean"),

  /// A color named "Bright Lavender" with hexadecimal value <a href='https://www.colorhexa.com/BF94E4' />#BF94E4</a> <br><img src="https://www.colorhexa.com/BF94E4.png" width="50" height='50' />
  brightLavender("#bf94e4", "Bright lavender"),

  /// A color named "Bright Pink" with hexadecimal value <a href='https://www.colorhexa.com/FF007F' />#FF007F</a> <br><img src="https://www.colorhexa.com/FF007F.png" width="50" height='50' />
  brightPink("#ff007f", "Bright pink"),

  /// A color named "Bright Turquoise" with hexadecimal value <a href='https://www.colorhexa.com/08E8DE' />#08E8DE</a> <br><img src="https://www.colorhexa.com/08E8DE.png" width="50" height='50' />
  brightTurquoise("#08e8de", "Bright turquoise"),

  /// A color named "Bright Ube" with hexadecimal value <a href='https://www.colorhexa.com/D19FE8' />#D19FE8</a> <br><img src="https://www.colorhexa.com/D19FE8.png" width="50" height='50' />
  brightUbe("#d19fe8", "Bright ube"),

  /// A color named "Brilliant Lavender" with hexadecimal value <a href='https://www.colorhexa.com/F4BBFF' />#F4BBFF</a> <br><img src="https://www.colorhexa.com/F4BBFF.png" width="50" height='50' />
  brilliantLavender("#f4bbff", "Brilliant lavender"),

  /// A color named "Bubbles" with hexadecimal value <a href='https://www.colorhexa.com/E7FEFF' />#E7FEFF</a> <br><img src="https://www.colorhexa.com/E7FEFF.png" width="50" height='50' />
  bubbles("#e7feff", "Bubbles"),

  /// A color named "Bulgarian Rose" with hexadecimal value <a href='https://www.colorhexa.com/480607' />#480607</a> <br><img src="https://www.colorhexa.com/480607.png" width="50" height='50' />
  bulgarianRose("#480607", "Bulgarian rose"),

  /// A color named "Café Au Lait" with hexadecimal value <a href='https://www.colorhexa.com/A67B5B' />#A67B5B</a> <br><img src="https://www.colorhexa.com/A67B5B.png" width="50" height='50' />
  cafAuLait("#a67b5b", "Café au lait"),

  /// A color named "Café Noir" with hexadecimal value <a href='https://www.colorhexa.com/4B3621' />#4B3621</a> <br><img src="https://www.colorhexa.com/4B3621.png" width="50" height='50' />
  cafNoir("#4b3621", "Café noir"),

  /// A color named "Cal Poly Pomona Green" with hexadecimal value <a href='https://www.colorhexa.com/1E4D2B' />#1E4D2B</a> <br><img src="https://www.colorhexa.com/1E4D2B.png" width="50" height='50' />
  calPolyPomonaGreen("#1e4d2b", "Cal Poly Pomona green"),

  /// A color named "Camouflage Green" with hexadecimal value <a href='https://www.colorhexa.com/78866B' />#78866B</a> <br><img src="https://www.colorhexa.com/78866B.png" width="50" height='50' />
  camouflageGreen("#78866b", "Camouflage green"),

  /// A color named "Carmine Pink" with hexadecimal value <a href='https://www.colorhexa.com/EB4C42' />#EB4C42</a> <br><img src="https://www.colorhexa.com/EB4C42.png" width="50" height='50' />
  carminePink("#eb4c42", "Carmine pink"),

  /// A color named "Carmine Red" with hexadecimal value <a href='https://www.colorhexa.com/FF0038' />#FF0038</a> <br><img src="https://www.colorhexa.com/FF0038.png" width="50" height='50' />
  carmineRed("#ff0038", "Carmine red"),

  /// A color named "Celestial Blue" with hexadecimal value <a href='https://www.colorhexa.com/4997D0' />#4997D0</a> <br><img src="https://www.colorhexa.com/4997D0.png" width="50" height='50' />
  celestialBlue("#4997d0", "Celestial blue"),

  /// A color named "Cerise Pink" with hexadecimal value <a href='https://www.colorhexa.com/EC3B83' />#EC3B83</a> <br><img src="https://www.colorhexa.com/EC3B83.png" width="50" height='50' />
  cerisePink("#ec3b83", "Cerise pink"),

  /// A color named "Chamoisee" with hexadecimal value <a href='https://www.colorhexa.com/A0785A' />#A0785A</a> <br><img src="https://www.colorhexa.com/A0785A.png" width="50" height='50' />
  chamoisee("#a0785a", "Chamoisee"),

  /// A color named "Cherry" with hexadecimal value <a href='https://www.colorhexa.com/DE3163' />#DE3163</a> <br><img src="https://www.colorhexa.com/DE3163.png" width="50" height='50' />
  cherry("#de3163", "Cherry"),

  /// A color named "Cinnamon" with hexadecimal value <a href='https://www.colorhexa.com/D2691E' />#D2691E</a> <br><img src="https://www.colorhexa.com/D2691E.png" width="50" height='50' />
  cinnamon("#d2691e", "Cinnamon"),

  /// A color named "Classic Rose" with hexadecimal value <a href='https://www.colorhexa.com/FBCCE7' />#FBCCE7</a> <br><img src="https://www.colorhexa.com/FBCCE7.png" width="50" height='50' />
  classicRose("#fbcce7", "Classic rose"),

  /// A color named "Cobalt" with hexadecimal value <a href='https://www.colorhexa.com/0047AB' />#0047AB</a> <br><img src="https://www.colorhexa.com/0047AB.png" width="50" height='50' />
  cobalt("#0047ab", "Cobalt"),

  /// A color named "Cool Black" with hexadecimal value <a href='https://www.colorhexa.com/002E63' />#002E63</a> <br><img src="https://www.colorhexa.com/002E63.png" width="50" height='50' />
  coolBlack("#002e63", "Cool black"),

  /// A color named "Coral Red" with hexadecimal value <a href='https://www.colorhexa.com/FF4040' />#FF4040</a> <br><img src="https://www.colorhexa.com/FF4040.png" width="50" height='50' />
  coralRed("#ff4040", "Coral red"),

  /// A color named "Cornflower" with hexadecimal value <a href='https://www.colorhexa.com/9ACEEB' />#9ACEEB</a> <br><img src="https://www.colorhexa.com/9ACEEB.png" width="50" height='50' />
  cornflower("#9aceeb", "Cornflower"),

  /// A color named "Crimson Red" with hexadecimal value <a href='https://www.colorhexa.com/990000' />#990000</a> <br><img src="https://www.colorhexa.com/990000.png" width="50" height='50' />
  crimsonRed("#990000", "Crimson Red"),

  /// A color named "Crimson Glory" with hexadecimal value <a href='https://www.colorhexa.com/BE0032' />#BE0032</a> <br><img src="https://www.colorhexa.com/BE0032.png" width="50" height='50' />
  crimsonGlory("#be0032", "Crimson glory"),

  /// A color named "Daffodil" with hexadecimal value <a href='https://www.colorhexa.com/FFFF31' />#FFFF31</a> <br><img src="https://www.colorhexa.com/FFFF31.png" width="50" height='50' />
  daffodil("#ffff31", "Daffodil"),

  /// A color named "Dandelion" with hexadecimal value <a href='https://www.colorhexa.com/F0E130' />#F0E130</a> <br><img src="https://www.colorhexa.com/F0E130.png" width="50" height='50' />
  dandelion("#f0e130", "Dandelion"),

  /// A color named "Dark Candy Apple Red" with hexadecimal value <a href='https://www.colorhexa.com/A40000' />#A40000</a> <br><img src="https://www.colorhexa.com/A40000.png" width="50" height='50' />
  darkCandyAppleRed("#a40000", "Dark candy apple red"),

  /// A color named "Dark Cerulean" with hexadecimal value <a href='https://www.colorhexa.com/08457E' />#08457E</a> <br><img src="https://www.colorhexa.com/08457E.png" width="50" height='50' />
  darkCerulean("#08457e", "Dark cerulean"),

  /// A color named "Dark Chestnut" with hexadecimal value <a href='https://www.colorhexa.com/986960' />#986960</a> <br><img src="https://www.colorhexa.com/986960.png" width="50" height='50' />
  darkChestnut("#986960", "Dark chestnut"),

  /// A color named "Dark Coral" with hexadecimal value <a href='https://www.colorhexa.com/CD5B45' />#CD5B45</a> <br><img src="https://www.colorhexa.com/CD5B45.png" width="50" height='50' />
  darkCoral("#cd5b45", "Dark coral"),

  /// A color named "Dark Lavender" with hexadecimal value <a href='https://www.colorhexa.com/734F96' />#734F96</a> <br><img src="https://www.colorhexa.com/734F96.png" width="50" height='50' />
  darkLavender("#734f96", "Dark lavender"),

  /// A color named "Dark Midnight Blue" with hexadecimal value <a href='https://www.colorhexa.com/003366' />#003366</a> <br><img src="https://www.colorhexa.com/003366.png" width="50" height='50' />
  darkMidnightBlue("#003366", "Dark midnight blue"),

  /// A color named "Dark Pastel Blue" with hexadecimal value <a href='https://www.colorhexa.com/779ECB' />#779ECB</a> <br><img src="https://www.colorhexa.com/779ECB.png" width="50" height='50' />
  darkPastelBlue("#779ecb", "Dark pastel blue"),

  /// A color named "Dark Pastel Purple" with hexadecimal value <a href='https://www.colorhexa.com/966FD6' />#966FD6</a> <br><img src="https://www.colorhexa.com/966FD6.png" width="50" height='50' />
  darkPastelPurple("#966fd6", "Dark pastel purple"),

  /// A color named "Dark Pastel Red" with hexadecimal value <a href='https://www.colorhexa.com/C23B22' />#C23B22</a> <br><img src="https://www.colorhexa.com/C23B22.png" width="50" height='50' />
  darkPastelRed("#c23b22", "Dark pastel red"),

  /// A color named "Dark Pink" with hexadecimal value <a href='https://www.colorhexa.com/E75480' />#E75480</a> <br><img src="https://www.colorhexa.com/E75480.png" width="50" height='50' />
  darkPink("#e75480", "Dark pink"),

  /// A color named "Dark Powder Blue" with hexadecimal value <a href='https://www.colorhexa.com/003399' />#003399</a> <br><img src="https://www.colorhexa.com/003399.png" width="50" height='50' />
  darkPowderBlue("#003399", "Dark powder blue"),

  /// A color named "Dark Raspberry" with hexadecimal value <a href='https://www.colorhexa.com/872657' />#872657</a> <br><img src="https://www.colorhexa.com/872657.png" width="50" height='50' />
  darkRaspberry("#872657", "Dark raspberry"),

  /// A color named "Dark Scarlet" with hexadecimal value <a href='https://www.colorhexa.com/560319' />#560319</a> <br><img src="https://www.colorhexa.com/560319.png" width="50" height='50' />
  darkScarlet("#560319", "Dark scarlet"),

  /// A color named "Dark Tan" with hexadecimal value <a href='https://www.colorhexa.com/918151' />#918151</a> <br><img src="https://www.colorhexa.com/918151.png" width="50" height='50' />
  darkTan("#918151", "Dark tan"),

  /// A color named "Dark Tangerine" with hexadecimal value <a href='https://www.colorhexa.com/FFA812' />#FFA812</a> <br><img src="https://www.colorhexa.com/FFA812.png" width="50" height='50' />
  darkTangerine("#ffa812", "Dark tangerine"),

  /// A color named "Dark Taupe" with hexadecimal value <a href='https://www.colorhexa.com/483C32' />#483C32</a> <br><img src="https://www.colorhexa.com/483C32.png" width="50" height='50' />
  darkTaupe("#483c32", "Dark taupe"),

  /// A color named "Dark Terra Cotta" with hexadecimal value <a href='https://www.colorhexa.com/CC4E5C' />#CC4E5C</a> <br><img src="https://www.colorhexa.com/CC4E5C.png" width="50" height='50' />
  darkTerraCotta("#cc4e5c", "Dark terra cotta"),

  /// A color named "Davy Grey" with hexadecimal value <a href='https://www.colorhexa.com/555555' />#555555</a> <br><img src="https://www.colorhexa.com/555555.png" width="50" height='50' />
  davyGrey("#555555", "Davy grey"),

  /// A color named "Debian Red" with hexadecimal value <a href='https://www.colorhexa.com/D70A53' />#D70A53</a> <br><img src="https://www.colorhexa.com/D70A53.png" width="50" height='50' />
  debianRed("#d70a53", "Debian red"),

  /// A color named "Deep Carmine" with hexadecimal value <a href='https://www.colorhexa.com/A9203E' />#A9203E</a> <br><img src="https://www.colorhexa.com/A9203E.png" width="50" height='50' />
  deepCarmine("#a9203e", "Deep carmine"),

  /// A color named "Deep Carmine Pink" with hexadecimal value <a href='https://www.colorhexa.com/EF3038' />#EF3038</a> <br><img src="https://www.colorhexa.com/EF3038.png" width="50" height='50' />
  deepCarminePink("#ef3038", "Deep carmine pink"),

  /// A color named "Deep Carrot Orange" with hexadecimal value <a href='https://www.colorhexa.com/E9692C' />#E9692C</a> <br><img src="https://www.colorhexa.com/E9692C.png" width="50" height='50' />
  deepCarrotOrange("#e9692c", "Deep carrot orange"),

  /// A color named "Deep Coffee" with hexadecimal value <a href='https://www.colorhexa.com/704241' />#704241</a> <br><img src="https://www.colorhexa.com/704241.png" width="50" height='50' />
  deepCoffee("#704241", "Deep coffee"),

  /// A color named "Deep Fuchsia" with hexadecimal value <a href='https://www.colorhexa.com/C154C1' />#C154C1</a> <br><img src="https://www.colorhexa.com/C154C1.png" width="50" height='50' />
  deepFuchsia("#c154c1", "Deep fuchsia"),

  /// A color named "Deep Lilac" with hexadecimal value <a href='https://www.colorhexa.com/9955BB' />#9955BB</a> <br><img src="https://www.colorhexa.com/9955BB.png" width="50" height='50' />
  deepLilac("#9955bb", "Deep lilac"),

  /// A color named "Deep Magenta" with hexadecimal value <a href='https://www.colorhexa.com/CC00CC' />#CC00CC</a> <br><img src="https://www.colorhexa.com/CC00CC.png" width="50" height='50' />
  deepMagenta("#cc00cc", "Deep magenta"),

  /// A color named "Deep Peach" with hexadecimal value <a href='https://www.colorhexa.com/FFCBA4' />#FFCBA4</a> <br><img src="https://www.colorhexa.com/FFCBA4.png" width="50" height='50' />
  deepPeach("#ffcba4", "Deep peach"),

  /// A color named "Dollar Bill" with hexadecimal value <a href='https://www.colorhexa.com/85BB65' />#85BB65</a> <br><img src="https://www.colorhexa.com/85BB65.png" width="50" height='50' />
  dollarBill("#85bb65", "Dollar bill"),

  /// A color named "Electric Crimson" with hexadecimal value <a href='https://www.colorhexa.com/FF003F' />#FF003F</a> <br><img src="https://www.colorhexa.com/FF003F.png" width="50" height='50' />
  electricCrimson("#ff003f", "Electric crimson"),

  /// A color named "Electric Cyan" with hexadecimal value <a href='https://www.colorhexa.com/00FFFF' />#00FFFF</a> <br><img src="https://www.colorhexa.com/00FFFF.png" width="50" height='50' />
  electricCyan("#00ffff", "Electric cyan"),

  /// A color named "Electric Lavender" with hexadecimal value <a href='https://www.colorhexa.com/F4BBFF' />#F4BBFF</a> <br><img src="https://www.colorhexa.com/F4BBFF.png" width="50" height='50' />
  electricLavender("#f4bbff", "Electric lavender"),

  /// A color named "Electric Ultramarine" with hexadecimal value <a href='https://www.colorhexa.com/3F00FF' />#3F00FF</a> <br><img src="https://www.colorhexa.com/3F00FF.png" width="50" height='50' />
  electricUltramarine("#3f00ff", "Electric ultramarine"),

  /// A color named "Electric Yellow" with hexadecimal value <a href='https://www.colorhexa.com/FFFF00' />#FFFF00</a> <br><img src="https://www.colorhexa.com/FFFF00.png" width="50" height='50' />
  electricYellow("#ffff00", "Electric yellow"),

  /// A color named "Famous" with hexadecimal value <a href='https://www.colorhexa.com/FF00FF' />#FF00FF</a> <br><img src="https://www.colorhexa.com/FF00FF.png" width="50" height='50' />
  famous("#ff00ff", "Famous"),

  /// A color named "Fern" with hexadecimal value <a href='https://www.colorhexa.com/71BC78' />#71BC78</a> <br><img src="https://www.colorhexa.com/71BC78.png" width="50" height='50' />
  fern("#71bc78", "Fern"),

  /// A color named "Fuchsia Pink" with hexadecimal value <a href='https://www.colorhexa.com/FF77FF' />#FF77FF</a> <br><img src="https://www.colorhexa.com/FF77FF.png" width="50" height='50' />
  fuchsiaPink("#ff77ff", "Fuchsia pink"),

  /// A color named "Ginger" with hexadecimal value <a href='https://www.colorhexa.com/B06500' />#B06500</a> <br><img src="https://www.colorhexa.com/B06500.png" width="50" height='50' />
  ginger("#b06500", "Ginger"),

  /// A color named "Halayà úbe" with hexadecimal value <a href='https://www.colorhexa.com/663854' />#663854</a> <br><img src="https://www.colorhexa.com/663854.png" width="50" height='50' />
  halayBe("#663854", "Halayà úbe"),

  /// A color named "International Orange" with hexadecimal value <a href='https://www.colorhexa.com/FF4F00' />#FF4F00</a> <br><img src="https://www.colorhexa.com/FF4F00.png" width="50" height='50' />
  internationalOrange("#ff4f00", "International orange"),

  /// A color named "Macaroni And Cheese" with hexadecimal value <a href='https://www.colorhexa.com/FFBD88' />#FFBD88</a> <br><img src="https://www.colorhexa.com/FFBD88.png" width="50" height='50' />
  macaroniAndCheese("#ffbd88", "Macaroni and Cheese"),

  /// A color named "Meat Brown" with hexadecimal value <a href='https://www.colorhexa.com/E5B73B' />#E5B73B</a> <br><img src="https://www.colorhexa.com/E5B73B.png" width="50" height='50' />
  meatBrown("#e5b73b", "Meat brown"),

  /// A color named "Medium Teal Blue" with hexadecimal value <a href='https://www.colorhexa.com/0054B4' />#0054B4</a> <br><img src="https://www.colorhexa.com/0054B4.png" width="50" height='50' />
  mediumTealBlue("#0054b4", "Medium teal blue"),

  /// A color named "Moonstone Blue" with hexadecimal value <a href='https://www.colorhexa.com/73A9C2' />#73A9C2</a> <br><img src="https://www.colorhexa.com/73A9C2.png" width="50" height='50' />
  moonstoneBlue("#73a9c2", "Moonstone blue"),

  /// A color named "Mordant Red 19" with hexadecimal value <a href='https://www.colorhexa.com/AE0C00' />#AE0C00</a> <br><img src="https://www.colorhexa.com/AE0C00.png" width="50" height='50' />
  mordantRed19("#ae0c00", "Mordant red 19"),

  /// A color named "Munsell" with hexadecimal value <a href='https://www.colorhexa.com/F2F3F4' />#F2F3F4</a> <br><img src="https://www.colorhexa.com/F2F3F4.png" width="50" height='50' />
  munsell("#f2f3f4", "Munsell"),

  /// A color named "Myrtle" with hexadecimal value <a href='https://www.colorhexa.com/21421E' />#21421E</a> <br><img src="https://www.colorhexa.com/21421E.png" width="50" height='50' />
  myrtle("#21421e", "Myrtle"),

  /// A color named "Navy Blue" with hexadecimal value <a href='https://www.colorhexa.com/000080' />#000080</a> <br><img src="https://www.colorhexa.com/000080.png" width="50" height='50' />
  navyBlue("#000080", "Navy blue"),

  /// A color named "Ocean Boat Blue" with hexadecimal value <a href='https://www.colorhexa.com/0077BE' />#0077BE</a> <br><img src="https://www.colorhexa.com/0077BE.png" width="50" height='50' />
  oceanBoatBlue("#0077be", "Ocean Boat Blue"),

  /// A color named "Payne Grey" with hexadecimal value <a href='https://www.colorhexa.com/536878' />#536878</a> <br><img src="https://www.colorhexa.com/536878.png" width="50" height='50' />
  payneGrey("#536878", "Payne grey"),

  /// A color named "Purple Mountain's Majesty" with hexadecimal value <a href='https://www.colorhexa.com/9D81BA' />#9D81BA</a> <br><img src="https://www.colorhexa.com/9D81BA.png" width="50" height='50' />
  purpleMountainSMajesty("#9d81ba", "Purple Mountain's Majesty"),

  /// A color named "Robin's Egg Blue" with hexadecimal value <a href='https://www.colorhexa.com/1FCECB' />#1FCECB</a> <br><img src="https://www.colorhexa.com/1FCECB.png" width="50" height='50' />
  robinSEggBlue("#1fcecb", "Robin's Egg Blue"),

  /// A color named "Saint Patrick Blue" with hexadecimal value <a href='https://www.colorhexa.com/23297A' />#23297A</a> <br><img src="https://www.colorhexa.com/23297A.png" width="50" height='50' />
  saintPatrickBlue("#23297a", "Saint Patrick Blue"),

  /// A color named "Shamrock" with hexadecimal value <a href='https://www.colorhexa.com/45CEA2' />#45CEA2</a> <br><img src="https://www.colorhexa.com/45CEA2.png" width="50" height='50' />
  shamrock("#45cea2", "Shamrock"),

  /// A color named "Smokey Topaz" with hexadecimal value <a href='https://www.colorhexa.com/933D41' />#933D41</a> <br><img src="https://www.colorhexa.com/933D41.png" width="50" height='50' />
  smokeyTopaz("#933d41", "Smokey topaz"),

  /// A color named "Sunglow" with hexadecimal value <a href='https://www.colorhexa.com/FFCC33' />#FFCC33</a> <br><img src="https://www.colorhexa.com/FFCC33.png" width="50" height='50' />
  sunglow("#ffcc33", "Sunglow"),

  /// A color named "Tawny" with hexadecimal value <a href='https://www.colorhexa.com/CD5700' />#CD5700</a> <br><img src="https://www.colorhexa.com/CD5700.png" width="50" height='50' />
  tawny("#cd5700", "Tawny");

  /// A random color from the list of named colors.
  static NamedColor get random => values.orderByRandom.first;

  final String hexadecimal;
  final String _name;

  const NamedColor(this.hexadecimal, this._name);

  /// Returns a named color from a value.
  /// If the value is a [NamedColor], it will return as is.
  ///  If the value is a [Color], it will return the named color that matches the color [hexadecimal] value.
  /// If the value is a [num], it will convert it to [int] and return the named color that matches the color [hexadecimal] value.
  /// If the value is a [String], it will return the named color that matches the color [hexadecimal] value, [name] or the [keyword].
  factory NamedColor.fromValue(dynamic value) {
    if (value is NamedColor) {
      return value;
    }

    if (value is Color) {
      value = value.hexadecimal;
    }

    if (value is num) {
      value = Color(value.round()).hexadecimal;
    }

    for (var color in values) {
      if (color.hexadecimal.flatEqual(value) || color.alphaHexadecimal.flatEqual(value) || color.keyword.flatEqual(generateKeyword(value))) {
        return color;
      }
    }
    throw ArgumentError('Invalid named color: $value');
  }

  @override
  int get alpha => _color.alpha;

  @override
  int get blue => _color.blue;

  @override
  int get green => _color.green;

  /// A unique keyword for the named color. Basically is the name of the color in lowercase, without spaces and special characters.
  string get keyword => generateKeyword(_name);

  /// The name of the color.
  string get name => _name.toTitleCase();

  @override
  double get opacity => _color.opacity;

  @override
  int get red => _color.red;

  @override
  int get value => _color.value;

  Color get _color => hexadecimal.asColor;

  @override
  double computeLuminance() => _color.computeLuminance();

  @override
  string toString() => "${name.toTitleCase()} - $hexadecimal";

  @override
  Color withAlpha(int a) => _color.withAlpha(a);

  @override
  Color withBlue(int b) => _color.withBlue(b);

  @override
  Color withGreen(int g) => _color.withGreen(g);

  @override
  Color withOpacity(double opacity) => _color.withOpacity(opacity);

  @override
  Color withRed(int r) => _color.withRed(r);
}
