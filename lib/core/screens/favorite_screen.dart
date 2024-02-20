import 'package:bigshow/core/providers/home_screen_provider.dart';
import 'package:bigshow/utils/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppsStrings.favAppbarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
        child: Consumer<HomeScreenProvider>(builder: (context, child, value) {
          if(child.favList.isEmpty){
            return const Center(child: Text(AppsStrings.emptyTxt));
          } else {
            return ListView.builder(
              itemCount: child.favList.length,
              itemBuilder: (context, index) {
                final item = child.favList[index];
                return Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: screenSize.height * .15,
                          width: screenSize.width * .3,
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child:
                              Image.network(item.image!, fit: BoxFit.fill)),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            height: screenSize.height * .15,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item.user!.name!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary)),
                                Text(item.user!.name!,
                                    style:
                                    Theme.of(context).textTheme.titleLarge),
                                const Spacer(),
                                ElevatedButton(
                                    onPressed: () {
                                      child.removeFavList(video: item);
                                    },
                                    child: const Text("Remove")),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    // const Divider(color: Colors.grey),
                  ],
                );
              },
            );
          }
        }),
      ),
    );
  }
}
