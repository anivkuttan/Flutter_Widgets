import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> nameList = [
    'Heklo',
    'hsdgk',
    'KADJHKF',
    'AHSDOF',
    'HASGDKA',
    'HAGSCI',
    'HGXCIA',
    'Heklo',
    'hsdgk',
    'KADJHKF',
    'AHSDOF',
    'HASGDKA',
    'HAGSCI',
    'HGXCIA',
    'Heklo',
    'hsdgk',
    'KADJHKF',
    'AHSDOF',
    'HASGDKA',
    'HAGSCI',
    'HGXCIA',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _bildSliverAppBar(appBarTitle: 'Blance'),
          SliverToBoxAdapter(
            child: Container(
              height: 30,
              color: Colors.purple,
              child: Text('Box Adapter'),
            ),
          ),
          buildSiliverList(),
          buildSliverPersistentHeader(),
          buildSliverFixedExtentList(),
        ],
      ),
    );
  }

  Widget _bildSliverAppBar({required String appBarTitle}) {
    return SliverAppBar(
      toolbarHeight: 100,

      //backgroundColor: Colors.deepOrange,
      // pinned: true,
      floating: true,
      elevation: 0.0,
      leading: IconButton(
        icon: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondPage()),
          );
        },
      ),
      expandedHeight: 250,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(appBarTitle),
        centerTitle: true,
        background: Image.asset("beer.jpg", fit: BoxFit.cover),
      ),
    );
  }

  Widget buildSliverFixedExtentList() {
    return SliverFixedExtentList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => ListTile(
            tileColor: Colors.green,
            title: Text('Hekko'),
          ),
          childCount: 70,
        ),
        itemExtent: 60);
  }

  Widget buildSiliverList() {
    return SliverList(
      delegate: SliverChildListDelegate(nameList
          .map(
            (e) => ListTile(
              title: Text(e),
            ),
          )
          .toList()),
    );
  }

  Widget buildSliverPersistentHeader() {
    return SliverPersistentHeader(
        pinned: true, delegate: Hedder(maxHeight: 230, minHeight: 60));
  }
}

class Hedder extends SliverPersistentHeaderDelegate {
  double maxHeight;
  double minHeight;
  Hedder({required this.maxHeight, required this.minHeight}) : super();
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    //  debugPrint(shrinkOffset.toString());
    return Stack(
      fit: StackFit.expand,
      children: [
        SizedBox.expand(
          child: Image.asset(
            'tree.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.8),
              ],
              // stops: [0.5, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Sliver Pressistand Hedder',
            style: TextStyle(fontSize: 33, color: Colors.white),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  Widget buildSliverPersistentHeader() {
    return SliverPersistentHeader(
        pinned: true, delegate: Hedder(maxHeight: 230, minHeight: 60));
  }

  Widget buildSliverFixedExtentList() {
    return SliverFixedExtentList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => ListTile(
            tileColor: Colors.green,
            title: Text('Hekko'),
          ),
          childCount: 70,
        ),
        itemExtent: 60);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomScrollView(
          slivers: [
            buildSliverPersistentHeader(),
            buildSliverFixedExtentList(),
          ],
        ),
      ),
    );
  }
}
