import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  List<String> list = [
    'الفرش والادوات',
    'الخدود',
    "الاضاءه",
    'الحواجب',
    'العيون',
    "الشفاه",
  ];
  List<String> title = ['الحواجب', 'العيون', "الشفاه", 'الوجه'];
  List<String> imagePath = [
    'https://img.pikbest.com/png-images/qiantu/cartoon-hand-drawn-cosmetics-png-elements_2583773.png!c1024wm0/compress/true/progressive/true/format/webp/fw/1024',
    'https://www.pngitem.com/pimgs/m/220-2208746_maquillaje-makeup-makeup-png-transparent-png.png',
    "https://freepngimg.com/thumb/makeup/166135-product-cosmetics-png-file-hd.png",
    'https://img.pikbest.com/png-images/qiantu/vector-hand-drawn-cartoon-cosmetics_2497164.png!c1024wm0/compress/true/progressive/true/format/webp/fw/1024',
  ];

  // late int w;

  late double h = 0;
  late bool expanded;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Image.network(
                "https://image.freepik.com/free-vector/sale-banner-with-cosmetic-products-black-silk_107791-2095.jpg"),
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: ExpansionTile(
                  initiallyExpanded: true,
                  iconColor: Colors.white,
                  collapsedIconColor: Colors.white,
                  title: Text(
                    "جميع المنتجات",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return new ExpandableListView(title: list[index]);
                      },
                      itemCount: list.length,
                    ),
                  ],
                ),
              ),
            ),
            // Expanded(child: Container(child: Image.asset('assets/images/isla.jpg',width: 20,),))
          ],
        ),
      ),
    );
  }
}

class ExpandableListView extends StatefulWidget {
  ExpandableListView({
    Key? key,
    required this.title,
  }) : super(key: key);
  String title;

  @override
  _ExpandableListViewState createState() => new _ExpandableListViewState();
}

class _ExpandableListViewState extends State<ExpandableListView> {
  bool expandFlag = false;
  List<String> title = ['الحواجب', 'العيون', "الشفاه", 'الوجه'];
  List<String> imagePath = [
    'https://img.pikbest.com/png-images/qiantu/cartoon-hand-drawn-cosmetics-png-elements_2583773.png!c1024wm0/compress/true/progressive/true/format/webp/fw/1024',
    'https://www.pngitem.com/pimgs/m/220-2208746_maquillaje-makeup-makeup-png-transparent-png.png',
    "https://freepngimg.com/thumb/makeup/166135-product-cosmetics-png-file-hd.png",
    'https://img.pikbest.com/png-images/qiantu/vector-hand-drawn-cartoon-cosmetics_2497164.png!c1024wm0/compress/true/progressive/true/format/webp/fw/1024',
  ];

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.symmetric(vertical: 1.0),
      child: new Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(
                () {
                  expandFlag = !expandFlag;
                },
              );
            },
            child: new Container(
              color: Colors.white,
              padding: new EdgeInsets.symmetric(horizontal: 5.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      expandFlag == true
                          ? Text(
                              "عرض المزيد",
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold),
                            )
                          : SizedBox(),
                      IconButton(
                          onPressed: () {
                            setState(
                              () {
                                expandFlag = !expandFlag;
                              },
                            );
                          },
                          icon: Icon(expandFlag == false
                              ? Icons.arrow_drop_down_sharp
                              : Icons.arrow_drop_up))
                    ],
                  ),
                ],
              ),
            ),
          ),
          new ExpandableContainer(
              expanded: expandFlag,
              child: new GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return new SizedBox(
                    height: 90,
                    width: 90,
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: Colors.grey.shade300,
                            width: 2,
                          )),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: NetworkImage(imagePath[index]),
                              fit: BoxFit.cover,
                            )),
                          ),
                          Text(title[index])
                        ],
                      ),
                    ),
                  );
                },
                itemCount: title.length,
              ))
        ],
      ),
    );
  }
}

class ExpandableContainer extends StatelessWidget {
  final bool expanded;
  final double collapsedHeight;
  final double expandedHeight;
  final Widget child;

  ExpandableContainer({
    required this.child,
    this.collapsedHeight = 0.0,
    this.expandedHeight = 200.0,
    this.expanded = true,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return new AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInCirc,
      width: screenWidth,
      height: expanded ? expandedHeight : collapsedHeight,
      child: new Container(
        child: child,
        decoration: new BoxDecoration(
            // borderRadius: BorderRadius.circular(20),
            border: new Border.all(width: 1.0, color: Colors.grey.shade200)),
      ),
    );
  }
}
