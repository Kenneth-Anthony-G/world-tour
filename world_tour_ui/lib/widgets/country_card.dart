

import 'package:flutter/material.dart';

import '../models/country.dart';
import '../screens/detail_screen.dart';
import '../theme/app_text.dart';


class CountryCard extends StatelessWidget {
  final Country country;
  const CountryCard({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailScreen(country: country),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        height: 60,
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(country.flagUrl,fit: BoxFit.cover,height: 50,width: 50,)),
            SizedBox(width: 12,),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(country.officialName,softWrap: true,overflow: TextOverflow.ellipsis,maxLines:1,style: AppText.medium,),
                  Text(country.frenchName,softWrap: true,overflow: TextOverflow.ellipsis,maxLines:1,),
                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}




class CountryCard2 extends StatelessWidget {
  final Country country;
  const CountryCard2({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2, // slight shadow like a card
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                country.flagUrl,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${country.frenchName}, ${country.officialName}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    country.frenchName,
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
