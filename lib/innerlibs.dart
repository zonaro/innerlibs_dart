// ignore_for_file: camel_case_types

library innerlibs;

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:innerlibs/innerlibs.dart';

export 'package:collection/collection.dart' hide groupBy;
export 'package:darq/darq.dart';

export 'align_extensions.dart';
export 'alignment_extensions.dart';
export 'boolean_extensions.dart';
export 'build_context_extensions.dart';
export 'center_extensions.dart';
export 'color_extensions.dart';
export 'container_extension.dart';
export 'date_extension.dart';
export 'dialog_extension.dart';
export 'edge_insets_extensions.dart';
export 'expanded_extension.dart';
export 'flexible_extension.dart';
export 'general_extensions.dart';
export 'gesture_detector_extension.dart';
export 'global.dart';
export 'icon_extensions.dart';
export 'list_extensions.dart';
export 'map_extensions.dart';
export 'num_extensions.dart';
export 'opacity_extension.dart';
export 'padding_extension.dart';
export 'pixel_converter.dart';
export 'positioned_extensions.dart';
export 'shimmer_extensions.dart';
export 'size_box_extension.dart';
export 'size_extensions.dart';
export 'sql_row_extensions.dart';
export 'string_extensions.dart';
export 'string_helpers.dart';
export 'text_extension.dart';
export 'text_style_extension.dart';
export 'theme_extension.dart';
export 'tooltip_extension.dart';
export 'util.dart';
export 'utils/day.dart';
export 'utils/format_time.dart';
export 'utils/formatters.dart';
export 'utils/haptic_feedback_type.dart';
export 'utils/keyed_json_table.dart';
export 'utils/month.dart';
export 'utils/sql_response.dart';
export 'utils/validation_interface.dart';
export 'widget_ext.dart';
export 'widgets/avatar_image.dart';
export 'widgets/badge.dart';
export 'widgets/custom_calendar.dart';
export 'widgets/custom_date_range_picker.dart';
export 'widgets/date_picker_form_field.dart';
export 'widgets/floating_area.dart';
export 'widgets/future_awaiter.dart';
export 'widgets/icon_card.dart';
export 'widgets/image_card.dart';
export 'widgets/min_size.dart';
export 'widgets/nil.dart';
export 'widgets/responsive.dart';
export 'widgets/responsive_grid.dart';
export 'widgets/restart_widget.dart';
export 'widgets/scaffold_builder.dart';
export 'widgets/shimmer.dart';

typedef date = DateTime;

/// C# alias for [String]
typedef string = String;
typedef strings = List<String>;
typedef ints = List<int>;
typedef doubles = List<double>;
typedef bytes = Uint8List;
typedef FileBytes = bytes;

/// C# alias for [double]
typedef decimal = double;

typedef money = decimal;

/// C# alias for [Iterable]
typedef IEnumerable = Iterable;

/// C# alias for [File]
typedef FileInfo = File;

/// C# alias for [Directory]
typedef DirectoryInfo = Directory;

/// Alias for [Map<String, dynamic>], used in most Json serializations
typedef JsonMap = Map<String, dynamic>;

/// C# Alias for [Map<K, V>]

typedef Dictionary<K, V> = Map<K, V>;

/// Alias for [Map<String, dynamic>], used to represent a row in a data table
typedef JsonRow = JsonMap;

/// Alias for [List<Map<String, dynamic>>], used to represent a data table
typedef JsonTable = List<JsonRow>;

/// Alias for [List<List<Map<String, dynamic>>>], used to represent a set of data tables
typedef JsonTableSet = List<JsonTable>;

/// Alias for [Map<string, List<Map<String, dynamic>>>], used to group data tables
typedef GroupedJsonTable = Map<string, JsonTable>;

/// Checks if [object] has a valid value. The following values are considered invalid:
/// Null values; Empty or only white spaces [String]s, 0 for [num] , [minDate] for [DateTime]. Call [isValid] recursively on [List] items or [Map] values.
/// Classes thats implements [Validator] will be checked using [Validator.validate] function.
/// Other class types, this method  call [ToString()] and check the result string against [isValid].
bool isValid(dynamic object) {
  try {
    if (object == null) {
      return false;
    }
    if (object is String) {
      return object.nullIf((s) => s == null || s.trimAll.flatEqual("null")).isNotBlank;
    }
    if (object is bool) {
      return object;
    }
    if (object is num) {
      return object != 0;
    }
    if (object is DateTime) {
      return object > minDate;
    }

    if (object is Validator) {
      return object.validate().isEmpty;
    }

    if (object is Iterable) {
      var l = object;
      if (l.isEmpty) return false;
      for (var e in l) {
        if ((e as Object?).isValid) {
          return true;
        }
      }
      return false;
    }
    if (object is Map) {
      var m = object;
      return m.isNotEmpty && m.values.isValid;
    }

    return object.toString().isValid;
  } catch (e) {
    consoleLog("IsValid => ", error: e);
    return false;
  }
}

/// Checks if the given [object] is not valid.
///
/// Returns `true` if the [object] is not valid, otherwise `false`.
bool isNotValid(dynamic object) => !isValid(object);
