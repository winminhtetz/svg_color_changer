import 'dart:io';

import 'package:svg_color_changer/svg_color_changer.dart';

Future<String> loadAsset(String path) async {
  final file = File(path);
  return await file.readAsString();
}

Future<void> writeSVG(String path, String contents) async {
  final file = File(path);
  await file.writeAsString(contents);
}

void main(List<String> arguments) async {
  final svg = await loadAsset('bin/mm.svg');
  final updateSvg = changeColor(name: "Mandalay", color: '#c2c2c2', svg: svg);
  await writeSVG('bin/mm.svg', updateSvg);
}
