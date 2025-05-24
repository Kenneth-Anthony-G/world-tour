import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:world_tour/theme/app_text.dart';
import '../models/country.dart';

class DetailScreen extends StatelessWidget {
  final Country country;

  const DetailScreen({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    double iconSize = 25;
    final formattedPopulation = NumberFormat("###,###,###,###", "fr_FR")
        .format(country.population)
        .replaceAll(',', ' ');

    return Scaffold(
      appBar: AppBar(title: Text(country.officialName)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Flag
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                country.flagUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),

            // Official + Region
            Row(
              children: [
                Expanded(
                  child: Text(
                    country.officialName,
                    style: AppText.large,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(width: 10,),
                Image.network(country.flagUrl,height: iconSize - 10,)
              ],
            ),
            Row(spacing: 10,
              children: [
                Image.asset('assets/icons/building.png',height: iconSize,),
                Text(
                  'Capital:',
                  style: AppText.large.copyWith(color: Colors.grey),
                ),
                Text(country.capital,style: AppText.large,)
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      _buildDetailRow( icon: Icon(Icons.people_alt_outlined,color: Colors.green,size: 25,),
                          title: 'Population', value: formattedPopulation),
                      _buildDetailRow(icon: Image.asset(height: iconSize,width: iconSize, 'assets/icons/language.png',color: Colors.purple,), title: 'Language', value: country.language),
                      _buildDetailRow(icon:Image.asset(height: iconSize,width: iconSize, 'assets/icons/coins.png',color: Colors.yellow.shade700,), title: 'Currency', value: country.currency),
                      _buildDetailRow( icon: Icon(size: iconSize, Icons.access_time_filled,color: Colors.blue,),
                          title: 'Time Zone', value: country.timeZone),
                      _buildDetailRow(icon: Icon(size: iconSize, Icons.phone,color: Colors.pinkAccent,),
                          title: 'Phone Code', value: country.phoneCode),
                      _buildDetailRow(
                          icon: Image.asset(height: iconSize,width: iconSize, 'assets/icons/earth.png',color: Colors.blueAccent,),
                          title: 'Continent', value: country.region),
                      _buildDetailRow(icon: Image.asset(height: iconSize,width: iconSize,color: Colors.teal, 'assets/icons/map.png'),
                          title: 'Area',
                          value: '${country.area.toStringAsFixed(0)} km²'),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow({String title = '', required String value, required Widget icon}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: SizedBox(
              width: 30,
              child: icon,
            ),
          ),
          Text(
            title,
            style: AppText.medium.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              value,
              style: AppText.large,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.end, // Align value to the right
            ),
          ),
        ],
      ),
    );
  }

}
