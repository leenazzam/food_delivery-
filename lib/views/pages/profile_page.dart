import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food/utils/appcolors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                'assets/images/img.png',
                color: AppColors.primary,
                height: 130,
                width: 130,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Leen Azzam",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(children: [
                    Icon(Icons.person),
                    Text(
                      "  Personal Information",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ]),
                  TextButton(
                      onPressed: () {},
                      child: const Row(
                        children: [
                          Icon(Icons.edit),
                          Text(
                            "Edit",
                            style: TextStyle(),
                          )
                        ],
                      ))
                ],
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
    //  ListView(
    //   physics: const BouncingScrollPhysics(),
    //   children: const [
    //     Icon(Icons.settings),
    //     SizedBox(
    //       height: 20,
    //     ),
    //     Icon(
    //       Icons.person,
    //       size: 80,
    //     ),
    //     Text(
    //       'Leen Azzam',
    //       textAlign: TextAlign.center,
    //       style: TextStyle(fontSize: 20),
    //     ),
    //     Text(
    //       'leenazzamsh@gmail.com',
    //       textAlign: TextAlign.center,
    //       style: TextStyle(fontSize: 15, color: AppColors.primary),
    //     ),
    //     Padding(
    //       padding: EdgeInsets.all(16.0),
    //       child: Text(
    //         'My Details',
    //         textAlign: TextAlign.start,
    //         style: TextStyle(fontSize: 20),
    //       ),
    //     ),
    //   ],
    // );
  }
}
