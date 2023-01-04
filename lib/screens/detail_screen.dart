import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_fashion_ecommerce/utils/system_ui.dart';
import 'package:ionicons/ionicons.dart';

class DetailScreen extends StatefulWidget {
  final String name;
  final String price;
  final bool is_liked;
  final String image_url;
  const DetailScreen(
      {super.key,
      required this.name,
      required this.price,
      required this.is_liked,
      required this.image_url});

  @override
  State<DetailScreen> createState() => _DetailSCreenState();
}

class _DetailSCreenState extends State<DetailScreen> {
  bool is_liked = false;
  int colorIndex = 0;
  int sizeIndex = 0;
  int count = 0;

  List<Color> colors = [
    (Colors.blue[200])!,
    (Colors.brown[200])!,
    (Colors.orange[200])!
  ];

  List<String> sizes = ['S', 'M', 'L'];

  Widget ColorChooser(List<Color> colors, int activeIndex, Function onChange) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: colors.asMap().entries.map((color) {
        return GestureDetector(
          onTap: () {
            onChange(color.key);
          },
          child: Container(
            height: 24,
            width: 24,
            padding: const EdgeInsets.only(bottom: 2, left: 1),
            margin: EdgeInsets.only(right: color.key == colors.length ? 0 : 4),
            decoration: BoxDecoration(
                color: color.value, borderRadius: BorderRadius.circular(4)),
            child: activeIndex == color.key
                ? const Center(
                    child: Icon(
                    Ionicons.checkmark_circle,
                    size: 20,
                  ))
                : const SizedBox(),
          ),
        );
      }).toList(),
    );
  }

  Widget SizeChooser(List<String> sizes, int activeIndex, Function onChange) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: sizes.asMap().entries.map((size) {
        return GestureDetector(
          onTap: () {
            onChange(size.key);
          },
          child: Container(
            height: 24,
            width: 24,
            margin: EdgeInsets.only(right: size.key == sizes.length ? 0 : 4),
            decoration: BoxDecoration(
                color:
                    size.key == activeIndex ? Colors.grey[900] : Colors.white,
                borderRadius: BorderRadius.circular(4)),
            child: Center(
              child: Text(
                size.value,
                style: TextStyle(
                    color: Colors.grey[300],
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    systemUi();
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.image_url), fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Ionicons.arrow_back),
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              is_liked = !is_liked;
                            });
                          },
                          child: Icon(is_liked
                              ? Ionicons.heart
                              : Ionicons.heart_outline))
                    ],
                  ),
                ),
                Container(
                  height: 24,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24))),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'zara',
                    style: TextStyle(
                        color: Colors.grey[400], fontWeight: FontWeight.w500),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        widget.price + ' eur',
                        style: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'color',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          ColorChooser(colors, colorIndex, (v) {
                            setState(() {
                              colorIndex = v;
                            });
                          })
                        ],
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'size',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          SizeChooser(sizes, sizeIndex, (v) {
                            setState(() {
                              sizeIndex = v;
                            });
                          })
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                count = count + 1;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              child: Icon(
                                Icons.add,
                                color: Colors.grey[700],
                                size: 16,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            count.toString(),
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (count == 0) {
                                  return;
                                } else {
                                  count = count - 1;
                                }
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              child: Icon(
                                Icons.remove,
                                color: Colors.grey[700],
                                size: 16,
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, top: 8, bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Ionicons.cart_outline,
                              color: Colors.white,
                              size: 16,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              'Add To Cart',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
