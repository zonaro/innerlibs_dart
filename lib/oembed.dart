// ignore_for_file: camel_case_types

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:innerlibs/innerlibs.dart';

typedef OEmbedProviders = List<OEmbed>;

/// Represents an oEmbed provider.
class OEmbed {
  static const providers = <OEmbed>[];

  /// The name of the provider.
  String providerName;

  /// The URL of the provider.
  String providerUrl;

  /// The list of endpoints.
  late List<OEmbedEndpoint> endpoints;

  /// Creates a new instance of [OEmbed].
  OEmbed(this.providerName, this.providerUrl, this.endpoints);

  /// Creates a new instance of [OEmbed] from a JSON map.
  factory OEmbed.fromJson(Map<String, dynamic> json) => OEmbed(json['provider_name'] ?? "", json['provider_url'] ?? "", [
        for (var v in json['endpoints'] ?? [])
          if (v != null) OEmbedEndpoint.fromJson(v)
      ]);

  /// Converts this [OEmbed] instance to a JSON map.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['provider_name'] = providerName;
    data['provider_url'] = providerUrl;
    data['endpoints'] = endpoints.map((v) => v.toJson()).toList();
    return data;
  }

  /// Retrieves oEmbed data from the given URL.
  ///
  /// Returns a [Future] that completes with an [OEmbedData] object if successful,
  /// or with a default [OEmbedData] object if oEmbed data is not found.
  /// The [url] parameter specifies the URL for which to retrieve the oEmbed data.
  /// The [providers] parameter specifies the list of oEmbed providers to search.
  /// If no providers are specified, the list of providers is retrieved from the oEmbed website.
  static Future<OEmbedData> fromUri(Uri url, [OEmbedProviders providers = const [], bool updateProviders = true]) async {
    try {
      if (providers.isEmpty) {
        providers = await getProviders(updateProviders);
      }

      // Find the provider that matches the given URL
      final OEmbed? provider = providers.firstWhereOrNull((p) {
        return url.host.flatEqual(p.providerUrl) ||
            p.endpoints.any((ep) {
              return ep.schemes.any((x) => url.toString().isLike(x));
            });
      });

      if (provider != null) {
        // Find the endpoint that supports oEmbed
        final OEmbedEndpoint? oEmbedEndpoint = provider.endpoints.firstWhereOrNull((e) => e.schemes.any((x) => url.toString().isLike(x)));
        if (oEmbedEndpoint != null) {
          var r = await oEmbedEndpoint.getOEmbedData(url);
          if (r != null) {
            return r;
          }
        }
      }
    } catch (e) {
      consoleLog('Error: $e');
    }

// Default oEmbed data is an HTML link to the URL with the site title as the link text
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final String html = response.body;
        final String title = RegExp(r'<title>([^<]+)</title>').firstMatch(html)?.group(1) ?? url.host;
        final String favicon = RegExp(r'<link rel="icon" href="([^"]+)"').firstMatch(html)?.group(1) ?? '';
        final String author = RegExp(r'<meta name="author" content="([^"]+)"').firstMatch(html)?.group(1) ?? '';
        return OEmbedData(
          title: title,
          authorName: author,
          providerName: url.host,
          providerUrl: url.host,
          authorUrl: url.host,
          thumbnailUrl: favicon,
          thumbnailHeight: 16,
          thumbnailWidth: 16,
          html: '<a target="_blank" href="$url"><img src="$favicon" alt="$title" style="width: 16px; height: 16px;"> $title</a>',
        );
      }
    } catch (e) {
      consoleLog('Error: $e');
    } finally {}
    return OEmbedData(
      title: "oEmbed not found",
      html: '<a target="_blank" href="$url">${url.host}</a>',
      providerUrl: url.host,
      providerName: url.host,
    );
  }

  /// Retrieves a list of oEmbed providers from the oEmbed website.
  static Future<OEmbedProviders> getProviders([bool updateProviders = true]) async {
    if (updateProviders || OEmbed.providers.isEmpty) {
      final response = await http.get(Uri.parse('https://oembed.com/providers.json'));
      if (response.statusCode == 200) {
        final List<OEmbed> providers = [
          for (dynamic x in json.decode(response.body))
            if (x != null) OEmbed.fromJson(x)
        ];
        if (providers.isNotEmpty) {
          OEmbed.providers.clear();
          OEmbed.providers.addAll(providers);
        }
      }
    }
    return OEmbed.providers;
  }
}

