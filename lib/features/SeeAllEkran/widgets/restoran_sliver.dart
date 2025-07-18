import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../providers/all_providers.dart';
import '../../../screens/detail_screen.dart';
class RestoranSliver extends ConsumerWidget {
  const RestoranSliver({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final restoranList = ref.watch(restoranFutureProvider);
    double ekranYuksekligi = MediaQuery.sizeOf(context).height;
    double ekranGenisligi = MediaQuery.sizeOf(context).width;
    return restoranList.when(
        data: (restoranListe) => SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index){
              final restorant = restoranListe[index];
              return Padding(
                padding:  EdgeInsets.symmetric(horizontal: 8.0,vertical:8 ),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DetayEkrani(secilenRestorant: restorant)));
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: ekranYuksekligi/4,
                        width: ekranGenisligi, // Genişliği sabitle
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: NetworkImage(restorant.restoran_resim),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        height: ekranYuksekligi/4,
                        width: ekranGenisligi, // Genişliği sabitle
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.17),
                              Colors.transparent,
                            ],
                          ),                              ),
                      ),
                      Positioned(
                        left: 5,
                        top: 10,
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  restorant.restoran_ad,
                                  style: GoogleFonts.roboto(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 5,
                        top: 10,
                        child: Container(
                          width: 80,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 18,
                                ),
                                Text(
                                  restorant.restoran_puan,
                                  style: GoogleFonts.roboto(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 5,
                          right: 10,
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                color: HexColor("#4D5652"),
                              ),

                              child:IconButton(onPressed: (){
                                final favoriNotifier = ref.read(favoriListesiProvider.notifier);
                                final currentList = [...favoriNotifier.state];

                                if (currentList.contains(restorant.restoran_ad)) {
                                  currentList.remove(restorant.restoran_ad);
                                } else {
                                  currentList.add(restorant.restoran_ad);
                                }

                                favoriNotifier.state = currentList;
                              }, icon: Icon(Icons.favorite,color:ref.watch(favoriListesiProvider).contains(restorant.restoran_ad)
                                  ? Colors.blue
                                  : Colors.white,))
                          )
                      ),


                    ],
                  ),
                ),
              );
            },
            childCount: restoranListe.length,
          ),
        ),
        error: (error, stackTrace) => SliverFillRemaining(
          child: Center(child: Text(error.toString())),
        ),
        loading: () => SliverFillRemaining(
          child: Center(child: CircularProgressIndicator()),
        ),
      );
  }
}
