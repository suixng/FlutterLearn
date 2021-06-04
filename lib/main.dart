import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/rendering.dart';

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
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(color: Colors.white),
//       child: Center(
//         child: Text(
//           'Hello World!',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }

//Widget of the Row and the Column
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter layout demo',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Flutter layout demo'),
//         ),
//         //Change to buildColumn() for the other column example
//         //body: Center(child: buildRow()),
//         //body: Center(child: buildColumn(),),
//         //body: Center(child: buildOverflowingRow()),
//         //body: Center(child: buildExpandedImages()),
//         body: Center(child: buildExpandedImagesWithFlex()),
//       ),
//     );
//   }

//   Widget buildRow() =>
//       //  #docregion Row
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Image.asset('images/pic1.jpg'),
//           Image.asset('images/pic2.jpg'),
//           Image.asset('images/pic3.jpg'),
//         ],
//       );
//   //  #enddocregion Row

//   Widget buildColumn() =>
//       //  #docregion Column
//       Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Image.asset('images/pic1.jpg'),
//           Image.asset('images/pic2.jpg'),
//           Image.asset('images/pic3.jpg'),
//         ],
//       );
//   //  #enddocregion Column

//   Widget buildOverflowingRow() =>
//       // #docregion overflowing-row
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Image.asset('images/pic1-1.jpg'),
//           Image.asset('images/pic2-1.jpg'),
//           Image.asset('images/pic3-1.jpg'),
//         ],
//       );
//   // #enddocregion overflowing-row

//   Widget buildExpandedImages() =>
//       // #docregion expanded-images
//       Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Expanded(
//             child: Image.asset('images/pic1-1.jpg'),
//           ),
//           Expanded(
//             child: Image.asset('images/pic2-1.jpg'),
//           ),
//           Expanded(
//             child: Image.asset('images/pic3-1.jpg'),
//           ),
//         ],
//       );
//   // #enddocregion expanded-images

//   Widget buildExpandedImagesWithFlex() =>
//       // #docregion expanded-images-with-flex
//       Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Expanded(
//             child: Image.asset('images/pic1-1.jpg'),
//           ),
//           Expanded(
//             flex: 2,
//             child: Image.asset('images/pic2-1.jpg'),
//           ),
//           Expanded(
//             child: Image.asset('images/pic3-1.jpg'),
//           ),
//         ],
//       );
//   // #enddocregion expanded-images-with-flex
// }

//Strwaberry Pavlova Recipe
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter layout demo',
//       home: buildHomePage('Strawberry Pavlova Recipe'),
//     );
//   }

//   Widget buildHomePage(String title) {
//     final titleText = Container(
//       padding: EdgeInsets.all(20),
//       child: Text(
//         'Strawberry Pavlova',
//         style: TextStyle(
//           fontWeight: FontWeight.w800,
//           letterSpacing: 0.5,
//           fontSize: 30,
//         ),
//       ),
//     );

//     final subTitle = Text(
//       'Pavlova is a meringue-based dessert named after the Russian ballerina '
//       'Anna Pavlova. Pavlova features a crisp crust and soft, light inside, '
//       'topped with fruit and whipped cream.',
//       textAlign: TextAlign.center,
//       style: TextStyle(
//         fontFamily: 'Georgia',
//         fontSize: 25,
//       ),
//     );

//     // #docregion ratings, stars
//     var stars = Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Icon(Icons.star, color: Colors.green[500]),
//         Icon(Icons.star, color: Colors.green[500]),
//         Icon(Icons.star, color: Colors.green[500]),
//         Icon(Icons.star, color: Colors.black),
//         Icon(Icons.star, color: Colors.black),
//       ],
//     );
//     // #enddocregion stars

//     final ratings = Container(
//       padding: EdgeInsets.all(20),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           stars,
//           Text(
//             '170 Reviews',
//             style: TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.w800,
//               fontFamily: 'Roboto',
//               letterSpacing: 0.5,
//               fontSize: 20,
//             ),
//           ),
//         ],
//       ),
//     );
//     // #enddocregion ratings

