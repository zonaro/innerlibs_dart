import 'dart:ui';

import 'package:innerlibs/innerlibs.dart';

typedef NamedColors = NamedColor;

/// A Enum containing all the named colors. Also implements the [Color] interface, so it can be used as a [Color].
enum NamedColor implements Color {
  /// A color named "Absolute Zero" with hexadecimal value #0048BA<br><img src="https://www.colorhexa.com/0048BA.png" width="50" height='50' />
  absoluteZero("#0048BA", "Absolute Zero"),

  /// A color named "Acid Green" with hexadecimal value #B0BF1A<br><img src="https://www.colorhexa.com/B0BF1A.png" width="50" height='50' />
  acidGreen("#B0BF1A", "Acid green"),

  /// A color named "Aero" with hexadecimal value #7CB9E8<br><img src="https://www.colorhexa.com/7CB9E8.png" width="50" height='50' />
  aero("#7CB9E8", "Aero"),

  /// A color named "Aero Blue" with hexadecimal value #C0E8D5<br><img src="https://www.colorhexa.com/C0E8D5.png" width="50" height='50' />
  aeroBlue("#C0E8D5", "Aero blue"),

  /// A color named "African Violet" with hexadecimal value #B284BE<br><img src="https://www.colorhexa.com/B284BE.png" width="50" height='50' />
  africanViolet("#B284BE", "African violet"),

  /// A color named "Air Superiority Blue" with hexadecimal value #72A0C1<br><img src="https://www.colorhexa.com/72A0C1.png" width="50" height='50' />
  airSuperiorityBlue("#72A0C1", "Air superiority blue"),

  /// A color named "Alabaster" with hexadecimal value #EDEAE0<br><img src="https://www.colorhexa.com/EDEAE0.png" width="50" height='50' />
  alabaster("#EDEAE0", "Alabaster"),

  /// A color named "Alice Blue" with hexadecimal value #F0F8FF<br><img src="https://www.colorhexa.com/F0F8FF.png" width="50" height='50' />
  aliceBlue('#F0F8FF', 'Alice Blue'),

  /// A color named "Alloy Orange" with hexadecimal value #C46210<br><img src="https://www.colorhexa.com/C46210.png" width="50" height='50' />
  alloyOrange("#C46210", "Alloy orange"),

  /// A color named "Almond" with hexadecimal value #EFDECD<br><img src="https://www.colorhexa.com/EFDECD.png" width="50" height='50' />
  almond("#EFDECD", "Almond"),

  /// A color named "Amaranth" with hexadecimal value #E52B50<br><img src="https://www.colorhexa.com/E52B50.png" width="50" height='50' />
  amaranth("#E52B50", "Amaranth"),

  /// A color named "Amaranth (M&P)" with hexadecimal value #9F2B68<br><img src="https://www.colorhexa.com/9F2B68.png" width="50" height='50' />
  amaranthMP("#9F2B68", "Amaranth (M&P)"),

  /// A color named "Amaranth Pink" with hexadecimal value #F19CBB<br><img src="https://www.colorhexa.com/F19CBB.png" width="50" height='50' />
  amaranthPink("#F19CBB", "Amaranth pink"),

  /// A color named "Amaranth Purple" with hexadecimal value #AB274F<br><img src="https://www.colorhexa.com/AB274F.png" width="50" height='50' />
  amaranthPurple("#AB274F", "Amaranth purple"),

  /// A color named "Amaranth Red" with hexadecimal value #D3212D<br><img src="https://www.colorhexa.com/D3212D.png" width="50" height='50' />
  amaranthRed("#D3212D", "Amaranth red"),

  /// A color named "Amazon" with hexadecimal value #3B7A57<br><img src="https://www.colorhexa.com/3B7A57.png" width="50" height='50' />
  amazon("#3B7A57", "Amazon"),

  /// A color named "Amber" with hexadecimal value #FFBF00<br><img src="https://www.colorhexa.com/FFBF00.png" width="50" height='50' />
  amber("#FFBF00", "Amber"),

  /// A color named "Amber (SAE/ECE)" with hexadecimal value #FF7E00<br><img src="https://www.colorhexa.com/FF7E00.png" width="50" height='50' />
  amberSAEECE("#FF7E00", "Amber (SAE/ECE)"),

  /// A color named "Amethyst" with hexadecimal value #9966CC<br><img src="https://www.colorhexa.com/9966CC.png" width="50" height='50' />
  amethyst("#9966CC", "Amethyst"),

  /// A color named "Android Green" with hexadecimal value #3DDC84<br><img src="https://www.colorhexa.com/3DDC84.png" width="50" height='50' />
  androidGreen("#3DDC84", "Android green"),

  /// A color named "Antique Brass" with hexadecimal value #CD9575<br><img src="https://www.colorhexa.com/CD9575.png" width="50" height='50' />
  antiqueBrass("#CD9575", "Antique brass"),

  /// A color named "Antique Bronze" with hexadecimal value #665D1E<br><img src="https://www.colorhexa.com/665D1E.png" width="50" height='50' />
  antiqueBronze("#665D1E", "Antique bronze"),

  /// A color named "Antique Fuchsia" with hexadecimal value #915C83<br><img src="https://www.colorhexa.com/915C83.png" width="50" height='50' />
  antiqueFuchsia("#915C83", "Antique fuchsia"),

  /// A color named "Antique Ruby" with hexadecimal value #841B2D<br><img src="https://www.colorhexa.com/841B2D.png" width="50" height='50' />
  antiqueRuby("#841B2D", "Antique ruby"),

  /// A color named "Antique White" with hexadecimal value #FAEBD7<br><img src="https://www.colorhexa.com/FAEBD7.png" width="50" height='50' />
  antiqueWhite('#FAEBD7', 'Antique White'),

  /// A color named "Ao" with hexadecimal value #008000<br><img src="https://www.colorhexa.com/008000.png" width="50" height='50' />
  ao("#008000", "Ao"),

  /// A color named "Apple Green" with hexadecimal value #8DB600<br><img src="https://www.colorhexa.com/8DB600.png" width="50" height='50' />
  appleGreen("#8DB600", "Apple green"),

  /// A color named "Apricot" with hexadecimal value #FBCEB1<br><img src="https://www.colorhexa.com/FBCEB1.png" width="50" height='50' />
  apricot("#FBCEB1", "Apricot"),

  /// A color named "Aqua" with hexadecimal value #00FFFF<br><img src="https://www.colorhexa.com/00FFFF.png" width="50" height='50' />
  aqua('#00FFFF', 'Aqua'),

  /// A color named "Aquamarine" with hexadecimal value #7FFFD4<br><img src="https://www.colorhexa.com/7FFFD4.png" width="50" height='50' />
  aquamarine('#7FFFD4', 'Aquamarine'),

  /// A color named "Arctic Lime" with hexadecimal value #D0FF14<br><img src="https://www.colorhexa.com/D0FF14.png" width="50" height='50' />
  arcticLime("#D0FF14", "Arctic lime"),

  /// A color named "Army Green" with hexadecimal value #4B5320<br><img src="https://www.colorhexa.com/4B5320.png" width="50" height='50' />
  armyGreen("#4B5320", "Army green"),

  /// A color named "Artichoke" with hexadecimal value #8F9779<br><img src="https://www.colorhexa.com/8F9779.png" width="50" height='50' />
  artichoke("#8F9779", "Artichoke"),

  /// A color named "Arylide Yellow" with hexadecimal value #E9D66B<br><img src="https://www.colorhexa.com/E9D66B.png" width="50" height='50' />
  arylideYellow("#E9D66B", "Arylide yellow"),

  /// A color named "Ash Gray" with hexadecimal value #B2BEB5<br><img src="https://www.colorhexa.com/B2BEB5.png" width="50" height='50' />
  ashGray("#B2BEB5", "Ash gray"),

  /// A color named "Asparagus" with hexadecimal value #87A96B<br><img src="https://www.colorhexa.com/87A96B.png" width="50" height='50' />
  asparagus("#87A96B", "Asparagus"),

  /// A color named "Atomic Tangerine" with hexadecimal value #FF9966<br><img src="https://www.colorhexa.com/FF9966.png" width="50" height='50' />
  atomicTangerine("#FF9966", "Atomic tangerine"),

  /// A color named "Auburn" with hexadecimal value #A52A2A<br><img src="https://www.colorhexa.com/A52A2A.png" width="50" height='50' />
  auburn("#A52A2A", "Auburn"),

  /// A color named "Aureolin" with hexadecimal value #FDEE00<br><img src="https://www.colorhexa.com/FDEE00.png" width="50" height='50' />
  aureolin("#FDEE00", "Aureolin"),

  /// A color named "Avocado" with hexadecimal value #568203<br><img src="https://www.colorhexa.com/568203.png" width="50" height='50' />
  avocado("#568203", "Avocado"),

  /// A color named "Azure" with hexadecimal value #F0FFFF<br><img src="https://www.colorhexa.com/F0FFFF.png" width="50" height='50' />
  azure('#F0FFFF', 'Azure'),

  /// A color named "Azure (X11/web color)" with hexadecimal value #F0FFFF<br><img src="https://www.colorhexa.com/F0FFFF.png" width="50" height='50' />
  azureX11WebColor("#F0FFFF", "Azure (X11/web color)"),

  /// A color named "Baby Blue" with hexadecimal value #89CFF0<br><img src="https://www.colorhexa.com/89CFF0.png" width="50" height='50' />
  babyBlue("#89CFF0", "Baby blue"),

  /// A color named "Baby Blue Eyes" with hexadecimal value #A1CAF1<br><img src="https://www.colorhexa.com/A1CAF1.png" width="50" height='50' />
  babyBlueEyes("#A1CAF1", "Baby blue eyes"),

  /// A color named "Baby Pink" with hexadecimal value #F4C2C2<br><img src="https://www.colorhexa.com/F4C2C2.png" width="50" height='50' />
  babyPink("#F4C2C2", "Baby pink"),

  /// A color named "Baby Powder" with hexadecimal value #FEFEFA<br><img src="https://www.colorhexa.com/FEFEFA.png" width="50" height='50' />
  babyPowder("#FEFEFA", "Baby powder"),

  /// A color named "Baker Miller Pink" with hexadecimal value #FF91AF<br><img src="https://www.colorhexa.com/FF91AF.png" width="50" height='50' />
  bakerMillerPink("#FF91AF", "Baker Miller pink"),

  /// A color named "Banana Mania" with hexadecimal value #FAE7B5<br><img src="https://www.colorhexa.com/FAE7B5.png" width="50" height='50' />
  bananaMania("#FAE7B5", "Banana Mania"),

  /// A color named "Barbie Pink" with hexadecimal value #DA1884<br><img src="https://www.colorhexa.com/DA1884.png" width="50" height='50' />
  barbiePink("#DA1884", "Barbie Pink"),

  /// A color named "Barn Red" with hexadecimal value #7C0A02<br><img src="https://www.colorhexa.com/7C0A02.png" width="50" height='50' />
  barnRed("#7C0A02", "Barn red"),

  /// A color named "Battleship Grey" with hexadecimal value #848482<br><img src="https://www.colorhexa.com/848482.png" width="50" height='50' />
  battleshipGrey("#848482", "Battleship grey"),

  /// A color named "B'dazzled Blue" with hexadecimal value #2E5894<br><img src="https://www.colorhexa.com/2E5894.png" width="50" height='50' />
  bdazzledBlue("#2E5894", "B'dazzled blue"),

  /// A color named "Beau Blue" with hexadecimal value #BCD4E6<br><img src="https://www.colorhexa.com/BCD4E6.png" width="50" height='50' />
  beauBlue("#BCD4E6", "Beau blue"),

  /// A color named "Beaver" with hexadecimal value #9F8170<br><img src="https://www.colorhexa.com/9F8170.png" width="50" height='50' />
  beaver("#9F8170", "Beaver"),

  /// A color named "Beige" with hexadecimal value #F5F5DC<br><img src="https://www.colorhexa.com/F5F5DC.png" width="50" height='50' />
  beige('#F5F5DC', 'Beige'),

  /// A color named "Big Dip O Ruby" with hexadecimal value #9C2542<br><img src="https://www.colorhexa.com/9C2542.png" width="50" height='50' />
  bigDipORuby("#9C2542", "Big dip o ruby"),

  /// A color named "Bisque" with hexadecimal value #FFE4C4<br><img src="https://www.colorhexa.com/FFE4C4.png" width="50" height='50' />
  bisque('#FFE4C4', 'Bisque'),

  /// A color named "Bistre" with hexadecimal value #3D2B1F<br><img src="https://www.colorhexa.com/3D2B1F.png" width="50" height='50' />
  bistre("#3D2B1F", "Bistre"),

  /// A color named "Bistre Brown" with hexadecimal value #967117<br><img src="https://www.colorhexa.com/967117.png" width="50" height='50' />
  bistreBrown("#967117", "Bistre brown"),

  /// A color named "Bitter Lemon" with hexadecimal value #CAE00D<br><img src="https://www.colorhexa.com/CAE00D.png" width="50" height='50' />
  bitterLemon("#CAE00D", "Bitter lemon"),

  /// A color named "Bitter Lime" with hexadecimal value #BFFF00<br><img src="https://www.colorhexa.com/BFFF00.png" width="50" height='50' />
  bitterLime("#BFFF00", "Bitter lime"),

  /// A color named "Bittersweet" with hexadecimal value #FE6F5E<br><img src="https://www.colorhexa.com/FE6F5E.png" width="50" height='50' />
  bittersweet("#FE6F5E", "Bittersweet"),

  /// A color named "Bittersweet Shimmer" with hexadecimal value #BF4F51<br><img src="https://www.colorhexa.com/BF4F51.png" width="50" height='50' />
  bittersweetShimmer("#BF4F51", "Bittersweet shimmer"),

  /// A color named "Black" with hexadecimal value #000000<br><img src="https://www.colorhexa.com/000000.png" width="50" height='50' />

  black('#000000', 'Black'),

  /// A color named "Black Bean" with hexadecimal value #3D0C02<br><img src="https://www.colorhexa.com/3D0C02.png" width="50" height='50' />
  blackBean("#3D0C02", "Black bean"),

  /// A color named "Black Chocolate" with hexadecimal value #1B1811<br><img src="https://www.colorhexa.com/1B1811.png" width="50" height='50' />
  blackChocolate("#1B1811", "Black chocolate"),

  /// A color named "Black Coffee" with hexadecimal value #3B2F2F<br><img src="https://www.colorhexa.com/3B2F2F.png" width="50" height='50' />
  blackCoffee("#3B2F2F", "Black coffee"),

  /// A color named "Black Coral" with hexadecimal value #54626F<br><img src="https://www.colorhexa.com/54626F.png" width="50" height='50' />
  blackCoral("#54626F", "Black coral"),

  /// A color named "Black Olive" with hexadecimal value #3B3C36<br><img src="https://www.colorhexa.com/3B3C36.png" width="50" height='50' />
  blackOlive("#3B3C36", "Black olive"),

  /// A color named "Black Shadows" with hexadecimal value #BFAFB2<br><img src="https://www.colorhexa.com/BFAFB2.png" width="50" height='50' />
  blackShadows("#BFAFB2", "Black Shadows"),

  /// A color named "Blanched Almond" with hexadecimal value #FFEBCD<br><img src="https://www.colorhexa.com/FFEBCD.png" width="50" height='50' />
  blanchedAlmond('#FFEBCD', 'Blanched Almond'),

  /// A color named "Blast Off Bronze" with hexadecimal value #A57164<br><img src="https://www.colorhexa.com/A57164.png" width="50" height='50' />
  blastOffBronze("#A57164", "Blast off bronze"),

  /// A color named "Bleu De France" with hexadecimal value #318CE7<br><img src="https://www.colorhexa.com/318CE7.png" width="50" height='50' />
  bleuDeFrance("#318CE7", "Bleu de France"),

  /// A color named "Blizzard Blue" with hexadecimal value #ACE5EE<br><img src="https://www.colorhexa.com/ACE5EE.png" width="50" height='50' />
  blizzardBlue("#ACE5EE", "Blizzard blue"),

  /// A color named "Blond" with hexadecimal value #FAF0BE<br><img src="https://www.colorhexa.com/FAF0BE.png" width="50" height='50' />
  blond("#FAF0BE", "Blond"),

  /// A color named "Blood Red" with hexadecimal value #660000<br><img src="https://www.colorhexa.com/660000.png" width="50" height='50' />
  bloodRed("#660000", "Blood red"),

  /// A color named "Blue" with hexadecimal value #0000FF<br><img src="https://www.colorhexa.com/0000FF.png" width="50" height='50' />
  blueColor('#0000FF', 'Blue'),

  /// A color named "Blue Bell" with hexadecimal value #A2A2D0<br><img src="https://www.colorhexa.com/A2A2D0.png" width="50" height='50' />
  blueBell("#A2A2D0", "Blue bell"),

  /// A color named "Blue (Crayola)" with hexadecimal value #1F75FE<br><img src="https://www.colorhexa.com/1F75FE.png" width="50" height='50' />
  blueCrayola("#1F75FE", "Blue (Crayola)"),

  /// A color named "Blue Gray" with hexadecimal value #6699CC<br><img src="https://www.colorhexa.com/6699CC.png" width="50" height='50' />
  blueGray("#6699CC", "Blue gray"),

  /// A color named "Blue Green" with hexadecimal value #0D98BA<br><img src="https://www.colorhexa.com/0D98BA.png" width="50" height='50' />
  blueGreen("#0D98BA", "Blue green"),

  /// A color named "Blue Green (Color Wheel)" with hexadecimal value #064E40<br><img src="https://www.colorhexa.com/064E40.png" width="50" height='50' />
  blueGreenColorWheel("#064E40", "Blue green (Color Wheel)"),

  /// A color named "Blue Jeans" with hexadecimal value #5DADEC<br><img src="https://www.colorhexa.com/5DADEC.png" width="50" height='50' />
  blueJeans("#5DADEC", "Blue jeans"),

  /// A color named "Blue (Munsell)" with hexadecimal value #0093AF<br><img src="https://www.colorhexa.com/0093AF.png" width="50" height='50' />
  blueMunsell("#0093AF", "Blue (Munsell)"),

  /// A color named "Blue (NCS)" with hexadecimal value #0087BD<br><img src="https://www.colorhexa.com/0087BD.png" width="50" height='50' />
  blueNCS("#0087BD", "Blue (NCS)"),

  /// A color named "Blue (Pantone)" with hexadecimal value #0018A8<br><img src="https://www.colorhexa.com/0018A8.png" width="50" height='50' />
  bluePantone("#0018A8", "Blue (Pantone)"),

  /// A color named "Blue (Pigment)" with hexadecimal value #333399<br><img src="https://www.colorhexa.com/333399.png" width="50" height='50' />
  bluePigment("#333399", "Blue (pigment)"),

  /// A color named "Blue (RYB)" with hexadecimal value #0247FE<br><img src="https://www.colorhexa.com/0247FE.png" width="50" height='50' />
  blueRYB("#0247FE", "Blue (RYB)"),

  /// A color named "Blue Sapphire" with hexadecimal value #126180<br><img src="https://www.colorhexa.com/126180.png" width="50" height='50' />
  blueSapphire("#126180", "Blue sapphire"),

  /// A color named "Bluetiful" with hexadecimal value #3C69E7<br><img src="https://www.colorhexa.com/3C69E7.png" width="50" height='50' />
  bluetiful("#3C69E7", "Bluetiful"),

  /// A color named "Blue Violet" with hexadecimal value #8A2BE2<br><img src="https://www.colorhexa.com/8A2BE2.png" width="50" height='50' />
  blueViolet('#8A2BE2', 'Blue Violet'),

  /// A color named "Blue Violet (Color Wheel)" with hexadecimal value #4D1A7F<br><img src="https://www.colorhexa.com/4D1A7F.png" width="50" height='50' />
  blueVioletColorWheel("#4D1A7F", "Blue violet (Color Wheel)"),

  /// A color named "Blue Violet (Crayola)" with hexadecimal value #7366BD<br><img src="https://www.colorhexa.com/7366BD.png" width="50" height='50' />
  blueVioletCrayola("#7366BD", "Blue violet (Crayola)"),

  /// A color named "Blue Yonder" with hexadecimal value #5072A7<br><img src="https://www.colorhexa.com/5072A7.png" width="50" height='50' />
  blueYonder("#5072A7", "Blue yonder"),

  /// A color named "Blush" with hexadecimal value #DE5D83<br><img src="https://www.colorhexa.com/de5d83.png" width="50" height='50' />
  blush("#DE5D83", "Blush"),

  /// A color named "Bole" with hexadecimal value #79443B<br><img src="https://www.colorhexa.com/79443b.png" width="50" height='50' />
  bole("#79443B", "Bole"),

  /// A color named "Bone" with hexadecimal value #E3DAC9<br><img src="https://www.colorhexa.com/e3dac9.png" width="50" height='50' />
  bone("#E3DAC9", "Bone"),

  /// A color named "Bottle Green" with hexadecimal value #006A4E<br><img src="https://www.colorhexa.com/006a4e.png" width="50" height='50' />
  bottleGreen("#006A4E", "Bottle green"),

  /// A color named "Brandy" with hexadecimal value #87413F<br><img src="https://www.colorhexa.com/87413f.png" width="50" height='50' />
  brandy("#87413F", "Brandy"),

  /// A color named "Brick Red" with hexadecimal value #CB4154<br><img src="https://www.colorhexa.com/cb4154.png" width="50" height='50' />
  brickRed("#CB4154", "Brick red"),

  /// A color named "Bright Green" with hexadecimal value #66FF00<br><img src="https://www.colorhexa.com/66ff00.png" width="50" height='50' />
  brightGreen("#66FF00", "Bright green"),

  /// A color named "Bright Lilac" with hexadecimal value #D891EF<br><img src="https://www.colorhexa.com/d891ef.png" width="50" height='50' />
  brightLilac("#D891EF", "Bright lilac"),

  /// A color named "Bright Maroon" with hexadecimal value #C32148<br><img src="https://www.colorhexa.com/c32148.png" width="50" height='50' />
  brightMaroon("#C32148", "Bright maroon"),

  /// A color named "Bright Navy Blue" with hexadecimal value #1974D2<br><img src="https://www.colorhexa.com/1974d2.png" width="50" height='50' />
  brightNavyBlue("#1974D2", "Bright navy blue"),

  /// A color named "Bright Yellow (Crayola)" with hexadecimal value #FFAA1D<br><img src="https://www.colorhexa.com/ffaa1d.png" width="50" height='50' />
  brightYellowCrayola("#FFAA1D", "Bright yellow (Crayola)"),

  /// A color named "Brilliant Rose" with hexadecimal value #FF55A3<br><img src="https://www.colorhexa.com/ff55a3.png" width="50" height='50' />
  brilliantRose("#FF55A3", "Brilliant rose"),

  /// A color named "Brink Pink" with hexadecimal value #FB607F<br><img src="https://www.colorhexa.com/fb607f.png" width="50" height='50' />
  brinkPink("#FB607F", "Brink pink"),

  /// A color named "British Racing Green" with hexadecimal value #004225<br><img src="https://www.colorhexa.com/004225.png" width="50" height='50' />
  britishRacingGreen("#004225", "British racing green"),

  /// A color named "Bronze" with hexadecimal value #CD7F32<br><img src="https://www.colorhexa.com/cd7f32.png" width="50" height='50' />
  bronze("#CD7F32", "Bronze"),

  /// A color named "Brown" with hexadecimal value #A52A2A<br><img src="https://www.colorhexa.com/a52a2a.png" width="50" height='50' />
  brown('#A52A2A', 'Brown'),

  /// A color named "Brown Sugar" with hexadecimal value #AF6E4D<br><img src="https://www.colorhexa.com/af6e4d.png" width="50" height='50' />
  brownSugar("#AF6E4D", "Brown sugar"),

  /// A color named "Brunswick Green" with hexadecimal value #1B4D3E<br><img src="https://www.colorhexa.com/1b4d3e.png" width="50" height='50' />
  brunswickGreen("#1B4D3E", "Brunswick green"),

  /// A color named "Bud Green" with hexadecimal value #7BB661<br><img src="https://www.colorhexa.com/7bb661.png" width="50" height='50' />
  budGreen("#7BB661", "Bud green"),

  /// A color named "Buff" with hexadecimal value #FFC680<br><img src="https://www.colorhexa.com/ffc680.png" width="50" height='50' />
  buff("#FFC680", "Buff"),

  /// A color named "Burgundy" with hexadecimal value #800020<br><img src="https://www.colorhexa.com/800020.png" width="50" height='50' />
  burgundy("#800020", "Burgundy"),

  /// A color named "Burlywood" with hexadecimal value #DEB887<br><img src="https://www.colorhexa.com/deb887.png" width="50" height='50' />
  burlyWood('#DEB887', 'Burly Wood'),

  /// A color named "Burnished Brown" with hexadecimal value #A17A74<br><img src="https://www.colorhexa.com/a17a74.png" width="50" height='50' />
  burnishedBrown("#A17A74", "Burnished brown"),

  /// A color named "Burnt Orange" with hexadecimal value #CC5500<br><img src="https://www.colorhexa.com/cc5500.png" width="50" height='50' />
  burntOrange("#CC5500", "Burnt orange"),

  /// A color named "Burnt Sienna" with hexadecimal value #E97451<br><img src="https://www.colorhexa.com/e97451.png" width="50" height='50' />
  burntSienna("#E97451", "Burnt sienna"),

  /// A color named "Burnt Umber" with hexadecimal value #8A3324<br><img src="https://www.colorhexa.com/8a3324.png" width="50" height='50' />
  burntUmber("#8A3324", "Burnt umber"),

  /// A color named "Byzantine" with hexadecimal value #BD33A4<br><img src="https://www.colorhexa.com/bd33a4.png" width="50" height='50' />
  byzantine("#BD33A4", "Byzantine"),

  /// A color named "Byzantium" with hexadecimal value #702963<br><img src="https://www.colorhexa.com/702963.png" width="50" height='50' />
  byzantium("#702963", "Byzantium"),

  /// A color named "Cadet" with hexadecimal value #536872<br><img src="https://www.colorhexa.com/536872.png" width="50" height='50' />
  cadet("#536872", "Cadet"),

  /// A color named "Cadet Blue" with hexadecimal value #5F9EA0<br><img src="https://www.colorhexa.com/5f9ea0.png" width="50" height='50' />
  cadetBlue('#5F9EA0', 'Cadet Blue'),

  /// A color named "Cadet Grey" with hexadecimal value #91A3B0<br><img src="https://www.colorhexa.com/91a3b0.png" width="50" height='50' />
  cadetBlueCrayola("#A9B2C3", "Cadet blue (Crayola)"),

  /// A color named "Cadet Grey" with hexadecimal value #91A3B0<br><img src="https://www.colorhexa.com/91a3b0.png" width="50" height='50' />
  cadetGrey("#91A3B0", "Cadet grey"),

  /// A color named "Cadmium Green" with hexadecimal value #006B3C<br><img src="https://www.colorhexa.com/006b3c.png" width="50" height='50' />
  cadmiumGreen("#006B3C", "Cadmium green"),

  /// A color named "Cadmium Orange" with hexadecimal value #ED872D<br><img src="https://www.colorhexa.com/ed872d.png" width="50" height='50' />
  cadmiumOrange("#ED872D", "Cadmium orange"),

  /// A color named "Cadmium Red" with hexadecimal value #E30022<br><img src="https://www.colorhexa.com/e30022.png" width="50" height='50' />
  cadmiumRed("#E30022", "Cadmium red"),

  /// A color named "Cadmium Yellow" with hexadecimal value #FFF600<br><img src="https://www.colorhexa.com/fff600.png" width="50" height='50' />
  cadmiumYellow("#FFF600", "Cadmium yellow"),

