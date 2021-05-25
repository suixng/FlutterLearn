import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     //final wordPair = new WordPair.random();
//     return new MaterialApp(
//       // title: 'Welcome to Flutter',
//       // home: new Scaffold(
//       //   appBar: new AppBar(
//       //     title: new Text('Welcome to Flutter'),
//       //   ),
//       //   body: new Center(
//       //     //child: new Text('Hello World'),
//       //     //child: new Text(wordPair.asPascalCase),
//       //     child: new RandomWords(),
//       //   ),
//       // ),
//       title: 'Startup Name Generator',
//       theme: new ThemeData(
//         primaryColor: Colors.white,
//       ),
//       home: new RandomWords(),
//     );
//   }
// }

// class RandomWords extends StatefulWidget {
//   @override
//   createState() => new RandomWordsState();
// }

// class RandomWordsState extends State<RandomWords> {
//   final _suggestions = <WordPair>[];

//   final _saved = new Set<WordPair>();

//   final _biggerFont = const TextStyle(fontSize: 18.0);
//   @override
//   Widget build(BuildContext context) {
//     //final wordPair = new WordPair.random();
//     //return new Text(wordPair.asPascalCase);
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text('Startup Name Generator'),
//         actions: <Widget>[
//           new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
//         ],
//       ),
//       body: _buildSuggestions(),
//     );
//   }

//   Widget _buildSuggestions() {
//     return new ListView.builder(
//       padding: const EdgeInsets.all(16.0),
//       // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
//       // 在偶数行，该函数会为单词对添加一个ListTile row.
//       // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。
//       // 注意，在小屏幕上，分割线看起来可能比较吃力。
//       itemBuilder: (context, i) {
//         // 在每一列之前，添加一个1像素高的分隔线widget
//         if (i.isOdd) return new Divider();

//         // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
//         // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
//         final index = i ~/ 2;
//         // 如果是建议列表中最后一个单词对
//         if (index >= _suggestions.length) {
//           // ...接着再生成10个单词对，然后添加到建议列表
//           _suggestions.addAll(generateWordPairs().take(10));
//         }
//         return _buildRow(_suggestions[index]);
//       },
//     );
//   }

//   Widget _buildRow(WordPair pair) {
//     final alreadySaved = _saved.contains(pair);
//     return new ListTile(
//         title: new Text(
//           pair.asPascalCase,
//           style: _biggerFont,
//         ),
//         trailing: new Icon(
//           alreadySaved ? Icons.favorite : Icons.favorite_border,
//           color: alreadySaved ? Colors.red : null,
//         ),
//         onTap: () {
//           setState(() {
//             if (alreadySaved) {
//               _saved.remove(pair);
//             } else {
//               _saved.add(pair);
//             }
//           });
//         });
//   }

//   void _pushSaved() {
//     Navigator.of(context).push(
//       new MaterialPageRoute(
//         builder: (context) {
//           final tiles = _saved.map(
//             (pair) {
//               return new ListTile(
//                 title: new Text(
//                   pair.asPascalCase,
//                   style: _biggerFont,
//                 ),
//               );
//             },
//           );
//           final divided = ListTile.divideTiles(
//             context: context,
//             tiles: tiles,
//           ).toList();

//           return new Scaffold(
//             appBar: new AppBar(
//               title: new Text('Saved Suggestions'),
//             ),
//             body: new ListView(children: divided),
//           );
//         },
//       ),
//     );
//   }
// }

class MyAppBar extends StatelessWidget {
  MyAppBar({required this.title});

