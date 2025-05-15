import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:physiomobile/const/images.dart';
import 'package:physiomobile/page/counter/counter_provider.dart';
import 'package:physiomobile/themes/themes.dart';
import 'package:physiomobile/utils/size.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(counterProvider);
    return Scaffold(
      backgroundColor: appColors.backgroundPrimary,
      appBar: AppBar(
        backgroundColor: appColors.backgroundPrimary,
        title: Text(
          "Counter",
          style: AppTextStyle.appBar,
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: paddingScreen().left + 8),
          child: Image.asset(
            logoPhysioMobile,
            height: 40,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              provider.count.toString(),
              style: AppTextStyle.title1.copyWith(fontSize: 100),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ButtonDefault(
                    title: "-",
                    onPressed: () => provider.decrement(),
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: ButtonDefault(
                    title: "+",
                    onPressed: () => provider.increment(),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
