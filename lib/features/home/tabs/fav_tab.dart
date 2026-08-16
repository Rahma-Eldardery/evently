import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/firebase_functions.dart';
import 'package:evently/core/widgets/custom_text_form_field.dart';
import 'package:evently/features/home/widgets/event_card.dart';
import 'package:evently/models/event_model.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavTab extends StatefulWidget {
  const FavTab({super.key});

  @override
  State<FavTab> createState() => _FavTabState();
}

class _FavTabState extends State<FavTab> {
  String searchText = "";

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);

    return StreamBuilder(
      stream: FirebaseFunctions.getfavEvents(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError == true) {
          return Center(child: Text("Something went wrong"));
        }

        List<EventModel> data =
            snapshot.data?.docs.map((e) {
              return e.data();
            }).toList() ??
            [];

        if (data.isEmpty) {
          return Center(
            child: Text(
              "no_favorites".tr(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          );
        }
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: CustomTextFormField(
                hintText: "search_hint".tr(),
                suffixIcon: Icon(
                  Icons.search,
                  color: provider.colors.primaryColor(),
                ),
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                  });
                },
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) => EventCard(
                  event: data[index],
                  onFavoriteTap: () {
                    setState(() {
                      data[index].isFavorite = !data[index].isFavorite;
                      FirebaseFunctions.updateEvent(data[index]);
                    });
                  },
                ),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemCount: data.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
