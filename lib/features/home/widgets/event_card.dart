import 'package:evently/models/event_model.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventCard extends StatelessWidget {
  final EventModel event;
  final VoidCallback onFavoriteTap;

  const EventCard({
    super.key,
    required this.event,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  event.category.imagePath,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Text(
                        event.day,
                        style: Theme.of(context).textTheme.labelMedium!
                            .copyWith(
                              color: provider.colors.primaryColor(),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        event.month,
                        style: Theme.of(context).textTheme.labelMedium!
                            .copyWith(
                              color: provider.colors.primaryColor(),
                              fontSize: 14,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: provider.colors.backgroundColor(),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    event.title,
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium!.copyWith(color: provider.colors.mainTextColor()),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: onFavoriteTap,
                  child: Icon(
                    event.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: provider.colors.primaryColor(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