  /// A color named "Café Au Lait" with hexadecimal value #A67B5B<br><img src="https://www.colorhexa.com/A67B5B.png" width="50" height='50' />
  cafeAuLait("#A67B5B", "Café au lait"),

  /// A color named "Café Noir" with hexadecimal value #4B3621<br><img src="https://www.colorhexa.com/4B3621.png" width="50" height='50' />
  cafeNoir("#4B3621", "Café noir"),

  /// A color named "Cambridge Blue" with hexadecimal value #A3C1AD<br><img src="https://www.colorhexa.com/A3C1AD.png" width="50" height='50' />
  cambridgeBlue("#A3C1AD", "Cambridge blue"),

  /// A color named "Camel" with hexadecimal value #C19A6B<br><img src="https://www.colorhexa.com/C19A6B.png" width="50" height='50' />
  camel("#C19A6B", "Camel"),

  /// A color named "Cameo Pink" with hexadecimal value #EFBBCC<br><img src="https://www.colorhexa.com/EFBBCC.png" width="50" height='50' />
  cameoPink("#EFBBCC", "Cameo pink"),

  /// A color named "Canary" with hexadecimal value #FFFF99<br><img src="https://www.colorhexa.com/FFFF99.png" width="50" height='50' />
  canary("#FFFF99", "Canary"),

  /// A color named "Canary Yellow" with hexadecimal value #FFEF00<br><img src="https://www.colorhexa.com/FFEF00.png" width="50" height='50' />
  canaryYellow("#FFEF00", "Canary yellow"),

  /// A color named "Candy Apple Red" with hexadecimal value #FF0800<br><img src="https://www.colorhexa.com/FF0800.png" width="50" height='50' />
  candyAppleRed("#FF0800", "Candy apple red"),

  /// A color named "Candy Pink" with hexadecimal value #E4717A<br><img src="https://www.colorhexa.com/E4717A.png" width="50" height='50' />
  candyPink("#E4717A", "Candy pink"),

  /// A color named "Capri" with hexadecimal value #00BFFF<br><img src="https://www.colorhexa.com/00BFFF.png" width="50" height='50' />
  capri("#00BFFF", "Capri"),

  /// A color named "Caput Mortuum" with hexadecimal value #592720<br><img src="https://www.colorhexa.com/592720.png" width="50" height='50' />
  caputMortuum("#592720", "Caput mortuum"),

  /// A color named "Cardinal" with hexadecimal value #C41E3A<br><img src="https://www.colorhexa.com/C41E3A.png" width="50" height='50' />
  cardinal("#C41E3A", "Cardinal"),

  /// A color named "Caribbean Green" with hexadecimal value #00CC99<br><img src="https://www.colorhexa.com/00CC99.png" width="50" height='50' />
  caribbeanGreen("#00CC99", "Caribbean green"),

  /// A color named "Carmine" with hexadecimal value #960018<br><img src="https://www.colorhexa.com/960018.png" width="50" height='50' />
  carmine("#960018", "Carmine"),

  /// A color named "Carmine (M&P)" with hexadecimal value #D70040<br><img src="https://www.colorhexa.com/D70040.png" width="50" height='50' />
  carmineMP("#D70040", "Carmine (M&P)"),

  /// A color named "Carnation Pink" with hexadecimal value #FFA6C9<br><img src="https://www.colorhexa.com/FFA6C9.png" width="50" height='50' />
  carnationPink("#FFA6C9", "Carnation pink"),

  /// A color named "Carnelian" with hexadecimal value #B31B1B<br><img src="https://www.colorhexa.com/B31B1B.png" width="50" height='50' />
  carnelian("#B31B1B", "Carnelian"),

  /// A color named "Carolina Blue" with hexadecimal value #56A0D3<br><img src="https://www.colorhexa.com/56A0D3.png" width="50" height='50' />
  carolinaBlue("#56A0D3", "Carolina blue"),

  /// A color named "Carrot Orange" with hexadecimal value #ED9121<br><img src="https://www.colorhexa.com/ED9121.png" width="50" height='50' />
  carrotOrange("#ED9121", "Carrot orange"),

  /// A color named "Castleton Green" with hexadecimal value #00563F<br><img src="https://www.colorhexa.com/00563F.png" width="50" height='50' />
  castletonGreen("#00563F", "Castleton green"),

  /// A color named "Catawba" with hexadecimal value #703642<br><img src="https://www.colorhexa.com/703642.png" width="50" height='50' />
  catawba("#703642", "Catawba"),

  /// A color named "Cedar Chest" with hexadecimal value #C95A49<br><img src="https://www.colorhexa.com/C95A49.png" width="50" height='50' />
  cedarChest("#C95A49", "Cedar Chest"),

  /// A color named "Celadon" with hexadecimal value #ACE1AF<br><img src="https://www.colorhexa.com/ACE1AF.png" width="50" height='50' />
  celadon("#ACE1AF", "Celadon"),

  /// A color named "Celadon Blue" with hexadecimal value #007BA7<br><img src="https://www.colorhexa.com/007BA7.png" width="50" height='50' />
  celadonBlue("#007BA7", "Celadon blue"),

  /// A color named "Celadon Green" with hexadecimal value #2F847C<br><img src="https://www.colorhexa.com/2F847C.png" width="50" height='50' />
  celadonGreen("#2F847C", "Celadon green"),

  /// A color named "Celeste" with hexadecimal value #B2FFFF<br><img src="https://www.colorhexa.com/B2FFFF.png" width="50" height='50' />
  celeste("#B2FFFF", "Celeste"),

  /// A color named "Celtic Blue" with hexadecimal value #246BCE<br><img src="https://www.colorhexa.com/246BCE.png" width="50" height='50' />
  celticBlue("#246BCE", "Celtic blue"),

  /// A color named "Cerise" with hexadecimal value #DE3163<br><img src="https://www.colorhexa.com/DE3163.png" width="50" height='50' />
  cerise("#DE3163", "Cerise"),

  /// A color named "Cerulean" with hexadecimal value #007BA7<br><img src="https://www.colorhexa.com/007BA7.png" width="50" height='50' />
  cerulean("#007BA7", "Cerulean"),

  /// A color named "Cerulean Blue" with hexadecimal value #2A52BE<br><img src="https://www.colorhexa.com/2A52BE.png" width="50" height='50' />
  ceruleanBlue("#2A52BE", "Cerulean blue"),

  /// A color named "Cerulean Crayola" with hexadecimal value #1DACD6<br><img src="https://www.colorhexa.com/1DACD6.png" width="50" height='50' />
  ceruleanCrayola("#1DACD6", "Cerulean (Crayola)"),

  /// A color named "Cerulean Frost" with hexadecimal value #6D9BC3<br><img src="https://www.colorhexa.com/6D9BC3.png" width="50" height='50' />
  ceruleanFrost("#6D9BC3", "Cerulean frost"),

  /// A color named "CG Blue" with hexadecimal value #007AA5<br><img src="https://www.colorhexa.com/007AA5.png" width="50" height='50' />
  cgBlue("#007AA5", "CG blue"),

  /// A color named "CG Red" with hexadecimal value #E03C31<br><img src="https://www.colorhexa.com/E03C31.png" width="50" height='50' />
  cgRed("#E03C31", "CG red"),

  /// A color named "Champagne" with hexadecimal value #F7E7CE<br><img src="https://www.colorhexa.com/F7E7CE.png" width="50" height='50' />
  champagne("#F7E7CE", "Champagne"),

  /// A color named "Champagne Pink" with hexadecimal value #F1DDCF<br><img src="https://www.colorhexa.com/F1DDCF.png" width="50" height='50' />
  champagnePink("#F1DDCF", "Champagne pink"),

  /// A color named "Charcoal" with hexadecimal value #36454F<br><img src="https://www.colorhexa.com/36454F.png" width="50" height='50' />
  charcoal("#36454F", "Charcoal"),

  /// A color named "Charleston Green" with hexadecimal value #232B2B<br><img src="https://www.colorhexa.com/232B2B.png" width="50" height='50' />
  charlestonGreen("#232B2B", "Charleston green"),

  /// A color named "Charm Pink" with hexadecimal value #E68FAC<br><img src="https://www.colorhexa.com/E68FAC.png" width="50" height='50' />
  charmPink("#E68FAC", "Charm pink"),

  /// A color named "Chartreuse" with hexadecimal value #7FFF00<br><img src="https://www.colorhexa.com/7FFF00.png" width="50" height='50' />
  chartreuse('#7FFF00', 'Chartreuse'),

  /// A color named "Chartreuse Traditional" with hexadecimal value #DFFF00<br><img src="https://www.colorhexa.com/DFFF00.png" width="50" height='50' />
  chartreuseTraditional("#DFFF00", "Chartreuse (traditional)"),

  /// A color named "Chartreuse Web" with hexadecimal value #7FFF00<br><img src="https://www.colorhexa.com/7FFF00.png" width="50" height='50' />
  chartreuseWeb("#7FFF00", "Chartreuse (web)"),

  /// A color named "Cherry Blossom Pink" with hexadecimal value #FFB7C5<br><img src="https://www.colorhexa.com/FFB7C5.png" width="50" height='50' />
  cherryBlossomPink("#FFB7C5", "Cherry blossom pink"),

  /// A color named "Chestnut" with hexadecimal value #954535<br><img src="https://www.colorhexa.com/954535.png" width="50" height='50' />
  chestnut("#954535", "Chestnut"),

  /// A color named "Chili Red" with hexadecimal value #E23D28<br><img src="https://www.colorhexa.com/E23D28.png" width="50" height='50' />
  chiliRed("#E23D28", "Chili red"),

  /// A color named "China Pink" with hexadecimal value #DE6FA1<br><img src="https://www.colorhexa.com/DE6FA1.png" width="50" height='50' />
  chinaPink("#DE6FA1", "China pink"),

  /// A color named "China Rose" with hexadecimal value #A8516E<br><img src="https://www.colorhexa.com/A8516E.png" width="50" height='50' />
  chinaRose("#A8516E", "China rose"),

  /// A color named "Chinese Red" with hexadecimal value #AA381E<br><img src="https://www.colorhexa.com/AA381E.png" width="50" height='50' />
  chineseRed("#AA381E", "Chinese red"),

  /// A color named "Chinese Violet" with hexadecimal value #856088<br><img src="https://www.colorhexa.com/856088.png" width="50" height='50' />
  chineseViolet("#856088", "Chinese violet"),

  /// A color named "Chinese Yellow" with hexadecimal value #FFB200<br><img src="https://www.colorhexa.com/FFB200.png" width="50" height='50' />
  chineseYellow("#FFB200", "Chinese yellow"),

  /// A color named "Chocolate" with hexadecimal value #D2691E<br><img src="https://www.colorhexa.com/D2691E.png" width="50" height='50' />
  chocolate('#D2691E', 'Chocolate'),

  /// A color named "Chocolate Cosmos" with hexadecimal value #58111A<br><img src="https://www.colorhexa.com/58111A.png" width="50" height='50' />
  chocolateCosmos("#58111A", "Chocolate Cosmos"),

  /// A color named "Chocolate Traditional" with hexadecimal value #7B3F00<br><img src="https://www.colorhexa.com/7B3F00.png" width="50" height='50' />
  chocolateTraditional("#7B3F00", "Chocolate (traditional)"),

  /// A color named "Chocolate Web" with hexadecimal value #D2691E<br><img src="https://www.colorhexa.com/D2691E.png" width="50" height='50' />
  chocolateWeb("#D2691E", "Chocolate (web)"),

  /// A color named "Chrome Yellow" with hexadecimal value #FFA700<br><img src="https://www.colorhexa.com/FFA700.png" width="50" height='50' />
  chromeYellow("#FFA700", "Chrome yellow"),

  /// A color named "Cinereous" with hexadecimal value #98817B<br><img src="https://www.colorhexa.com/98817B.png" width="50" height='50' />
  cinereous("#98817B", "Cinereous"),

  /// A color named "Cinnabar" with hexadecimal value #E34234<br><img src="https://www.colorhexa.com/E34234.png" width="50" height='50' />
  cinnabar("#E34234", "Cinnabar"),

  /// A color named "Cinnamon Satin" with hexadecimal value #CD607E<br><img src="https://www.colorhexa.com/CD607E.png" width="50" height='50' />
  cinnamonSatin("#CD607E", "Cinnamon Satin"),

  /// A color named "Citrine" with hexadecimal value #E4D00A<br><img src="https://www.colorhexa.com/E4D00A.png" width="50" height='50' />
  citrine("#E4D00A", "Citrine"),

  /// A color named "Citron" with hexadecimal value #9FA91F<br><img src="https://www.colorhexa.com/9FA91F.png" width="50" height='50' />
  citron("#9FA91F", "Citron"),

  /// A color named "Claret" with hexadecimal value #7F1734<br><img src="https://www.colorhexa.com/7F1734.png" width="50" height='50' />
  claret("#7F1734", "Claret"),

  /// A color named "Cobalt Blue" with hexadecimal value #0047AB<br><img src="https://www.colorhexa.com/0047AB.png" width="50" height='50' />
  cobaltBlue("#0047AB", "Cobalt blue"),

  /// A color named "Cocoa Brown" with hexadecimal value #D2691E<br><img src="https://www.colorhexa.com/D2691E.png" width="50" height='50' />
  cocoaBrown("#D2691E", "Cocoa brown"),

  /// A color named "Coffee" with hexadecimal value #6F4E37<br><img src="https://www.colorhexa.com/6F4E37.png" width="50" height='50' />
  coffee("#6F4E37", "Coffee"),

  /// A color named "Columbia Blue" with hexadecimal value #B9D9EB<br><img src="https://www.colorhexa.com/B9D9EB.png" width="50" height='50' />
  columbiaBlue("#B9D9EB", "Columbia Blue"),

  /// A color named "Congo Pink" with hexadecimal value #F88379<br><img src="https://www.colorhexa.com/F88379.png" width="50" height='50' />
  congoPink("#F88379", "Congo pink"),

  /// A color named "Cool Grey" with hexadecimal value #8C92AC<br><img src="https://www.colorhexa.com/8C92AC.png" width="50" height='50' />
  coolGrey("#8C92AC", "Cool grey"),

  /// A color named "Copper" with hexadecimal value #B87333<br><img src="https://www.colorhexa.com/B87333.png" width="50" height='50' />
  copper("#B87333", "Copper"),

  /// A color named "Copper Crayola" with hexadecimal value #DA8A67<br><img src="https://www.colorhexa.com/DA8A67.png" width="50" height='50' />
  copperCrayola("#DA8A67", "Copper (Crayola)"),

  /// A color named "Copper Penny" with hexadecimal value #AD6F69<br><img src="https://www.colorhexa.com/AD6F69.png" width="50" height='50' />
  copperPenny("#AD6F69", "Copper penny"),

  /// A color named "Copper Red" with hexadecimal value #CB6D51<br><img src="https://www.colorhexa.com/CB6D51.png" width="50" height='50' />
  copperRed("#CB6D51", "Copper red"),

  /// A color named "Copper Rose" with hexadecimal value #996666<br><img src="https://www.colorhexa.com/996666.png" width="50" height='50' />
  copperRose("#996666", "Copper rose"),

  /// A color named "Coquelicot" with hexadecimal value #FF3800<br><img src="https://www.colorhexa.com/FF3800.png" width="50" height='50' />
  coquelicot("#FF3800", "Coquelicot"),

  /// A color named "Coral" with hexadecimal value #FF7F50<br><img src="https://www.colorhexa.com/FF7F50.png" width="50" height='50' />
  coral('#FF7F50', 'Coral'),

  /// A color named "Coral Pink" with hexadecimal value #F88379<br><img src="https://www.colorhexa.com/F88379.png" width="50" height='50' />
  coralPink("#F88379", "Coral pink"),

  /// A color named "Cordovan" with hexadecimal value #893F45<br><img src="https://www.colorhexa.com/893F45.png" width="50" height='50' />
  cordovan("#893F45", "Cordovan"),

  /// A color named "Corn" with hexadecimal value #FBEC5D<br><img src="https://www.colorhexa.com/FBEC5D.png" width="50" height='50' />
  corn("#FBEC5D", "Corn"),

  /// A color named "Cornell Red" with hexadecimal value #B31B1B<br><img src="https://www.colorhexa.com/B31B1B.png" width="50" height='50' />
  cornellRed("#B31B1B", "Cornell red"),

  /// A color named "Cornflower Blue" with hexadecimal value #6495ED<br><img src="https://www.colorhexa.com/6495ED.png" width="50" height='50' />
  cornflowerBlue('#6495ED', 'Cornflower Blue'),

  /// A color named "Cornsilk" with hexadecimal value #FFF8DC<br><img src="https://www.colorhexa.com/FFF8DC.png" width="50" height='50' />
  cornsilk('#FFF8DC', 'Cornsilk'),

  /// A color named "Cosmic Cobalt" with hexadecimal value #2E2D88<br><img src="https://www.colorhexa.com/2E2D88.png" width="50" height='50' />
  cosmicCobalt("#2E2D88", "Cosmic cobalt"),

  /// A color named "Cosmic Latte" with hexadecimal value #FFF8E7<br><img src="https://www.colorhexa.com/FFF8E7.png" width="50" height='50' />
  cosmicLatte("#FFF8E7", "Cosmic latte"),

  /// A color named "Cotton Candy" with hexadecimal value #FFBCD9<br><img src="https://www.colorhexa.com/FFBCD9.png" width="50" height='50' />
  cottonCandy("#FFBCD9", "Cotton candy"),

  /// A color named "Coyote Brown" with hexadecimal value #81613C<br><img src="https://www.colorhexa.com/81613C.png" width="50" height='50' />
  coyoteBrown("#81613C", "Coyote brown"),

  /// A color named "Cream" with hexadecimal value #FFFDD0<br><img src="https://www.colorhexa.com/FFFDD0.png" width="50" height='50' />
  cream("#FFFDD0", "Cream"),

  /// A color named "Crimson" with hexadecimal value #DC143C<br><img src="https://www.colorhexa.com/DC143C.png" width="50" height='50' />
  crimson('#DC143C', 'Crimson'),

  /// A color named "Crimson UA" with hexadecimal value #9E1B32<br><img src="https://www.colorhexa.com/9E1B32.png" width="50" height='50' />
  crimsonUA("#9E1B32", "Crimson (UA)"),

  /// A color named "Crystal" with hexadecimal value #A7D8DE<br><img src="https://www.colorhexa.com/A7D8DE.png" width="50" height='50' />
  crystal("#A7D8DE", "Crystal"),

  /// A color named "Cultured" with hexadecimal value #F5F5F5<br><img src="https://www.colorhexa.com/F5F5F5.png" width="50" height='50' />
  cultured("#F5F5F5", "Cultured"),

  /// A color named "Cyan" with hexadecimal value #00FFFF<br><img src="https://www.colorhexa.com/00FFFF.png" width="50" height='50' />
  cyan('#00FFFF', 'Cyan'),

  /// A color named "Cyan Process" with hexadecimal value #00B7EB<br><img src="https://www.colorhexa.com/00B7EB.png" width="50" height='50' />
  cyanProcess("#00B7EB", "Cyan (process)"),

  /// A color named "Cyber Grape" with hexadecimal value #58427C<br><img src="https://www.colorhexa.com/58427C.png" width="50" height='50' />
  cyberGrape("#58427C", "Cyber grape"),

  /// A color named "Cyber Yellow" with hexadecimal value #FFD300<br><img src="https://www.colorhexa.com/FFD300.png" width="50" height='50' />
  cyberYellow("#FFD300", "Cyber yellow"),

  /// A color named "Cyclamen" with hexadecimal value #F56FA1<br><img src="https://www.colorhexa.com/F56FA1.png" width="50" height='50' />
  cyclamen("#F56FA1", "Cyclamen"),

  /// A color named "Dark Blue" with hexadecimal value #00008B<br><img src="https://www.colorhexa.com/00008B.png" width="50" height='50' />
  darkBlue('#00008B', 'Dark Blue'),

  /// A color named "Dark Blue Gray" with hexadecimal value #666699<br><img src="https://www.colorhexa.com/666699.png" width="50" height='50' />
  darkBlueGray("#666699", "Dark blue gray"),

  /// A color named "Dark Brown" with hexadecimal value #654321<br><img src="https://www.colorhexa.com/654321.png" width="50" height='50' />
  darkBrown("#654321", "Dark brown"),

  /// A color named "Dark Byzantium" with hexadecimal value #5D3954<br><img src="https://www.colorhexa.com/5D3954.png" width="50" height='50' />
  darkByzantium("#5D3954", "Dark byzantium"),

  /// A color named "Dark Cornflower Blue" with hexadecimal value #26428B<br><img src="https://www.colorhexa.com/26428B.png" width="50" height='50' />
  darkCornflowerBlue("#26428B", "Dark cornflower blue"),

  /// A color named "Dark Cyan" with hexadecimal value #008B8B<br><img src="https://www.colorhexa.com/008B8B.png" width="50" height='50' />
  darkCyan('#008B8B', 'Dark Cyan'),

  /// A color named "Dark Electric Blue" with hexadecimal value #536878<br><img src="https://www.colorhexa.com/536878.png" width="50" height='50' />
  darkElectricBlue("#536878", "Dark electric blue"),

  /// A color named "Dark Goldenrod" with hexadecimal value #B8860B<br><img src="https://www.colorhexa.com/B8860B.png" width="50" height='50' />
  darkGoldenrod("#B8860B", "Dark goldenrod"),

  /// A color named "Dark Gray" with hexadecimal value #A9A9A9<br><img src="https://www.colorhexa.com/A9A9A9.png" width="50" height='50' />
  darkGray('#A9A9A9', 'Dark Gray'),

  /// A color named "Dark Green" with hexadecimal value #006400<br><img src="https://www.colorhexa.com/006400.png" width="50" height='50' />
  darkGreen('#006400', 'Dark Green'),

  /// A color named "Dark Green (X11)" with hexadecimal value #006400<br><img src="https://www.colorhexa.com/006400.png" width="50" height='50' />
  darkGreenX11("#006400", "Dark green (X11)"),

  /// A color named "Dark Jungle Green" with hexadecimal value #1A2421<br><img src="https://www.colorhexa.com/1A2421.png" width="50" height='50' />
  darkJungleGreen("#1A2421", "Dark jungle green"),

  /// A color named "Dark Khaki" with hexadecimal value #BDB76B<br><img src="https://www.colorhexa.com/BDB76B.png" width="50" height='50' />
  darkKhaki('#BDB76B', 'Dark Khaki'),

  /// A color named "Dark Lava" with hexadecimal value #483C32<br><img src="https://www.colorhexa.com/483C32.png" width="50" height='50' />
  darkLava("#483C32", "Dark lava"),

  /// A color named "Dark Liver" with hexadecimal value #534B4F<br><img src="https://www.colorhexa.com/534B4F.png" width="50" height='50' />
  darkLiver("#534B4F", "Dark liver"),

  /// A color named "Dark Liver (Horses)" with hexadecimal value #543D37<br><img src="https://www.colorhexa.com/543D37.png" width="50" height='50' />
  darkLiverHorses("#543D37", "Dark liver (horses)"),

  /// A color named "Dark Magenta" with hexadecimal value #8B008B<br><img src="https://www.colorhexa.com/8B008B.png" width="50" height='50' />
  darkMagenta('#8B008B', 'Dark Magenta'),

  /// A color named "Dark Moss Green" with hexadecimal value #4A5D23<br><img src="https://www.colorhexa.com/4A5D23.png" width="50" height='50' />
  darkMossGreen("#4A5D23", "Dark moss green"),

  /// A color named "Dark Olive Green" with hexadecimal value #556B2F<br><img src="https://www.colorhexa.com/556B2F.png" width="50" height='50' />
  darkOliveGreen('#556B2F', 'Dark Olive Green'),

  /// A color named "Dark Orange" with hexadecimal value #FF8C00<br><img src="https://www.colorhexa.com/FF8C00.png" width="50" height='50' />
  darkOrange('#FF8C00', 'Dark Orange'),

  /// A color named "Dark Orchid" with hexadecimal value #9932CC<br><img src="https://www.colorhexa.com/9932CC.png" width="50" height='50' />
  darkOrchid('#9932CC', 'Dark Orchid'),

  /// A color named "Dark Pastel Green" with hexadecimal value #03C03C<br><img src="https://www.colorhexa.com/03C03C.png" width="50" height='50' />
  darkPastelGreen("#03C03C", "Dark pastel green"),

  /// A color named "Dark Purple" with hexadecimal value #301934<br><img src="https://www.colorhexa.com/301934.png" width="50" height='50' />
  darkPurple("#301934", "Dark purple"),

  /// A color named "Dark Red" with hexadecimal value #8B0000<br><img src="https://www.colorhexa.com/8B0000.png" width="50" height='50' />
  darkRed('#8B0000', 'Dark Red'),

  /// A color named "Dark Salmon" with hexadecimal value #E9967A<br><img src="https://www.colorhexa.com/E9967A.png" width="50" height='50' />
  darkSalmon('#E9967A', 'Dark Salmon'),

  /// A color named "Dark Sea Green" with hexadecimal value #8FBC8F<br><img src="https://www.colorhexa.com/8FBC8F.png" width="50" height='50' />
  darkSeaGreen('#8FBC8F', 'Dark Sea Green'),

  /// A color named "Dark Sienna" with hexadecimal value #3C1414<br><img src="https://www.colorhexa.com/3C1414.png" width="50" height='50' />
  darkSienna("#3C1414", "Dark sienna"),

  /// A color named "Dark Sky Blue" with hexadecimal value #8CBED6<br><img src="https://www.colorhexa.com/8CBED6.png" width="50" height='50' />
  darkSkyBlue("#8CBED6", "Dark sky blue"),

  /// A color named "Dark Slate Blue" with hexadecimal value #483D8B<br><img src="https://www.colorhexa.com/483D8B.png" width="50" height='50' />
  darkSlateBlue('#483D8B', 'Dark Slate Blue'),

  /// A color named "Dark Slate Gray" with hexadecimal value #2F4F4F<br><img src="https://www.colorhexa.com/2F4F4F.png" width="50" height='50' />
  darkSlateGray('#2F4F4F', 'Dark Slate Gray'),

  /// A color named "Dark Spring Green" with hexadecimal value #177245<br><img src="https://www.colorhexa.com/177245.png" width="50" height='50' />
  darkSpringGreen("#177245", "Dark spring green"),

  /// A color named "Dark Turquoise" with hexadecimal value #00CED1<br><img src="https://www.colorhexa.com/00CED1.png" width="50" height='50' />
  darkTurquoise('#00CED1', 'Dark Turquoise'),

  /// A color named "Dark Violet" with hexadecimal value #9400D3<br><img src="https://www.colorhexa.com/9400D3.png" width="50" height='50' />
  darkViolet('#9400D3', 'Dark Violet'),

  /// A color named "Dartmouth Green" with hexadecimal value #00703C<br><img src="https://www.colorhexa.com/00703C.png" width="50" height='50' />
  dartmouthGreen("#00703C", "Dartmouth green"),

  /// A color named "Davy's Grey" with hexadecimal value #555555<br><img src="https://www.colorhexa.com/555555.png" width="50" height='50' />
  davysGrey("#555555", "Davy's grey"),

  /// A color named "Deep Cerise" with hexadecimal value #DA3287<br><img src="https://www.colorhexa.com/DA3287.png" width="50" height='50' />
  deepCerise("#DA3287", "Deep cerise"),

  /// A color named "Deep Champagne" with hexadecimal value #FAD6A5<br><img src="https://www.colorhexa.com/FAD6A5.png" width="50" height='50' />
  deepChampagne("#FAD6A5", "Deep champagne"),

  /// A color named "Deep Chestnut" with hexadecimal value #B94E48<br><img src="https://www.colorhexa.com/B94E48.png" width="50" height='50' />
  deepChestnut("#B94E48", "Deep chestnut"),

