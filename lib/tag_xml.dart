import 'package:innerlibs/innerlibs.dart';
import 'package:xml/xml.dart';

 


/// Represents an XML tag that can behave like a POCO class and implement validations
class TagXml extends XmlElement implements Validator {
  /// Returns the tag name.
  string get tagName => name.local;

  void compute() {}

  bool computeAndValidate([bool throwException = false]) {
    compute();
    if (throwException) {
      validateOrThrow((errors) => InvalidException("This $tagName is not valid:", errors));
    }
    return isValidInstance;
  }

  /// Constructs a [TagXml] instance with the given [name].
  TagXml.fromTagName(String name) : super((XmlName(name)));

  /// Return the XML string representation of the node.
  @override
  String toString() => toXmlString(pretty: true);

  /// Checks if this node is a descendant of the given [tag].
  bool isIn<T extends TagXml>(T tag) => tag.descendantElements.contains(this);

  ///  Checks if this node is a descendant of the document thats this node is.
  bool isInDocument<T extends TagXml>(T tag) => tag.root.descendantElements.contains(this);

  /// Returns the text value from a specific child node with the given [tag].
  ///
  /// If the child node does not exist or if there are multiple child nodes with the same [tag],
  /// it returns `null`.

  /// Returns the Enum value from a specific child node with the given [tag].
  T? getValueFromNode<T, U>(String tag, [T Function(U i)? constructor]) {
    var x = findElements(tag).singleOrNull?.innerText;
    if (x == null) return null;
    if (constructor == null) return changeTo(x);
    try {
      return constructor(changeTo(x));
    } catch (e) {
      return null;
    }
  }

  /// Sets the text value for a specific child node with the given [tag].
  ///
  /// If the child node does not exist, it creates a new one with the provided [value].
  /// If the [value] is `null`, the child node will be removed if it exists.
  ///
  void setTextValueForNode<T>(String tag, string? value) {
    var element = findElements(tag).singleOrNull;
    if (value == null) {
      if (element != null) {
        element.remove();
        element = null;
        return;
      }
    } else {
      if (element == null) {
        // If the element does not exist, create a new one with the provided value
        final newNode = XmlElement(XmlName(tag));
        newNode.innerText = value;
        children.add(newNode);
      } else {
        element.innerText = value;
      }
    }
  }

  /// Returns a child node with the given [tag] as an instance of [T].
  ///
  /// If the child node does not exist, it returns `null`.
  T? getTagAs<T extends TagXml>(String tag, T Function() constructor) {
    var n = findElements(tag).singleOrNull;
    if (n == null) return null;
    return mutate(n, constructor);
  }

  /// Sets a child node with the given [tag] to the provided [value].
  ///
  /// If the [value] is not `null`, it  adds the [value]'s as child.
  /// If the [value] is `null`, it removes the child node if it exists.
  void setTagFrom<T extends TagXml>(String tag, T? value) {
    var n = findElements(tag).singleOrNull;
    if (value != null) {
      if (n == null) {
        children.add(value);
      } else {
        n.children.clear();
        n.children.add(value);
      }
    } else {
      if (n != null) {
        n.remove();
      }
    }
  }

  /// Returns an iterable of child nodes with the given [tagName] as instances of [T].
  Iterable<T> getTagsFrom<T extends TagXml>(String tagName, T Function() constructor) => findElements(tagName).map((n) => mutate(n, constructor)!);

  /// Create a instance of [T] from a XML string and using the provided [constructor].
  /// The [constructor] is a function that creates a new instance of [T] and returns it.
  /// Provide the [tagName] if [T] name is different fom tagName.
  static T? fromXmlString<T extends TagXml>(string xml, T Function() constructor) => fromXmlStringList(xml, constructor).firstOrNull;

  /// Create a list of instances of [T] from a XML string and using the provided [constructor].
  /// The [constructor] is a function that creates a new instance of [T] and returns it.
  /// Provide the [tagName] if [T] name is different fom tagName.
  static List<T> fromXmlStringList<T extends TagXml>(string xml, T Function() constructor) {
    if (xml.isBlank) return [];
    try {
      return XmlDocument.parse(xml).findAllElements(constructor().tagName).map((tag) => TagXml.mutate(tag, constructor)!).toList();
    } catch (e) {
      consoleLog("$e", error: e);
      return [];
    }
  }

  /// Mutate a [XmlElement] into a [TagXml] of type [T].
  /// - If the [XmlElement] is `null`, it returns `null`.
  /// - If the [XmlElement] is already an instance of [T], it returns the [XmlElement] as [T].
  /// - If the [XmlElement] is not an instance of [T], it creates a new instance of [T] and copies the attributes and children of the [XmlElement] to the new instance, insert the new instance in the parent of the [XmlElement] and remove the [XmlElement].
  static T? mutate<T extends TagXml>(XmlElement? n, T Function() constructor) {
    if (n == null) return null;
    if (n is T) return n;
    var m = constructor();
    while (n.children.isNotEmpty) {
      var c = m.children.first;
      c.remove();
      m.children.add(c);
    }
    while (n.attributes.isNotEmpty) {
      var a = n.attributes.first;
      n.removeAttribute(a.name.qualified);
      m.setAttribute(a.name.qualified, a.value);
    }

    if (n.hasParent) {
      var index = n.parent!.children.indexOf(n);
      n.parent!.children.insert(index, m);
      n.remove();
    }
    return m;
  }

  /// Remove all child nodes with the given [tagName].
  void removeChildren(string tagName) {
    while (findElements(tagName).isNotEmpty) {
      findElements(tagName).first.remove();
    }
  }

  void renameChildren(string oldTagName, string newTagName) {
    while (findElements(oldTagName).isNotEmpty) {
      var e = findElements(oldTagName).first;
      mutate(e, () => TagXml.fromTagName(newTagName));
    }
  }

  @override
  Iterable<String> validate() {
    return [];
  }

  /// Returns the deep level of the current node.
  int get deepLevel {
    int level = 0;
    var p = parent;
    while (p != null) {
      level++;
      p = p.parent;
    }
    return level;
  }

  string get deepArrow => "($tagName) ${identArrow(length: deepLevel, pattern: "|=>")}";

  /// Returns the path of the current node.
  /// The [joiner] is used to join the path segments.
  string path([string joiner = "."]) {
    string path = tagName;
    var p = parent;
    while (p != null) {
      if (p is XmlElement) {
        path = "${name.qualified}$joiner$path";
        p = p.parent;
      }
    }
    return path;
  }
}
