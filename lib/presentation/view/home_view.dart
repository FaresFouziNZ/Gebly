import 'package:flutter/material.dart';
import 'package:gebly/core/services/authentication_services.dart';
import 'package:gebly/presentation/widget/join_event_widget.dart';
// import 'package:gebly/view_models/home_view_model.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // final viewModel = HomeViewModel();
    return Scaffold(
      drawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.outlineVariant,
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
                leading: Icon(Icons.home_outlined, color: Theme.of(context).colorScheme.scrim),
                title: Text('Home', style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.scrim)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListTile(
                minLeadingWidth: 0,
                leading: Icon(Icons.history, color: Theme.of(context).colorScheme.scrim),
                title:
                    Text('Previous events', style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.scrim)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListTile(
                minLeadingWidth: 0,
                leading: Icon(Icons.add_box_outlined, color: Theme.of(context).colorScheme.scrim),
                title: Text('Join event', style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.scrim)),
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
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 10, 0, 11),
              child: Text('Settings', style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.scrim)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListTile(
                minLeadingWidth: 0,
                leading: Icon(Icons.broken_image_outlined, color: Theme.of(context).colorScheme.scrim),
                title: Text('Theme', style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.scrim)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListTile(
                minLeadingWidth: 0,
                leading: Icon(Icons.add_card_outlined, color: Theme.of(context).colorScheme.scrim),
                title: Text('Payment information',
                    style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.scrim)),
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
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 10, 0, 11),
              child: Text('About us', style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.scrim)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListTile(
                minLeadingWidth: 0,
                leading: Icon(Icons.question_mark, color: Theme.of(context).colorScheme.scrim),
                title: Text('FAQ', style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.scrim)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListTile(
                minLeadingWidth: 0,
                leading: Icon(Icons.message_outlined, color: Theme.of(context).colorScheme.scrim),
                title: Text('Contact us', style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.scrim)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListTile(
                minLeadingWidth: 0,
                leading: Icon(Icons.logout, color: Theme.of(context).colorScheme.scrim),
                title: Text('log out', style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.scrim)),
                onTap: () {
                  AuthenticationServices().signOut();
                  Navigator.pop(context);
                  context.go('/login');
                },
              ),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            backgroundColor: Colors.transparent,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text(
                  'محمد',
                  style: TextStyle(
                      fontSize: 32, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Text(
                  ',حياك',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
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
                      GestureDetector(
                        onTap: () => context.push('/select-restaurant'),
                        child: Align(
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
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.054,
                    width: MediaQuery.of(context).size.width * 0.75,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '“',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('Sharing',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            )),
                        const Text(
                          ' is caring”',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.76,
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(27.0),
                              bottomRight: Radius.circular(27.0),
                              topLeft: Radius.circular(3),
                              bottomLeft: Radius.circular(3),
                            )),
                        child: Center(
                          child: Text(
                            'already in a party?',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: 32,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
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
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.36,
                            height: MediaQuery.of(context).size.height * 0.086,
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.onPrimary,
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(27.0),
                                  bottomRight: Radius.circular(27.0),
                                )),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Text('Enter event code to join',
                              style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        const Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: JoinEventWidget(),
                          ),
                        ),
                      ],
                    ),
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
