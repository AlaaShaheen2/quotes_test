import 'package:flutter/material.dart';
import 'package:quotes_test/widget/card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Quotes(),
    );
  }
}

class Quotes extends StatefulWidget {
  const Quotes({super.key});

  @override
  State<Quotes> createState() => _QuotesState();
}

class BestQuotes {
  String title;
  String author;
  BestQuotes({required this.title, required this.author});
}

class _QuotesState extends State<Quotes> {
  List AllQuotes = [
    BestQuotes(
        author: "جورج برناردشو",
        title:
            " اهتم بأن تحصل على ما تحبه، و الا ستكون مجبراً على ان تقبل ما تحصل عليه 🔥"),
    BestQuotes(
        author: "ابراهيم الفقي",
        title:
            "الحكمة أن تعرف ما الذي تفعله ، و المهارة أن تعرف كيف تفعله ، و النجاح هو ان تفعله"),
    BestQuotes(
        author: "عمر بن الخطاب",
        title: "عاملوا الناس بما يُظهرون لكم، والله يتولّى مافي صدورهم. "),
    BestQuotes(
        author: "محمد الغزالي", title: "من أحب الله رأى كل شئ جميلا  ✋ "),
  ];
  delete(BestQuotes item) {
    setState(() {
      AllQuotes.remove(item);
    });
  }

  final myController = TextEditingController();
  final myController2 = TextEditingController();

  addNewQuote() {
    setState(() {
      AllQuotes.add(
          BestQuotes(title: myController.text, author: myController2.text));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: myController,
                      decoration: InputDecoration(
                        hintText: 'Add new',
                      ),
                      maxLength: 20,
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    TextField(
                      controller: myController2,
                      decoration: InputDecoration(
                        hintText: 'Add new',
                      ),
                      maxLength: 20,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          addNewQuote();
                        },
                        child: Text(
                          'Add',
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        )),
                  ],
                ),
              );
            },
            isScrollControlled: true,
          );
        },
        backgroundColor: Color.fromARGB(255, 166, 172, 246),
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 50, 57, 121),
        title: Text(
          'Best Quotes',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...AllQuotes.map((item) => CardWidget(
                  item: item,
                  delete: delete,
                )).toList()
          ],
        ),
      ),
    );
  }
}
