import 'dart:convert';
import 'dart:io';

void main() {
  final dir = Directory('lib/ui');

  final dirList = dir.listSync(recursive: true);

  List<String> paths = [];
  for (var i in dirList) {
    final path = i.path;
    if (path.contains('.dart')) {
      paths.add(path);
    }
  }

  String listing = '';

  for (int i = 0; i < paths.length; i++) {
    final file = File(paths[i]);

    listing += '${i + 1} ${file.path}\n\n';

    final text = file.readAsStringSync();

    final lines = const LineSplitter().convert(text);

    for (var line in lines) {
      listing += line.trim();
      listing += '\n';
    }

    listing += '\n\n';
  }

  File('listing.txt').writeAsStringSync(listing);
}
