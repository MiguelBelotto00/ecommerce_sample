import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_sample/core/helpers/default_styles.dart';
import 'package:ecommerce_sample/core/helpers/extensions.dart';
import 'package:ecommerce_sample/src/features/home/presentation/providers/providers.dart';
import 'package:ecommerce_sample/src/features/home/presentation/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppBarHome extends ConsumerWidget implements PreferredSizeWidget {
  const AppBarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userDataProvider);
    return AppBar(
      leading: user.when(
          data: (data) => InkWell(
                onTap: () => scaffoldKey.currentState?.openDrawer(),
                child: CircleAvatar(
                  maxRadius: 10,
                  child: CachedNetworkImage(imageUrl: data.image),
                ),
              ),
          error: (error, stackTrace) => SizedBox.shrink(),
          loading: () => SizedBox.shrink()),
      title: user.when(
        data: (data) => Text(
          context.l10n.welcomeMessage('${data.firstName} ${data.lastName}'),
          style: DefaultStyles.boldTitle.copyWith(
            color: Colors.white,
          ),
        ),
        error: (error, stackTrace) {
          debugPrint('Error: $error');
          return Text(
            context.l10n.welcome,
            style: DefaultStyles.boldTitle.copyWith(
              color: Colors.white,
            ),
          );
        },
        loading: () => CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 10);
}