  /// A color named "Deep Jungle Green" with hexadecimal value #004B49<br><img src="https://www.colorhexa.com/004B49.png" width="50" height='50' />
  deepJungleGreen("#004B49", "Deep jungle green"),

  /// A color named "Deep Pink" with hexadecimal value #FF1493<br><img src="https://www.colorhexa.com/FF1493.png" width="50" height='50' />
  deepPink('#FF1493', 'Deep Pink'),

  /// A color named "Deep Saffron" with hexadecimal value #FF9933<br><img src="https://www.colorhexa.com/FF9933.png" width="50" height='50' />
  deepSaffron("#FF9933", "Deep saffron"),

  /// A color named "Deep Sky Blue" with hexadecimal value #00BFFF<br><img src="https://www.colorhexa.com/00BFFF.png" width="50" height='50' />
  deepSkyBlue('#00BFFF', 'Deep Sky Blue'),

  /// A color named "Deep Space Sparkle" with hexadecimal value #4A646C<br><img src="https://www.colorhexa.com/4A646C.png" width="50" height='50' />
  deepSpaceSparkle("#4A646C", "Deep Space Sparkle"),

  /// A color named "Deep Taupe" with hexadecimal value #7E5E60<br><img src="https://www.colorhexa.com/7E5E60.png" width="50" height='50' />
  deepTaupe("#7E5E60", "Deep taupe"),

  /// A color named "Denim" with hexadecimal value #1560BD<br><img src="https://www.colorhexa.com/1560BD.png" width="50" height='50' />
  denim("#1560BD", "Denim"),

  /// A color named "Denim Blue" with hexadecimal value #2243B6<br><img src="https://www.colorhexa.com/2243B6.png" width="50" height='50' />
  denimBlue("#2243B6", "Denim blue"),

  /// A color named "Desert" with hexadecimal value #C19A6B<br><img src="https://www.colorhexa.com/C19A6B.png" width="50" height='50' />
  desert("#C19A6B", "Desert"),

  /// A color named "Desert Sand" with hexadecimal value #EDC9AF<br><img src="https://www.colorhexa.com/EDC9AF.png" width="50" height='50' />
  desertSand("#EDC9AF", "Desert sand"),

  /// A color named "Dodger Blue" with hexadecimal value #1E90FF<br><img src="https://www.colorhexa.com/1E90FF.png" width="50" height='50' />
  dodgerBlue('#1E90FF', 'Dodger Blue'),

  /// A color named "Dogwood Rose" with hexadecimal value #D71868<br><img src="https://www.colorhexa.com/D71868.png" width="50" height='50' />
  dogwoodRose("#D71868", "Dogwood rose"),

  /// A color named "Drab" with hexadecimal value #967117<br><img src="https://www.colorhexa.com/967117.png" width="50" height='50' />
  drab("#967117", "Drab"),

  /// A color named "Duke Blue" with hexadecimal value #00009C<br><img src="https://www.colorhexa.com/00009C.png" width="50" height='50' />
  dukeBlue("#00009C", "Duke blue"),

  /// A color named "Dutch White" with hexadecimal value #EFDFBB<br><img src="https://www.colorhexa.com/EFDFBB.png" width="50" height='50' />
  dutchWhite("#EFDFBB", "Dutch white"),

  /// A color named "Earth Yellow" with hexadecimal value #E1A95F<br><img src="https://www.colorhexa.com/E1A95F.png" width="50" height='50' />
  earthYellow("#E1A95F", "Earth yellow"),

  /// A color named "Ebony" with hexadecimal value #555D50<br><img src="https://www.colorhexa.com/555D50.png" width="50" height='50' />
  ebony("#555D50", "Ebony"),

  /// A color named "Ecru" with hexadecimal value #C2B280<br><img src="https://www.colorhexa.com/C2B280.png" width="50" height='50' />
  ecru("#C2B280", "Ecru"),

  /// A color named "Eerie Black" with hexadecimal value #1B1B1B<br><img src="https://www.colorhexa.com/1B1B1B.png" width="50" height='50' />
  eerieBlack("#1B1B1B", "Eerie black"),

  /// A color named "Eggplant" with hexadecimal value #614051<br><img src="https://www.colorhexa.com/614051.png" width="50" height='50' />
  eggplant("#614051", "Eggplant"),

  /// A color named "Eggshell" with hexadecimal value #F0EAD6<br><img src="https://www.colorhexa.com/F0EAD6.png" width="50" height='50' />
  eggshell("#F0EAD6", "Eggshell"),

  /// A color named "Egyptian Blue" with hexadecimal value #1034A6<br><img src="https://www.colorhexa.com/1034A6.png" width="50" height='50' />
  egyptianBlue("#1034A6", "Egyptian blue"),

  /// A color named "Eigengrau" with hexadecimal value #16161D<br><img src="https://www.colorhexa.com/16161D.png" width="50" height='50' />
  eigengrau("#16161D", "Eigengrau"),

  /// A color named "Electric Blue" with hexadecimal value #7DF9FF<br><img src="https://www.colorhexa.com/7DF9FF.png" width="50" height='50' />
  electricBlue("#7DF9FF", "Electric blue"),

  /// A color named "Electric Green" with hexadecimal value #00FF00<br><img src="https://www.colorhexa.com/00FF00.png" width="50" height='50' />
  electricGreen("#00FF00", "Electric green"),

  /// A color named "Electric Indigo" with hexadecimal value #6F00FF<br><img src="https://www.colorhexa.com/6F00FF.png" width="50" height='50' />
  electricIndigo("#6F00FF", "Electric indigo"),

  /// A color named "Electric Lime" with hexadecimal value #CCFF00<br><img src="https://www.colorhexa.com/CCFF00.png" width="50" height='50' />
  electricLime("#CCFF00", "Electric lime"),

  /// A color named "Electric Purple" with hexadecimal value #BF00FF<br><img src="https://www.colorhexa.com/BF00FF.png" width="50" height='50' />
  electricPurple("#BF00FF", "Electric purple"),

  /// A color named "Electric Violet" with hexadecimal value #8F00FF<br><img src="https://www.colorhexa.com/8F00FF.png" width="50" height='50' />
  electricViolet("#8F00FF", "Electric violet"),

  /// A color named "Emerald" with hexadecimal value #50C878<br><img src="https://www.colorhexa.com/50C878.png" width="50" height='50' />
  emerald("#50C878", "Emerald"),

  /// A color named "Eminence" with hexadecimal value #6C3082<br><img src="https://www.colorhexa.com/6C3082.png" width="50" height='50' />
  eminence("#6C3082", "Eminence"),

  /// A color named "English Green" with hexadecimal value #1B4D3E<br><img src="https://www.colorhexa.com/1B4D3E.png" width="50" height='50' />
  englishGreen("#1B4D3E", "English green"),

  /// A color named "English Lavender" with hexadecimal value #B48395<br><img src="https://www.colorhexa.com/B48395.png" width="50" height='50' />
  englishLavender("#B48395", "English lavender"),

  /// A color named "English Red" with hexadecimal value #AB4B52<br><img src="https://www.colorhexa.com/AB4B52.png" width="50" height='50' />
  englishRed("#AB4B52", "English red"),

  /// A color named "English Vermillion" with hexadecimal value #CC474B<br><img src="https://www.colorhexa.com/CC474B.png" width="50" height='50' />
  englishVermillion("#CC474B", "English vermillion"),

  /// A color named "English Violet" with hexadecimal value #563C5C<br><img src="https://www.colorhexa.com/563C5C.png" width="50" height='50' />
  englishViolet("#563C5C", "English violet"),

  /// A color named "Erin" with hexadecimal value #00FF40<br><img src="https://www.colorhexa.com/00FF40.png" width="50" height='50' />
  erin("#00FF40", "Erin"),

  /// A color named "Eton Blue" with hexadecimal value #96C8A2<br><img src="https://www.colorhexa.com/96C8A2.png" width="50" height='50' />
  etonBlue("#96C8A2", "Eton blue"),

  /// A color named "Fallow" with hexadecimal value #C19A6B<br><img src="https://www.colorhexa.com/C19A6B.png" width="50" height='50' />
  fallow("#C19A6B", "Fallow"),

  /// A color named "Falu Red" with hexadecimal value #801818<br><img src="https://www.colorhexa.com/801818.png" width="50" height='50' />
  faluRed("#801818", "Falu red"),

  /// A color named "Fandango" with hexadecimal value #B53389<br><img src="https://www.colorhexa.com/B53389.png" width="50" height='50' />
  fandango("#B53389", "Fandango"),

  /// A color named "Fandango Pink" with hexadecimal value #DE5285<br><img src="https://www.colorhexa.com/DE5285.png" width="50" height='50' />
  fandangoPink("#DE5285", "Fandango pink"),

  /// A color named "Fashion Fuchsia" with hexadecimal value #F400A1<br><img src="https://www.colorhexa.com/F400A1.png" width="50" height='50' />
  fashionFuchsia("#F400A1", "Fashion fuchsia"),

  /// A color named "Fawn" with hexadecimal value #E5AA70<br><img src="https://www.colorhexa.com/E5AA70.png" width="50" height='50' />
  fawn("#E5AA70", "Fawn"),

  /// A color named "Feldgrau" with hexadecimal value #4D5D53<br><img src="https://www.colorhexa.com/4D5D53.png" width="50" height='50' />
  feldgrau("#4D5D53", "Feldgrau"),

  /// A color named "Feldspar" with hexadecimal value #FDD5B1<br><img src="https://www.colorhexa.com/FDD5B1.png" width="50" height='50' />
  feldspar("#FDD5B1", "Feldspar"),

  /// A color named "Fern Green" with hexadecimal value #4F7942<br><img src="https://www.colorhexa.com/4F7942.png" width="50" height='50' />
  fernGreen("#4F7942", "Fern green"),

  /// A color named "Ferrari Red" with hexadecimal value #FF2800<br><img src="https://www.colorhexa.com/FF2800.png" width="50" height='50' />
  ferrariRed("#FF2800", "Ferrari red"),

  /// A color named "Field Drab" with hexadecimal value #6C541E<br><img src="https://www.colorhexa.com/6C541E.png" width="50" height='50' />
  fieldDrab("#6C541E", "Field drab"),

  /// A color named "Firebrick" with hexadecimal value #B22222<br><img src="https://www.colorhexa.com/B22222.png" width="50" height='50' />
  firebrick("#B22222", "Firebrick"),

  /// A color named "Fire Brick" with hexadecimal value #B22222<br><img src="https://www.colorhexa.com/B22222.png" width="50" height='50' />
  fireBrick('#B22222', 'Fire Brick'),

  /// A color named "Fire Engine Red" with hexadecimal value #CE2029<br><img src="https://www.colorhexa.com/CE2029.png" width="50" height='50' />
  fireEngineRed("#CE2029", "Fire engine red"),

  /// A color named "Flame" with hexadecimal value #E25822<br><img src="https://www.colorhexa.com/E25822.png" width="50" height='50' />
  flame("#E25822", "Flame"),

  /// A color named "Flamingo Pink" with hexadecimal value #FC8EAC<br><img src="https://www.colorhexa.com/FC8EAC.png" width="50" height='50' />
  flamingoPink("#FC8EAC", "Flamingo pink"),

  /// A color named "Flattery" with hexadecimal value #6B4423<br><img src="https://www.colorhexa.com/6B4423.png" width="50" height='50' />
  flattery("#6B4423", "Flattery"),

  /// A color named "Flavescent" with hexadecimal value #F7E98E<br><img src="https://www.colorhexa.com/F7E98E.png" width="50" height='50' />
  flavescent("#F7E98E", "Flavescent"),

  /// A color named "Flax" with hexadecimal value #EEDC82<br><img src="https://www.colorhexa.com/EEDC82.png" width="50" height='50' />
  flax("#EEDC82", "Flax"),

  /// A color named "Flirt" with hexadecimal value #A2006D<br><img src="https://www.colorhexa.com/A2006D.png" width="50" height='50' />
  flirt("#A2006D", "Flirt"),

  /// A color named "Floral White" with hexadecimal value #FFFAF0<br><img src="https://www.colorhexa.com/FFFAF0.png" width="50" height='50' />
  floralWhite('#FFFAF0', 'Floral White'),

  /// A color named "Fluorescent Orange" with hexadecimal value #FFBF00<br><img src="https://www.colorhexa.com/FFBF00.png" width="50" height='50' />
  fluorescentOrange("#FFBF00", "Fluorescent orange"),

  /// A color named "Fluorescent Pink" with hexadecimal value #FF1493<br><img src="https://www.colorhexa.com/FF1493.png" width="50" height='50' />
  fluorescentPink("#FF1493", "Fluorescent pink"),

  /// A color named "Fluorescent Yellow" with hexadecimal value #CCFF00<br><img src="https://www.colorhexa.com/CCFF00.png" width="50" height='50' />
  fluorescentYellow("#CCFF00", "Fluorescent yellow"),

  /// A color named "Folly" with hexadecimal value #FF004F<br><img src="https://www.colorhexa.com/FF004F.png" width="50" height='50' />
  folly("#FF004F", "Folly"),

  /// A color named "Forest Green" with hexadecimal value #228B22<br><img src="https://www.colorhexa.com/228B22.png" width="50" height='50' />
  forestGreen('#228B22', 'Forest Green'),

  /// A color named "French Beige" with hexadecimal value #A67B5B<br><img src="https://www.colorhexa.com/A67B5B.png" width="50" height='50' />
  frenchBeige("#A67B5B", "French beige"),

  /// A color named "French Bistre" with hexadecimal value #856D4D<br><img src="https://www.colorhexa.com/856D4D.png" width="50" height='50' />
  frenchBistre("#856D4D", "French bistre"),

  /// A color named "French Blue" with hexadecimal value #0072BB<br><img src="https://www.colorhexa.com/0072BB.png" width="50" height='50' />
  frenchBlue("#0072BB", "French blue"),

  /// A color named "French Fuchsia" with hexadecimal value #FD3F92<br><img src="https://www.colorhexa.com/FD3F92.png" width="50" height='50' />
  frenchFuchsia("#FD3F92", "French fuchsia"),

  /// A color named "French Lilac" with hexadecimal value #86608E<br><img src="https://www.colorhexa.com/86608E.png" width="50" height='50' />
  frenchLilac("#86608E", "French lilac"),

  /// A color named "French Lime" with hexadecimal value #9EFD38<br><img src="https://www.colorhexa.com/9EFD38.png" width="50" height='50' />
  frenchLime("#9EFD38", "French lime"),

  /// A color named "French Mauve" with hexadecimal value #D473D4<br><img src="https://www.colorhexa.com/D473D4.png" width="50" height='50' />
  frenchMauve("#D473D4", "French mauve"),

  /// A color named "French Pink" with hexadecimal value #FD6C9E<br><img src="https://www.colorhexa.com/FD6C9E.png" width="50" height='50' />
  frenchPink("#FD6C9E", "French pink"),

  /// A color named "French Plum" with hexadecimal value #811453<br><img src="https://www.colorhexa.com/811453.png" width="50" height='50' />
  frenchPlum("#811453", "French plum"),

  /// A color named "French Puce" with hexadecimal value #4E1609<br><img src="https://www.colorhexa.com/4E1609.png" width="50" height='50' />
  frenchPuce("#4E1609", "French puce"),

  /// A color named "French Raspberry" with hexadecimal value #C72C48<br><img src="https://www.colorhexa.com/C72C48.png" width="50" height='50' />
  frenchRaspberry("#C72C48", "French raspberry"),

  /// A color named "French Rose" with hexadecimal value #F64A8A<br><img src="https://www.colorhexa.com/F64A8A.png" width="50" height='50' />
  frenchRose("#F64A8A", "French rose"),

  /// A color named "French Sky Blue" with hexadecimal value #77B5FE<br><img src="https://www.colorhexa.com/77B5FE.png" width="50" height='50' />
  frenchSkyBlue("#77B5FE", "French sky blue"),

  /// A color named "French Violet" with hexadecimal value #8806CE<br><img src="https://www.colorhexa.com/8806CE.png" width="50" height='50' />
  frenchViolet("#8806CE", "French violet"),

  /// A color named "French Wine" with hexadecimal value #AC1E44<br><img src="https://www.colorhexa.com/AC1E44.png" width="50" height='50' />
  frenchWine("#AC1E44", "French wine"),

  /// A color named "Fresh Air" with hexadecimal value #A6E7FF<br><img src="https://www.colorhexa.com/A6E7FF.png" width="50" height='50' />
  freshAir("#A6E7FF", "Fresh air"),

  /// A color named "Frosted Mint" with hexadecimal value #DBFFF8<br><img src="https://www.colorhexa.com/DBFFF8.png" width="50" height='50' />
  frostedMint("#DBFFF8", "Frosted mint"),

  /// A color named "Fuchsia" with hexadecimal value #FF00FF<br><img src="https://www.colorhexa.com/FF00FF.png" width="50" height='50' />
  fuchsia('#FF00FF', 'Fuchsia'),

  /// A color named "Fuchsia Crayola" with hexadecimal value #C154C1<br><img src="https://www.colorhexa.com/C154C1.png" width="50" height='50' />
  fuchsiaCrayola("#C154C1", "Fuchsia (Crayola)"),

  /// A color named "Fuchsia Purple" with hexadecimal value #CC397B<br><img src="https://www.colorhexa.com/CC397B.png" width="50" height='50' />
  fuchsiaPurple("#CC397B", "Fuchsia purple"),

  /// A color named "Fuchsia Rose" with hexadecimal value #C74375<br><img src="https://www.colorhexa.com/C74375.png" width="50" height='50' />
  fuchsiaRose("#C74375", "Fuchsia rose"),

  /// A color named "Fulvous" with hexadecimal value #E48400<br><img src="https://www.colorhexa.com/E48400.png" width="50" height='50' />
  fulvous("#E48400", "Fulvous"),

  /// A color named "Fuzzy Wuzzy" with hexadecimal value #CC6666<br><img src="https://www.colorhexa.com/CC6666.png" width="50" height='50' />
  fuzzyWuzzy("#CC6666", "Fuzzy Wuzzy"),

  /// A color named "Gainsboro" with hexadecimal value #DCDCDC<br><img src="https://www.colorhexa.com/DCDCDC.png" width="50" height='50' />
  gainsboro('#DCDCDC', 'Gainsboro'),

  /// A color named "Gamboge" with hexadecimal value #E49B0F<br><img src="https://www.colorhexa.com/E49B0F.png" width="50" height='50' />
  gamboge("#E49B0F", "Gamboge"),

  /// A color named "Generic Viridian" with hexadecimal value #007F66<br><img src="https://www.colorhexa.com/007F66.png" width="50" height='50' />
  genericViridian("#007F66", "Generic viridian"),

  /// A color named "Ghost White" with hexadecimal value #F8F8FF<br><img src="https://www.colorhexa.com/F8F8FF.png" width="50" height='50' />
  ghostWhite('#F8F8FF', 'Ghost White'),

  /// A color named "Giants Orange" with hexadecimal value #FE5A1D<br><img src="https://www.colorhexa.com/FE5A1D.png" width="50" height='50' />
  giantsOrange("#FE5A1D", "Giants orange"),

  /// A color named "Glaucous" with hexadecimal value #6082B6<br><img src="https://www.colorhexa.com/6082B6.png" width="50" height='50' />
  glaucous("#6082B6", "Glaucous"),

  /// A color named "Glitter" with hexadecimal value #E6E8FA<br><img src="https://www.colorhexa.com/E6E8FA.png" width="50" height='50' />
  glitter("#E6E8FA", "Glitter"),

  /// A color named "Glossy Grape" with hexadecimal value #AB92B3<br><img src="https://www.colorhexa.com/AB92B3.png" width="50" height='50' />
  glossyGrape("#AB92B3", "Glossy grape"),

  /// A color named "Go Green" with hexadecimal value #00AB66<br><img src="https://www.colorhexa.com/00AB66.png" width="50" height='50' />
  goGreen("#00AB66", "GO green"),

  /// A color named "Gold" with hexadecimal value #FFD700<br><img src="https://www.colorhexa.com/FFD700.png" width="50" height='50' />
  gold('#FFD700', 'Gold'),

  /// A color named "Golden Brown" with hexadecimal value #996515<br><img src="https://www.colorhexa.com/996515.png" width="50" height='50' />
  goldenBrown("#996515", "Golden brown"),

  /// A color named "Golden Poppy" with hexadecimal value #FCC200<br><img src="https://www.colorhexa.com/FCC200.png" width="50" height='50' />
  goldenPoppy("#FCC200", "Golden poppy"),

  /// A color named "Goldenrod" with hexadecimal value #DAA520<br><img src="https://www.colorhexa.com/DAA520.png" width="50" height='50' />
  goldenrod("#DAA520", "Goldenrod"),

  /// A color named "Golden Rod" with hexadecimal value #DAA520<br><img src="https://www.colorhexa.com/DAA520.png" width="50" height='50' />
  goldenRod('#DAA520', 'Golden Rod'),

  /// A color named "Golden Yellow" with hexadecimal value #FFDF00<br><img src="https://www.colorhexa.com/FFDF00.png" width="50" height='50' />
  goldenYellow("#FFDF00", "Golden yellow"),

  /// A color named "Gold Fusion" with hexadecimal value #85754E<br><img src="https://www.colorhexa.com/85754E.png" width="50" height='50' />
  goldFusion("#85754E", "Gold Fusion"),

  /// A color named "Granite Gray" with hexadecimal value #676767<br><img src="https://www.colorhexa.com/676767.png" width="50" height='50' />
  graniteGray("#676767", "Granite gray"),

  /// A color named "Granny Smith Apple" with hexadecimal value #A8E4A0<br><img src="https://www.colorhexa.com/A8E4A0.png" width="50" height='50' />
  grannySmithApple("#A8E4A0", "Granny Smith apple"),

  /// A color named "Grape" with hexadecimal value #6F2DA8<br><img src="https://www.colorhexa.com/6F2DA8.png" width="50" height='50' />
  grape("#6F2DA8", "Grape"),

  /// A color named "Gray" with hexadecimal value #808080<br><img src="https://www.colorhexa.com/808080.png" width="50" height='50' />
  gray('#808080', 'Gray'),

  /// A color named "Gray Asparagus" with hexadecimal value #465945<br><img src="https://www.colorhexa.com/465945.png" width="50" height='50' />
  grayAsparagus("#465945", "Gray asparagus"),

  /// A color named "Gray Blue" with hexadecimal value #8C92AC<br><img src="https://www.colorhexa.com/8C92AC.png" width="50" height='50' />
  grayBlue("#8C92AC", "Gray blue"),

  /// A color named "Green" with hexadecimal value #008000<br><img src="https://www.colorhexa.com/008000.png" width="50" height='50' />
  greenColor('#008000', 'Green'),

  /// A color named "Green Blue" with hexadecimal value #1164B4<br><img src="https://www.colorhexa.com/1164B4.png" width="50" height='50' />
  greenBlue("#1164B4", "Green blue"),

  /// A color named "Green Crayola" with hexadecimal value #1CAC78<br><img src="https://www.colorhexa.com/1CAC78.png" width="50" height='50' />
  greenCrayola("#1CAC78", "Green (Crayola)"),

  /// A color named "Green Cyan" with hexadecimal value #009966<br><img src="https://www.colorhexa.com/009966.png" width="50" height='50' />
  greenCyan("#009966", "Green cyan"),

  /// A color named "Green Lizard" with hexadecimal value #A7F432<br><img src="https://www.colorhexa.com/A7F432.png" width="50" height='50' />
  greenLizard("#A7F432", "Green lizard"),

  /// A color named "Green Munsell" with hexadecimal value #00A877<br><img src="https://www.colorhexa.com/00A877.png" width="50" height='50' />
  greenMunsell("#00A877", "Green (Munsell)"),

  /// A color named "Green NCS" with hexadecimal value #009F6B<br><img src="https://www.colorhexa.com/009F6B.png" width="50" height='50' />
  greenNCS("#009F6B", "Green (NCS)"),

  /// A color named "Green Pantone" with hexadecimal value #00AD43<br><img src="https://www.colorhexa.com/00AD43.png" width="50" height='50' />
  greenPantone("#00AD43", "Green (Pantone)"),

  /// A color named "Green Pigment" with hexadecimal value #00A550<br><img src="https://www.colorhexa.com/00A550.png" width="50" height='50' />
  greenPigment("#00A550", "Green (pigment)"),

  /// A color named "Green RYB" with hexadecimal value #66B032<br><img src="https://www.colorhexa.com/66B032.png" width="50" height='50' />
  greenRYB("#66B032", "Green (RYB)"),

  /// A color named "Green Sheen" with hexadecimal value #6EAEA1<br><img src="https://www.colorhexa.com/6EAEA1.png" width="50" height='50' />
  greenSheen("#6EAEA1", "Green sheen"),

  /// A color named "Green Yellow" with hexadecimal value #ADFF2F<br><img src="https://www.colorhexa.com/ADFF2F.png" width="50" height='50' />
  greenYellow('#ADFF2F', 'Green Yellow'),

  /// A color named "Grullo" with hexadecimal value #A99A86<br><img src="https://www.colorhexa.com/A99A86.png" width="50" height='50' />
  grullo("#A99A86", "Grullo"),

  /// A color named "Gunmetal" with hexadecimal value #2A3439<br><img src="https://www.colorhexa.com/2A3439.png" width="50" height='50' />
  gunmetal("#2a3439", "Gunmetal"),

  /// A color named "Guppie Green" with hexadecimal value #00FF7F<br><img src="https://www.colorhexa.com/00FF7F.png" width="50" height='50' />
  guppieGreen("#00FF7F", "Guppie green"),

  /// A color named "Halaya Ube" with hexadecimal value #663854<br><img src="https://www.colorhexa.com/663854.png" width="50" height='50' />
  halayaUbe("#663854", "Halayà úbe"),

  /// A color named "Han Blue" with hexadecimal value #446CCF<br><img src="https://www.colorhexa.com/446CCF.png" width="50" height='50' />
  hanBlue("#446CCF", "Han blue"),

  /// A color named "Han Purple" with hexadecimal value #5218FA<br><img src="https://www.colorhexa.com/5218FA.png" width="50" height='50' />
  hanPurple("#5218FA", "Han purple"),

  /// A color named "Hansa Yellow" with hexadecimal value #E9D66B<br><img src="https://www.colorhexa.com/E9D66B.png" width="50" height='50' />
  hansaYellow("#E9D66B", "Hansa yellow"),

  /// A color named "Harlequin" with hexadecimal value #3FFF00<br><img src="https://www.colorhexa.com/3FFF00.png" width="50" height='50' />
  harlequin("#3FFF00", "Harlequin"),

  /// A color named "Harlequin Green" with hexadecimal value #46CB18<br><img src="https://www.colorhexa.com/46CB18.png" width="50" height='50' />
  harlequinGreen("#46CB18", "Harlequin green"),

  /// A color named "Harvard Crimson" with hexadecimal value #C90016<br><img src="https://www.colorhexa.com/C90016.png" width="50" height='50' />
  harvardCrimson("#C90016", "Harvard crimson"),

  /// A color named "Harvest Gold" with hexadecimal value #DA9100<br><img src="https://www.colorhexa.com/DA9100.png" width="50" height='50' />
  harvestGold("#DA9100", "Harvest gold"),

  /// A color named "Heart Gold" with hexadecimal value #808000<br><img src="https://www.colorhexa.com/808000.png" width="50" height='50' />
  heartGold("#808000", "Heart gold"),

  /// A color named "Heat Wave" with hexadecimal value #FF7A00<br><img src="https://www.colorhexa.com/FF7A00.png" width="50" height='50' />
  heatWave("#FF7A00", "Heat Wave"),