  //fields in a Widgt subclass are always marked "final"
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 56.0, //in logical pixels
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: new BoxDecoration(color: Colors.blue[500]),
      //Row is a horiontal,linear layout
      child: new Row(
        //<Widget> is the type of items in the list
        children: <Widget>[
          new IconButton(
            icon: new Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null, //null disables the button
          ),
          //Expanded expands its child
          //to fill the available space
          new Expanded(
            child: title,
          ),
          new IconButton(
            onPressed: null,
            icon: new Icon(Icons.search),
            tooltip: 'Search',
          ),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Material is a conceptual piece
    //of paper on which the UI appears
    return new Material(
      //Column is a vertical,linear layout
      child: new Column(
        children: <Widget>[
          new MyAppBar(
            title: new Text(
              'Example title',
              style: Theme.of(context).primaryTextTheme.headline6,
            ),
          ),
          new Expanded(
            child: new Center(
              child: new Text('Hello world!'),
            ),
          ),
        ],
      ),
    );
  }
}

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Scaffold is a layout for the major Material Compenents
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: Text('Example title'),
        actions: <Widget>[
          IconButton(
            onPressed: null,
            icon: Icon(Icons.search),
            tooltip: 'Search',
          ),
        ],
      ),
      //body is the majority of the screen
      body: Center(
        child: Text('Hello,world!'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Add', //used by assistive technologies
        child: Icon(Icons.add),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('MyButton was tapped!');
      },
      child: Container(
        height: 50.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: Center(
          child: Text('Engage'),
        ),
      ),
    );
  }
}

class CounterDisplay extends StatelessWidget {
  CounterDisplay({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Text('Count: $count');
  }
}

class CounterIncrementor extends StatelessWidget {
  CounterIncrementor({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text('Increment'),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: <Widget>[
  //       ElevatedButton(
  //         onPressed: _increment,
  //         child: Text('Increment'),
  //       ),
  //       SizedBox(width: 16),
  //       Text('Count: $_counter'),
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CounterIncrementor(onPressed: _increment),
        SizedBox(width: 16),
        CounterDisplay(count: _counter),
      ],
    );
  }
}

class Product {
  const Product({required this.name});
  final String name;
}

typedef void CartChangedCallback(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({
    required this.product,
    required this.inCart,
    required this.onCartChanged,
  }) : super(key: ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle? _getTextStyle(BuildContext context) {
    if (!inCart) return null;

    return TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onCartChanged(product, inCart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(product.name, style: _getTextStyle(context)),
    );
  }
}

class ShopppingList extends StatefulWidget {
  ShopppingList({Key? key, required this.products}) : super(key: key);

  final List<Product> products;

  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShopppingList> {
  Set<Product> _shoppingCart = Set<Product>();

  void _handldCartChanged(Product product, bool inCart) {
    setState(() {
      if (!inCart)
        _shoppingCart.add(product);
      else
        _shoppingCart.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product) {
          return ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handldCartChanged,
          );
        }).toList(),
      ),
    );
  }
}

//MaterialApp
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter layout demo',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Flutter layout demo'),
//         ),
//         body: Center(
//           child: Text('Hello world!'),
//         ),
//       ),
//     );
//   }
// }

//Not Material App
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Center(
        child: Text(
          'Hello World!',
          textDirection: TextDirection.ltr, 
          style: TextStyle(
            fontSize: 32,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}

void main() {
  //runApp(MyApp());

  // runApp(
  //   new Center(
  //     child: new Text(
  //       'Hello,world!',
  //       textDirection: TextDirection.ltr,
  //     ),
  //   ),
  // );

  // runApp(new MaterialApp(
  //   title: 'My app', //used by the OS task switcher
  //   home: SafeArea(
  //     child: MyScaffold(),
  //   ),
  // ));

  // runApp(MaterialApp(
  //   title: 'Flutter Tutorial',
  //   home: TutorialHome(),
  // ));

  // runApp(
  //   MaterialApp(
  //     home: Scaffold(
  //       body: Center(
  //         child: MyButton(),
  //       ),
  //     ),
  //   ),
  // );

  // runApp(
  //   MaterialApp(
  //     home: Scaffold(
  //       body: Center(
  //         child: Counter(),
  //       ),
  //     ),
  //   ),
  // );

  // runApp(
  //   MaterialApp(
  //     home: Scaffold(
  //       body: Center(
  //         child: ShoppingListItem(
  //             product: Product(name: 'Chips'),
  //             inCart: true,
  //             onCartChanged: (product, inCart) {}),
  //       ),
  //     ),
  //   ),
  // );

  // runApp(
  //   MaterialApp(
  //     title: 'Shopping App',
  //     home: ShopppingList(
  //       products: <Product>[
  //         Product(name: 'Eggs'),
  //         Product(name: 'Flour'),
  //         Product(name: 'Chocolate chips'),
  //       ],
  //     ),
  //   ),
  // );

  runApp(MyApp());
}
