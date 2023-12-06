import 'package:flutter/material.dart';
import '../widget/event_code.dart';

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
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        backgroundColor: const Color(0xfffef1f0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: 120,
              child: Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset('assets/images/Title.png'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListTile(
                minLeadingWidth: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                tileColor: const Color(0xffffffff),
                leading: const Icon(Icons.home_outlined, color: Color(0xff000000)),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListTile(
                minLeadingWidth: 0,
                leading: const Icon(Icons.history, color: Color(0xff000000)),
                title: const Text('Previous events'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListTile(
                minLeadingWidth: 0,
                leading: const Icon(Icons.add_box_outlined, color: Color(0xff000000)),
                title: const Text('Join event'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const Divider(
              color: Color(0x33000000),
              thickness: 1,
              indent: 15,
              endIndent: 15,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(25.0, 10, 0, 11),
              child: Text('Settings', style: TextStyle(fontSize: 14, color: Color(0xff000000))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListTile(
                minLeadingWidth: 0,
                leading: const Icon(Icons.broken_image_outlined, color: Color(0xff000000)),
                title: const Text('Theme'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListTile(
                minLeadingWidth: 0,
                leading: const Icon(Icons.add_card_outlined, color: Color(0xff000000)),
                title: const Text('Payment information'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const Divider(
              color: Color(0x33000000),
              thickness: 1,
              indent: 15,
              endIndent: 15,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(25.0, 10, 0, 11),
              child: Text('About us', style: TextStyle(fontSize: 14, color: Color(0xff000000))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListTile(
                minLeadingWidth: 0,
                leading: const Icon(Icons.question_mark, color: Color(0xff000000)),
                title: const Text('FAQ'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListTile(
                minLeadingWidth: 0,
                leading: const Icon(Icons.message_outlined, color: Color(0xff000000)),
                title: const Text('Contact us'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
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
              Align(
                alignment: Alignment.center,
                child: Container(
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
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
