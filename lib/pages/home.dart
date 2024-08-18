import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdf_maker/pages/pdf_reader.dart';
import 'package:pdf_maker/pages/pdf_writer.dart';
import 'package:pdf_maker/tools/pdf_tools.dart';
import 'package:path/path.dart' as p;

import '../widgets/menu_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  FutureBuilder<List<FileSystemEntity>> loadUi() {
    return FutureBuilder<List<FileSystemEntity>>(
      future: PdfTools().getAllPdfFiles(),
      builder: (BuildContext context, AsyncSnapshot<List<FileSystemEntity>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  var item = snapshot.data?[index];

                  return ListTile(
                    title: Text(p.basename(item!.path.toString())),
                    /*leading: Thumbnail(
                      dataResolver: () async {
                        return (await DefaultAssetBundle.of(context)
                            .load(*//*item.path*//*"assets/demo.pdf"))
                            .buffer
                            .asUint8List();
                      },
                      mimeType: 'application/pdf',
                      widgetSize: 60,
                      useWrapper: true,
                      decoration: WidgetDecoration(
                          wrapperBgColor: Colors.blueAccent),
                    ),*/
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PdfReader(file: item,)));
                    },
                  );
                }
            );
          }
          else {
            return Container();
          }
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PDF Maker"),
        centerTitle: true,
      ),

      body: const MenuContainer(),
      /*body: loadUi(),*/
      
      floatingActionButton: FloatingActionButton.extended(
        tooltip: "Create",
          onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const PdfWriter())
        );
      }, label: const Text("Create"),),
    );
  }
}
