import 'package:archonit_test_prj/core/extension/string_price_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/colors_cubit.dart';
import '../cubit/colors_state.dart';
import '../widgets/crypto_tile.dart';

class ColorsListPage extends StatelessWidget {
  const ColorsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    scrollController.addListener(() {
      final cubit = context.read<ColorsCubit>();
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 200 &&
          !cubit.isLoading) {
        cubit.fetchNext();
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text("Crypto Colors")),
      body: BlocBuilder<ColorsCubit, ColorsState>(
        builder: (context, state) {
          final list = state.list;

          return RefreshIndicator(
            onRefresh: () => onRefresh(context),
            child: ListView.builder(
              controller: scrollController,
              itemCount: list.length + 1,
              itemBuilder: (context, index) {
                if (index == list.length) {
                  return context.read<ColorsCubit>().hasMore
                      ? const Padding(
                          padding: EdgeInsets.all(20),
                          child: Center(child: CircularProgressIndicator()),
                        )
                      : const SizedBox.shrink();
                }

                return CryptoTile(
                  symbol: list[index].symbol,
                  priceUsd: list[index].priceUsd.formatPrice(),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Future<void> onRefresh(BuildContext context) async {
    final cubit = context.read<ColorsCubit>();
    if (!cubit.isLoading) {
      await cubit.refresh();
    }
  }
}
