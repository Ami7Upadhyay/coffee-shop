import 'package:coffie_shop/component/titel_with_vertical_divider.dart';
import 'package:coffie_shop/models/ProductListResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../component/responsive.dart';
import '../../component/text_widget.dart';
import 'package:coffie_shop/extenstion/image_path.dart';

import 'default_padding_container.dart';

class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  ProductListResponse productListResponse = ProductListResponse();
  List<Products>? selectedProduct = [];

  @override
  void initState() {
    productListResponse = ProductListResponse.fromJson(jsonData);
    selectedProduct = productListResponse.productData?.first.products;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultPaddingContainer(child: _buildContent());
  }

  Widget _buildContent() {
    return Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [_title(), _buildTabs(), buildGrid()],
    );
  }

  Widget _title() {
    return const TitleWithDivider(
        title: "Choose our delicious and best products");
  }

  Widget _buildTabs() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 40),
      width: double.infinity,
      child: Wrap(
        children: List.generate(productListResponse.productData?.length ?? 0,
            (index) {
          ProductData productData = productListResponse.productData![index];
          return tab(productData, onTap: () {
            setState(() {
              selectedProduct = productData.products;
            });
          });
        }),
      ),
    );
  }

  Widget tab(ProductData productData, {Function? onTap}) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 20, 20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              onTap?.call();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: productData.name ?? '',
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(height: 5),
                CustomText(
                  text: '${productData.quantity} products',
                  fontSize: 12,
                  color: Colors.black45,
                  fontWeight: FontWeight.w600,
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: 30,
            width: 1,
            color: Colors.black38,
          )
        ],
      ),
    );
  }

  Widget buildGrid() {
    return GridView.builder(
        itemCount: selectedProduct?.length ?? 0,
        shrinkWrap: true,
        padding: Responsive.isMobile(context)
            ? const EdgeInsets.symmetric(horizontal: 40)
            : EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 290,
            crossAxisCount: Responsive.isMobile(context) ? 1 : 3,
            crossAxisSpacing: 50,
            mainAxisSpacing: 20),
        itemBuilder: (BuildContext context, int index) {
          Products product = selectedProduct![index];
          return ProductDetails(product: product);
        });
  }
}

var jsonData = {
  "product_data": [
    {
      "name": "New Delicacies",
      "quantity": 3,
      "products": [
        {"image": "delicacies1", "price": "5", "product_name": "Cookies"},
        {"image": "delicacies2", "price": "6", "product_name": "Croissant"},
        {"image": "delicacies3", "price": "4", "product_name": "Croissant"}
      ]
    },
    {
      "name": "Hot Coffee",
      "quantity": 4,
      "products": [
        {"image": "coffee1", "price": "7", "product_name": "Black Coffee"},
        {"image": "coffee2", "price": "12", "product_name": "Pure Coffee"},
        {"image": "coffee3", "price": "9", "product_name": "Milk Coffee"},
        {"image": "coffee4", "price": "9", "product_name": "Moka Coffee"}
      ]
    },
    {
      "name": "Cakes And Delicacies",
      "quantity": 4,
      "products": [
        {"image": "cake1", "price": "6", "product_name": "Cream Cake"},
        {"image": "cake2", "price": "5", "product_name": "Chocolate Croissant"},
        {"image": "cake3", "price": "15", "product_name": "Pancake"},
        {"image": "cake4", "price": "12", "product_name": "Milk Cake"}
      ]
    }
  ]
};

class ProductDetails extends StatefulWidget {
  final Products product;
  const ProductDetails({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  Animation<Offset>? animationOffset;
  late AnimationController productAnimationController;
  Animation<double>? animationOpacity;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return product();
  }

  Widget product() {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, blurRadius: 2, offset: Offset(0, 2))
          ]),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(color: Colors.grey.shade200),
                child: SliderAnimation(
                  child: Image.asset(
                    widget.product.image?.toPng ?? '',
                    height: 150,
                  ),
                ),
                // ),
              ),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "\$${widget.product.price}",
                      style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "${widget.product.productName}",
                      style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class SliderAnimation extends StatefulWidget {
  final Widget child;
  //final Animation<Offset> animationOffset;
  const SliderAnimation({Key? key, required this.child}) : super(key: key);

  @override
  State<SliderAnimation> createState() => _SliderAnimationState();
}

class _SliderAnimationState extends State<SliderAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  Animation<Offset>? animationOffset;
  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    var curved =
        CurvedAnimation(parent: animationController, curve: Curves.ease);
    animationOffset =
        Tween<Offset>(begin: Offset.zero, end: const Offset(0, -0.2))
            .animate(animationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        hoverColor: Colors.transparent,
        onTap: () {},
        onHover: (isHover) {
          {
            if (isHover) {
              setState(() {
                animationController.forward();
              });
            } else {
              setState(() {
                animationController.reverse();
              });
            }
          }
        },
        child: SlideTransition(
          position: animationOffset!,
          child: widget.child,
        ));
  }
}