/// Represents the data returned by an oEmbed request.
class OEmbedData {
  /// The title of the resource.
  String? title;

  /// The name of the author of the resource.
  String? authorName;

  /// The URL of the author of the resource.
  String? authorUrl;

  /// The type of the resource.
  String? type;

  /// The height of the resource.
  int? height;

  /// The width of the resource.
  int? width;

  /// The version of the oEmbed protocol used.
  String? version;

  /// The name of the provider of the resource.
  String? providerName;

  /// The URL of the provider of the resource.
  String? providerUrl;

  /// The height of the thumbnail image.
  int? thumbnailHeight;

  /// The width of the thumbnail image.
  int? thumbnailWidth;

  /// The URL of the thumbnail image.
  String? thumbnailUrl;

  /// The HTML code to embed the resource.
  String? html;

  /// Constructs a new [OEmbedData] instance.
  OEmbedData({
    this.title,
    this.authorName,
    this.authorUrl,
    this.type,
    this.height,
    this.width,
    this.version,
    this.providerName,
    this.providerUrl,
    this.thumbnailHeight,
    this.thumbnailWidth,
    this.thumbnailUrl,
    this.html,
  });



  /// Constructs a new [OEmbedData] instance from a JSON map.
  OEmbedData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    authorName = json['author_name'];
    authorUrl = json['author_url'];
    type = json['type'];
    height = json['height'];
    width = json['width'];
    version = json['version'];
    providerName = json['provider_name'];
    providerUrl = json['provider_url'];
    thumbnailHeight = json['thumbnail_height'];
    thumbnailWidth = json['thumbnail_width'];
    thumbnailUrl = json['thumbnail_url'];
    html = json['html'];
  }

  /// Converts this [OEmbedData] instance to a JSON map.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['author_name'] = authorName;
    data['author_url'] = authorUrl;
    data['type'] = type;
    data['height'] = height;
    data['width'] = width;
    data['version'] = version;
    data['provider_name'] = providerName;
    data['provider_url'] = providerUrl;
    data['thumbnail_height'] = thumbnailHeight;
    data['thumbnail_width'] = thumbnailWidth;
    data['thumbnail_url'] = thumbnailUrl;
    data['html'] = html;
    return data;
  }

  /// Constructs a new [OEmbedData] instance from a URL.
  static Future<OEmbedData> fromUri(Uri url) async => await OEmbed.fromUri(url);
}

/// Represents an OEmbed endpoint.
class OEmbedEndpoint {
  /// The list of wildcard schemes accepted by this Endpoint.
  List<String> schemes;

  /// The URL for get oEmbed response.
  Uri url;

  /// Constructs an [OEmbedEndpoint] with the given [url] and [schemes].
  OEmbedEndpoint(
    this.url,
    this.schemes,
  );

  /// Constructs an [OEmbedEndpoint] from a JSON object.
  factory OEmbedEndpoint.fromJson(Map<String, dynamic> json) => OEmbedEndpoint(
        changeTo(json['url']),
        [
          for (var i in json['schemes'] ?? [])
            if (i != null && i is String) i
        ],
      );

  /// Retrieves OEmbed data for a given URL.
  ///
  /// Makes an HTTP GET request to the specified URL and returns the OEmbed data
  /// if the request is successful (status code 200). Otherwise, returns null.
  ///
  /// The [url] parameter specifies the URL for which to retrieve the OEmbed data.
  /// It should be a valid Uri object.
  ///
  /// Example usage:
  /// ```dart
  /// Uri url = Uri.parse('https://example.com');
  /// OEmbedData? data = await getOEmbedData(url);
  /// ```
  Future<OEmbedData?> getOEmbedData(Uri url) async {
    final res = await http.get(Uri.https(this.url.authority, this.url.path, {'url': url.toString(), ...this.url.queryParameters}));
    if (res.statusCode == 200) {
      var item = OEmbedData.fromJson(jsonDecode(res.body));
      return item;
    }
    return null;
  }

  /// Converts this [OEmbedEndpoint] to a JSON object.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['schemes'] = schemes;
    data['url'] = url.toString();
    return data;
  }
}
