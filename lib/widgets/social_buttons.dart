import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialButtons extends StatelessWidget{

  const SocialButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      spacing: 4,
      runSpacing: 4,
      children: <Widget>[
        const SizedBox(
          height: 30,
          child: IconButton(
            icon: Icon(FontAwesomeIcons.facebookSquare,color: Colors.blue,),
            iconSize: 20,
            onPressed: null,
          ),
        ),
        const SizedBox(
          height: 30,
          child: IconButton(
            icon: Icon(FontAwesomeIcons.twitterSquare,color: Colors.blue,),
            iconSize: 20,
            onPressed: null,
          ),
        ),
        SizedBox(
          height: 30,
          child: IconButton(
            icon: const Icon(FontAwesomeIcons.githubSquare,color: Colors.blue,),
            iconSize: 20,
            onPressed: () {},
          ),
        ),
        SizedBox(
          height: 30,
          child: IconButton(
            icon: const Icon(FontAwesomeIcons.instagramSquare,color: Colors.blue,),
            iconSize: 20,
            onPressed: () {},
          ),
        ),
        SizedBox(
          height: 30,
          child: IconButton(
            icon: const Icon(FontAwesomeIcons.linkedinIn,color: Colors.blue,),
            iconSize: 20,
            onPressed: () {},
          ),
        ),
        SizedBox(
          height: 30,
          child: IconButton(
            icon: const Icon(FontAwesomeIcons.mailchimp,color: Colors.blue,),
            iconSize: 20,
            onPressed: () {},
          ),
        ),
        SizedBox(
          height: 30,
          child: IconButton(
            icon: const Icon(FontAwesomeIcons.phone, color: Colors.blue,),
            iconSize: 20,
            onPressed: () {},
          ),
        ),
      ],
    );
  }

}