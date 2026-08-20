import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/firebase_functions.dart';
import 'package:evently/core/widgets/custom_app_bar.dart';
import 'package:evently/features/edit_event/edit_event.dart';
import 'package:evently/models/event_model.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventDetailsScreen extends StatelessWidget {
  static const String routeName = "event_details";
  const EventDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    var event = ModalRoute.of(context)!.settings.arguments as EventModel;

    var day = DateFormat('d').format(event.date);
    var month = DateFormat('MMMM').format(event.date);
    var time = DateFormat('h:mm a').format(event.date);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: CustomAppBar(
        title: "event_datails".tr(),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                EditEventScreen.routeName,
                arguments: event,
              );
            },
            icon: const Icon(Icons.edit_outlined, color: Colors.blue),
          ),
          IconButton(
            onPressed: () {
              FirebaseFunctions.deleteEvent(event);
              Navigator.pop(context);
            },
            icon: const Icon(Icons.delete_outline, color: Colors.red),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(16),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(event.category.imagePath, fit: BoxFit.contain),
            ),
            const SizedBox(height: 16),

            Text(
              event.title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: provider.colors.mainTextColor(),
              ),
            ),
            const SizedBox(height: 16),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: provider.colors.primaryColor().withValues(
                        alpha: 0.15,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.calendar_month_outlined,
                      color: provider.colors.primaryColor(),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$day $month",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: provider.colors.mainTextColor(),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        time,
                        style: TextStyle(
                          fontSize: 14,
                          color: provider.colors.greyColor(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            Text(
              "Description",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: provider.colors.mainTextColor(),
              ),
            ),
            const SizedBox(height: 12),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                event.description,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.6,
                  color: provider.colors.secTextColor(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
