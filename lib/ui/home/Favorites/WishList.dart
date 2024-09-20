import 'package:app1/ui/home/Favorites/cubit/WishlistStates.dart';
import 'package:app1/ui/home/Favorites/cubit/WishlistViewModel.dart';
import 'package:app1/ui/widgets/FavoriteBuild.dart';
import 'package:app1/ui/widgets/customsearch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteTab extends StatelessWidget {
  static const String routeName = 'wichlist';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Wishlistviewmodel()..getwichList(),
      child: BlocBuilder<Wishlistviewmodel, Wichliststates>(
        builder: (context, state) {
          if (state is GetWishlistLoadingtstates) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetWishlistErrortstates) {
            return Center(child: Text('Error: ${state.failures.errorMessage}'));
          } else if (state is GetWishlisttSuccessstates) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Customsearch(),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.response.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Favoritebuild(
                            wichListdata: state.response.data![index]);
                      },
                    ),
                  ],
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