  /// A color named "Heliotrope" with hexadecimal value #DF73FF<br><img src="https://www.colorhexa.com/DF73FF.png" width="50" height='50' />
  heliotrope("#DF73FF", "Heliotrope"),

  /// A color named "Heliotrope Gray" with hexadecimal value #AA98A9<br><img src="https://www.colorhexa.com/AA98A9.png" width="50" height='50' />
  heliotropeGray("#AA98A9", "Heliotrope gray"),

  /// A color named "Heliotrope Magenta" with hexadecimal value #AA00BB<br><img src="https://www.colorhexa.com/AA00BB.png" width="50" height='50' />
  heliotropeMagenta("#AA00BB", "Heliotrope magenta"),

  /// A color named "Hollywood Cerise" with hexadecimal value #F400A1<br><img src="https://www.colorhexa.com/F400A1.png" width="50" height='50' />
  hollywoodCerise("#F400A1", "Hollywood cerise"),

  /// A color named "Honey Dew" with hexadecimal value #F0FFF0<br><img src="https://www.colorhexa.com/F0FFF0.png" width="50" height='50' />
  honeyDew('#F0FFF0', 'Honey Dew'),

  /// A color named "Honolulu Blue" with hexadecimal value #006DB0<br><img src="https://www.colorhexa.com/006DB0.png" width="50" height='50' />
  honoluluBlue("#006DB0", "Honolulu blue"),

  /// A color named "Hooker Green" with hexadecimal value #49796B<br><img src="https://www.colorhexa.com/49796B.png" width="50" height='50' />
  hookerGreen("#49796B", "Hooker green"),

  /// A color named "Hot Magenta" with hexadecimal value #FF1DCE<br><img src="https://www.colorhexa.com/FF1DCE.png" width="50" height='50' />
  hotMagenta("#FF1DCE", "Hot magenta"),

  /// A color named "Hot Pink" with hexadecimal value #FF69B4<br><img src="https://www.colorhexa.com/FF69B4.png" width="50" height='50' />
  hotPink('#FF69B4', 'Hot Pink'),

  /// A color named "Hunter Green" with hexadecimal value #355E3B<br><img src="https://www.colorhexa.com/355E3B.png" width="50" height='50' />
  hunterGreen("#355E3B", "Hunter green"),

  /// A color named "Iceberg" with hexadecimal value #71A6D2<br><img src="https://www.colorhexa.com/71A6D2.png" width="50" height='50' />
  iceberg("#71A6D2", "Iceberg"),

  /// A color named "Icterine" with hexadecimal value #FCF75E<br><img src="https://www.colorhexa.com/FCF75E.png" width="50" height='50' />
  icterine("#FCF75E", "Icterine"),

  /// A color named "Illuminating Emerald" with hexadecimal value #319177<br><img src="https://www.colorhexa.com/319177.png" width="50" height='50' />
  illuminatingEmerald("#319177", "Illuminating emerald"),

  /// A color named "Imperial" with hexadecimal value #602F6B<br><img src="https://www.colorhexa.com/602F6B.png" width="50" height='50' />
  imperial("#602F6B", "Imperial"),

  /// A color named "Imperial Blue" with hexadecimal value #002395<br><img src="https://www.colorhexa.com/002395.png" width="50" height='50' />
  imperialBlue("#002395", "Imperial blue"),

  /// A color named "Imperial Purple" with hexadecimal value #66023C<br><img src="https://www.colorhexa.com/66023C.png" width="50" height='50' />
  imperialPurple("#66023C", "Imperial purple"),

  /// A color named "Imperial Red" with hexadecimal value #ED2939<br><img src="https://www.colorhexa.com/ED2939.png" width="50" height='50' />
  imperialRed("#ED2939", "Imperial red"),

  /// A color named "Inchworm" with hexadecimal value #B2EC5D<br><img src="https://www.colorhexa.com/B2EC5D.png" width="50" height='50' />
  inchworm("#B2EC5D", "Inchworm"),

  /// A color named "Independence" with hexadecimal value #4C516D<br><img src="https://www.colorhexa.com/4C516D.png" width="50" height='50' />
  independence("#4C516D", "Independence"),

  /// A color named "India Green" with hexadecimal value #138808<br><img src="https://www.colorhexa.com/138808.png" width="50" height='50' />
  indiaGreen("#138808", "India green"),

  /// A color named "Indian Red" with hexadecimal value #CD5C5C<br><img src="https://www.colorhexa.com/CD5C5C.png" width="50" height='50' />
  indianRed('#CD5C5C', 'Indian Red'),

  /// A color named "Indian Yellow" with hexadecimal value #E3A857<br><img src="https://www.colorhexa.com/E3A857.png" width="50" height='50' />
  indianYellow("#E3A857", "Indian yellow"),

  /// A color named "Indigo" with hexadecimal value #4B0082<br><img src="https://www.colorhexa.com/4B0082.png" width="50" height='50' />
  indigo('#4B0082', 'Indigo'),

  /// A color named "Indigo Dye" with hexadecimal value #091F92<br><img src="https://www.colorhexa.com/091F92.png" width="50" height='50' />
  indigoDye("#091F92", "Indigo dye"),

  /// A color named "Indigo Web" with hexadecimal value #4B0082<br><img src="https://www.colorhexa.com/4B0082.png" width="50" height='50' />
  indigoWeb("#4B0082", "Indigo (web)"),

  /// A color named "Infrared" with hexadecimal value #FF496C<br><img src="https://www.colorhexa.com/FF496C.png" width="50" height='50' />
  infrared("#FF496C", "Infrared"),

  /// A color named "Interdimensional Blue" with hexadecimal value #360CCC<br><img src="https://www.colorhexa.com/360CCC.png" width="50" height='50' />
  interdimensionalBlue("#360CCC", "Interdimensional blue"),

  /// A color named "International Klein Blue" with hexadecimal value #002FA7<br><img src="https://www.colorhexa.com/002FA7.png" width="50" height='50' />
  internationalKleinBlue("#002FA7", "International Klein Blue"),

  /// A color named "International Orange Aerospace" with hexadecimal value #FF4F00<br><img src="https://www.colorhexa.com/FF4F00.png" width="50" height='50' />
  internationalOrangeAerospace("#FF4F00", "International orange (aerospace)"),

  /// A color named "International Orange Engineering" with hexadecimal value #BA160C<br><img src="https://www.colorhexa.com/BA160C.png" width="50" height='50' />
  internationalOrangeEngineering("#BA160C", "International orange (engineering)"),

  /// A color named "International Orange Golden Gate Bridge" with hexadecimal value #C0362C<br><img src="https://www.colorhexa.com/C0362C.png" width="50" height='50' />
  internationalOrangeGoldenGateBridge("#C0362C", "International orange (Golden Gate Bridge)"),

  /// A color named "Iris" with hexadecimal value #5A4FCF<br><img src="https://www.colorhexa.com/5A4FCF.png" width="50" height='50' />
  iris("#5A4FCF", "Iris"),

  /// A color named "Irresistible" with hexadecimal value #B3446C<br><img src="https://www.colorhexa.com/B3446C.png" width="50" height='50' />
  irresistible("#B3446C", "Irresistible"),

  /// A color named "Isabelline" with hexadecimal value #F4F0EC<br><img src="https://www.colorhexa.com/F4F0EC.png" width="50" height='50' />
  isabelline("#F4F0EC", "Isabelline"),

  /// A color named "Islamic Green" with hexadecimal value #009000<br><img src="https://www.colorhexa.com/009000.png" width="50" height='50' />
  islamicGreen("#009000", "Islamic green"),

  /// A color named "Italian Sky Blue" with hexadecimal value #B2FFFF<br><img src="https://www.colorhexa.com/B2FFFF.png" width="50" height='50' />
  italianSkyBlue("#B2FFFF", "Italian sky blue"),

  /// A color named "Ivory" with hexadecimal value #FFFFF0<br><img src="https://www.colorhexa.com/FFFFF0.png" width="50" height='50' />
  ivory('#FFFFF0', 'Ivory'),

  /// A color named "Jade" with hexadecimal value #00A86B<br><img src="https://www.colorhexa.com/00A86B.png" width="50" height='50' />
  jade("#00A86B", "Jade"),

  /// A color named "Japanese Carmine" with hexadecimal value #9D2933<br><img src="https://www.colorhexa.com/9D2933.png" width="50" height='50' />
  japaneseCarmine("#9D2933", "Japanese carmine"),

  /// A color named "Japanese Indigo" with hexadecimal value #264348<br><img src="https://www.colorhexa.com/264348.png" width="50" height='50' />
  japaneseIndigo("#264348", "Japanese indigo"),

  /// A color named "Japanese Laurel" with hexadecimal value #0A6906<br><img src="https://www.colorhexa.com/0A6906.png" width="50" height='50' />
  japaneseLaurel("#0A6906", "Japanese laurel"),

  /// A color named "Japanese Violet" with hexadecimal value #5B3256<br><img src="https://www.colorhexa.com/5B3256.png" width="50" height='50' />
  japaneseViolet("#5B3256", "Japanese violet"),

  /// A color named "Jasmine" with hexadecimal value #F8DE7E<br><img src="https://www.colorhexa.com/F8DE7E.png" width="50" height='50' />
  jasmine("#F8DE7E", "Jasmine"),

  /// A color named "Jasper" with hexadecimal value #D73B3E<br><img src="https://www.colorhexa.com/D73B3E.png" width="50" height='50' />
  jasper("#D73B3E", "Jasper"),

  /// A color named "Jazzberry Jam" with hexadecimal value #A50B5E<br><img src="https://www.colorhexa.com/A50B5E.png" width="50" height='50' />
  jazzberryJam("#A50B5E", "Jazzberry jam"),

  /// A color named "Jelly Bean" with hexadecimal value #DA614E<br><img src="https://www.colorhexa.com/DA614E.png" width="50" height='50' />
  jellyBean("#DA614E", "Jelly bean"),

  /// A color named "Jet" with hexadecimal value #343434<br><img src="https://www.colorhexa.com/343434.png" width="50" height='50' />
  jet("#343434", "Jet"),

  /// A color named "Jonquil" with hexadecimal value #F4CA16<br><img src="https://www.colorhexa.com/F4CA16.png" width="50" height='50' />
  jonquil("#F4CA16", "Jonquil"),

  /// A color named "Jordy Blue" with hexadecimal value #8AB9F1<br><img src="https://www.colorhexa.com/8AB9F1.png" width="50" height='50' />
  jordyBlue("#8AB9F1", "Jordy blue"),

  /// A color named "June Bud" with hexadecimal value #BDDA57<br><img src="https://www.colorhexa.com/BDDA57.png" width="50" height='50' />
  juneBud("#BDDA57", "June bud"),

  /// A color named "Jungle Green" with hexadecimal value #29AB87<br><img src="https://www.colorhexa.com/29AB87.png" width="50" height='50' />
  jungleGreen("#29AB87", "Jungle green"),

  /// A color named "Kelly Green" with hexadecimal value #4CBB17<br><img src="https://www.colorhexa.com/4CBB17.png" width="50" height='50' />
  kellyGreen("#4CBB17", "Kelly green"),

  /// A color named "Kenyan Copper" with hexadecimal value #7C1C05<br><img src="https://www.colorhexa.com/7C1C05.png" width="50" height='50' />
  kenyanCopper("#7C1C05", "Kenyan copper"),

  /// A color named "Keppel" with hexadecimal value #3AB09E<br><img src="https://www.colorhexa.com/3AB09E.png" width="50" height='50' />
  keppel("#3AB09E", "Keppel"),

  /// A color named "Key Lime" with hexadecimal value #E8F48C<br><img src="https://www.colorhexa.com/E8F48C.png" width="50" height='50' />
  keyLime("#E8F48C", "Key lime"),

  /// A color named "Khaki" with hexadecimal value #F0E68C<br><img src="https://www.colorhexa.com/F0E68C.png" width="50" height='50' />
  khaki('#F0E68C', 'Khaki'),

  /// A color named "Khaki (X11)" with hexadecimal value #F0E68C<br><img src="https://www.colorhexa.com/F0E68C.png" width="50" height='50' />
  khakiX11("#F0E68C", "Khaki (X11)"),

  /// A color named "Kiwi" with hexadecimal value #8EE53F<br><img src="https://www.colorhexa.com/8EE53F.png" width="50" height='50' />
  kiwi("#8EE53F", "Kiwi"),

  /// A color named "Kobe" with hexadecimal value #882D17<br><img src="https://www.colorhexa.com/882D17.png" width="50" height='50' />
  kobe("#882D17", "Kobe"),

  /// A color named "Kobi" with hexadecimal value #E79FC4<br><img src="https://www.colorhexa.com/E79FC4.png" width="50" height='50' />
  kobi("#E79FC4", "Kobi"),

  /// A color named "Kombu Green" with hexadecimal value #354230<br><img src="https://www.colorhexa.com/354230.png" width="50" height='50' />
  kombuGreen("#354230", "Kombu green"),

  /// A color named "KU Crimson" with hexadecimal value #E8000D<br><img src="https://www.colorhexa.com/E8000D.png" width="50" height='50' />
  kuCrimson("#E8000D", "KU crimson"),

  /// A color named "Languid Lavender" with hexadecimal value #D6CADD<br><img src="https://www.colorhexa.com/D6CADD.png" width="50" height='50' />
  languidLavender("#D6CADD", "Languid lavender"),

  /// A color named "Lapis Lazuli" with hexadecimal value #26619C<br><img src="https://www.colorhexa.com/26619C.png" width="50" height='50' />
  lapisLazuli("#26619C", "Lapis lazuli"),

  /// A color named "La Salle Green" with hexadecimal value #087830<br><img src="https://www.colorhexa.com/087830.png" width="50" height='50' />
  laSalleGreen("#087830", "La Salle green"),

  /// A color named "Laser Lemon" with hexadecimal value #FFFF66<br><img src="https://www.colorhexa.com/FFFF66.png" width="50" height='50' />
  laserLemon("#FFFF66", "Laser lemon"),

  /// A color named "Laurel Green" with hexadecimal value #A9BA9D<br><img src="https://www.colorhexa.com/A9BA9D.png" width="50" height='50' />
  laurelGreen("#A9BA9D", "Laurel green"),

  /// A color named "Lava" with hexadecimal value #CF1020<br><img src="https://www.colorhexa.com/CF1020.png" width="50" height='50' />
  lava("#CF1020", "Lava"),

  /// A color named "Lavender" with hexadecimal value #E6E6FA<br><img src="https://www.colorhexa.com/E6E6FA.png" width="50" height='50' />
  lavender('#E6E6FA', 'Lavender'),

  /// A color named "Lavender Blue" with hexadecimal value #CCCCFF<br><img src="https://www.colorhexa.com/CCCCFF.png" width="50" height='50' />
  lavenderBlue("#CCCCFF", "Lavender blue"),

  /// A color named "Lavender Blush" with hexadecimal value #FFF0F5<br><img src="https://www.colorhexa.com/FFF0F5.png" width="50" height='50' />
  lavenderBlush('#FFF0F5', 'Lavender Blush'),

  /// A color named "Lavender (Floral)" with hexadecimal value #B57EDC<br><img src="https://www.colorhexa.com/B57EDC.png" width="50" height='50' />
  lavenderFloral("#B57EDC", "Lavender (floral)"),

  /// A color named "Lavender Gray" with hexadecimal value #C4C3D0<br><img src="https://www.colorhexa.com/C4C3D0.png" width="50" height='50' />
  lavenderGray("#C4C3D0", "Lavender gray"),

  /// A color named "Lavender Indigo" with hexadecimal value #9457EB<br><img src="https://www.colorhexa.com/9457EB.png" width="50" height='50' />
  lavenderIndigo("#9457EB", "Lavender indigo"),

  /// A color named "Lavender Magenta" with hexadecimal value #EE82EE<br><img src="https://www.colorhexa.com/EE82EE.png" width="50" height='50' />
  lavenderMagenta("#EE82EE", "Lavender magenta"),

  /// A color named "Lavender Mist" with hexadecimal value #E6E6FA<br><img src="https://www.colorhexa.com/E6E6FA.png" width="50" height='50' />
  lavenderMist("#E6E6FA", "Lavender mist"),

  /// A color named "Lavender Pink" with hexadecimal value #FBAED2<br><img src="https://www.colorhexa.com/FBAED2.png" width="50" height='50' />
  lavenderPink("#FBAED2", "Lavender pink"),

  /// A color named "Lavender Purple" with hexadecimal value #967BB6<br><img src="https://www.colorhexa.com/967BB6.png" width="50" height='50' />
  lavenderPurple("#967BB6", "Lavender purple"),

  /// A color named "Lavender Rose" with hexadecimal value #FBA0E3<br><img src="https://www.colorhexa.com/FBA0E3.png" width="50" height='50' />
  lavenderRose("#FBA0E3", "Lavender rose"),

  /// A color named "Lawn Green" with hexadecimal value #7CFC00<br><img src="https://www.colorhexa.com/7CFC00.png" width="50" height='50' />
  lawnGreen('#7CFC00', 'Lawn Green'),

  /// A color named "Lemon" with hexadecimal value #FFF700<br><img src="https://www.colorhexa.com/FFF700.png" width="50" height='50' />
  lemon("#FFF700", "Lemon"),

  /// A color named "Lemon Chiffon" with hexadecimal value #FFFACD<br><img src="https://www.colorhexa.com/FFFACD.png" width="50" height='50' />
  lemonChiffon('#FFFACD', 'Lemon Chiffon'),

  /// A color named "Lemon Curry" with hexadecimal value #CCA01D<br><img src="https://www.colorhexa.com/CCA01D.png" width="50" height='50' />
  lemonCurry("#CCA01D", "Lemon curry"),

  /// A color named "Lemon Glacier" with hexadecimal value #FDFF00<br><img src="https://www.colorhexa.com/FDFF00.png" width="50" height='50' />
  lemonGlacier("#FDFF00", "Lemon glacier"),

  /// A color named "Lemon Lime" with hexadecimal value #E3FF00<br><img src="https://www.colorhexa.com/E3FF00.png" width="50" height='50' />
  lemonLime("#E3FF00", "Lemon lime"),

  /// A color named "Lemon Meringue" with hexadecimal value #F6EABE<br><img src="https://www.colorhexa.com/F6EABE.png" width="50" height='50' />
  lemonMeringue("#F6EABE", "Lemon meringue"),

  /// A color named "Lemon Yellow" with hexadecimal value #FFF44F<br><img src="https://www.colorhexa.com/FFF44F.png" width="50" height='50' />
  lemonYellow("#FFF44F", "Lemon yellow"),

  /// A color named "Liberty" with hexadecimal value #545AA7<br><img src="https://www.colorhexa.com/545AA7.png" width="50" height='50' />
  liberty("#545AA7", "Liberty"),

  /// A color named "Licorice" with hexadecimal value #1A1110<br><img src="https://www.colorhexa.com/1A1110.png" width="50" height='50' />
  licorice("#1A1110", "Licorice"),

  /// A color named "Light Apricot" with hexadecimal value #FDD5B1<br><img src="https://www.colorhexa.com/FDD5B1.png" width="50" height='50' />
  lightApricot("#FDD5B1", "Light apricot"),

  /// A color named "Light Blue" with hexadecimal value #ADD8E6<br><img src="https://www.colorhexa.com/ADD8E6.png" width="50" height='50' />
  lightBlue('#ADD8E6', 'Light Blue'),

  /// A color named "Light Brown" with hexadecimal value #B5651D<br><img src="https://www.colorhexa.com/B5651D.png" width="50" height='50' />
  lightBrown("#B5651D", "Light brown"),

  /// A color named "Light Carmine Pink" with hexadecimal value #E66771<br><img src="https://www.colorhexa.com/E66771.png" width="50" height='50' />
  lightCarminePink("#E66771", "Light carmine pink"),

  /// A color named "Light Coral" with hexadecimal value #F08080<br><img src="https://www.colorhexa.com/F08080.png" width="50" height='50' />
  lightCoral('#F08080', 'Light Coral'),

  /// A color named "Light Cornflower Blue" with hexadecimal value #93CCEA<br><img src="https://www.colorhexa.com/93CCEA.png" width="50" height='50' />
  lightCornflowerBlue("#93CCEA", "Light cornflower blue"),

  /// A color named "Light Crimson" with hexadecimal value #F56991<br><img src="https://www.colorhexa.com/F56991.png" width="50" height='50' />
  lightCrimson("#F56991", "Light crimson"),

  /// A color named "Light Cyan" with hexadecimal value #E0FFFF<br><img src="https://www.colorhexa.com/E0FFFF.png" width="50" height='50' />
  lightCyan('#E0FFFF', 'Light Cyan'),

  /// A color named "Light Deep Pink" with hexadecimal value #FF5CCD<br><img src="https://www.colorhexa.com/FF5CCD.png" width="50" height='50' />
  lightDeepPink("#FF5CCD", "Light deep pink"),

  /// A color named "Light French Beige" with hexadecimal value #C8AD7F<br><img src="https://www.colorhexa.com/C8AD7F.png" width="50" height='50' />
  lightFrenchBeige("#C8AD7F", "Light French beige"),

  /// A color named "Light Fuchsia Pink" with hexadecimal value #F984EF<br><img src="https://www.colorhexa.com/F984EF.png" width="50" height='50' />
  lightFuchsiaPink("#F984EF", "Light fuchsia pink"),

  /// A color named "Light Goldenrod Yellow" with hexadecimal value #FAFAD2<br><img src="https://www.colorhexa.com/FAFAD2.png" width="50" height='50' />
  lightGoldenrodYellow("#FAFAD2", "Light goldenrod yellow"),

  /// A color named "Light Golden Rod Yellow" with hexadecimal value #FAFAD2<br><img src="https://www.colorhexa.com/FAFAD2.png" width="50" height='50' />
  lightGoldenRodYellow('#FAFAD2', 'Light Golden Rod Yellow'),

  /// A color named "Light Gray" with hexadecimal value #D3D3D3<br><img src="https://www.colorhexa.com/D3D3D3.png" width="50" height='50' />
  lightGray('#D3D3D3', 'Light Gray'),

  /// A color named "Light Green" with hexadecimal value #90EE90<br><img src="https://www.colorhexa.com/90EE90.png" width="50" height='50' />
  lightGreen('#90EE90', 'Light Green'),

  /// A color named "Light Hot Pink" with hexadecimal value #FFB3DE<br><img src="https://www.colorhexa.com/FFB3DE.png" width="50" height='50' />
  lightHotPink("#FFB3DE", "Light hot pink"),

  /// A color named "Light Khaki" with hexadecimal value #F0E68C<br><img src="https://www.colorhexa.com/F0E68C.png" width="50" height='50' />
  lightKhaki("#F0E68C", "Light khaki"),

  /// A color named "Light Medium Orchid" with hexadecimal value #D39BCB<br><img src="https://www.colorhexa.com/D39BCB.png" width="50" height='50' />
  lightMediumOrchid("#D39BCB", "Light medium orchid"),

  /// A color named "Light Moss Green" with hexadecimal value #ADDFAD<br><img src="https://www.colorhexa.com/ADDFAD.png" width="50" height='50' />
  lightMossGreen("#ADDFAD", "Light moss green"),

  /// A color named "Light Orchid" with hexadecimal value #E6A8D7<br><img src="https://www.colorhexa.com/E6A8D7.png" width="50" height='50' />
  lightOrchid("#E6A8D7", "Light orchid"),

  /// A color named "Light Pastel Purple" with hexadecimal value #B19CD9<br><img src="https://www.colorhexa.com/B19CD9.png" width="50" height='50' />
  lightPastelPurple("#B19CD9", "Light pastel purple"),

  /// A color named "Light Pink" with hexadecimal value #FFB6C1<br><img src="https://www.colorhexa.com/FFB6C1.png" width="50" height='50' />
  lightPink('#FFB6C1', 'Light Pink'),

  /// A color named "Light Red Ochre" with hexadecimal value #E97451<br><img src="https://www.colorhexa.com/E97451.png" width="50" height='50' />
  lightRedOchre("#E97451", "Light red ochre"),

  /// A color named "Light Salmon" with hexadecimal value #FFA07A<br><img src="https://www.colorhexa.com/FFA07A.png" width="50" height='50' />
  lightSalmon('#FFA07A', 'Light Salmon'),

  /// A color named "Light Salmon Pink" with hexadecimal value #FF9999<br><img src="https://www.colorhexa.com/FF9999.png" width="50" height='50' />
  lightSalmonPink("#FF9999", "Light salmon pink"),

  /// A color named "Light Sea Green" with hexadecimal value #20B2AA<br><img src="https://www.colorhexa.com/20B2AA.png" width="50" height='50' />
  lightSeaGreen('#20B2AA', 'Light Sea Green'),

  /// A color named "Light Sky Blue" with hexadecimal value #87CEFA<br><img src="https://www.colorhexa.com/87CEFA.png" width="50" height='50' />
  lightSkyBlue('#87CEFA', 'Light Sky Blue'),

  /// A color named "Light Slate Gray" with hexadecimal value #778899<br><img src="https://www.colorhexa.com/778899.png" width="50" height='50' />
  lightSlateGray('#778899', 'Light Slate Gray'),

  /// A color named "Light Steel Blue" with hexadecimal value #B0C4DE<br><img src="https://www.colorhexa.com/B0C4DE.png" width="50" height='50' />
  lightSteelBlue('#B0C4DE', 'Light Steel Blue'),

  /// A color named "Light Taupe" with hexadecimal value #B38B6D<br><img src="https://www.colorhexa.com/B38B6D.png" width="50" height='50' />
  lightTaupe("#B38B6D", "Light taupe"),

  /// A color named "Light Thulian Pink" with hexadecimal value #E68FAC<br><img src="https://www.colorhexa.com/E68FAC.png" width="50" height='50' />
  lightThulianPink("#E68FAC", "Light Thulian pink"),

  /// A color named "Light Yellow" with hexadecimal value #FFFFE0<br><img src="https://www.colorhexa.com/FFFFE0.png" width="50" height='50' />
  lightYellow('#FFFFE0', 'Light Yellow'),

  /// A color named "Lilac" with hexadecimal value #C8A2C8<br><img src="https://www.colorhexa.com/C8A2C8.png" width="50" height='50' />
  lilac("#C8A2C8", "Lilac"),

  /// A color named "Lilac Luster" with hexadecimal value #AE98AA<br><img src="https://www.colorhexa.com/AE98AA.png" width="50" height='50' />
  lilacLuster("#AE98AA", "Lilac Luster"),

  /// A color named "Lime" with hexadecimal value #00FF00<br><img src="https://www.colorhexa.com/00FF00.png" width="50" height='50' />
  lime('#00FF00', 'Lime'),

  /// A color named "Lime Green" with hexadecimal value #32CD32<br><img src="https://www.colorhexa.com/32CD32.png" width="50" height='50' />
  limeGreen('#32CD32', 'Lime Green'),

  /// A color named "Limerick" with hexadecimal value #9DC209<br><img src="https://www.colorhexa.com/9DC209.png" width="50" height='50' />
  limerick("#9DC209", "Limerick"),

  /// A color named "Lincoln Green" with hexadecimal value #195905<br><img src="https://www.colorhexa.com/195905.png" width="50" height='50' />
  lincolnGreen("#195905", "Lincoln green"),

  /// A color named "Linen" with hexadecimal value #FAF0E6<br><img src="https://www.colorhexa.com/FAF0E6.png" width="50" height='50' />
  linen('#FAF0E6', 'Linen'),

  /// A color named "Lion" with hexadecimal value #C19A6B<br><img src="https://www.colorhexa.com/C19A6B.png" width="50" height='50' />
  lion("#C19A6B", "Lion"),

  /// A color named "Liseran Purple" with hexadecimal value #DE6FA1<br><img src="https://www.colorhexa.com/DE6FA1.png" width="50" height='50' />
  liseranPurple("#DE6FA1", "Liseran purple"),

