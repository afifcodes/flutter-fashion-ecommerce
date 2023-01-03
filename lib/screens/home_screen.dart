import 'package:flutter/material.dart';
import 'package:flutter_fashion_ecommerce/utils/system_ui.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ionicons/ionicons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  List<Map<String, dynamic>> cards = [
    {
      'name': 'Fashion 1',
      'price': '59,95',
      'is_liked': false,
      'image_url':
          'https://images.unsplash.com/photo-1552374196-1ab2a1c593e8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
    },
    {
      'name': 'Fashion 2',
      'price': '22,95',
      'is_liked': false,
      'image_url':
          'https://images.unsplash.com/photo-1622519407650-3df9883f76a5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80'
    },
    {
      'name': 'Fashion 3',
      'price': '25,95',
      'is_liked': false,
      'image_url':
          'https://images.unsplash.com/photo-1559582798-678dfc71ccd8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80'
    },
    {
      'name': 'Fashion 4',
      'price': '30,95',
      'is_liked': false,
      'image_url':
          'https://images.unsplash.com/photo-1617127365659-c47fa864d8bc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
    },
    {
      'name': 'Fashion 5',
      'price': '42,95',
      'is_liked': false,
      'image_url':
          'https://images.unsplash.com/photo-1617137968427-85924c800a22?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
    },
    {
      'name': 'Fashion 6',
      'price': '32,95',
      'is_liked': false,
      'image_url':
          'https://images.unsplash.com/photo-1536766820879-059fec98ec0a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
    },
    {
      'name': 'Fashion 7',
      'price': '36,95',
      'is_liked': false,
      'image_url':
          'https://images.unsplash.com/photo-1488161628813-04466f872be2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80'
    },
    {
      'name': 'Fashion 8',
      'price': '22,95',
      'is_liked': false,
      'image_url':
          'https://images.unsplash.com/photo-1506634572416-48cdfe530110?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=685&q=80'
    },
    {
      'name': 'Fashion 9',
      'price': '27,95',
      'is_liked': false,
      'image_url':
          'https://images.unsplash.com/photo-1593757147298-e064ed1419e5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
    }
  ];

  PreferredSizeWidget appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: const Icon(
        Ionicons.menu,
        color: Color(0xff171717),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Ionicons.bag,
              color: Color(0xff171717),
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    systemUi();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const Text(
                    'Explore Trendy Clothes',
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height: 1,
                        letterSpacing: -1.5,
                        color: Color(0xff171717),
                        fontSize: 36,
                        fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(8)),
                    child: TextFormField(
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                      maxLines: 1,
                      scrollPadding: EdgeInsets.zero,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Ionicons.search,
                            size: 16,
                            color: Colors.grey[400],
                          ),
                          prefix: const SizedBox(width: 4),
                          prefixIconConstraints: const BoxConstraints(
                              maxHeight: 18,
                              maxWidth: 18,
                              minHeight: 18,
                              minWidth: 18),
                          hintText: 'Search clothes, brands or etc...',
                          hintStyle: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                          isDense: true,
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Tag(
                      isActive: index == 0,
                      onTap: () {
                        setState(() {
                          index = 0;
                        });
                      },
                      label: 'Casual'),
                  const SizedBox(
                    width: 6,
                  ),
                  Tag(
                      isActive: index == 1,
                      onTap: () {
                        setState(() {
                          index = 1;
                        });
                      },
                      label: 'Sports'),
                  const SizedBox(
                    width: 6,
                  ),
                  Tag(
                      isActive: index == 2,
                      onTap: () {
                        setState(() {
                          index = 2;
                        });
                      },
                      label: 'Classic'),
                  const SizedBox(
                    width: 6,
                  ),
                  Tag(
                      isActive: index == 3,
                      onTap: () {
                        setState(() {
                          index = 3;
                        });
                      },
                      label: 'Official'),
                  const SizedBox(
                    width: 6,
                  ),
                  Tag(
                      isActive: index == 6,
                      onTap: () {
                        setState(() {
                          index = 6;
                        });
                      },
                      label: 'Fresh'),
                  const SizedBox(
                    width: 6,
                  ),
                  Tag(
                      isActive: index == 5,
                      onTap: () {
                        setState(() {
                          index = 5;
                        });
                      },
                      label: 'Viral'),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: MasonryGridView.count(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(24),
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              itemCount: cards.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(top: index == 1 ? 36 : 0, bottom: 28),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 200,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              image: DecorationImage(
                                  image:
                                      NetworkImage(cards[index]['image_url']),
                                  fit: BoxFit.cover)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    cards[index]['is_liked'] =
                                        !cards[index]['is_liked'];
                                  });
                                },
                                child: Icon(
                                  cards[index]['is_liked']
                                      ? Ionicons.heart
                                      : Ionicons.heart_outline,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          cards[index]['name'].toUpperCase(),
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.5),
                        ),
                        Text(
                          cards[index]['price'] + ' EUR',
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -1),
                        ),
                      ]),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

Widget Tag({onTap, isActive, label}) {
  return GestureDetector(
    onTap: () {
      onTap();
    },
    child: Container(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 8, top: 6),
      decoration: BoxDecoration(
          color: isActive ? const Color(0xff171717) : Colors.white,
          borderRadius: BorderRadius.circular(8)),
      child: Text(
        label,
        style: TextStyle(
            color: isActive ? Colors.white : const Color(0xff171717),
            fontSize: 12,
            fontWeight: FontWeight.w500),
      ),
    ),
  );
}
