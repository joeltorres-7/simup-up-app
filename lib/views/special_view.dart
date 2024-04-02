import 'package:flutter/material.dart';
import 'package:simup_up/views/styles/spaces.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SpecialView extends StatelessWidget {
  const SpecialView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              centerTitle: true,
              elevation: 4,
              shadowColor: Colors.grey[100]!,
              backgroundColor: Theme.of(context).colorScheme.background,
              scrolledUnderElevation: 0.4,
              title: Text(
                AppLocalizations.of(context)!.devLetterTitle,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  enableFeedback: false,
                  onPressed: () {
                    Navigator.of(context).pop();
                  }
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.thisLetterIsSpecial,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      VerticalSpacing(16.0),
                      Text(
                        AppLocalizations.of(context)!.devLetter,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      VerticalSpacing(24.0),
                      Center(
                        child: Image.asset(
                            "assets/images/illustrations/lionel.png",
                          width: screenWidth * 0.8,
                        ),
                      ),
                      VerticalSpacing(16.0),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}