  /// A color named "Little Boy Blue" with hexadecimal value #6CA0DC<br><img src="https://www.colorhexa.com/6CA0DC.png" width="50" height='50' />
  littleBoyBlue("#6CA0DC", "Little boy blue"),

  /// A color named "Liver" with hexadecimal value #674C47<br><img src="https://www.colorhexa.com/674C47.png" width="50" height='50' />
  liver("#674C47", "Liver"),

  /// A color named "Liver Chestnut" with hexadecimal value #987456<br><img src="https://www.colorhexa.com/987456.png" width="50" height='50' />
  liverChestnut("#987456", "Liver chestnut"),

  /// A color named "Liver Dogs" with hexadecimal value #B86D29<br><img src="https://www.colorhexa.com/B86D29.png" width="50" height='50' />
  liverDogs("#B86D29", "Liver (dogs)"),

  /// A color named "Liver Organ" with hexadecimal value #6C2E1F<br><img src="https://www.colorhexa.com/6C2E1F.png" width="50" height='50' />
  liverOrgan("#6C2E1F", "Liver (organ)"),

  /// A color named "Livid" with hexadecimal value #6699CC<br><img src="https://www.colorhexa.com/6699CC.png" width="50" height='50' />
  livid("#6699CC", "Livid"),

  /// A color named "Lumber" with hexadecimal value #FFE4CD<br><img src="https://www.colorhexa.com/FFE4CD.png" width="50" height='50' />
  lumber("#FFE4CD", "Lumber"),

  /// A color named "Lust" with hexadecimal value #E62020<br><img src="https://www.colorhexa.com/E62020.png" width="50" height='50' />
  lust("#E62020", "Lust"),

  /// A color named "Magenta" with hexadecimal value #FF00FF<br><img src="https://www.colorhexa.com/FF00FF.png" width="50" height='50' />
  magenta('#FF00FF', 'Magenta'),

  /// A color named "Magenta Crayola" with hexadecimal value #FF55A3<br><img src="https://www.colorhexa.com/FF55A3.png" width="50" height='50' />
  magentaCrayola("#FF55A3", "Magenta (Crayola)"),

  /// A color named "Magenta Dye" with hexadecimal value #CA1F7B<br><img src="https://www.colorhexa.com/CA1F7B.png" width="50" height='50' />
  magentaDye("#CA1F7B", "Magenta (dye)"),

  /// A color named "Magenta Haze" with hexadecimal value #9F4576<br><img src="https://www.colorhexa.com/9F4576.png" width="50" height='50' />
  magentaHaze("#9F4576", "Magenta haze"),

  /// A color named "Magenta Pantone" with hexadecimal value #D0417E<br><img src="https://www.colorhexa.com/D0417E.png" width="50" height='50' />
  magentaPantone("#D0417E", "Magenta (Pantone)"),

  /// A color named "Magenta Process" with hexadecimal value #FF0090<br><img src="https://www.colorhexa.com/FF0090.png" width="50" height='50' />
  magentaProcess("#FF0090", "Magenta (process)"),

  /// A color named "Magic Mint" with hexadecimal value #AAF0D1<br><img src="https://www.colorhexa.com/AAF0D1.png" width="50" height='50' />
  magicMint("#AAF0D1", "Magic mint"),

  /// A color named "Magnolia" with hexadecimal value #F8F4FF<br><img src="https://www.colorhexa.com/F8F4FF.png" width="50" height='50' />
  magnolia("#F8F4FF", "Magnolia"),

  /// A color named "Mahogany" with hexadecimal value #C04000<br><img src="https://www.colorhexa.com/C04000.png" width="50" height='50' />
  mahogany("#C04000", "Mahogany"),

  /// A color named "Maize" with hexadecimal value #FBEC5D<br><img src="https://www.colorhexa.com/FBEC5D.png" width="50" height='50' />
  maize("#FBEC5D", "Maize"),

  /// A color named "Maize Crayola" with hexadecimal value #F2C649<br><img src="https://www.colorhexa.com/F2C649.png" width="50" height='50' />
  maizeCrayola("#F2C649", "Maize (Crayola)"),

  /// A color named "Majorelle Blue" with hexadecimal value #6050DC<br><img src="https://www.colorhexa.com/6050DC.png" width="50" height='50' />
  majorelleBlue("#6050DC", "Majorelle blue"),

  /// A color named "Malachite" with hexadecimal value #0BDA51<br><img src="https://www.colorhexa.com/0BDA51.png" width="50" height='50' />
  malachite("#0BDA51", "Malachite"),

  /// A color named "Manatee" with hexadecimal value #979AAA<br><img src="https://www.colorhexa.com/979AAA.png" width="50" height='50' />
  manatee("#979AAA", "Manatee"),

  /// A color named "Mandarin" with hexadecimal value #F37A48<br><img src="https://www.colorhexa.com/F37A48.png" width="50" height='50' />
  mandarin("#F37A48", "Mandarin"),

  /// A color named "Mango" with hexadecimal value #FDBE02<br><img src="https://www.colorhexa.com/FDBE02.png" width="50" height='50' />
  mango("#FDBE02", "Mango"),

  /// A color named "Mango Tango" with hexadecimal value #FF8243<br><img src="https://www.colorhexa.com/FF8243.png" width="50" height='50' />
  mangoTango("#FF8243", "Mango Tango"),

  /// A color named "Mantis" with hexadecimal value #74C365<br><img src="https://www.colorhexa.com/74C365.png" width="50" height='50' />
  mantis("#74C365", "Mantis"),

  /// A color named "Mardi Gras" with hexadecimal value #880085<br><img src="https://www.colorhexa.com/880085.png" width="50" height='50' />
  mardiGras("#880085", "Mardi Gras"),

  /// A color named "Marigold" with hexadecimal value #EAA221<br><img src="https://www.colorhexa.com/EAA221.png" width="50" height='50' />
  marigold("#EAA221", "Marigold"),

  /// A color named "Maroon" with hexadecimal value #800000<br><img src="https://www.colorhexa.com/800000.png" width="50" height='50' />
  maroon('#800000', 'Maroon'),

  /// A color named "Maroon Crayola" with hexadecimal value #C32148<br><img src="https://www.colorhexa.com/C32148.png" width="50" height='50' />
  maroonCrayola("#C32148", "Maroon (Crayola)"),

  /// A color named "Maroon HTML CSS" with hexadecimal value #800000<br><img src="https://www.colorhexa.com/800000.png" width="50" height='50' />
  maroonHTMLCSS("#800000", "Maroon (HTML/CSS)"),

  /// A color named "Maroon X11" with hexadecimal value #B03060<br><img src="https://www.colorhexa.com/B03060.png" width="50" height='50' />
  maroonX11("#B03060", "Maroon (X11)"),

  /// A color named "Mauve" with hexadecimal value #E0B0FF<br><img src="https://www.colorhexa.com/E0B0FF.png" width="50" height='50' />
  mauve("#E0B0FF", "Mauve"),

  /// A color named "Mauvelous" with hexadecimal value #EF98AA<br><img src="https://www.colorhexa.com/EF98AA.png" width="50" height='50' />
  mauvelous("#EF98AA", "Mauvelous"),

  /// A color named "Mauve Taupe" with hexadecimal value #915F6D<br><img src="https://www.colorhexa.com/915F6D.png" width="50" height='50' />
  mauveTaupe("#915F6D", "Mauve taupe"),

  /// A color named "Maximum Blue" with hexadecimal value #47ABCC<br><img src="https://www.colorhexa.com/47ABCC.png" width="50" height='50' />
  maximumBlue("#47ABCC", "Maximum blue"),

  /// A color named "Maximum Blue Green" with hexadecimal value #30BFBF<br><img src="https://www.colorhexa.com/30BFBF.png" width="50" height='50' />
  maximumBlueGreen("#30BFBF", "Maximum blue green"),

  /// A color named "Maximum Blue Purple" with hexadecimal value #ACACE6<br><img src="https://www.colorhexa.com/ACACE6.png" width="50" height='50' />
  maximumBluePurple("#ACACE6", "Maximum blue purple"),

  /// A color named "Maximum Green" with hexadecimal value #5E8C31<br><img src="https://www.colorhexa.com/5E8C31.png" width="50" height='50' />
  maximumGreen("#5E8C31", "Maximum green"),

  /// A color named "Maximum Green Yellow" with hexadecimal value #D9E650<br><img src="https://www.colorhexa.com/D9E650.png" width="50" height='50' />
  maximumGreenYellow("#D9E650", "Maximum green yellow"),

  /// A color named "Maximum Purple" with hexadecimal value #733380<br><img src="https://www.colorhexa.com/733380.png" width="50" height='50' />
  maximumPurple("#733380", "Maximum purple"),

  /// A color named "Maximum Red" with hexadecimal value #D92121<br><img src="https://www.colorhexa.com/D92121.png" width="50" height='50' />
  maximumRed("#D92121", "Maximum red"),

  /// A color named "Maximum Red Purple" with hexadecimal value #A63A79<br><img src="https://www.colorhexa.com/A63A79.png" width="50" height='50' />
  maximumRedPurple("#A63A79", "Maximum red purple"),

  /// A color named "Maximum Yellow" with hexadecimal value #FAFA37<br><img src="https://www.colorhexa.com/FAFA37.png" width="50" height='50' />
  maximumYellow("#FAFA37", "Maximum yellow"),

  /// A color named "Maximum Yellow Red" with hexadecimal value #F2BA49<br><img src="https://www.colorhexa.com/F2BA49.png" width="50" height='50' />
  maximumYellowRed("#F2BA49", "Maximum yellow red"),

  /// A color named "Maya Blue" with hexadecimal value #73C2FB<br><img src="https://www.colorhexa.com/73C2FB.png" width="50" height='50' />
  mayaBlue("#73C2FB", "Maya blue"),

  /// A color named "May Green" with hexadecimal value #4C9141<br><img src="https://www.colorhexa.com/4C9141.png" width="50" height='50' />
  mayGreen("#4C9141", "May green"),

  /// A color named "Medium Aquamarine" with hexadecimal value #66DDAA<br><img src="https://www.colorhexa.com/66DDAA.png" width="50" height='50' />
  mediumAquamarine("#66DDAA", "Medium aquamarine"),

  /// A color named "Medium Aqua Marine" with hexadecimal value #66CDAA<br><img src="https://www.colorhexa.com/66CDAA.png" width="50" height='50' />
  mediumAquaMarine('#66CDAA', 'Medium Aqua Marine'),

  /// A color named "Medium Blue" with hexadecimal value #0000CD<br><img src="https://www.colorhexa.com/0000CD.png" width="50" height='50' />
  mediumBlue('#0000CD', 'Medium Blue'),

  /// A color named "Medium Candy Apple Red" with hexadecimal value #E2062C<br><img src="https://www.colorhexa.com/E2062C.png" width="50" height='50' />
  mediumCandyAppleRed("#E2062C", "Medium candy apple red"),

  /// A color named "Medium Carmine" with hexadecimal value #AF4035<br><img src="https://www.colorhexa.com/AF4035.png" width="50" height='50' />
  mediumCarmine("#AF4035", "Medium carmine"),

  /// A color named "Medium Champagne" with hexadecimal value #F3E5AB<br><img src="https://www.colorhexa.com/F3E5AB.png" width="50" height='50' />
  mediumChampagne("#F3E5AB", "Medium champagne"),

  /// A color named "Medium Electric Blue" with hexadecimal value #035096<br><img src="https://www.colorhexa.com/035096.png" width="50" height='50' />
  mediumElectricBlue("#035096", "Medium electric blue"),

  /// A color named "Medium Jungle Green" with hexadecimal value #1C352D<br><img src="https://www.colorhexa.com/1C352D.png" width="50" height='50' />
  mediumJungleGreen("#1C352D", "Medium jungle green"),

  /// A color named "Medium Lavender Magenta" with hexadecimal value #DDA0DD<br><img src="https://www.colorhexa.com/DDA0DD.png" width="50" height='50' />
  mediumLavenderMagenta("#DDA0DD", "Medium lavender magenta"),

  /// A color named "Medium Orchid" with hexadecimal value #BA55D3<br><img src="https://www.colorhexa.com/BA55D3.png" width="50" height='50' />
  mediumOrchid('#BA55D3', 'Medium Orchid'),

  /// A color named "Medium Persian Blue" with hexadecimal value #0067A5<br><img src="https://www.colorhexa.com/0067A5.png" width="50" height='50' />
  mediumPersianBlue("#0067A5", "Medium persian blue"),

  /// A color named "Medium Purple" with hexadecimal value #9370DB<br><img src="https://www.colorhexa.com/9370DB.png" width="50" height='50' />
  mediumPurple('#9370DB', 'Medium Purple'),

  /// A color named "Medium Red Violet" with hexadecimal value #BB3385<br><img src="https://www.colorhexa.com/BB3385.png" width="50" height='50' />
  mediumRedViolet("#BB3385", "Medium red violet"),

  /// A color named "Medium Ruby" with hexadecimal value #AA4069<br><img src="https://www.colorhexa.com/AA4069.png" width="50" height='50' />
  mediumRuby("#AA4069", "Medium ruby"),

  /// A color named "Medium Sea Green" with hexadecimal value #3CB371<br><img src="https://www.colorhexa.com/3CB371.png" width="50" height='50' />
  mediumSeaGreen('#3CB371', 'Medium Sea Green'),

  /// A color named "Medium Sky Blue" with hexadecimal value #80DAEB<br><img src="https://www.colorhexa.com/80DAEB.png" width="50" height='50' />
  mediumSkyBlue("#80DAEB", "Medium sky blue"),

  /// A color named "Medium Slate Blue" with hexadecimal value #7B68EE<br><img src="https://www.colorhexa.com/7B68EE.png" width="50" height='50' />
  mediumSlateBlue('#7B68EE', 'Medium Slate Blue'),

  /// A color named "Medium Spring Bud" with hexadecimal value #C9DC87<br><img src="https://www.colorhexa.com/C9DC87.png" width="50" height='50' />
  mediumSpringBud("#C9DC87", "Medium spring bud"),

  /// A color named "Medium Spring Green" with hexadecimal value #00FA9A<br><img src="https://www.colorhexa.com/00FA9A.png" width="50" height='50' />
  mediumSpringGreen('#00FA9A', 'Medium Spring Green'),

  /// A color named "Medium Taupe" with hexadecimal value #674C47<br><img src="https://www.colorhexa.com/674C47.png" width="50" height='50' />
  mediumTaupe("#674C47", "Medium taupe"),

  /// A color named "Medium Turquoise" with hexadecimal value #48D1CC<br><img src="https://www.colorhexa.com/48D1CC.png" width="50" height='50' />
  mediumTurquoise('#48D1CC', 'Medium Turquoise'),

  /// A color named "Medium Tuscan Red" with hexadecimal value #79443B<br><img src="https://www.colorhexa.com/79443B.png" width="50" height='50' />
  mediumTuscanRed("#79443B", "Medium tuscan red"),

  /// A color named "Medium Vermilion" with hexadecimal value #D9603B<br><img src="https://www.colorhexa.com/D9603B.png" width="50" height='50' />
  mediumVermilion("#D9603B", "Medium vermilion"),

  /// A color named "Medium Violet Red" with hexadecimal value #C71585<br><img src="https://www.colorhexa.com/C71585.png" width="50" height='50' />
  mediumVioletRed('#C71585', 'Medium Violet Red'),

  /// A color named "Mellow Apricot" with hexadecimal value #F8B878<br><img src="https://www.colorhexa.com/F8B878.png" width="50" height='50' />
  mellowApricot("#F8B878", "Mellow apricot"),

  /// A color named "Mellow Yellow" with hexadecimal value #F8DE7E<br><img src="https://www.colorhexa.com/F8DE7E.png" width="50" height='50' />
  mellowYellow("#F8DE7E", "Mellow yellow"),

  /// A color named "Melon" with hexadecimal value #FEBAAD<br><img src="https://www.colorhexa.com/FEBAAD.png" width="50" height='50' />
  melon("#FEBAAD", "Melon"),

  /// A color named "Metallic Seaweed" with hexadecimal value #0A7E8C<br><img src="https://www.colorhexa.com/0A7E8C.png" width="50" height='50' />
  metallicSeaweed("#0A7E8C", "Metallic seaweed"),

  /// A color named "Metallic Sunburst" with hexadecimal value #9C7C38<br><img src="https://www.colorhexa.com/9C7C38.png" width="50" height='50' />
  metallicSunburst("#9C7C38", "Metallic sunburst"),

  /// A color named "Mexican Pink" with hexadecimal value #E4007C<br><img src="https://www.colorhexa.com/E4007C.png" width="50" height='50' />
  mexicanPink("#E4007C", "Mexican pink"),

  /// A color named "Middle Blue" with hexadecimal value #7ED4E6<br><img src="https://www.colorhexa.com/7ED4E6.png" width="50" height='50' />
  middleBlue("#7ED4E6", "Middle blue"),

  /// A color named "Middle Blue Green" with hexadecimal value #8DD9CC<br><img src="https://www.colorhexa.com/8DD9CC.png" width="50" height='50' />
  middleBlueGreen("#8DD9CC", "Middle blue green"),

  /// A color named "Middle Blue Purple" with hexadecimal value #8B72BE<br><img src="https://www.colorhexa.com/8B72BE.png" width="50" height='50' />
  middleBluePurple("#8B72BE", "Middle blue purple"),

  /// A color named "Middle Green" with hexadecimal value #4D8C57<br><img src="https://www.colorhexa.com/4D8C57.png" width="50" height='50' />
  middleGreen("#4D8C57", "Middle green"),

  /// A color named "Middle Green Yellow" with hexadecimal value #ACBF60<br><img src="https://www.colorhexa.com/ACBF60.png" width="50" height='50' />
  middleGreenYellow("#ACBF60", "Middle green yellow"),

  /// A color named "Middle Grey" with hexadecimal value #8B8680<br><img src="https://www.colorhexa.com/8B8680.png" width="50" height='50' />
  middleGrey("#8B8680", "Middle grey"),

  /// A color named "Middle Purple" with hexadecimal value #D982B5<br><img src="https://www.colorhexa.com/D982B5.png" width="50" height='50' />
  middlePurple("#D982B5", "Middle purple"),

  /// A color named "Middle Red" with hexadecimal value #E58E73<br><img src="https://www.colorhexa.com/E58E73.png" width="50" height='50' />
  middleRed("#E58E73", "Middle red"),

  /// A color named "Middle Red Purple" with hexadecimal value #A55353<br><img src="https://www.colorhexa.com/A55353.png" width="50" height='50' />
  middleRedPurple("#A55353", "Middle red purple"),

  /// A color named "Middle Yellow" with hexadecimal value #FFEB00<br><img src="https://www.colorhexa.com/FFEB00.png" width="50" height='50' />
  middleYellow("#FFEB00", "Middle yellow"),

  /// A color named "Middle Yellow Red" with hexadecimal value #ECB176<br><img src="https://www.colorhexa.com/ECB176.png" width="50" height='50' />
  middleYellowRed("#ECB176", "Middle yellow red"),

  /// A color named "Midnight" with hexadecimal value #702670<br><img src="https://www.colorhexa.com/702670.png" width="50" height='50' />
  midnight("#702670", "Midnight"),

  /// A color named "Midnight Blue" with hexadecimal value #191970<br><img src="https://www.colorhexa.com/191970.png" width="50" height='50' />
  midnightBlue('#191970', 'Midnight Blue'),

  /// A color named "Midnight Green" with hexadecimal value #004953<br><img src="https://www.colorhexa.com/004953.png" width="50" height='50' />
  midnightGreen("#004953", "Midnight green"),

  /// A color named "Mikado Yellow" with hexadecimal value #FFC40C<br><img src="https://www.colorhexa.com/FFC40C.png" width="50" height='50' />
  mikadoYellow("#FFC40C", "Mikado yellow"),

  /// A color named "Milk" with hexadecimal value #FDFFF5<br><img src="https://www.colorhexa.com/FDFFF5.png" width="50" height='50' />
  milk("#FDFFF5", "Milk"),

  /// A color named "Mindaro" with hexadecimal value #E3F988<br><img src="https://www.colorhexa.com/E3F988.png" width="50" height='50' />
  mindaro("#E3F988", "Mindaro"),

  /// A color named "Ming" with hexadecimal value #36747D<br><img src="https://www.colorhexa.com/36747D.png" width="50" height='50' />
  ming("#36747D", "Ming"),

  /// A color named "Minion Yellow" with hexadecimal value #F5E050<br><img src="https://www.colorhexa.com/F5E050.png" width="50" height='50' />
  minionYellow("#F5E050", "Minion yellow"),

  /// A color named "Mint" with hexadecimal value #3EB489<br><img src="https://www.colorhexa.com/3EB489.png" width="50" height='50' />
  mint("#3EB489", "Mint"),

  /// A color named "Mint Cream" with hexadecimal value #F5FFFA<br><img src="https://www.colorhexa.com/F5FFFA.png" width="50" height='50' />
  mintCream('#F5FFFA', 'Mint Cream'),

  /// A color named "Mint Green" with hexadecimal value #98FF98<br><img src="https://www.colorhexa.com/98FF98.png" width="50" height='50' />
  mintGreen("#98FF98", "Mint green"),

  /// A color named "Misty Moss" with hexadecimal value #BBB477<br><img src="https://www.colorhexa.com/BBB477.png" width="50" height='50' />
  mistyMoss("#BBB477", "Misty moss"),

  /// A color named "Misty Rose" with hexadecimal value #FFE4E1<br><img src="https://www.colorhexa.com/FFE4E1.png" width="50" height='50' />
  mistyRose('#FFE4E1', 'Misty Rose'),

  /// A color named "Moccasin" with hexadecimal value #FFE4B5<br><img src="https://www.colorhexa.com/FFE4B5.png" width="50" height='50' />
  moccasin('#FFE4B5', 'Moccasin'),

  /// A color named "Mode Beige" with hexadecimal value #967117<br><img src="https://www.colorhexa.com/967117.png" width="50" height='50' />
  modeBeige("#967117", "Mode beige"),

  /// A color named "Morning Blue" with hexadecimal value #8DA399<br><img src="https://www.colorhexa.com/8DA399.png" width="50" height='50' />
  morningBlue("#8DA399", "Morning blue"),

  /// A color named "Moss Green" with hexadecimal value #8A9A5B<br><img src="https://www.colorhexa.com/8A9A5B.png" width="50" height='50' />
  mossGreen("#8A9A5B", "Moss green"),

  /// A color named "Mountain Meadow" with hexadecimal value #30BA8F<br><img src="https://www.colorhexa.com/30BA8F.png" width="50" height='50' />
  mountainMeadow("#30BA8F", "Mountain meadow"),

  /// A color named "Mountbatten Pink" with hexadecimal value #997A8D<br><img src="https://www.colorhexa.com/997A8D.png" width="50" height='50' />
  mountbattenPink("#997A8D", "Mountbatten pink"),

  /// A color named "MSU Green" with hexadecimal value #18453B<br><img src="https://www.colorhexa.com/18453B.png" width="50" height='50' />
  msuGreen("#18453B", "MSU green"),

  /// A color named "Mughal Green" with hexadecimal value #306030<br><img src="https://www.colorhexa.com/306030.png" width="50" height='50' />
  mughalGreen("#306030", "Mughal green"),

  /// A color named "Mulberry" with hexadecimal value #C54B8C<br><img src="https://www.colorhexa.com/C54B8C.png" width="50" height='50' />
  mulberry("#C54B8C", "Mulberry"),

  /// A color named "Mummy's Tomb" with hexadecimal value #828E84<br><img src="https://www.colorhexa.com/828E84.png" width="50" height='50' />
  mummysTomb("#828E84", "Mummy's tomb"),

  /// A color named "Mustard" with hexadecimal value #FFDB58<br><img src="https://www.colorhexa.com/FFDB58.png" width="50" height='50' />
  mustard("#FFDB58", "Mustard"),

  /// A color named "Myrtle Green" with hexadecimal value #317873<br><img src="https://www.colorhexa.com/317873.png" width="50" height='50' />
  myrtleGreen("#317873", "Myrtle green"),

  /// A color named "Nadeshiko Pink" with hexadecimal value #F6ADC6<br><img src="https://www.colorhexa.com/F6ADC6.png" width="50" height='50' />
  nadeshikoPink("#F6ADC6", "Nadeshiko pink"),

  /// A color named "Napier Green" with hexadecimal value #2A8000<br><img src="https://www.colorhexa.com/2A8000.png" width="50" height='50' />
  napierGreen("#2A8000", "Napier green"),

  /// A color named "Naples Yellow" with hexadecimal value #FADA5E<br><img src="https://www.colorhexa.com/FADA5E.png" width="50" height='50' />
  naplesYellow("#FADA5E", "Naples yellow"),

  /// A color named "Navajo White" with hexadecimal value #FFDEAD<br><img src="https://www.colorhexa.com/FFDEAD.png" width="50" height='50' />
  navajoWhite('#FFDEAD', 'Navajo White'),

  /// A color named "Navy" with hexadecimal value #000080<br><img src="https://www.colorhexa.com/000080.png" width="50" height='50' />
  navy('#000080', 'Navy'),

  /// A color named "Navy Purple" with hexadecimal value #9457EB<br><img src="https://www.colorhexa.com/9457EB.png" width="50" height='50' />
  navyPurple("#9457EB", "Navy purple"),

  /// A color named "Neon Carrot" with hexadecimal value #FFA343<br><img src="https://www.colorhexa.com/FFA343.png" width="50" height='50' />
  neonCarrot("#FFA343", "Neon carrot"),

  /// A color named "Neon Fuchsia" with hexadecimal value #FE4164<br><img src="https://www.colorhexa.com/FE4164.png" width="50" height='50' />
  neonFuchsia("#FE4164", "Neon fuchsia"),

  /// A color named "Neon Green" with hexadecimal value #39FF14<br><img src="https://www.colorhexa.com/39FF14.png" width="50" height='50' />
  neonGreen("#39FF14", "Neon green"),

  /// A color named "New York Pink" with hexadecimal value #D7837F<br><img src="https://www.colorhexa.com/D7837F.png" width="50" height='50' />
  newYorkPink("#D7837F", "New York pink"),

  /// A color named "Nickel" with hexadecimal value #727472<br><img src="https://www.colorhexa.com/727472.png" width="50" height='50' />
  nickel("#727472", "Nickel"),

  /// A color named "Non Photo Blue" with hexadecimal value #A4DDED<br><img src="https://www.colorhexa.com/A4DDED.png" width="50" height='50' />
  nonPhotoBlue("#A4DDED", "Non photo blue"),

  /// A color named "North Texas Green" with hexadecimal value #059033<br><img src="https://www.colorhexa.com/059033.png" width="50" height='50' />
  northTexasGreen("#059033", "North Texas green"),

  /// A color named "Nyanza" with hexadecimal value #E9FFDB<br><img src="https://www.colorhexa.com/E9FFDB.png" width="50" height='50' />
  nyanza("#E9FFDB", "Nyanza"),

  /// A color named "Ocean Blue" with hexadecimal value #4F42B5<br><img src="https://www.colorhexa.com/4F42B5.png" width="50" height='50' />
  oceanBlue("#4F42B5", "Ocean blue"),

  /// A color named "Ocean Green" with hexadecimal value #48BF91<br><img src="https://www.colorhexa.com/48BF91.png" width="50" height='50' />
  oceanGreen("#48BF91", "Ocean green"),

  /// A color named "Ochre" with hexadecimal value #CC7722<br><img src="https://www.colorhexa.com/CC7722.png" width="50" height='50' />
  ochre("#CC7722", "Ochre"),

  /// A color named "Office Green" with hexadecimal value #008000<br><img src="https://www.colorhexa.com/008000.png" width="50" height='50' />
  officeGreen("#008000", "Office green"),

