import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:holy_quran/surahpage.dart';
import 'package:quran/quran.dart' as quran;


class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text(' MY QURAN'),
      
      automaticallyImplyLeading: false,),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BounceInDown(
              child: Text(
              '    Asalamu Alaikum !!!',
              textAlign: TextAlign.center,
              style: TextStyle(
                        color: Colors.amber,
                        fontSize: 30,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w900,
                        height: 0,
              ),
                      ),
            ),SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                      itemCount: quran.totalSurahCount,
                      itemBuilder: (context, index) {
                        return ZoomIn(
                          
                          child: Column(
                            children: [
                              ListTile(
                                onTap: (){
                              
                                Get.to(()=>surahpage(surahindex: index,), transition: Transition.upToDown);
                              },
                                subtitle: Text(
                                  'Total Verses  ${quran.getVerseCount(index+1)}' ,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color:const Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 15,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                  ),
                              ),
                                
                                
                               
                                title:  Text(
                                 quran.getSurahNameEnglish(index+1),
                                  style: TextStyle(
                                      color:const Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                  ),
                              ),
                                trailing:  Text(
                                  quran.getSurahNameArabic( index + 1, ),
                                  style: TextStyle(
                                      color:Color.fromARGB(255, 0, 0, 0),
                              fontSize: 24,
                              fontFamily: 'Lateef',
                              fontWeight: FontWeight.w400,
                              height: 0,
                              ),
                                ),
                                
                              leading: CircleAvatar(child: Text("${index+1}"),backgroundColor: Colors.amber,),
                                            
                              ),
                              Container(width: Get.width, color: Colors.amber, height: 2,)
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
          );

  }
}