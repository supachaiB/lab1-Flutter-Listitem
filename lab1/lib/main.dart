import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: MyAppPage(),
    );
  }
}

class MyAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> names = [
      "1. นายเจษฎา ลีรัตน์ 643450067-0",
      "2. นายธนาธิป เตชะ 643450076-9",
      "3. นายพีระเดช โพธิ์หล้า 643450082-4",
      "4. นายวิญญู พรมภิภักดิ์ 643450084-0",
      "5. นายเทวารัณย์ ชัยกิจ 643450324-6",
      "6. นายณัฐกานต์ อินทรพานิชย์ 643450072-7",
      "7. นายศุภชัย แสนประสิทธิ์ 643450332-7",
      "8. ธนรัตน์ บ้านสระ 643450658-7"
    ];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("รายชื่อนักศึกษา CIS ปี 4"),
        ),
        body: ListView.builder(
            itemCount: names.length,
            itemBuilder: (context, index) {
              return displayNameItem(name: names[index], index: index);
            }));
  }

  Widget displayNameItem({required String name, required int index}) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Row(children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              'images/${index + 1}.jpg',
              width: 100,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return const Icon(Icons.error);
              },
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: name.contains("นายศุภชัย แสนประสิทธิ์")
                ? rainbowText(name)
                : Text(
                    name,
                    style: const TextStyle(fontSize: 20),
                  ),
          ),
        ]));
  }

  Widget rainbowText(String text) {
    List<Color> rainbowColors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.indigo,
      Colors.purple,
    ];

    List<TextSpan> spans = [];
    for (int i = 0; i < text.length; i++) {
      spans.add(TextSpan(
          text: text[i],
          style: TextStyle(
            color: rainbowColors[i % rainbowColors.length],
            decoration: text.contains("นายศุภชัย แสนประสิทธิ์")
                ? TextDecoration.underline
                : TextDecoration.none,
          )));
    }

    return RichText(
      text: TextSpan(children: spans, style: const TextStyle(fontSize: 20)),
    );
  }
}