  /// A color named "Old Burgundy" with hexadecimal value #43302E<br><img src="https://www.colorhexa.com/43302E.png" width="50" height='50' />
  oldBurgundy("#43302E", "Old burgundy"),

  /// A color named "Old Gold" with hexadecimal value #CFB53B<br><img src="https://www.colorhexa.com/CFB53B.png" width="50" height='50' />
  oldGold("#CFB53B", "Old gold"),

  /// A color named "Old Heliotrope" with hexadecimal value #563C5C<br><img src="https://www.colorhexa.com/563C5C.png" width="50" height='50' />
  oldHeliotrope("#563C5C", "Old heliotrope"),

  /// A color named "Old Lace" with hexadecimal value #FDF5E6<br><img src="https://www.colorhexa.com/FDF5E6.png" width="50" height='50' />
  oldLace('#FDF5E6', 'Old Lace'),

  /// A color named "Old Lavender" with hexadecimal value #796878<br><img src="https://www.colorhexa.com/796878.png" width="50" height='50' />
  oldLavender("#796878", "Old lavender"),

  /// A color named "Old Mauve" with hexadecimal value #673147<br><img src="https://www.colorhexa.com/673147.png" width="50" height='50' />
  oldMauve("#673147", "Old mauve"),

  /// A color named "Old Moss Green" with hexadecimal value #867E36<br><img src="https://www.colorhexa.com/867E36.png" width="50" height='50' />
  oldMossGreen("#867E36", "Old moss green"),

  /// A color named "Old Rose" with hexadecimal value #C08081<br><img src="https://www.colorhexa.com/C08081.png" width="50" height='50' />
  oldRose("#C08081", "Old rose"),

  /// A color named "Old Silver" with hexadecimal value #848482<br><img src="https://www.colorhexa.com/848482.png" width="50" height='50' />
  oldSilver("#848482", "Old silver"),

  /// A color named "Olive" with hexadecimal value #808000<br><img src="https://www.colorhexa.com/808000.png" width="50" height='50' />
  olive('#808000', 'Olive'),

  /// A color named "Olive Drab" with hexadecimal value #6B8E23<br><img src="https://www.colorhexa.com/6B8E23.png" width="50" height='50' />
  oliveDrab('#6B8E23', 'Olive Drab'),

  /// A color named "Olive Green" with hexadecimal value #B5B35C<br><img src="https://www.colorhexa.com/B5B35C.png" width="50" height='50' />
  oliveGreen("#B5B35C", "Olive green"),

  /// A color named "Olivine" with hexadecimal value #9AB973<br><img src="https://www.colorhexa.com/9AB973.png" width="50" height='50' />
  olivine("#9AB973", "Olivine"),

  /// A color named "Onyx" with hexadecimal value #353839<br><img src="https://www.colorhexa.com/353839.png" width="50" height='50' />
  onyx("#353839", "Onyx"),

  /// A color named "Opal" with hexadecimal value #A8C3BC<br><img src="https://www.colorhexa.com/A8C3BC.png" width="50" height='50' />
  opal("#A8C3BC", "Opal"),

  /// A color named "Opera Mauve" with hexadecimal value #B784A7<br><img src="https://www.colorhexa.com/B784A7.png" width="50" height='50' />
  operaMauve("#B784A7", "Opera mauve"),

  /// A color named "Orange" with hexadecimal value #FFA500<br><img src="https://www.colorhexa.com/FFA500.png" width="50" height='50' />
  orange('#FFA500', 'Orange'),

  /// A color named "Orange Peel" with hexadecimal value #FF9F00<br><img src="https://www.colorhexa.com/FF9F00.png" width="50" height='50' />
  orangePeel("#FF9F00", "Orange peel"),

  /// A color named "Orange Red" with hexadecimal value #FF4500<br><img src="https://www.colorhexa.com/FF4500.png" width="50" height='50' />
  orangeRed('#FF4500', 'Orange Red'),

  /// A color named "Orange Soda" with hexadecimal value #FA5B3D<br><img src="https://www.colorhexa.com/FA5B3D.png" width="50" height='50' />
  orangeSoda("#FA5B3D", "Orange soda"),

  /// A color named "Orange Yellow" with hexadecimal value #F5BD1F<br><img src="https://www.colorhexa.com/F5BD1F.png" width="50" height='50' />
  orangeYellow("#F5BD1F", "Orange yellow"),

  /// A color named "Orchid" with hexadecimal value #DA70D6<br><img src="https://www.colorhexa.com/DA70D6.png" width="50" height='50' />
  orchid('#DA70D6', 'Orchid'),

  /// A color named "Orchid Pink" with hexadecimal value #F2BDCD<br><img src="https://www.colorhexa.com/F2BDCD.png" width="50" height='50' />
  orchidPink("#F2BDCD", "Orchid pink"),

  /// A color named "Orioles Orange" with hexadecimal value #FB4F14<br><img src="https://www.colorhexa.com/FB4F14.png" width="50" height='50' />
  oriolesOrange("#FB4F14", "Orioles orange"),

  /// A color named "Otter Brown" with hexadecimal value #654321<br><img src="https://www.colorhexa.com/654321.png" width="50" height='50' />
  otterBrown("#654321", "Otter brown"),

  /// A color named "OU Crimson Red" with hexadecimal value #990000<br><img src="https://www.colorhexa.com/990000.png" width="50" height='50' />
  ouCrimsonRed("#990000", "OU crimson red"),

  /// A color named "Outer Space" with hexadecimal value #414A4C<br><img src="https://www.colorhexa.com/414A4C.png" width="50" height='50' />
  outerSpace("#414A4C", "Outer space"),

  /// A color named "Outrageous Orange" with hexadecimal value #FF6E4A<br><img src="https://www.colorhexa.com/FF6E4A.png" width="50" height='50' />
  outrageousOrange("#FF6E4A", "Outrageous orange"),

  /// A color named "Oxblood" with hexadecimal value #4A0000<br><img src="https://www.colorhexa.com/4A0000.png" width="50" height='50' />
  oxblood("#4A0000", "Oxblood"),

  /// A color named "Oxford Blue" with hexadecimal value #002147<br><img src="https://www.colorhexa.com/002147.png" width="50" height='50' />
  oxfordBlue("#002147", "Oxford blue"),

  /// A color named "Pacific Blue" with hexadecimal value #1CA9C9<br><img src="https://www.colorhexa.com/1CA9C9.png" width="50" height='50' />
  pacificBlue("#1CA9C9", "Pacific blue"),

  /// A color named "Pakistan Green" with hexadecimal value #006600<br><img src="https://www.colorhexa.com/006600.png" width="50" height='50' />
  pakistanGreen("#006600", "Pakistan green"),

  /// A color named "Palatinate Blue" with hexadecimal value #273BE2<br><img src="https://www.colorhexa.com/273BE2.png" width="50" height='50' />
  palatinateBlue("#273BE2", "Palatinate blue"),

  /// A color named "Palatinate Purple" with hexadecimal value #682860<br><img src="https://www.colorhexa.com/682860.png" width="50" height='50' />
  palatinatePurple("#682860", "Palatinate purple"),

  /// A color named "Pale Aqua" with hexadecimal value #BCD4E6<br><img src="https://www.colorhexa.com/BCD4E6.png" width="50" height='50' />
  paleAqua("#BCD4E6", "Pale aqua"),

  /// A color named "Pale Blue" with hexadecimal value #AFEEEE<br><img src="https://www.colorhexa.com/AFEEEE.png" width="50" height='50' />
  paleBlue("#AFEEEE", "Pale blue"),

  /// A color named "Pale Brown" with hexadecimal value #987654<br><img src="https://www.colorhexa.com/987654.png" width="50" height='50' />
  paleBrown("#987654", "Pale brown"),

  /// A color named "Pale Carmine" with hexadecimal value #AF4035<br><img src="https://www.colorhexa.com/AF4035.png" width="50" height='50' />
  paleCarmine("#AF4035", "Pale carmine"),

  /// A color named "Pale Cerulean" with hexadecimal value #9BC4E2<br><img src="https://www.colorhexa.com/9BC4E2.png" width="50" height='50' />
  paleCerulean("#9BC4E2", "Pale cerulean"),

  /// A color named "Pale Chestnut" with hexadecimal value #DDADAF<br><img src="https://www.colorhexa.com/DDADAF.png" width="50" height='50' />
  paleChestnut("#DDADAF", "Pale chestnut"),

  /// A color named "Pale Copper" with hexadecimal value #DA8A67<br><img src="https://www.colorhexa.com/DA8A67.png" width="50" height='50' />
  paleCopper("#DA8A67", "Pale copper"),

  /// A color named "Pale Cornflower Blue" with hexadecimal value #ABCDEF<br><img src="https://www.colorhexa.com/ABCDEF.png" width="50" height='50' />
  paleCornflowerBlue("#ABCDEF", "Pale cornflower blue"),

  /// A color named "Pale Cyan" with hexadecimal value #87D3F8<br><img src="https://www.colorhexa.com/87D3F8.png" width="50" height='50' />
  paleCyan("#87D3F8", "Pale cyan"),

  /// A color named "Pale Gold" with hexadecimal value #E6BE8A<br><img src="https://www.colorhexa.com/E6BE8A.png" width="50" height='50' />
  paleGold("#E6BE8A", "Pale gold"),

  /// A color named "Pale Goldenrod" with hexadecimal value #EEE8AA<br><img src="https://www.colorhexa.com/EEE8AA.png" width="50" height='50' />
  paleGoldenrod("#EEE8AA", "Pale goldenrod"),

  /// A color named "Pale Golden Rod" with hexadecimal value #EEE8AA<br><img src="https://www.colorhexa.com/EEE8AA.png" width="50" height='50' />
  paleGoldenRod('#EEE8AA', 'Pale Golden Rod'),

  /// A color named "Pale Green" with hexadecimal value #98FB98<br><img src="https://www.colorhexa.com/98FB98.png" width="50" height='50' />
  paleGreen('#98FB98', 'Pale Green'),

  /// A color named "Pale Lavender" with hexadecimal value #DCD0FF<br><img src="https://www.colorhexa.com/DCD0FF.png" width="50" height='50' />
  paleLavender("#DCD0FF", "Pale lavender"),

  /// A color named "Pale Magenta" with hexadecimal value #F984E5<br><img src="https://www.colorhexa.com/F984E5.png" width="50" height='50' />
  paleMagenta("#F984E5", "Pale magenta"),

  /// A color named "Pale Magenta Pink" with hexadecimal value #FF99CC<br><img src="https://www.colorhexa.com/FF99CC.png" width="50" height='50' />
  paleMagentaPink("#FF99CC", "Pale magenta pink"),

  /// A color named "Pale Pink" with hexadecimal value #FADADD<br><img src="https://www.colorhexa.com/FADADD.png" width="50" height='50' />
  palePink("#FADADD", "Pale pink"),

  /// A color named "Pale Plum" with hexadecimal value #DDA0DD<br><img src="https://www.colorhexa.com/DDA0DD.png" width="50" height='50' />
  palePlum("#DDA0DD", "Pale plum"),

  /// A color named "Pale Red Violet" with hexadecimal value #DB7093<br><img src="https://www.colorhexa.com/DB7093.png" width="50" height='50' />
  paleRedViolet("#DB7093", "Pale red violet"),

  /// A color named "Pale Robin Egg Blue" with hexadecimal value #96DED1<br><img src="https://www.colorhexa.com/96DED1.png" width="50" height='50' />
  paleRobinEggBlue("#96DED1", "Pale robin egg blue"),

  /// A color named "Pale Silver" with hexadecimal value #C9C0BB<br><img src="https://www.colorhexa.com/C9C0BB.png" width="50" height='50' />
  paleSilver("#C9C0BB", "Pale silver"),

  /// A color named "Pale Spring Bud" with hexadecimal value #ECEBBD<br><img src="https://www.colorhexa.com/ECEBBD.png" width="50" height='50' />
  paleSpringBud("#ECEBBD", "Pale spring bud"),

  /// A color named "Pale Taupe" with hexadecimal value #BC987E<br><img src="https://www.colorhexa.com/BC987E.png" width="50" height='50' />
  paleTaupe("#BC987E", "Pale taupe"),

  /// A color named "Pale Turquoise" with hexadecimal value #AFEEEE<br><img src="https://www.colorhexa.com/AFEEEE.png" width="50" height='50' />
  paleTurquoise('#AFEEEE', 'Pale Turquoise'),

  /// A color named "Pale Violet" with hexadecimal value #CC99FF<br><img src="https://www.colorhexa.com/CC99FF.png" width="50" height='50' />
  paleViolet("#CC99FF", "Pale violet"),

  /// A color named "Pale Violet Red" with hexadecimal value #DB7093<br><img src="https://www.colorhexa.com/DB7093.png" width="50" height='50' />
  paleVioletRed('#DB7093', 'Pale Violet Red'),

  /// A color named "Pansy Purple" with hexadecimal value #78184A<br><img src="https://www.colorhexa.com/78184A.png" width="50" height='50' />
  pansyPurple("#78184A", "Pansy purple"),

  /// A color named "Paolo Veronese Green" with hexadecimal value #009B7D<br><img src="https://www.colorhexa.com/009B7D.png" width="50" height='50' />
  paoloVeroneseGreen("#009B7D", "Paolo Veronese green"),

  /// A color named "Pastel Brown" with hexadecimal value #836953<br><img src="https://www.colorhexa.com/836953.png" width="50" height='50' />
  pastelBrown("#836953", "Pastel brown"),

  /// A color named "Pastel Gray" with hexadecimal value #CFCFC4<br><img src="https://www.colorhexa.com/CFCFC4.png" width="50" height='50' />
  pastelGray("#CFCFC4", "Pastel gray"),

  /// A color named "Pastel Green" with hexadecimal value #77DD77<br><img src="https://www.colorhexa.com/77DD77.png" width="50" height='50' />
  pastelGreen("#77DD77", "Pastel green"),

  /// A color named "Pastel Magenta" with hexadecimal value #F49AC2<br><img src="https://www.colorhexa.com/F49AC2.png" width="50" height='50' />
  pastelMagenta("#F49AC2", "Pastel magenta"),

  /// A color named "Pastel Orange" with hexadecimal value #FFB347<br><img src="https://www.colorhexa.com/FFB347.png" width="50" height='50' />
  pastelOrange("#FFB347", "Pastel orange"),

  /// A color named "Pastel Pink" with hexadecimal value #FFD1DC<br><img src="https://www.colorhexa.com/FFD1DC.png" width="50" height='50' />
  pastelPink("#FFD1DC", "Pastel pink"),

  /// A color named "Pastel Purple" with hexadecimal value #B39EB5<br><img src="https://www.colorhexa.com/B39EB5.png" width="50" height='50' />
  pastelPurple("#B39EB5", "Pastel purple"),

  /// A color named "Pastel Red" with hexadecimal value #FF6961<br><img src="https://www.colorhexa.com/FF6961.png" width="50" height='50' />
  pastelRed("#FF6961", "Pastel red"),

  /// A color named "Pastel Violet" with hexadecimal value #CB99C9<br><img src="https://www.colorhexa.com/CB99C9.png" width="50" height='50' />
  pastelViolet("#CB99C9", "Pastel violet"),

  /// A color named "Pastel Yellow" with hexadecimal value #FDFD96<br><img src="https://www.colorhexa.com/FDFD96.png" width="50" height='50' />
  pastelYellow("#FDFD96", "Pastel yellow"),

  /// A color named "Patriarch" with hexadecimal value #800080<br><img src="https://www.colorhexa.com/800080.png" width="50" height='50' />
  patriarch("#800080", "Patriarch"),

  /// A color named "Payne's Grey" with hexadecimal value #536878<br><img src="https://www.colorhexa.com/536878.png" width="50" height='50' />
  paynesGrey("#536878", "Payne's grey"),

  /// A color named "Peach" with hexadecimal value #FFE5B4<br><img src="https://www.colorhexa.com/FFE5B4.png" width="50" height='50' />
  peach("#FFE5B4", "Peach"),

  /// A color named "Peach (Crayola)" with hexadecimal value #FFCBA4<br><img src="https://www.colorhexa.com/FFCBA4.png" width="50" height='50' />
  peachCrayola("#FFCBA4", "Peach (Crayola)"),

  /// A color named "Peach Orange" with hexadecimal value #FFCC99<br><img src="https://www.colorhexa.com/FFCC99.png" width="50" height='50' />
  peachOrange("#FFCC99", "Peach orange"),

  /// A color named "Peach Puff" with hexadecimal value #FFDAB9<br><img src="https://www.colorhexa.com/FFDAB9.png" width="50" height='50' />
  peachPuff('#FFDAB9', 'Peach Puff'),

  /// A color named "Peach Yellow" with hexadecimal value #FADFAD<br><img src="https://www.colorhexa.com/FADFAD.png" width="50" height='50' />
  peachYellow("#FADFAD", "Peach yellow"),

  /// A color named "Pear" with hexadecimal value #D1E231<br><img src="https://www.colorhexa.com/D1E231.png" width="50" height='50' />
  pear("#D1E231", "Pear"),

  /// A color named "Pearl" with hexadecimal value #EAE0C8<br><img src="https://www.colorhexa.com/EAE0C8.png" width="50" height='50' />
  pearl("#EAE0C8", "Pearl"),

  /// A color named "Pearl Aqua" with hexadecimal value #88D8C0<br><img src="https://www.colorhexa.com/88D8C0.png" width="50" height='50' />
  pearlAqua("#88D8C0", "Pearl aqua"),

  /// A color named "Pearly Purple" with hexadecimal value #B768A2<br><img src="https://www.colorhexa.com/B768A2.png" width="50" height='50' />
  pearlyPurple("#B768A2", "Pearly purple"),

  /// A color named "Peridot" with hexadecimal value #E6E200<br><img src="https://www.colorhexa.com/E6E200.png" width="50" height='50' />
  peridot("#E6E200", "Peridot"),

  /// A color named "Periwinkle" with hexadecimal value #CCCCFF<br><img src="https://www.colorhexa.com/CCCCFF.png" width="50" height='50' />
  periwinkle("#CCCCFF", "Periwinkle"),

  /// A color named "Periwinkle (Crayola)" with hexadecimal value #C3CDE6<br><img src="https://www.colorhexa.com/C3CDE6.png" width="50" height='50' />
  periwinkleCrayola("#C3CDE6", "Periwinkle (Crayola)"),

  /// A color named "Permanent Geranium Lake" with hexadecimal value #E12C2C<br><img src="https://www.colorhexa.com/E12C2C.png" width="50" height='50' />
  permanentGeraniumLake("#E12C2C", "Permanent geranium lake"),

  /// A color named "Persian Blue" with hexadecimal value #1C39BB<br><img src="https://www.colorhexa.com/1C39BB.png" width="50" height='50' />
  persianBlue("#1C39BB", "Persian blue"),

  /// A color named "Persian Green" with hexadecimal value #00A693<br><img src="https://www.colorhexa.com/00A693.png" width="50" height='50' />
  persianGreen("#00A693", "Persian green"),

  /// A color named "Persian Indigo" with hexadecimal value #32127A<br><img src="https://www.colorhexa.com/32127A.png" width="50" height='50' />
  persianIndigo("#32127A", "Persian indigo"),

  /// A color named "Persian Orange" with hexadecimal value #D99058<br><img src="https://www.colorhexa.com/D99058.png" width="50" height='50' />
  persianOrange("#D99058", "Persian orange"),

  /// A color named "Persian Pink" with hexadecimal value #F77FBE<br><img src="https://www.colorhexa.com/F77FBE.png" width="50" height='50' />
  persianPink("#F77FBE", "Persian pink"),

  /// A color named "Persian Plum" with hexadecimal value #701C1C<br><img src="https://www.colorhexa.com/701C1C.png" width="50" height='50' />
  persianPlum("#701C1C", "Persian plum"),

  /// A color named "Persian Red" with hexadecimal value #CC3333<br><img src="https://www.colorhexa.com/CC3333.png" width="50" height='50' />
  persianRed("#CC3333", "Persian red"),

  /// A color named "Persian Rose" with hexadecimal value #FE28A2<br><img src="https://www.colorhexa.com/FE28A2.png" width="50" height='50' />
  persianRose("#FE28A2", "Persian rose"),

  /// A color named "Persimmon" with hexadecimal value #EC5800<br><img src="https://www.colorhexa.com/EC5800.png" width="50" height='50' />
  persimmon("#EC5800", "Persimmon"),

  /// A color named "Peru" with hexadecimal value #CD853F<br><img src="https://www.colorhexa.com/CD853F.png" width="50" height='50' />
  peru('#CD853F', 'Peru'),

  /// A color named "Phlox" with hexadecimal value #DF00FF<br><img src="https://www.colorhexa.com/DF00FF.png" width="50" height='50' />
  phlox("#DF00FF", "Phlox"),

  /// A color named "Phthalo Blue" with hexadecimal value #000F89<br><img src="https://www.colorhexa.com/000F89.png" width="50" height='50' />
  phthaloBlue("#000F89", "Phthalo blue"),

  /// A color named "Phthalo Green" with hexadecimal value #123524<br><img src="https://www.colorhexa.com/123524.png" width="50" height='50' />
  phthaloGreen("#123524", "Phthalo green"),

  /// A color named "Picton Blue" with hexadecimal value #45B1E8<br><img src="https://www.colorhexa.com/45B1E8.png" width="50" height='50' />
  pictonBlue("#45B1E8", "Picton blue"),

  /// A color named "Pictorial Carmine" with hexadecimal value #C30B4E<br><img src="https://www.colorhexa.com/C30B4E.png" width="50" height='50' />
  pictorialCarmine("#C30B4E", "Pictorial carmine"),

  /// A color named "Piggy Pink" with hexadecimal value #FDDDE6<br><img src="https://www.colorhexa.com/FDDDE6.png" width="50" height='50' />
  piggyPink("#FDDDE6", "Piggy pink"),

  /// A color named "Pine Green" with hexadecimal value #01796F<br><img src="https://www.colorhexa.com/01796F.png" width="50" height='50' />
  pineGreen("#01796F", "Pine green"),

  /// A color named "Pine Tree" with hexadecimal value #2A2F23<br><img src="https://www.colorhexa.com/2A2F23.png" width="50" height='50' />
  pineTree("#2A2F23", "Pine tree"),

  /// A color named "Pink" with hexadecimal value #FFC0CB<br><img src="https://www.colorhexa.com/FFC0CB.png" width="50" height='50' />
  pink('#FFC0CB', 'Pink'),

  /// A color named "Pink Flamingo" with hexadecimal value #FC74FD<br><img src="https://www.colorhexa.com/FC74FD.png" width="50" height='50' />
  pinkFlamingo("#FC74FD", "Pink flamingo"),

  /// A color named "Pink Lace" with hexadecimal value #FFDDF4<br><img src="https://www.colorhexa.com/FFDDF4.png" width="50" height='50' />
  pinkLace("#FFDDF4", "Pink lace"),

  /// A color named "Pink Lavender" with hexadecimal value #D8B2D1<br><img src="https://www.colorhexa.com/D8B2D1.png" width="50" height='50' />
  pinkLavender("#D8B2D1", "Pink lavender"),

  /// A color named "Pink Orange" with hexadecimal value #FF9966<br><img src="https://www.colorhexa.com/FF9966.png" width="50" height='50' />
  pinkOrange("#FF9966", "Pink orange"),

  /// A color named "Pink Pearl" with hexadecimal value #E7ACCF<br><img src="https://www.colorhexa.com/E7ACCF.png" width="50" height='50' />
  pinkPearl("#E7ACCF", "Pink pearl"),

  /// A color named "Pink Raspberry" with hexadecimal value #980036<br><img src="https://www.colorhexa.com/980036.png" width="50" height='50' />
  pinkRaspberry("#980036", "Pink raspberry"),

  /// A color named "Pink Sherbet" with hexadecimal value #F78FA7<br><img src="https://www.colorhexa.com/F78FA7.png" width="50" height='50' />
  pinkSherbet("#F78FA7", "Pink sherbet"),

  /// A color named "Pistachio" with hexadecimal value #93C572<br><img src="https://www.colorhexa.com/93C572.png" width="50" height='50' />
  pistachio("#93C572", "Pistachio"),

  /// A color named "Platinum" with hexadecimal value #E5E4E2<br><img src="https://www.colorhexa.com/E5E4E2.png" width="50" height='50' />
  platinum("#E5E4E2", "Platinum"),

  /// A color named "Plum" with hexadecimal value #DDA0DD<br><img src="https://www.colorhexa.com/DDA0DD.png" width="50" height='50' />
  plum('#DDA0DD', 'Plum'),

  /// A color named "Plump Purple" with hexadecimal value #5946B2<br><img src="https://www.colorhexa.com/5946B2.png" width="50" height='50' />
  plumpPurple("#5946B2", "Plump purple"),

  /// A color named "Plum (Web)" with hexadecimal value #8E4585<br><img src="https://www.colorhexa.com/8E4585.png" width="50" height='50' />
  plumWeb("#8E4585", "Plum (web)"),

  /// A color named "Polished Pine" with hexadecimal value #5DA493<br><img src="https://www.colorhexa.com/5DA493.png" width="
  puce("#CC8899", "Puce"),

  /// A color named "Puce Red" with hexadecimal value #722F37<br><img src="https://www.colorhexa.com/722F37.png" width="50" height='50' />
  puceRed("#722F37", "Puce red"),

  /// A color named "Pullman Brown" with hexadecimal value #644117<br><img src="https://www.colorhexa.com/644117.png" width="50" height='50' />
  pullmanBrown("#644117", "Pullman brown"),

  /// A color named "Pullman Green" with hexadecimal value #3B331C<br><img src="https://www.colorhexa.com/3B331C.png" width="50" height='50' />
  pullmanGreen("#3B331C", "Pullman green"),

  /// A color named "Pumpkin" with hexadecimal value #FF7518<br><img src="https://www.colorhexa.com/FF7518.png" width="50" height='50' />
  pumpkin("#FF7518", "Pumpkin"),

  /// A color named "Purple" with hexadecimal value #800080<br><img src="https://www.colorhexa.com/800080.png" width="50" height='50' />
  purple('#800080', 'Purple'),

  /// A color named "Purple 100" with hexadecimal value #E1BEE7<br><img src="https://www.colorhexa.com/E1BEE7.png" width="50" height='50' />
  purple100("#E1BEE7", "Purple 100"),

  /// A color named "Purple 200" with hexadecimal value #CE93D8<br><img src="https://www.colorhexa.com/CE93D8.png" width="50" height='50' />
  purple200("#CE93D8", "Purple 200"),

  /// A color named "Purple 300" with hexadecimal value #BA68C8<br><img src="https://www.colorhexa.com/BA68C8.png" width="50" height='50' />
  purple300("#BA68C8", "Purple 300"),

  /// A color named "Purple 400" with hexadecimal value #AB47BC<br><img src="https://www.colorhexa.com/AB47BC.png" width="50" height='50' />
  purple400("#AB47BC", "Purple 400"),

  /// A color named "Purple 500" with hexadecimal value #9C27B0<br><img src="https://www.colorhexa.com/9C27B0.png" width="50" height='50' />
  purple500("#9C27B0", "Purple 500"),

  /// A color named "Purple 600" with hexadecimal value #8E24AA<br><img src="https://www.colorhexa.com/8E24AA.png" width="50" height='50' />
  purple600("#8E24AA", "Purple 600"),

  /// A color named "Purple 700" with hexadecimal value #7B1FA2<br><img src="https://www.colorhexa.com/7B1FA2.png" width="50" height='50' />
  purple700("#7B1FA2", "Purple 700"),

  /// A color named "Purple 800" with hexadecimal value #6A1B9A<br><img src="https://www.colorhexa.com/6A1B9A.png" width="50" height='50' />
  purple800("#6A1B9A", "Purple 800"),

