import 'package:flutter/material.dart';
import 'package:flutter_block/features/cart/bloc/cart_bloc.dart';
import 'package:flutter_block/features/home/models/home_product_data_model.dart';

class CartTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;
  const CartTileWidget({super.key, required this.productDataModel,required this.cartBloc});

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
                        image: NetworkImage(productDataModel.imageUrl))),
              ),
              const SizedBox(height: 20),
              Text(
                productDataModel.name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(productDataModel.description),
              Row(
                children: [
                  Text(
                    "\$ " + productDataModel.price.toString(),
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
                    // cartBloc.add(HomeProductWishListButtonClickedEvent(
                    //   clickedProduct: productDataModel
                    // ));
                  },
                  icon: Icon(Icons.favorite),
                ),
                IconButton(
                  onPressed: () {
                    cartBloc.add(CartRemoveFromCartEvent(
                      productDataModel: productDataModel
                    ));
                  },
                  icon: Icon(Icons.shopping_bag_rounded),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
