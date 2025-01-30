import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/profile_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key,});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProfileBloc>().add(ProfileFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if(state is ProfileFetchSuccessState){
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start
              ,
              children: [
                const SizedBox(height: 20,),
                buildText("My Profile",20),
                const SizedBox(height: 40,),
                tagText("Name"),
                const SizedBox(height: 10,),
                buildText(state.userProfile.name!,18),
                const SizedBox(height: 20,),
                tagText("Phone"),
                buildText(state.userProfile.phoneNumber!,18)
              ],
            ),
          );
        }else{
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Text tagText(String s) => Text(s,style: TextStyle(color: Colors.grey),);

  Text buildText(String s, double size) => Text(s, style: TextStyle(fontSize: size,fontWeight: FontWeight.bold),);
}
