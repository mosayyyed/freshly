import 'package:flutter/material.dart';

class FeaturedRecipeBanner extends StatelessWidget {
  const FeaturedRecipeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 200,
        decoration: const BoxDecoration(
          color: Color(0xFF021C17),
          image: DecorationImage(
            image: NetworkImage(
                'https://images.slurrp.com/prod/recipe_images/taste/tomato-tamarind-chicken-curry-1619715706_11JS0B0U9CF2RIB2SLZR.webp?impolicy=slurrp-20210601&width=1200&height=675'),
            fit: BoxFit.cover,
            opacity: 0.5,
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'FEATURED RECIPE',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Kariwari Chicken Curry',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white70,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: Colors.white70,
                        size: 18,
                      ),
                      SizedBox(width: 4),
                      Text(
                        '35 mins',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 12),
              Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.circle, color: Colors.white70, size: 13),
                    SizedBox(width: 4),
                    Icon(Icons.circle, color: Colors.white70, size: 13),
                    SizedBox(width: 4),
                    Icon(Icons.circle, color: Color(0xFF00967A), size: 13),
                    SizedBox(width: 4),
                    Icon(Icons.circle, color: Colors.white70, size: 13),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
