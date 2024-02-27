import 'package:flutter/material.dart';
import 'package:flutter_block/features/cart/bloc/cart_bloc.dart';
import 'package:flutter_block/features/home/bloc/home_bloc.dart';
import 'package:flutter_block/features/home/models/home_product_data_model.dart';

class ProductTileWidget extends StatefulWidget {
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;

  ProductTileWidget({
    Key? key,
    required this.productDataModel,
    required this.homeBloc,
  }) : super(key: key);

  @override
  _ProductTileWidgetState createState() => _ProductTileWidgetState();
}

class _ProductTileWidgetState extends State<ProductTileWidget> {
  bool isWishlistRed = false; // To track the color of the wishlist icon
  bool isCartRed = false; // To track the color of the cart icon

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.productDataModel.imageUrl),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                widget.productDataModel.name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(widget.productDataModel.description),
              Row(
                children: [
                  Text(
                    "\$ " + widget.productDataModel.price.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    widget.homeBloc.add(
                      HomeProductWishListButtonClickedEvent(
                        clickedProduct: widget.productDataModel,
                      ),
                    );
                    setState(() {
                      isWishlistRed = !isWishlistRed; // Toggle the color
                    });
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: isWishlistRed ? Colors.red : null,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    widget.homeBloc.add(
                      HomeProductCartButtonClickedEvent(
                        clickedProduct: widget.productDataModel,
                      ),
                    );
                    setState(() {
                      isCartRed = !isCartRed; // Toggle the color
                    });
                  },
                  icon: Icon(
                    Icons.shopping_bag_rounded,
                    color: isCartRed ? Colors.red : null,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