  /// A color named "Purple 900" with hexadecimal value #4A148C<br><img src="https://www.colorhexa.com/4A148C.png" width="50" height='50' />
  purple900("#4A148C", "Purple 900"),

  /// A color named "Purple A100" with hexadecimal value #EA80FC<br><img src="https://www.colorhexa.com/EA80FC.png" width="50" height='50' />
  purpleA100("#EA80FC", "Purple A100"),

  /// A color named "Purple A200" with hexadecimal value #E040FB<br><img src="https://www.colorhexa.com/E040FB.png" width="50" height='50' />
  purpleA200("#E040FB", "Purple A200"),

  /// A color named "Purple A400" with hexadecimal value #D500F9<br><img src="https://www.colorhexa.com/D500F9.png" width="50" height='50' />
  purpleA400("#D500F9", "Purple A400"),

  /// A color named "Purple A700" with hexadecimal value #AA00FF<br><img src="https://www.colorhexa.com/AA00FF.png" width="50" height='50' />
  purpleA700("#AA00FF", "Purple A700"),

  /// A color named "Purple Heart" with hexadecimal value #69359C<br><img src="https://www.colorhexa.com/69359C.png" width="50" height='50' />
  purpleHeart("#69359C", "Purple heart"),

  /// A color named "Purple Mountain Majesty" with hexadecimal value #9678B6<br><img src="https://www.colorhexa.com/9678B6.png" width="50" height='50' />
  purpleMountainMajesty("#9678B6", "Purple mountain majesty"),

  /// A color named "Purple navy" with hexadecimal value #4E5180<br><img src="https://www.colorhexa.com/4E5180.png" width="50" height='50' />
  purpleNavy("#4E5180", "Purple navy"),

  /// A color named "Purple Pizzazz" with hexadecimal value #FE4EDA<br><img src="https://www.colorhexa.com/FE4EDA.png" width="50" height='50' />
  purplePizzazz("#FE4EDA", "Purple pizzazz"),

  /// A color named "Purple Plum" with hexadecimal value #9C51B6<br><img src="https://www.colorhexa.com/9C51B6.png" width="50" height='50' />
  purplePlum("#9C51B6", "Purple plum"),

  /// A color named "Purple Taupe" with hexadecimal value #50404D<br><img src="https://www.colorhexa.com/50404D.png" width="50" height='50' />
  purpleTaupe("#50404D", "Purple taupe"),

  /// A color named "Purpureus" with hexadecimal value #9A4EAE<br><img src="https://www.colorhexa.com/9A4EAE.png" width="50" height='50' />
  purpureus("#9A4EAE", "Purpureus"),

  /// A color named "Quartz" with hexadecimal value #51484F<br><img src="https://www.colorhexa.com/51484F.png" width="50" height='50' />
  quartz("#51484F", "Quartz"),

  /// A color named "Queen Blue" with hexadecimal value #436B95<br><img src="https://www.colorhexa.com/436B95.png" width="50" height='50' />
  queenBlue("#436B95", "Queen blue"),

  /// A color named "Queen Pink" with hexadecimal value #E8CCD7<br><img src="https://www.colorhexa.com/E8CCD7.png" width="50" height='50' />
  queenPink("#E8CCD7", "Queen pink"),

  /// A color named "Quinacridone Magenta" with hexadecimal value #8E3A59<br><img src="https://www.colorhexa.com/8E3A59.png" width="50" height='50' />
  quinacridoneMagenta("#8E3A59", "Quinacridone magenta"),

  /// A color named "Rackley" with hexadecimal value #5D8AA8<br><img src="https://www.colorhexa.com/5D8AA8.png" width="50" height='50' />
  rackley("#5D8AA8", "Rackley"),

  /// A color named "Radical Red" with hexadecimal value #FF355E<br><img src="https://www.colorhexa.com/FF355E.png" width="50" height='50' />
  radicalRed("#FF355E", "Radical red"),

  /// A color named "Rajah" with hexadecimal value #FBAB60<br><img src="https://www.colorhexa.com/FBAB60.png" width="50" height='50' />
  rajah("#FBAB60", "Rajah"),

  /// A color named "Raspberry" with hexadecimal value #E30B5C<br><img src="https://www.colorhexa.com/E30B5C.png" width="50" height='50' />
  raspberry("#E30B5C", "Raspberry"),

  /// A color named "Raspberry Glace" with hexadecimal value #915F6D<br><img src="https://www.colorhexa.com/915F6D.png" width="50" height='50' />
  raspberryGlace("#915F6D", "Raspberry glacé"),

  /// A color named "Raspberry Pink" with hexadecimal value #E25098<br><img src="https://www.colorhexa.com/E25098.png" width="50" height='50' />
  raspberryPink("#E25098", "Raspberry pink"),

  /// A color named "Raspberry Rose" with hexadecimal value #B3446C<br><img src="https://www.colorhexa.com/B3446C.png" width="50" height='50' />
  raspberryRose("#B3446C", "Raspberry rose"),

  /// A color named "Raw Sienna" with hexadecimal value #D68A59<br><img src="https://www.colorhexa.com/D68A59.png" width="50" height='50' />
  rawSienna("#D68A59", "Raw sienna"),

  /// A color named "Raw Umber" with hexadecimal value #826644<br><img src="https://www.colorhexa.com/826644.png" width="50" height='50' />
  rawUmber("#826644", "Raw umber"),

  /// A color named "Razzle Dazzle Rose" with hexadecimal value #FF33CC<br><img src="https://www.colorhexa.com/FF33CC.png" width="50" height='50' />
  razzleDazzleRose("#FF33CC", "Razzle dazzle rose"),

  /// A color named "Razzmatazz" with hexadecimal value #E3256B<br><img src="https://www.colorhexa.com/E3256B.png" width="50" height='50' />
  razzmatazz("#E3256B", "Razzmatazz"),

  /// A color named "Razzmic Berry" with hexadecimal value #8D4E85<br><img src="https://www.colorhexa.com/8D4E85.png" width="50" height='50' />
  razzmicBerry("#8D4E85", "Razzmic berry"),

  /// A color named "Rebecca Purple" with hexadecimal value #663399<br><img src="https://www.colorhexa.com/663399.png" width="50" height='50' />
  rebeccaPurple('#663399', 'Rebecca Purple'),

  /// A color named "Red" with hexadecimal value #FF0000<br><img src="https://www.colorhexa.com/FF0000.png" width="50" height='50' />
  redColor('#FF0000', 'Red'),

  /// A color named "Red Brown" with hexadecimal value #A52A2A<br><img src="https://www.colorhexa.com/A52A2A.png" width="50" height='50' />
  redBrown("#A52A2A", "Red brown"),

  /// A color named "Red (Crayola)" with hexadecimal value #EE204D<br><img src="https://www.colorhexa.com/EE204D.png" width="50" height='50' />
  redCrayola("#EE204D", "Red (Crayola)"),

  /// A color named "Red Devil" with hexadecimal value #860111<br><img src="https://www.colorhexa.com/860111.png" width="50" height='50' />
  redDevil("#860111", "Red devil"),

  /// A color named "Red (Munsell)" with hexadecimal value #F2003C<br><img src="https://www.colorhexa.com/F2003C.png" width="50" height='50' />
  redMunsell("#F2003C", "Red (Munsell)"),

  /// A color named "Red (NCS)" with hexadecimal value #C40233<br><img src="https://www.colorhexa.com/C40233.png" width="50" height='50' />
  redNcs("#C40233", "Red (NCS)"),

  /// A color named "Red Orange" with hexadecimal value #FF5349<br><img src="https://www.colorhexa.com/FF5349.png" width="50" height='50' />
  redOrange("#FF5349", "Red orange"),

  /// A color named "Red (Pantone)" with hexadecimal value #ED2939<br><img src="https://www.colorhexa.com/ED2939.png" width="50" height='50' />
  redPantone("#ED2939", "Red (Pantone)"),

  /// A color named "Red (Pigment)" with hexadecimal value #ED1C24<br><img src="https://www.colorhexa.com/ED1C24.png" width="50" height='50' />
  redPigment("#ED1C24", "Red (pigment)"),

  /// A color named "Red Purple" with hexadecimal value #E40078<br><img src="https://www.colorhexa.com/E40078.png" width="50" height='50' />
  redPurple("#E40078", "Red purple"),

  /// A color named "Red (RYB)" with hexadecimal value #FE2712<br><img src="https://www.colorhexa.com/FE2712.png" width="50" height='50' />
  redRyb("#FE2712", "Red (RYB)"),

  /// A color named "Red Salsa" with hexadecimal value #FD3A4A<br><img src="https://www.colorhexa.com/FD3A4A.png" width="50" height='50' />
  redSalsa("#FD3A4A", "Red salsa"),

  /// A color named "Red Violet" with hexadecimal value #C71585<br><img src="https://www.colorhexa.com/C71585.png" width="50" height='50' />
  redViolet("#C71585", "Red violet"),

  /// A color named "Red Wood" with hexadecimal value #A45A52<br><img src="https://www.colorhexa.com/A45A52.png" width="50" height='50' />
  redwood("#A45A52", "Redwood"),

  /// A color named "Regalia" with hexadecimal value #522D80<br><img src="https://www.colorhexa.com/522D80.png" width="50" height='50' />
  regalia("#522D80", "Regalia"),

  /// A color named "Registration Black" with hexadecimal value #000000<br><img src="https://www.colorhexa.com/000000.png" width="50" height='50' />
  registrationBlack("#000000", "Registration black"),

  /// A color named "Resolution Blue" with hexadecimal value #002387<br><img src="https://www.colorhexa.com/002387.png" width="50" height='50' />
  resolutionBlue("#002387", "Resolution blue"),

  /// A color named "Rhythm" with hexadecimal value #777696<br><img src="https://www.colorhexa.com/777696.png" width="50" height='50' />
  rhythm("#777696", "Rhythm"),

  /// A color named "Rich Black" with hexadecimal value #004040<br><img src="https://www.colorhexa.com/004040.png" width="50" height='50' />
  richBlack("#004040", "Rich black"),

  /// A color named "Rich Black (FOGRA29)" with hexadecimal value #010B13<br><img src="https://www.colorhexa.com/010B13.png" width="50" height='50' />
  richBlackFogra29("#010B13", "Rich black (FOGRA29)"),

  /// A color named "Rich Black (FOGRA39)" with hexadecimal value #010203<br><img src="https://www.colorhexa.com/010203.png" width="50" height='50' />
  richBlackFogra39("#010203", "Rich black (FOGRA39)"),

  /// A color named "Rich Brilliant Lavender" with hexadecimal value #F1A7FE<br><img src="https://www.colorhexa.com/F1A7FE.png" width="50" height='50' />
  richBrilliantLavender("#F1A7FE", "Rich brilliant lavender"),

  /// A color named "Rich Carmine" with hexadecimal value #D70040<br><img src="https://www.colorhexa.com/D70040.png" width="50" height='50' />
  richCarmine("#D70040", "Rich carmine"),

  /// A color named "Rich Electric Blue" with hexadecimal value #0892D0<br><img src="https://www.colorhexa.com/0892D0.png" width="50" height='50' />
  richElectricBlue("#0892D0", "Rich electric blue"),

  /// A color named "Rich Lavender" with hexadecimal value #A76BCF<br><img src="https://www.colorhexa.com/A76BCF.png" width="50" height='50' />
  richLavender("#A76BCF", "Rich lavender"),

  /// A color named "Rich Lilac" with hexadecimal value #B666D2<br><img src="https://www.colorhexa.com/B666D2.png" width="50" height='50' />
  richLilac("#B666D2", "Rich lilac"),

  /// A color named "Rich Maroon" with hexadecimal value #B03060<br><img src="https://www.colorhexa.com/B03060.png" width="50" height='50' />
  richMaroon("#B03060", "Rich maroon"),

  /// A color named "Rifle Green" with hexadecimal value #444C38<br><img src="https://www.colorhexa.com/444C38.png" width="50" height='50' />
  rifleGreen("#444C38", "Rifle green"),

  /// A color named "Robin Egg Blue" with hexadecimal value #00CCCC<br><img src="https://www.colorhexa.com/00CCCC.png" width="50" height='50' />
  robinEggBlue("#00CCCC", "Robin egg blue"),

  /// A color named "Rocket Metallic" with hexadecimal value #8A7F80<br><img src="https://www.colorhexa.com/8A7F80.png" width="50" height='50' />
  rocketMetallic("#8A7F80", "Rocket metallic"),

  /// A color named "Roman Silver" with hexadecimal value #838996<br><img src="https://www.colorhexa.com/838996.png" width="50" height='50' />
  romanSilver("#838996", "Roman silver"),

  /// A color named "Rose" with hexadecimal value #FF007F<br><img src="https://www.colorhexa.com/FF007F.png" width="50" height='50' />
  rose("#FF007F", "Rose"),

  /// A color named "Rose Bonbon" with hexadecimal value #F9429E<br><img src="https://www.colorhexa.com/F9429E.png" width="50" height='50' />
  roseBonbon("#F9429E", "Rose bonbon"),

  /// A color named "Rose Dust" with hexadecimal value #9E5E6F<br><img src="https://www.colorhexa.com/9E5E6F.png" width="50" height='50' />
  roseDust("#9E5E6F", "Rose dust"),

  /// A color named "Rose Ebony" with hexadecimal value #674846<br><img src="https://www.colorhexa.com/674846.png" width="50" height='50' />
  roseEbony("#674846", "Rose ebony"),

  /// A color named "Rose Gold" with hexadecimal value #B76E79<br><img src="https://www.colorhexa.com/B76E79.png" width="50" height='50' />
  roseGold("#B76E79", "Rose gold"),

  /// A color named "Rose Madder" with hexadecimal value #E32636<br><img src="https://www.colorhexa.com/E32636.png" width="50" height='50' />
  roseMadder("#E32636", "Rose madder"),

  /// A color named "Rose Pink" with hexadecimal value #FF66CC<br><img src="https://www.colorhexa.com/FF66CC.png" width="50" height='50' />
  rosePink("#FF66CC", "Rose pink"),

  /// A color named "Rose Quartz" with hexadecimal value #AA98A9<br><img src="https://www.colorhexa.com/AA98A9.png" width="50" height='50' />
  roseQuartz("#AA98A9", "Rose quartz"),

  /// A color named "Rose Red" with hexadecimal value #C21E56<br><img src="https://www.colorhexa.com/C21E56.png" width="50" height='50' />
  roseRed("#C21E56", "Rose red"),

  /// A color named "Rose Taupe" with hexadecimal value #905D5D<br><img src="https://www.colorhexa.com/905D5D.png" width="50" height='50' />
  roseTaupe("#905D5D", "Rose taupe"),

  /// A color named "Rose Vale" with hexadecimal value #AB4E52<br><img src="https://www.colorhexa.com/AB4E52.png" width="50" height='50' />
  roseVale("#AB4E52", "Rose vale"),

  /// A color named "Rosewood" with hexadecimal value #65000B<br><img src="https://www.colorhexa.com/65000B.png" width="50" height='50' />
  rosewood("#65000B", "Rosewood"),

  /// A color named "Rosso Corsa" with hexadecimal value #D40000<br><img src="https://www.colorhexa.com/D40000.png" width="50" height='50' />
  rossoCorsa("#D40000", "Rosso corsa"),

  /// A color named "Rosy Brown" with hexadecimal value #BC8F8F<br><img src="https://www.colorhexa.com/BC8F8F.png" width="50" height='50' />
  rosyBrown('#BC8F8F', 'Rosy Brown'),

  /// A color named "Royal Azure" with hexadecimal value #0038A8<br><img src="https://www.colorhexa.com/0038A8.png" width="50" height='50' />
  royalAzure("#0038A8", "Royal azure"),

  /// A color named "Royal Blue" with hexadecimal value #4169E1<br><img src="https://www.colorhexa.com/4169E1.png" width="50" height='50' />
  royalBlue('#4169E1', 'Royal Blue'),

  /// A color named "Royal Fuchsia" with hexadecimal value #CA2C92<br><img src="https://www.colorhexa.com/CA2C92.png" width="50" height='50' />
  royalFuchsia("#CA2C92", "Royal fuchsia"),

  /// A color named "Royal Purple" with hexadecimal value #7851A9<br><img src="https://www.colorhexa.com/7851A9.png" width="50" height='50' />
  royalPurple("#7851A9", "Royal purple"),

  /// A color named "Royal Yellow" with hexadecimal value #FADA5E<br><img src="https://www.colorhexa.com/FADA5E.png" width="50" height='50' />
  royalYellow("#FADA5E", "Royal yellow"),

  /// A color named "Rubine Red" with hexadecimal value #D10056<br><img src="https://www.colorhexa.com/D10056.png" width="50" height='50' />
  rubineRed("#D10056", "Rubine red"),

  /// A color named "Ruby" with hexadecimal value #E0115F<br><img src="https://www.colorhexa.com/E0115F.png" width="50" height='50' />
  ruby("#E0115F", "Ruby"),

  /// A color named "Ruby Red" with hexadecimal value #9B111E<br><img src="https://www.colorhexa.com/9B111E.png" width="50" height='50' />
  rubyRed("#9B111E", "Ruby red"),

  /// A color named "Ruddy" with hexadecimal value #FF0028<br><img src="https://www.colorhexa.com/FF0028.png" width="50" height='50' />
  ruddy("#FF0028", "Ruddy"),

  /// A color named "Ruddy Brown" with hexadecimal value #BB6528<br><img src="https://www.colorhexa.com/BB6528.png" width="50" height='50' />
  ruddyBrown("#BB6528", "Ruddy brown"),

  /// A color named "Ruddy Pink" with hexadecimal value #E18E96<br><img src="https://www.colorhexa.com/E18E96.png" width="50" height='50' />
  ruddyPink("#E18E96", "Ruddy pink"),

  /// A color named "Rufous" with hexadecimal value #A81C07<br><img src="https://www.colorhexa.com/A81C07.png" width="50" height='50' />
  rufous("#A81C07", "Rufous"),

  /// A color named "Russet" with hexadecimal value #80461B<br><img src="https://www.colorhexa.com/80461B.png" width="50" height='50' />
  russet("#80461B", "Russet"),

  /// A color named "Russian Green" with hexadecimal value #679267<br><img src="https://www.colorhexa.com/679267.png" width="50" height='50' />
  russianGreen("#679267", "Russian green"),

  /// A color named "Russian Violet" with hexadecimal value #32174D<br><img src="https://www.colorhexa.com/32174D.png" width="50" height='50' />
  russianViolet("#32174D", "Russian violet"),

  /// A color named "Rust" with hexadecimal value #B7410E<br><img src="https://www.colorhexa.com/B7410E.png" width="50" height='50' />
  rust("#B7410E", "Rust"),

  /// A color named "Rusty Red" with hexadecimal value #DA2C43<br><img src="https://www.colorhexa.com/DA2C43.png" width="50" height='50' />
  rustyRed("#DA2C43", "Rusty red"),

  /// A color named "Sacramento State Green" with hexadecimal value #043927<br><img src="https://www.colorhexa.com/043927.png" width="50" height='50' />
  sacramentoStateGreen("#043927", "Sacramento State green"),

  /// A color named "Saddle Brown" with hexadecimal value #8B4513<br><img src="https://www.colorhexa.com/8B4513.png" width="50" height='50' />
  saddleBrown('#8B4513', 'Saddle Brown'),

  /// A color named "Safety Orange" with hexadecimal value #FF7800<br><img src="https://www.colorhexa.com/FF7800.png" width="50" height='50' />
  safetyOrange("#FF7800", "Safety orange"),

  /// A color named "Safety Yellow" with hexadecimal value #EED202<br><img src="https://www.colorhexa.com/EED202.png" width="50" height='50' />
  safetyYellow("#EED202", "Safety yellow"),

  /// A color named "Saffron" with hexadecimal value #F4C430<br><img src="https://www.colorhexa.com/F4C430.png" width="50" height='50' />
  saffron("#F4C430", "Saffron"),

  /// A color named "Salmon" with hexadecimal value #FA8072<br><img src="https://www.colorhexa.com/FA8072.png" width="50" height='50' />
  salmon('#FA8072', 'Salmon'),

  /// A color named "Salmon Pink" with hexadecimal value #FF91A4<br><img src="https://www.colorhexa.com/FF91A4.png" width="50" height='50' />
  salmonPink("#FF91A4", "Salmon pink"),

  /// A color named "Sand" with hexadecimal value #C2B280<br><img src="https://www.colorhexa.com/C2B280.png" width="50" height='50' />
  sand("#C2B280", "Sand"),

  /// A color named "Sand Dune" with hexadecimal value #967117<br><img src="https://www.colorhexa.com/967117.png" width="50" height='50' />
  sandDune("#967117", "Sand dune"),

  /// A color named "Sandstorm" with hexadecimal value #ECD540<br><img src="https://www.colorhexa.com/ECD540.png" width="50" height='50' />
  sandstorm("#ECD540", "Sandstorm"),

  /// A color named "Sandy Brown" with hexadecimal value #F4A460<br><img src="https://www.colorhexa.com/F4A460.png" width="50" height='50' />
  sandyBrown('#F4A460', 'Sandy Brown'),

  /// A color named "Sandy Taupe" with hexadecimal value #967117<br><img src="https://www.colorhexa.com/967117.png" width="50" height='50' />
  sandyTaupe("#967117", "Sandy taupe"),

  /// A color named "Sangria" with hexadecimal value #92000A<br><img src="https://www.colorhexa.com/92000A.png" width="50" height='50' />
  sangria("#92000A", "Sangria"),

  /// A color named "Sap Green" with hexadecimal value #507D2A<br><img src="https://www.colorhexa.com/507D2A.png" width="50" height='50' />
  sapGreen("#507D2A", "Sap green"),

  /// A color named "Sapphire" with hexadecimal value #0F52BA<br><img src="https://www.colorhexa.com/0F52BA.png" width="50" height='50' />
  sapphire("#0F52BA", "Sapphire"),

  /// A color named "Sapphire Blue" with hexadecimal value #0067A5<br><img src="https://www.colorhexa.com/0067A5.png" width="50" height='50' />
  sapphireBlue("#0067A5", "Sapphire blue"),

  /// A color named "Satin Sheen Gold" with hexadecimal value #CBA135<br><img src="https://www.colorhexa.com/CBA135.png" width="50" height='50' />
  satinSheenGold("#CBA135", "Satin sheen gold"),

  /// A color named "Scarlet" with hexadecimal value #FF2400<br><img src="https://www.colorhexa.com/FF2400.png" width="50" height='50' />
  scarlet("#FF2400", "Scarlet"),

  /// A color named "Scarlet Red" with hexadecimal value #CD202C<br><img src="https://www.colorhexa.com/CD202C.png" width="50" height='50' />
  scarletRed("#CD202C", "Scarlet red"),

  /// A color named "Schauss Pink" with hexadecimal value #FF91AF<br><img src="https://www.colorhexa.com/FF91AF.png" width="50" height='50' />
  schaussPink("#FF91AF", "Schauss pink"),

  /// A color named "School Bus Yellow" with hexadecimal value #FFD800<br><img src="https://www.colorhexa.com/FFD800.png" width="50" height='50' />
  schoolBusYellow("#FFD800", "School bus yellow"),

  /// A color named "Screamin' Green" with hexadecimal value #66FF66<br><img src="https://www.colorhexa.com/66FF66.png" width="50" height='50' />
  screaminGreen("#66FF66", "Screamin' Green"),

  /// A color named "Sea Blue" with hexadecimal value #006994<br><img src="https://www.colorhexa.com/006994.png" width="50" height='50' />
  seaBlue("#006994", "Sea blue"),

  /// A color named "Sea Green" with hexadecimal value #2E8B57<br><img src="https://www.colorhexa.com/2E8B57.png" width="50" height='50' />
  seaGreen('#2E8B57', 'Sea Green'),

  /// A color named "Seal Brown" with hexadecimal value #59260B<br><img src="https://www.colorhexa.com/59260B.png" width="50" height='50' />
  sealBrown("#59260B", "Seal brown"),

  /// A color named "Seashell" with hexadecimal value #FFF5EE<br><img src="https://www.colorhexa.com/FFF5EE.png" width="50" height='50' />
  seashell("#FFF5EE", "Seashell"),

  /// A color named "Sea Shell" with hexadecimal value #FFF5EE<br><img src="https://www.colorhexa.com/FFF5EE.png" width="50" height='50' />
  seaShell('#FFF5EE', 'Sea Shell'),

  /// A color named "Selective Yellow" with hexadecimal value #FFBA00<br><img src="https://www.colorhexa.com/FFBA00.png" width="50" height='50' />
  selectiveYellow("#FFBA00", "Selective yellow"),

  /// A color named "Sepia" with hexadecimal value #704214<br><img src="https://www.colorhexa.com/704214.png" width="50" height='50' />
  sepia("#704214", "Sepia"),

  /// A color named "Shadow" with hexadecimal value #8A795D<br><img src="https://www.colorhexa.com/8A795D.png" width="50" height='50' />
  shadow("#8A795D", "Shadow"),

  /// A color named "Shadow Blue" with hexadecimal value #778BA5<br><img src="https://www.colorhexa.com/778BA5.png" width="50" height='50' />
  shadowBlue("#778BA5", "Shadow blue"),

  /// A color named "Shampoo" with hexadecimal value #FFCFF1<br><img src="https://www.colorhexa.com/FFCFF1.png" width="50" height='50' />
  shampoo("#FFCFF1", "Shampoo"),

  /// A color named "Shamrock Green" with hexadecimal value #009E60<br><img src="https://www.colorhexa.com/009E60.png" width="50" height='50' />
  shamrockGreen("#009E60", "Shamrock green"),

  /// A color named "Sheen Green" with hexadecimal value #8FD400<br><img src="https://www.colorhexa.com/8FD400.png" width="50" height='50' />
  sheenGreen("#8FD400", "Sheen green"),

  /// A color named "Shimmering Blush" with hexadecimal value #D98695<br><img src="https://www.colorhexa.com/D98695.png" width="50" height='50' />
  shimmeringBlush("#D98695", "Shimmering blush"),

  /// A color named "Shiny Shamrock" with hexadecimal value #5FA778<br><img src="https://www.colorhexa.com/5FA778.png" width="50" height='50' />
  shinyShamrock("#5FA778", "Shiny shamrock"),

  /// A color named "Shocking Pink" with hexadecimal value #FC0FC0<br><img src="https://www.colorhexa.com/FC0FC0.png" width="50" height='50' />
  shockingPink("#FC0FC0", "Shocking pink"),

  /// A color named "Shocking Pink Crayola" with hexadecimal value #FF6FFF<br><img src="https://www.colorhexa.com/FF6FFF.png" width="50" height='50' />
  shockingPinkCrayola("#FF6FFF", "Shocking pink (Crayola)"),

  /// A color named "Sienna" with hexadecimal value #A0522D<br><img src="https://www.colorhexa.com/A0522D.png" width="50" height='50' />
  sienna('#A0522D', 'Sienna'),

  /// A color named "Silver" with hexadecimal value #C0C0C0<br><img src="https://www.colorhexa.com/C0C0C0.png" width="50" height='50' />
  silver('#C0C0C0', 'Silver'),

  /// A color named "Silver Chalice" with hexadecimal value #ACACAC<br><img src="https://www.colorhexa.com/ACACAC.png" width="50" height='50' />
  silverChalice("#ACACAC", "Silver chalice"),

  /// A color named "Silver Lake Blue" with hexadecimal value #5D89BA<br><img src="https://www.colorhexa.com/5D89BA.png" width="50" height='50' />
  silverLakeBlue("#5D89BA", "Silver lake blue"),

  /// A color named "Silver Pink" with hexadecimal value #C4AEAD<br><img src="https://www.colorhexa.com/C4AEAD.png" width="50" height='50' />
  silverPink("#C4AEAD", "Silver pink"),

