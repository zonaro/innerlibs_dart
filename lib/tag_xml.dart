import 'package:innerlibs/innerlibs.dart';
import 'package:xml/xml.dart';

/// Represents an XML tag that can behave like a POCO class and implement validations and computations
class TagXml extends XmlElement implements Validator {
  /// Constructs a [TagXml] instance with the given [name].
  TagXml.fromTagName(String name) : super((XmlName(name)));

  /// Return a string with a arrow with length equal to [deepLevel]
  string get deepArrow => "${identArrow(length: deepLevel, pattern: "|=>")} ($tagName)".trim();

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

  /// Returns the path of the current node.
  string get path => pathJoin("/");

  /// Gets or sets the tag name.
  string get tagName => name.local;
  set tagName(string value) {
    if (value.isBlank || value == tagName) return;
    mutate(this, () => TagXml.fromTagName(value), true);
  }

  /// compute this tag
  void compute() {}

  /// Compute and validate this tag.
  /// If [throwException] is `true`, it throws an [InvalidException] if the tag is not valid.
  bool computeAndValidate([bool throwException = false]) {
    compute();
    if (throwException) {
      validateOrThrow((errors) => InvalidException("This $tagName is not valid:", errors));
    }
    return isValidInstance;
  }

  /// Returns a child node with the given [tagName].
  XmlElement? getFirstChild(String tagName) => findElements(tagName).firstOrNull;

  /// Returns a child node with the given [tag] as an instance of [T].
  ///
  /// If the child node does not exist, it returns `null`.
  T? getTagAs<T extends TagXml>(String tag, T Function() constructor) => mutate(findElements(tag).singleOrNull, constructor);

  /// Returns an iterable of child nodes with the given [tagName] as instances of [T].
  Iterable<T> getTagsFrom<T extends TagXml>(String tagName, T Function() constructor) => findElements(tagName).map((n) => mutate(n, constructor)!);

  /// Returns the text value from a specific child node with the given [tag].
  ///
  /// If the child node does not exist or if there are multiple child nodes with the same [tag],
  /// it returns `null`.
  T? getValueFromNode<T, U>(String tag, [T Function(U i)? parser]) {
    var x = findElements(tag).singleOrNull?.innerText;
    if (x == null) return null;
    if (parser == null) return changeTo(x);
    try {
      return parser(changeTo(x));
    } catch (e) {
      return null;
    }
  }

  /// check if children with [tagName] exists
  bool hasChildren(String tagName) => findElements(tagName).isNotEmpty;

  /// Checks if this node is a descendant of the given [tag].
  bool isIn<T extends TagXml>(T tag) => tag.descendantElements.contains(this);

  ///  Checks if this node is a descendant of the document thats [tag] is.
  bool isInDocument<T extends TagXml>(T tag) => tag.root.descendantElements.contains(this);

  /// Returns the path of the current node.
  /// The [joiner] is used to join the path segments.
  string pathJoin([string joiner = "."]) {
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

  /// Remove all child nodes with the given [tagName].
  void removeChildren(string tagName) {
    while (hasChildren(tagName)) {
      getFirstChild(tagName)!.remove();
    }
  }

  void renameChildren(string oldTagName, string newTagName) {
    while (hasChildren(oldTagName)) {
      var e = getFirstChild(oldTagName);
      mutate(e, () => TagXml.fromTagName(newTagName), true);
    }
  }

  /// Sets a child node with the given [childName] to the provided [value].
  ///
  /// If the [value] is not `null`, it  adds the [value]'s as child.
  /// If the [value] is `null`, it removes the child node if it exists.
  void setTagFrom<T extends TagXml>(String childName, T? value) {
    var n = findElements(childName).singleOrNull;
    if (n != null) {
      n.remove();
    }
    if (value != null) {
      children.add(value);
      value.tagName = childName;
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

  /// Return the XML string representation of the node.
  @override
  String toString() {
    compute();
    return toXmlString(pretty: true);
  }

  @override
  Iterable<String> validate() {
    return [];
  }

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
  static T? mutate<T extends TagXml>(XmlElement? element, T Function() constructor, [bool force = false]) {
    if (element == null) {
      if (force) return constructor();
      return null;
    }
    if (element is T && force == false) return element;
    var newTag = constructor();
    while (element.children.isNotEmpty) {
      var c = newTag.children.first;
      c.remove();
      newTag.children.add(c);
    }
    while (element.attributes.isNotEmpty) {
      var a = element.attributes.first;
      element.removeAttribute(a.name.qualified);
      newTag.setAttribute(a.name.qualified, a.value);
    }

    if (element.hasParent) {
      var index = element.parent!.children.indexOf(element);
      element.parent!.children.insert(index, newTag);
      element.remove();
    }
    return newTag;
  }
}
