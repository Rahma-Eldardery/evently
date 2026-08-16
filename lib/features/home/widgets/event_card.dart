import 'package:evently/core/app_colors.dart';
import 'package:evently/models/event_model.dart';
import 'package:flutter/material.dart';

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
    // The card is a light surface in both themes, so it always uses the light palette.
    AppColors colors = LightColor();
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
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
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Text(
                        event.day,
                        style: Theme.of(context).textTheme.labelMedium!
                            .copyWith(
                              color: colors.primaryColor(),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        event.month,
                        style: Theme.of(context).textTheme.labelMedium!
                            .copyWith(
                              color: colors.primaryColor(),
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
              color: const Color(0xFFF4F7FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    event.title,
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium!.copyWith(color: Colors.black),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: onFavoriteTap,
                  child: Icon(
                    event.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: colors.primaryColor(),
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