//     // #docregion iconList
//     final descTextStyle = TextStyle(
//       color: Colors.black,
//       fontWeight: FontWeight.w800,
//       fontFamily: 'Roboto',
//       letterSpacing: 0.5,
//       fontSize: 18,
//       height: 2,
//     );

//     // DefaultTextStyle.merge() allows you to create a default text
//     // style that is inherited by its child and all subsequent children.
//     final iconList = DefaultTextStyle.merge(
//       style: descTextStyle,
//       child: Container(
//         padding: EdgeInsets.all(20),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Column(
//               children: [
//                 Icon(Icons.kitchen, color: Colors.green[500]),
//                 Text('PREP:'),
//                 Text('25 min'),
//               ],
//             ),
//             Column(
//               children: [
//                 Icon(Icons.timer, color: Colors.green[500]),
//                 Text('COOK:'),
//                 Text('1 hr'),
//               ],
//             ),
//             Column(
//               children: [
//                 Icon(Icons.restaurant, color: Colors.green[500]),
//                 Text('FEEDS:'),
//                 Text('4-6'),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//     // #enddocregion iconList

//     // #docregion leftColumn
//     final leftColumn = Container(
//       padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
//       child: Column(
//         children: [
//           titleText,
//           subTitle,
//           ratings,
//           iconList,
//         ],
//       ),
//     );
//     // #enddocregion leftColumn

//     final mainImage = Image.asset(
//       'images/pavlova.jpg',
//       fit: BoxFit.cover,
//     );

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       // #docregion body
//       body: Center(
//         child: Container(
//           margin: EdgeInsets.fromLTRB(0, 40, 0, 30),
//           height: 600,
//           child: Card(
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   width: 440,
//                   child: leftColumn,
//                 ),
//                 mainImage,
//               ],
//             ),
//           ),
//         ),
//       ),
//       // #enddocregion body
//     );
//   }
// }

//Container
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter layout demo',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Flutter layout demo'),
//         ),
//         body: Center(child: _buildImageColumn()),
//       ),
//     );
//   }

//   // #docregion column
//   Widget _buildImageColumn() => Container(
//         decoration: BoxDecoration(
//           color: Colors.black26,
//         ),
//         child: Column(
//           children: [
//             _buildImageRow(4),
//             _buildImageRow(6),
//           ],
//         ),
//       );
//   // #enddocregion column

//   // #docregion row
//   Widget _buildDecoratedImage(int imageIndex) => Expanded(
//         child: Container(
//           decoration: BoxDecoration(
//             border: Border.all(width: 10, color: Colors.black38),
//             borderRadius: const BorderRadius.all(const Radius.circular(8)),
//           ),
//           margin: const EdgeInsets.all(4),
//           child: Image.asset('images/pic$imageIndex.jpg'),
//         ),
//       );

//   Widget _buildImageRow(int imageIndex) => Row(
//         children: [
//           _buildDecoratedImage(imageIndex),
//           _buildDecoratedImage(imageIndex + 1),
//         ],
//       );
//   // #enddocregion row
// }

//GridView And ListView
// class MyApp extends StatelessWidget {
//   static final showGrid = true; // Set to false to show ListView

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter layout demo',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Flutter layout demo'),
//         ),
//         body: Center(child: showGrid ? _buildGrid() : _buildList()),
//       ),
//     );
//   }

//   // #docregion grid
//   Widget _buildGrid() => GridView.extent(
//       maxCrossAxisExtent: 150,
//       padding: const EdgeInsets.all(4),
//       mainAxisSpacing: 4,
//       crossAxisSpacing: 4,
//       children: _buildGridTileList(30));

//   // The images are saved with names pic0.jpg, pic1.jpg...pic29.jpg.
//   // The List.generate() constructor allows an easy way to create
//   // a list when objects have a predictable naming pattern.
//   List<Container> _buildGridTileList(int count) => List.generate(
//       count, (i) => Container(child: Image.asset('images/pic$i.jpg')));
//   // #enddocregion grid

