import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({this.onClicked, this.cardColor, this.cardChild});

  final Color? cardColor;
  final Widget? cardChild;
  final void Function()? onClicked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClicked,
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardChild,
      ),
    );
  }
}

class Customer {
  String name;
  int? age;
  String location;
  Customer(this.name, {this.age, this.location = "US"});
  @override
  String toString() {
    return "Customer [name=${this.name},age=${this.age},location=${this.location}]";
  }
}

var customer = Customer("bezkoder", age: 26, location: "US");
