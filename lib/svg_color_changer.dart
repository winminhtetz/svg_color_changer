String changeColor({
  required String name,
  required String color,
  required String svg,
}) {
  final RegExp pathRegex = RegExp(
    r'(id="[^"]*" name="' + name + r'")( fill="[^"]*")?',
    caseSensitive: false,
  );

  String update = svg.replaceAllMapped(
    pathRegex,
    (match) {
      final idAndName = match.group(1)!;
      String? isColorExist = match.group(2);

      if (isColorExist != null) {
        return '$idAndName fill="$color"';
      } else {
        // If fill attribute does not exist, add the new fill attribute
        return '$idAndName fill="$color"';
      }
    },
  );

  return update;
}