  /// A color named "Silver Sand" with hexadecimal value #BFC1C2<br><img src="https://www.colorhexa.com/BFC1C2.png" width="50" height='50' />
  silverSand("#BFC1C2", "Silver sand"),

  /// A color named "Sinopia" with hexadecimal value #CB410B<br><img src="https://www.colorhexa.com/CB410B.png" width="50" height='50' />
  sinopia("#CB410B", "Sinopia"),

  /// A color named "Skobeloff" with hexadecimal value #007474<br><img src="https://www.colorhexa.com/007474.png" width="50" height='50' />
  skobeloff("#007474", "Skobeloff"),

  /// A color named "Sky Blue" with hexadecimal value #87CEEB<br><img src="https://www.colorhexa.com/87CEEB.png" width="50" height='50' />
  skyBlue('#87CEEB', 'Sky Blue'),

  /// A color named "Sky Magenta" with hexadecimal value #CF71AF<br><img src="https://www.colorhexa.com/CF71AF.png" width="50" height='50' />
  skyMagenta("#CF71AF", "Sky magenta"),

  /// A color named "Slate Blue" with hexadecimal value #6A5ACD<br><img src="https://www.colorhexa.com/6A5ACD.png" width="50" height='50' />
  slateBlue('#6A5ACD', 'Slate Blue'),

  /// A color named "Slate Gray" with hexadecimal value #708090<br><img src="https://www.colorhexa.com/708090.png" width="50" height='50' />
  slateGray('#708090', 'Slate Gray'),

  /// A color named "Smalt" with hexadecimal value #003399<br><img src="https://www.colorhexa.com/003399.png" width="50" height='50' />
  smalt("#003399", "Smalt"),

  /// A color named "Smitten" with hexadecimal value #C84186<br><img src="https://www.colorhexa.com/C84186.png" width="50" height='50' />
  smitten("#C84186", "Smitten"),

  /// A color named "Smoky Black" with hexadecimal value #100C08<br><img src="https://www.colorhexa.com/100C08.png" width="50" height='50' />
  smokyBlack("#100C08", "Smoky black"),

  /// A color named "Snow" with hexadecimal value #FFFAFA<br><img src="https://www.colorhexa.com/FFFAFA.png" width="50" height='50' />
  snow('#FFFAFA', 'Snow'),

  /// A color named "Soap" with hexadecimal value #CEC8EF<br><img src="https://www.colorhexa.com/CEC8EF.png" width="50" height='50' />
  soap("#CEC8EF", "Soap"),

  /// A color named "Solid Pink" with hexadecimal value #893843<br><img src="https://www.colorhexa.com/893843.png" width="50" height='50' />
  solidPink("#893843", "Solid pink"),

  /// A color named "Sonic Silver" with hexadecimal value #757575<br><img src="https://www.colorhexa.com/757575.png" width="50" height='50' />
  sonicSilver("#757575", "Sonic silver"),

  /// A color named "Space Cadet" with hexadecimal value #1D2951<br><img src="https://www.colorhexa.com/1D2951.png" width="50" height='50' />
  spaceCadet("#1D2951", "Space cadet"),

  /// A color named "Spanish Bistre" with hexadecimal value #807532<br><img src="https://www.colorhexa.com/807532.png" width="50" height='50' />
  spanishBistre("#807532", "Spanish bistre"),

  /// A color named "Spanish Blue" with hexadecimal value #0070B8<br><img src="https://www.colorhexa.com/0070B8.png" width="50" height='50' />
  spanishBlue("#0070B8", "Spanish blue"),

  /// A color named "Spanish Carmine" with hexadecimal value #D10047<br><img src="https://www.colorhexa.com/D10047.png" width="50" height='50' />
  spanishCarmine("#D10047", "Spanish carmine"),

  /// A color named "Spanish Crimson" with hexadecimal value #E51A4C<br><img src="https://www.colorhexa.com/E51A4C.png" width="50" height='50' />
  spanishCrimson("#E51A4C", "Spanish crimson"),

  /// A color named "Spanish Gray" with hexadecimal value #989898<br><img src="https://www.colorhexa.com/989898.png" width="50" height='50' />
  spanishGray("#989898", "Spanish gray"),

  /// A color named "Spanish Green" with hexadecimal value #009150<br><img src="https://www.colorhexa.com/009150.png" width="50" height='50' />
  spanishGreen("#009150", "Spanish green"),

  /// A color named "Spanish Orange" with hexadecimal value #E86100<br><img src="https://www.colorhexa.com/E86100.png" width="50" height='50' />
  spanishOrange("#E86100", "Spanish orange"),

  /// A color named "Spanish Pink" with hexadecimal value #F7BFBE<br><img src="https://www.colorhexa.com/F7BFBE.png" width="50" height='50' />
  spanishPink("#F7BFBE", "Spanish pink"),

  /// A color named "Spanish Red" with hexadecimal value #E60026<br><img src="https://www.colorhexa.com/E60026.png" width="50" height='50' />
  spanishRed("#E60026", "Spanish red"),

  /// A color named "Spanish Sky Blue" with hexadecimal value #00FFFF<br><img src="https://www.colorhexa.com/00FFFF.png" width="50" height='50' />
  spanishSkyBlue("#00FFFF", "Spanish sky blue"),

  /// A color named "Spanish Violet" with hexadecimal value #4C2882<br><img src="https://www.colorhexa.com/4C2882.png" width="50" height='50' />
  spanishViolet("#4C2882", "Spanish violet"),

  /// A color named "Spanish Viridian" with hexadecimal value #007F5C<br><img src="https://www.colorhexa.com/007F5C.png" width="50" height='50' />
  spanishViridian("#007F5C", "Spanish viridian"),

  /// A color named "Spartan Crimson" with hexadecimal value #9E1316<br><img src="https://www.colorhexa.com/9E1316.png" width="50" height='50' />
  spartanCrimson("#9E1316", "Spartan crimson"),

  /// A color named "Spicy Mix" with hexadecimal value #8B5F4D<br><img src="https://www.colorhexa.com/8B5F4D.png" width="50" height='50' />
  spicyMix("#8B5f4D", "Spicy mix"),

  /// A color named "Spiro Disco Ball" with hexadecimal value #0FC0FC<br><img src="https://www.colorhexa.com/0FC0FC.png" width="50" height='50' />
  spiroDiscoBall("#0FC0FC", "Spiro Disco Ball"),

  /// A color named "Spring Bud" with hexadecimal value #A7FC00<br><img src="https://www.colorhexa.com/A7FC00.png" width="50" height='50' />
  springBud("#A7FC00", "Spring bud"),

  /// A color named "Spring Green" with hexadecimal value #00FF7F<br><img src="https://www.colorhexa.com/00FF7F.png" width="50" height='50' />
  springGreen('#00FF7F', 'Spring Green'),

  /// A color named "Star Command Blue" with hexadecimal value #007BB8<br><img src="https://www.colorhexa.com/007BB8.png" width="50" height='50' />
  starCommandBlue("#007BB8", "Star command blue"),

  /// A color named "Steel Blue" with hexadecimal value #4682B4<br><img src="https://www.colorhexa.com/4682B4.png" width="50" height='50' />
  steelBlue('#4682B4', 'Steel Blue'),

  /// A color named "Steel Pink" with hexadecimal value #CC33CC<br><img src="https://www.colorhexa.com/CC33CC.png" width="50" height='50' />
  steelPink("#CC33CC", "Steel pink"),

  /// A color named "Stil De Grain Yellow" with hexadecimal value #FADA5E<br><img src="https://www.colorhexa.com/FADA5E.png" width="50" height='50' />
  stilDeGrainYellow("#FADA5E", "Stil de grain yellow"),

  /// A color named "Stizza" with hexadecimal value #990000<br><img src="https://www.colorhexa.com/990000.png" width="50" height='50' />
  stizza("#990000", "Stizza"),

  /// A color named "Storm Cloud" with hexadecimal value #4F666A<br><img src="https://www.colorhexa.com/4F666A.png" width="50" height='50' />
  stormcloud("#4F666A", "Stormcloud"),

  /// A color named "Straw" with hexadecimal value #E4D96F<br><img src="https://www.colorhexa.com/E4D96F.png" width="50" height='50' />
  straw("#E4D96F", "Straw"),

  /// A color named "Strawberry" with hexadecimal value #FC5A8D<br><img src="https://www.colorhexa.com/FC5A8D.png" width="50" height='50' />
  strawberry("#FC5A8D", "Strawberry"),

  /// A color named "Sugar Plum" with hexadecimal value #914E75<br><img src="https://www.colorhexa.com/914E75.png" width="50" height='50' />
  sugarPlum("#914E75", "Sugar plum"),

  /// A color named "Sunset" with hexadecimal value #FAD6A5<br><img src="https://www.colorhexa.com/FAD6A5.png" width="50" height='50' />
  sunset("#FAD6A5", "Sunset"),

  /// A color named "Sunset Orange" with hexadecimal value #FD5E53<br><img src="https://www.colorhexa.com/FD5E53.png" width="50" height='50' />
  sunsetOrange("#FD5E53", "Sunset orange"),

  /// A color named "Super Pink" with hexadecimal value #CF6BA9<br><img src="https://www.colorhexa.com/CF6BA9.png" width="50" height='50' />
  superPink("#CF6BA9", "Super pink"),

  /// A color named "Tan" with hexadecimal value #D2B48C<br><img src="https://www.colorhexa.com/D2B48C.png" width="50" height='50' />
  tan('#D2B48C', 'Tan'),

  /// A color named "Tangelo" with hexadecimal value #F94D00<br><img src="https://www.colorhexa.com/F94D00.png" width="50" height='50' />
  tangelo("#F94D00", "Tangelo"),

  /// A color named "Tangerine" with hexadecimal value #F28500<br><img src="https://www.colorhexa.com/F28500.png" width="50" height='50' />
  tangerine("#F28500", "Tangerine"),

  /// A color named "Tangerine Yellow" with hexadecimal value #FFCC00<br><img src="https://www.colorhexa.com/FFCC00.png" width="50" height='50' />
  tangerineYellow("#FFCC00", "Tangerine yellow"),

  /// A color named "Tango Pink" with hexadecimal value #E4717A<br><img src="https://www.colorhexa.com/E4717A.png" width="50" height='50' />
  tangoPink("#E4717A", "Tango pink"),

  /// A color named "Taupe" with hexadecimal value #483C32<br><img src="https://www.colorhexa.com/483C32.png" width="50" height='50' />
  taupe("#483C32", "Taupe"),

  /// A color named "Taupe Gray" with hexadecimal value #8B8589<br><img src="https://www.colorhexa.com/8B8589.png" width="50" height='50' />
  taupeGray("#8B8589", "Taupe gray"),

  /// A color named "Tea Green" with hexadecimal value #D0F0C0<br><img src="https://www.colorhexa.com/D0F0C0.png" width="50" height='50' />
  teaGreen("#D0F0C0", "Tea green"),

  /// A color named "Teal" with hexadecimal value #008080<br><img src="https://www.colorhexa.com/008080.png" width="50" height='50' />
  teal('#008080', 'Teal'),

  /// A color named "Teal Blue" with hexadecimal value #367588<br><img src="https://www.colorhexa.com/367588.png" width="50" height='50' />
  tealBlue("#367588", "Teal blue"),

  /// A color named "Teal Deer" with hexadecimal value #99E6B3<br><img src="https://www.colorhexa.com/99E6B3.png" width="50" height='50' />
  tealDeer("#99E6B3", "Teal deer"),

  /// A color named "Teal Green" with hexadecimal value #00827F<br><img src="https://www.colorhexa.com/00827F.png" width="50" height='50' />
  tealGreen("#00827F", "Teal green"),

  /// A color named "Tea Rose" with hexadecimal value #F88379<br><img src="https://www.colorhexa.com/F88379.png" width="50" height='50' />
  teaRose("#F88379", "Tea rose"),

  /// A color named "Telemagenta" with hexadecimal value #CF3476<br><img src="https://www.colorhexa.com/CF3476.png" width="50" height='50' />
  teleMagenta("#CF3476", "Telemagenta"),

  /// A color named "Tenné" with hexadecimal value #CD5700<br><img src="https://www.colorhexa.com/CD5700.png" width="50" height='50' />
  tenne("#CD5700", "Tenné"),

  /// A color named "Terra Cotta" with hexadecimal value #E2725B<br><img src="https://www.colorhexa.com/E2725B.png" width="50" height='50' />
  terraCotta("#E2725B", "Terra cotta"),

  /// A color named "Thistle" with hexadecimal value #D8BFD8<br><img src="https://www.colorhexa.com/D8BFD8.png" width="50" height='50' />
  thistle('#D8BFD8', 'Thistle'),

  /// A color named "Thulian Pink" with hexadecimal value #DE6FA1<br><img src="https://www.colorhexa.com/DE6FA1.png" width="50" height='50' />
  thulianPink("#DE6FA1", "Thulian pink"),

  /// A color named "Tickle Me Pink" with hexadecimal value #FC89AC<br><img src="https://www.colorhexa.com/FC89AC.png" width="50" height='50' />
  tickleMePink("#FC89AC", "Tickle Me Pink"),

  /// A color named "Tiffany Blue" with hexadecimal value #0ABAB5<br><img src="https://www.colorhexa.com/0ABAB5.png" width="50" height='50' />
  tiffanyBlue("#0ABAB5", "Tiffany blue"),

  /// A color named "Tiger Eye" with hexadecimal value #E08D3C<br><img src="https://www.colorhexa.com/E08D3C.png" width="50" height='50' />
  tigerEye("#E08D3C", "Tiger eye"),

  /// A color named "Tiger Orange" with hexadecimal value #FD6A02<br><img src="https://www.colorhexa.com/FD6A02.png" width="50" height='50' />
  tigerOrange("#FD6A02", "Tiger orange"),

  /// A color named "Tiger's Eye" with hexadecimal value #E08D3C<br><img src="https://www.colorhexa.com/E08D3C.png" width="50" height='50' />
  tigersEye("#E08D3C", "Tiger's eye"),

  /// A color named "Timberwolf" with hexadecimal value #DBD7D2<br><img src="https://www.colorhexa.com/DBD7D2.png" width="50" height='50' />
  timberwolf("#DBD7D2", "Timberwolf"),

  /// A color named "Titanium Yellow" with hexadecimal value #EEE600<br><img src="https://www.colorhexa.com/EEE600.png" width="50" height='50' />
  titaniumYellow("#EEE600", "Titanium yellow"),

  /// A color named "Tomato" with hexadecimal value #FF6347<br><img src="https://www.colorhexa.com/FF6347.png" width="50" height='50' />
  tomato('#FF6347', 'Tomato'),

  /// A color named "Toolbox" with hexadecimal value #746CC0<br><img src="https://www.colorhexa.com/746CC0.png" width="50" height='50' />
  toolbox("#746CC0", "Toolbox"),

  /// A color named "Topaz" with hexadecimal value #FFC87C<br><img src="https://www.colorhexa.com/FFC87C.png" width="50" height='50' />
  topaz("#FFC87C", "Topaz"),

  /// A color named "Tractor Red" with hexadecimal value #FD0E35<br><img src="https://www.colorhexa.com/FD0E35.png" width="50" height='50' />
  tractorRed("#FD0E35", "Tractor red"),

  /// A color named "Transparent" with hexadecimal value #FFFFFFFF<br><img src="https://www.colorhexa.com/FFFFFFFF.png" width="50" height='50' />
  transparent("#FFFFFFFF", "Transparent"),

  /// A color named "Trolley Grey" with hexadecimal value #808080<br><img src="https://www.colorhexa.com/808080.png" width="50" height='50' />
  trolleyGrey("#808080", "Trolley grey"),

  /// A color named "Tropical Rain Forest" with hexadecimal value #00755E<br><img src="https://www.colorhexa.com/00755E.png" width="50" height='50' />
  tropicalRainForest("#00755E", "Tropical rain forest"),

  /// A color named "True Blue" with hexadecimal value #0073CF<br><img src="https://www.colorhexa.com/0073CF.png" width="50" height='50' />
  trueBlue("#0073CF", "True blue"),

  /// A color named "Tufts Blue" with hexadecimal value #417DC1<br><img src="https://www.colorhexa.com/417DC1.png" width="50" height='50' />
  tuftsBlue("#417DC1", "Tufts blue"),

  /// A color named "Tulip" with hexadecimal value #FF878D<br><img src="https://www.colorhexa.com/FF878D.png" width="50" height='50' />
  tulip("#FF878D", "Tulip"),

  /// A color named "Tumbleweed" with hexadecimal value #DEAA88<br><img src="https://www.colorhexa.com/DEAA88.png" width="50" height='50' />
  tumbleweed("#DEAA88", "Tumbleweed"),

  /// A color named "Turkish Rose" with hexadecimal value #B57281<br><img src="https://www.colorhexa.com/B57281.png" width="50" height='50' />
  turkishRose("#B57281", "Turkish rose"),

  /// A color named "Turquoise" with hexadecimal value #40E0D0<br><img src="https://www.colorhexa.com/40E0D0.png" width="50" height='50' />
  turquoise('#40E0D0', 'Turquoise'),

  /// A color named "Turquoise Blue" with hexadecimal value #00FFEF<br><img src="https://www.colorhexa.com/00FFEF.png" width="50" height='50' />
  turquoiseBlue("#00FFEF", "Turquoise blue"),

  /// A color named "Turquoise Green" with hexadecimal value #A0D6B4<br><img src="https://www.colorhexa.com/A0D6B4.png" width="50" height='50' />
  turquoiseGreen("#A0D6B4", "Turquoise green"),

  /// A color named "Tuscan" with hexadecimal value #FAD6A5<br><img src="https://www.colorhexa.com/FAD6A5.png" width="50" height='50' />
  tuscan("#FAD6A5", "Tuscan"),

  /// A color named "Tuscan Brown" with hexadecimal value #6F4E37<br><img src="https://www.colorhexa.com/6F4E37.png" width="50" height='50' />
  tuscanBrown("#6F4E37", "Tuscan brown"),

  /// A color named "Tuscan Red" with hexadecimal value #7C4848<br><img src="https://www.colorhexa.com/7C4848.png" width="50" height='50' />
  tuscanRed("#7C4848", "Tuscan red"),

  /// A color named "Tuscan Tan" with hexadecimal value #A67B5B<br><img src="https://www.colorhexa.com/A67B5B.png" width="50" height='50' />
  tuscanTan("#A67B5B", "Tuscan tan"),

  /// A color named "Tuscany" with hexadecimal value #C09999<br><img src="https://www.colorhexa.com/C09999.png" width="50" height='50' />
  tuscany("#C09999", "Tuscany"),

  /// A color named "Twilight Lavender" with hexadecimal value #8A496B<br><img src="https://www.colorhexa.com/8A496B.png" width="50" height='50' />
  twilightLavender("#8A496B", "Twilight lavender"),

  /// A color named "Tyrian Purple" with hexadecimal value #66023C<br><img src="https://www.colorhexa.com/66023C.png" width="50" height='50' />
  tyrianPurple("#66023C", "Tyrian purple"),

  /// A color named "UA Blue" with hexadecimal value #0033AA<br><img src="https://www.colorhexa.com/0033AA.png" width="50" height='50' />
  uaBlue("#0033AA", "UA blue"),

  /// A color named "UA Red" with hexadecimal value #D9004C<br><img src="https://www.colorhexa.com/D9004C.png" width="50" height='50' />
  volt("#CEFF00", "Volt"),

  warmBlack("#004242", "Warm black"),
  waterspout("#A4F4F9", "Waterspout"),
  wenge("#645452", "Wenge"),
  wheat('#F5DEB3', 'Wheat'),
  white("#FFFFFF", "White"),
  whiteSmoke("#F5F5F5", "White smoke"),
  wildBlueYonder("#A2ADD0", "Wild blue yonder"),
  wildOrchid("#D470A2", "Wild orchid"),
  wildStrawberry("#FF43A4", "Wild strawberry"),
  wildWatermelon("#FC6C85", "Wild watermelon"),
  willpowerOrange("#FD5800", "Willpower orange"),
  windsorTan("#A75502", "Windsor tan"),
  wine("#722F37", "Wine"),
  wineDregs("#673147", "Wine dregs"),
  wintergreenDream("#56887D", "Wintergreen dream"),
  winterSky("#FF007C", "Winter sky"),
  winterWizard("#A0E6FF", "Winter wizard"),
  wisteria("#C9A0DC", "Wisteria"),
  woodBrown("#C19A6B", "Wood brown"),
  xanadu("#738678", "Xanadu"),
  yaleBlue("#0F4D92", "Yale blue"),
  yellow("#FFFF00", "Yellow"),
  yellowGreen('#9ACD32', 'Yellow Green'),
  yellowOrange("#FFAE42", "Yellow orange"),
  yellowRose("#FFF000", "Yellow rose"),
  zaffre("#0014A8", "Zaffre"),
  zinnwalditeBrown("#2C1608", "Zinnwaldite brown"),
  zomp("#39A78E", "Zomp"),
  airForceBlue("#5d8aa8", "Air Force blue"),
  alizarinCrimson("#e32636", "Alizarin crimson"),
  americanRose("#ff033e", "American rose"),
  antiFlashWhite("#f2f3f4", "Anti-flash white"),
  ashGrey("#b2beb5", "Ash grey"),
  aurometalsaurus("#6e7f80", "AuroMetalSaurus"),
  awesome("#ff2052", "Awesome"),
  azureMistWeb("#f0ffff", "Azure mist/web"),
  ballBlue("#21abcd", "Ball Blue"),
  bananaYellow("#ffe135", "Banana yellow"),
  bazaar("#98777b", "Bazaar"),
  bluePurple("#8a2be2", "Blue purple"),
  bondiBlue("#0095b6", "Bondi blue"),
  bostonUniversityRed("#cc0000", "Boston University Red"),
  boysenberry("#873260", "Boysenberry"),
  brandeisBlue("#0070ff", "Brandeis blue"),
  brass("#b5a642", "Brass"),
  brightCerulean("#1dacd6", "Bright cerulean"),
  brightLavender("#bf94e4", "Bright lavender"),
  brightPink("#ff007f", "Bright pink"),
  brightTurquoise("#08e8de", "Bright turquoise"),
  brightUbe("#d19fe8", "Bright ube"),
  brilliantLavender("#f4bbff", "Brilliant lavender"),
  bubbles("#e7feff", "Bubbles"),
  bulgarianRose("#480607", "Bulgarian rose"),
  cafAuLait("#a67b5b", "Café au lait"),
  cafNoir("#4b3621", "Café noir"),
  calPolyPomonaGreen("#1e4d2b", "Cal Poly Pomona green"),
  camouflageGreen("#78866b", "Camouflage green"),
  carminePink("#eb4c42", "Carmine pink"),
  carmineRed("#ff0038", "Carmine red"),
  celestialBlue("#4997d0", "Celestial blue"),
  cerisePink("#ec3b83", "Cerise pink"),
  chamoisee("#a0785a", "Chamoisee"),
  cherry("#de3163", "Cherry"),
  cinnamon("#d2691e", "Cinnamon"),
  classicRose("#fbcce7", "Classic rose"),
  cobalt("#0047ab", "Cobalt"),
  coolBlack("#002e63", "Cool black"),
  coralRed("#ff4040", "Coral red"),
  cornflower("#9aceeb", "Cornflower"),
  crimsonRed("#990000", "Crimson Red"),
  crimsonGlory("#be0032", "Crimson glory"),
  daffodil("#ffff31", "Daffodil"),
  dandelion("#f0e130", "Dandelion"),
  darkCandyAppleRed("#a40000", "Dark candy apple red"),
  darkCerulean("#08457e", "Dark cerulean"),
  darkChestnut("#986960", "Dark chestnut"),
  darkCoral("#cd5b45", "Dark coral"),
  darkLavender("#734f96", "Dark lavender"),
  darkMidnightBlue("#003366", "Dark midnight blue"),
  darkPastelBlue("#779ecb", "Dark pastel blue"),
  darkPastelPurple("#966fd6", "Dark pastel purple"),
  darkPastelRed("#c23b22", "Dark pastel red"),
  darkPink("#e75480", "Dark pink"),
  darkPowderBlue("#003399", "Dark powder blue"),
  darkRaspberry("#872657", "Dark raspberry"),
  darkScarlet("#560319", "Dark scarlet"),
  darkTan("#918151", "Dark tan"),
  darkTangerine("#ffa812", "Dark tangerine"),
  darkTaupe("#483c32", "Dark taupe"),
  darkTerraCotta("#cc4e5c", "Dark terra cotta"),
  davyGrey("#555555", "Davy grey"),
  debianRed("#d70a53", "Debian red"),
  deepCarmine("#a9203e", "Deep carmine"),
  deepCarminePink("#ef3038", "Deep carmine pink"),
  deepCarrotOrange("#e9692c", "Deep carrot orange"),
  deepCoffee("#704241", "Deep coffee"),
  deepFuchsia("#c154c1", "Deep fuchsia"),
  deepLilac("#9955bb", "Deep lilac"),
  deepMagenta("#cc00cc", "Deep magenta"),
  deepPeach("#ffcba4", "Deep peach"),
  dollarBill("#85bb65", "Dollar bill"),
  electricCrimson("#ff003f", "Electric crimson"),
  electricCyan("#00ffff", "Electric cyan"),
  electricLavender("#f4bbff", "Electric lavender"),
  electricUltramarine("#3f00ff", "Electric ultramarine"),
  electricYellow("#ffff00", "Electric yellow"),
  famous("#ff00ff", "Famous"),
  fern("#71bc78", "Fern"),
  fuchsiaPink("#ff77ff", "Fuchsia pink"),
  ginger("#b06500", "Ginger"),
  halayBe("#663854", "Halayà úbe"),
  internationalOrange("#ff4f00", "International orange"),
  macaroniAndCheese("#ffbd88", "Macaroni and Cheese"),
  meatBrown("#e5b73b", "Meat brown"),
  mediumTealBlue("#0054b4", "Medium teal blue"),
  moonstoneBlue("#73a9c2", "Moonstone blue"),
  mordantRed19("#ae0c00", "Mordant red 19"),
  munsell("#f2f3f4", "Munsell"),
  myrtle("#21421e", "Myrtle"),
  navyBlue("#000080", "Navy blue"),
  oceanBoatBlue("#0077be", "Ocean Boat Blue"),
  payneGrey("#536878", "Payne grey"),
  purpleMountainSMajesty("#9d81ba", "Purple Mountain's Majesty"),
  robinSEggBlue("#1fcecb", "Robin's Egg Blue"),
  saintPatrickBlue("#23297a", "Saint Patrick Blue"),
  shamrock("#45cea2", "Shamrock"),
  smokeyTopaz("#933d41", "Smokey topaz"),
  sunglow("#ffcc33", "Sunglow"),
  tawny("#cd5700", "Tawny");

  static NamedColor get random => values.orderByRandom.first;

  final String hexadecimal;
  final String _name;

  const NamedColor(this.hexadecimal, this._name);

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
  int get alpha => color.alpha;

  @override
  int get blue => color.blue;

  /// Returns the color of the named color.
  Color get color => hexadecimal.asColor;

  @override
  int get green => color.green;

  string get keyword => generateKeyword(_name);

  string get name => _name.toTitleCase();

  @override
  double get opacity => color.opacity;

  @override
  int get red => color.red;

  @override
  int get value => color.value;

  @override
  double computeLuminance() => color.computeLuminance();

  @override
  toString() => "${name.toTitleCase()} - $hexadecimal";

  @override
  Color withAlpha(int a) => color.withAlpha(a);

  @override
  Color withBlue(int b) => color.withBlue(b);

  @override
  Color withGreen(int g) => color.withGreen(g);

  @override
  Color withOpacity(double opacity) => color.withOpacity(opacity);
  @override
  Color withRed(int r) => color.withRed(r);
}
