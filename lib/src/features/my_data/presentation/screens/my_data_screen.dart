import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_sample/core/helpers/default_styles.dart';
import 'package:ecommerce_sample/core/helpers/extensions.dart';
import 'package:ecommerce_sample/src/features/home/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MyDataScreen extends ConsumerWidget {
  const MyDataScreen({super.key});

  static const String name = 'myData';
  static const String route = '/my-data';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () => GoRouter.of(context).pop(),
        ),
        title: Text(
          context.l10n.myData,
          style: DefaultStyles.boldTitle.copyWith(
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: userData.when(
        data: (data) => SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  child: CachedNetworkImage(
                    imageUrl: data.image,
                  ),
                  maxRadius: 70,
                ),
                Text(
                  'First Name: ${data.firstName}',
                  style: DefaultStyles.Title,
                ),
                Text(
                  'Last Name: ${data.lastName}',
                  style: DefaultStyles.Title,
                ),
                Text(
                  'Email: ${data.email}',
                  style: DefaultStyles.Title,
                ),
              ],
            ),
          ),
        ),
        error: (error, stackTrace) => Center(
          child: Text('Ha ocurrido un error'),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