//   // #docregion list
//   Widget _buildList() => ListView(
//         children: [
//           _tile('CineArts at the Empire', '85 W Portal Ave', Icons.theaters),
//           _tile('The Castro Theater', '429 Castro St', Icons.theaters),
//           _tile('Alamo Drafthouse Cinema', '2550 Mission St', Icons.theaters),
//           _tile('Roxie Theater', '3117 16th St', Icons.theaters),
//           _tile('United Artists Stonestown Twin', '501 Buckingham Way',
//               Icons.theaters),
//           _tile('AMC Metreon 16', '135 4th St #3000', Icons.theaters),
//           Divider(),
//           _tile('K\'s Kitchen', '757 Monterey Blvd', Icons.restaurant),
//           _tile('Emmy\'s Restaurant', '1923 Ocean Ave', Icons.restaurant),
//           _tile(
//               'Chaiya Thai Restaurant', '272 Claremont Blvd', Icons.restaurant),
//           _tile('La Ciccia', '291 30th St', Icons.restaurant),
//         ],
//       );

//   ListTile _tile(String title, String subtitle, IconData icon) => ListTile(
//         title: Text(title,
//             style: TextStyle(
//               fontWeight: FontWeight.w500,
//               fontSize: 20,
//             )),
//         subtitle: Text(subtitle),
//         leading: Icon(
//           icon,
//           color: Colors.blue[500],
//         ),
//       );
//   // #enddocregion list
// }

//Stack And Card
// class MyApp extends StatelessWidget {
//   static final showCard = true; // Set to false to show Stack

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter layout demo',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Flutter layout demo'),
//         ),
//         body: Center(child: showCard ? _buildCard() : _buildStack()),
//       ),
//     );
//   }

//   // #docregion Card
//   Widget _buildCard() => SizedBox(
//         height: 210,
//         child: Card(
//           child: Column(
//             children: [
//               ListTile(
//                 title: Text('1625 Main Street',
//                     style: TextStyle(fontWeight: FontWeight.w500)),
//                 subtitle: Text('My City, CA 99984'),
//                 leading: Icon(
//                   Icons.restaurant_menu,
//                   color: Colors.blue[500],
//                 ),
//               ),
//               Divider(),
//               ListTile(
//                 title: Text('(408) 555-1212',
//                     style: TextStyle(fontWeight: FontWeight.w500)),
//                 leading: Icon(
//                   Icons.contact_phone,
//                   color: Colors.blue[500],
//                 ),
//               ),
//               ListTile(
//                 title: Text('costa@example.com'),
//                 leading: Icon(
//                   Icons.contact_mail,
//                   color: Colors.blue[500],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//   // #enddocregion Card

//   // #docregion Stack
//   Widget _buildStack() => Stack(
//         alignment: const Alignment(0.6, 0.6),
//         children: [
//           CircleAvatar(
//             backgroundImage: AssetImage('images/pic0.jpg'),
//             radius: 100,
//           ),
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.black45,
//             ),
//             child: Text(
//               'Mia B',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ],
//       );
//   // #enddocregion Stack
// }

//A Example Widget App
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // #docregion titleSection
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            //1
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //2
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Oeschimen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Swizerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          //3
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text('41')
        ],
      ),
    );
    // #enddocregion titleSection

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'Call'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );

    // #docregion textSection
    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );
    // #enddocregion textSection

    return MaterialApp(
      title: "Flutter layout demo",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter layout demo'),
        ),
        // body: Center(
        //   child: Text('Hello World'),
        // ),
        body: ListView(
          children: [
            Image.asset(
              'images/lake.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: color,
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
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

  //debugPaintSizeEnabled = true; //Remove to supress visual layout
  debugPaintSizeEnabled = false; // Set to true for visual layout
  runApp(MyApp());
}
