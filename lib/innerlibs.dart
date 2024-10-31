// ignore_for_file: camel_case_types

library innerlibs;

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:innerlibs/innerlibs.dart';
import 'package:latlong2/latlong.dart' as lat_long_path show Path;

export 'package:brasil_fields/brasil_fields.dart' hide Estados;
export 'package:collection/collection.dart' hide groupBy;
export 'package:darq/darq.dart';
export 'package:date_field/date_field.dart';
export 'package:gap/gap.dart';
export 'package:get/get.dart';
export 'package:icons_plus/icons_plus.dart';
export 'package:innerlibs/innerlibs.dart';
export 'package:latlong2/latlong.dart' hide Path;

export 'align_extensions.dart';
export 'alignment_extensions.dart';
export 'boolean_extensions.dart';
export 'brasil.dart';
export 'build_context_extensions.dart';
export 'campo.dart';
export 'center_extensions.dart';
export 'cidade.dart';
export 'color_extensions.dart';
export 'container_extension.dart';
export 'date_extension.dart';
export 'dialog_extension.dart';
export 'edge_insets_extensions.dart';
export 'endereco.dart';
export 'estado.dart';
export 'expanded_extension.dart';
export 'file_extensions.dart';
export 'flexible_extension.dart';
export 'formatters.dart';
export 'general_extensions.dart';
export 'gesture_detector_extension.dart';
export 'global.dart';
export 'icon_extensions.dart';
export 'info_usuario.dart';
export 'keyed_json_table.dart';
export 'l10n/app_localizations.dart';
export 'list_extensions.dart';
export 'map_extensions.dart';
export 'named_color.dart';
export 'num_extensions.dart';
export 'oembed.dart';
export 'opacity_extension.dart';
export 'padding_extension.dart';
export 'pixel_converter.dart';
export 'positioned_extensions.dart';
export 'self_map.dart';
export 'shimmer_extensions.dart';
export 'size_box_extension.dart';
export 'size_extensions.dart';
export 'sql_response.dart';
export 'sql_row_extensions.dart';
export 'string_extensions.dart';
export 'string_helpers.dart';
export 'tag_xml.dart';
export 'telefone.dart';
export 'text_extension.dart';
export 'text_style_extension.dart';
export 'theme_extension.dart';
export 'tooltip_extension.dart';
export 'validation_interface.dart';
export 'widget_ext.dart';
export 'widgets/avatar_image.dart';
export 'widgets/brazil_plate.dart';
export 'widgets/custom_calendar.dart';
export 'widgets/custom_date_range_picker.dart';
export 'widgets/date_picker_form_field.dart';
export 'widgets/empty_widget.dart';
export 'widgets/expandable.dart';
export 'widgets/floating_area.dart';
export 'widgets/future_awaiter.dart';
export 'widgets/icon_card.dart';
export 'widgets/image_card.dart';
export 'widgets/milk_truck.dart';
export 'widgets/min_size.dart';
export 'widgets/nil.dart';
export 'widgets/placeholders.dart';
export 'widgets/responsive.dart';
export 'widgets/responsive_grid.dart';
export 'widgets/scaffold_builder.dart';
export 'widgets/shimmer.dart';
export 'widgets/square_button.dart';
export 'widgets/widgets_to_image.dart';

GetInterface get inn => Get;

typedef bytes = Uint8List;

typedef date = DateTime;

/// C# alias for [double]
typedef decimal = double;

/// C# Alias for [Map<K, V>]
typedef Dictionary<K, V> = Map<K, V>;

/// C# alias for [Directory]
typedef DirectoryInfo = Directory;
typedef DoubleList = List<double>;
typedef Estados = Estado;

typedef FileBytes = bytes;

/// C# alias for [File]
typedef FileInfo = File;

/// Alias for [Map<T, List<Map<String, dynamic>>>], used to group [JsonTable]s
typedef GroupedJsonTable<T> = Map<T, JsonTable>;

/// C# alias for [Iterable]
typedef IEnumerable = Iterable;

typedef IntList = List<int>;

/// Alias for [Map<String, dynamic>], used in most Json serializations
typedef JsonMap = Map<String, dynamic>;

/// Alias for [Map<String, dynamic>], used to represent a row in a data table
typedef JsonRow = JsonMap;

/// Alias for [List<Map<String, dynamic>>], used to represent a data table
typedef JsonTable = List<JsonRow>;

/// Alias for [List<List<Map<String, dynamic>>>], used to represent a set of data tables
typedef JsonTableSet = List<JsonTable>;

typedef LatitudeLongitude = LatLng;

typedef LatLongPath = lat_long_path.Path;

typedef money = decimal;

/// C# alias for [String]
typedef string = String;

typedef StringList = List<String>;

class LatLngTime extends LatLng {
  final DateTime timestamp;

  LatLngTime(super.latitude, super.longitude, DateTime? timestamp) : timestamp = timestamp ?? now;
}
