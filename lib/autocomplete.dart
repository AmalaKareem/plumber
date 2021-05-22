import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:plumber_app/ship.dart';
import 'package:plumber_app/store.dart';

class Data extends StatefulWidget {
  final String compnyName;

  const Data({
    Key key,
    this.compnyName,
  }) : super(key: key);
  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  // TextEditingController tools = TextEditingController();
  List<CartItem> equipment = [
    CartItem(id: "1", name: "ALLEN KEY", quantity: 1, price: 20),
    CartItem(id: "2", name: "ALLIGATOR", quantity: 1, price: 25),
    CartItem(id: "3", name: "AUGER", quantity: 1, price: 30),
    CartItem(id: "4", name: "AXE", quantity: 1, price: 40),
    CartItem(id: "5", name: "HAMEER DRILL", quantity: 1, price: 35),
    CartItem(id: "6", name: "Spaneer", quantity: 1, price: 50),
    CartItem(id: "7", name: "PIPE", quantity: 1, price: 90),
    CartItem(id: "8", name: "SCREWDRIVER", quantity: 1, price: 10),
    CartItem(id: "9", name: "PIPE WRENCH", quantity: 1, price: 80)
  ];
  int quantity = 1;
  double price = 1;
  int count = 0;

  // void incrementCounter(int i) {
  //   setState(() {
  //     quantity.add(i);
  //     print(quantity[i]);
  //     price *= quantity[i];
  //   });
  // }

  // void decrement() {
  //   setState(() {
  //     quantity--;
  //     price *= quantity[i];
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.tealAccent.shade700,
          title: Text(
            widget.compnyName,
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(children: [
              Container(
                height: 50,
                width: 300,
                margin: EdgeInsets.all(40),
                child: TextField(
                  onTap: () {},
                  // controller: tools,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Search',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {},
                    ),
                    suffix:
                        IconButton(icon: Icon(Icons.clear), onPressed: () {}),
                  ),
                ),
              ),
              SizedBox(
                  height: 500,
                  child:
                      // ListView.builder(
                      //   scrollDirection: Axis.vertical,
                      //   shrinkWrap: true,
                      //   itemCount: 9,
                      //   itemBuilder: (context, index) {
                      //     print('==========================================');
                      //     print(equipment.length);
                      //     return
                      SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                        children: equipment.map((tx) {
                      if (equipment.isNotEmpty)
                        return Container(
                          margin: EdgeInsets.all(15),
                          alignment: Alignment.center,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(13.0),
                              ),
                            ),
                            color: Colors.teal,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(tx.id),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Image.asset(
                                  "assets/allen.png",
                                  height: 60,
                                ),
                                // Image.network(
                                //     "https://favpng.com/png_view/socket-wrench-transparent-image-hand-tool-socket-wrench-hex-key-png/EsvTfcjw"),
                                SizedBox(
                                  width: 82,
                                  child: Text(
                                    tx.name,
                                    style: TextStyle(color: Color(0xFFffffeb)),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Flexible(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                        alignment: Alignment.centerRight,
                                        margin:
                                            EdgeInsets.only(top: 5, right: 10),
                                        child: Text(
                                          "Product Price:₹${tx.price.toString()}",
                                          style: TextStyle(color: Colors.white),
                                        )),
                                    Container(
                                        alignment: Alignment.bottomRight,
                                        child: Counter(quantity: quantity)),
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      alignment: Alignment.bottomRight,
                                      child: RaisedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Store()));
                                        },
                                        color: Colors.black54,
                                        child: Text(
                                          "ADD",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    )
                                  ],
                                ))
                              ],
                            ),
                          ),
                        );
                    }).toList()),
                  ))
            ])));

    // ;
    //             },
    //           ),
    // ),
    //             ],)))
    //     ),
    //   ),
    // );
  }
}

class Counter extends StatefulWidget {
  const Counter({
    Key key,
    @required this.quantity,
  }) : super(key: key);

  final int quantity;

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  int items = 0;

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
            child: Text("  Quantity:",
                style: TextStyle(color: Colors.white, fontSize: 12))),

        // child: FlatButton(
        //   onPressed: () {
        //     incrementCounter();
        //   },
        //   child: Text(
        //     '+',
        //     style: TextStyle(
        //         color: Colors.white,
        //         fontSize: 30.0),
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.only(left: 0),
          child: IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                setState(() {
                  items == 0 ? items : items--;
                });
              }),
        ),
        Text(
          '$items',
        ),
        Padding(
          padding: const EdgeInsets.only(right: 0),
          child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  items++;
                });
              }),
        ),
      ],
    );
  }
}
