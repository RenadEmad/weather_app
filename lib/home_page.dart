import 'package:flutter/material.dart';
import 'package:weather_app/pages/search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
//eadaa6538a884eee95a233053241609
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions: [
            Builder(
              builder: (context) => IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SearchPage();
                  }));
                },
                icon: const Icon(
                  Icons.search,
                  size: 28,
                  color: Colors.white,
                ),
              ),
            )
          ],
          title: const Text(
            'WeatherApp',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: false,
          backgroundColor: Colors.blue,
        ),
        body: weatherData == null
            ? const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'There is no weather',
                      style: TextStyle(color: Colors.black, fontSize: 24),
                    ),
                    Text(
                      'Start searching for now',
                      style: TextStyle(color: Colors.black, fontSize: 24),
                    )
                  ],
                ),
              )
            : Container(
                color: Colors.orange,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(
                      flex: 3,
                    ),
                    const Text(
                      'Cairo',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const Text('Updated: 12:11 PM',
                        style: TextStyle(
                          fontSize: 18,
                        )),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/images/clear.png',
                            errorBuilder: (context, error, stackTrace) {
                          return const Text('Error loading image');
                        }),
                        const Text('30', style: TextStyle(fontSize: 20)),
                        const Column(
                          children: [
                            Text(
                              'max:',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text('min:', style: TextStyle(fontSize: 20))
                          ],
                        )
                      ],
                    ),
                    const Spacer(
                      flex: 3,
                    ),
                    const Text(
                      'Clear',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(
                      flex: 5,
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
