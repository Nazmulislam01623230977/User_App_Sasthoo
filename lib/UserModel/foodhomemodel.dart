class FoodHomelist {
  String arrowicon;
  String itemname;
  String detills;
  String imageurl;

  FoodHomelist({this.arrowicon, this.itemname, this.detills, this.imageurl});
}

List<FoodHomelist> foodhomelist = [
  FoodHomelist(
    arrowicon: 'assets/images/arrow.png',
    itemname: 'New Pizzas',
    detills: 'loresm ispum set amount ',
    imageurl: 'assets/images/newpizza.png',
  ),
  FoodHomelist(
    arrowicon: 'assets/images/arrow.png',
    itemname: 'Frankie',
    detills: 'loresm ispum set amount ',
    imageurl: 'assets/images/newpizza.png',
  ),
  FoodHomelist(
    arrowicon: 'assets/images/arrow.png',
    itemname: 'ICE CREAM',
    detills: 'loresm ispum set amount ',
    imageurl: 'assets/images/newpizza.png',
  ),
  FoodHomelist(
    arrowicon: 'assets/images/arrow.png',
    itemname: 'Mojito',
    detills: 'loresm ispum set amount ',
    imageurl: 'assets/images/newpizza.png',
  ),
];
