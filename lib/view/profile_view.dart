import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tek_app/core/view_model/profile_view_model.dart';
import 'package:tek_app/view/auth/login_screen.dart';
import 'package:tek_app/view/widgets/custom_text.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => controller.loading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              body: Container(
                padding: EdgeInsets.only(top: 50),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(100),
                                ),
                                // AssetImage('assets/images/userImage.jpg')
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/userImage.jpg')),
                              ),
                            ),
                            Column(
                              children: [
                                CustomText(
                                  text: 'Hussein AlDARWICH',
                                  color: Colors.black,
                                  fontSize: 26,
                                ),
                                CustomText(
                                  text: 'admin@gmail.com',
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Container(
                        child: TextButton(
                          onPressed: () {},
                          child: ListTile(
                            title: CustomText(
                              text: 'Edit Profile',
                            ),
                            leading: Image.asset('assets/images/edit.png'),
                            trailing: Icon(
                              Icons.navigate_next,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: TextButton(
                          onPressed: () {},
                          child: ListTile(
                            title: CustomText(
                              text: 'Shipping Address',
                            ),
                            leading: Image.asset('assets/images/address.png'),
                            trailing: Icon(
                              Icons.navigate_next,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: TextButton(
                          onPressed: () {},
                          child: ListTile(
                            title: CustomText(
                              text: 'Order History',
                            ),
                            leading: Image.asset('assets/images/order.png'),
                            trailing: Icon(
                              Icons.navigate_next,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: TextButton(
                          onPressed: () {},
                          child: ListTile(
                            title: CustomText(
                              text: 'Cards',
                            ),
                            leading: Image.asset('assets/images/cards.png'),
                            trailing: Icon(
                              Icons.navigate_next,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: TextButton(
                          onPressed: () {},
                          child: ListTile(
                            title: CustomText(
                              text: 'Notifications',
                            ),
                            leading:
                                Image.asset('assets/images/notifications.png'),
                            trailing: Icon(
                              Icons.navigate_next,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: TextButton(
                          onPressed: () {
                            controller.signOut();
                            Get.offAll(LoginScreen());
                          },
                          child: ListTile(
                            title: CustomText(
                              text: 'Log Out',
                            ),
                            leading: Image.asset('assets/images/logout.png'),
                            trailing: Icon(
                              Icons.navigate_next,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
