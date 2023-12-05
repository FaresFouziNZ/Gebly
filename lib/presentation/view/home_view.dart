import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text('HomeView'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.25,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.086,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(27.0),
                        bottomLeft: Radius.circular(27.0),
                      )),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.76,
                  height: MediaQuery.of(context).size.height * 0.086,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(27.0),
                        bottomRight: Radius.circular(27.0),
                      )),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.925,
                height: MediaQuery.of(context).size.height * 0.19,
                decoration: BoxDecoration(
                  // color: Theme.of(context).colorScheme.secondaryContainer,
                  image: const DecorationImage(
                    image: AssetImage('assets/images/eventAd.png'),
                    fit: BoxFit.fitWidth,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Theme.of(context).colorScheme.secondaryContainer,
                      Theme.of(context).colorScheme.primaryContainer,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(7.0),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.925,
                height: MediaQuery.of(context).size.height * 0.19,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                  ),
                  borderRadius: BorderRadius.circular(7.0),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 8.0, bottom: 8.0, right: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Gathering? \nStart here',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
