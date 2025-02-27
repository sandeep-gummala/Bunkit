import 'package:bunkit/auth/auth_service.dart';
import 'package:bunkit/components/profilepage_component.dart';
import 'package:bunkit/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    Future<String> getName() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString("name").toString();
    }

    return Scaffold(
      backgroundColor: Colors.white,
        body: Padding(
      padding: const EdgeInsets.all(26.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  padding: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 66, 66, 66),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset("lib/assets/profile.png"),
                ),
                SizedBox(width: 20),
                Container(
                  height: 100,
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      FutureBuilder(
                              future: getName(), 
                              builder: (context, snapshot) {
                                return Text(snapshot.hasData ? snapshot.data.toString() : "Unknown",
                                style: GoogleFonts.poppins(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF232323),
                                ));
                              },
                            ),
                      SizedBox(height: 2),
                      Text("23PA1A0577 - CSE",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 57, 57, 57),
                          ))
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 30),
            ProfilepageComponent(
                name: "Notifications", image: "Bell", toggle: true),
            ProfilepageComponent(name: "Dark Mode", image: "Sun", toggle: true),
            ProfilepageComponent(
                name: "Change Password", image: "Lock", toggle: false),
            Divider(height: 4, color: const Color.fromARGB(255, 107, 107, 107)),
            SizedBox(height: 22),
            ProfilepageComponent(
                name: "Security", image: "Chield_check", toggle: false),
            ProfilepageComponent(
                name: "Your Data", image: "Data_bank", toggle: false),
            ProfilepageComponent(
                name: "Refresh Profile", image: "Refresh", toggle: false),
            ProfilepageComponent(
                name: "Invite Friends", image: "Send", toggle: false),
            Divider(height: 2, color: const Color.fromARGB(255, 107, 107, 107)),
            SizedBox(height: 22),
            ProfilepageComponent(
                name: "FAQ's", image: "Question", toggle: false),
            ProfilepageComponent(
                name: "Terms & Conditions", image: "Order", toggle: false),
            ProfilepageComponent(
                name: "About Developer", image: "User", toggle: false),
            ProfilepageComponent(name: "Rate Us", image: "Star", toggle: false),
            GestureDetector(
              onTap: () async {
                AuthService().logout();
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setBool("isLoggedIn", false);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SplashScreen()));
              },
              child: ProfilepageComponent(
                  name: "Log out", image: "Sign_out_squre", toggle: false),
            ),
            Divider(height: 2, color: const Color.fromARGB(255, 107, 107, 107)),
            SizedBox(height: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset("lib/assets/Trash.svg", height: 22),
                    SizedBox(width: 20),
                    Text(
                      "Delete Account",
                      style: GoogleFonts.poppins(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 255, 0, 0),
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    ));
  }
}
