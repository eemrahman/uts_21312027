import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {

  late TextEditingController cNama;
  late TextEditingController cNPM;
  late TextEditingController cAlamat;
  late TextEditingController cProgramStudi;
  late TextEditingController cJK;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addProduct(String npm, String nama, String alamat, String program_studi, String jk) async{
    CollectionReference products = firestore.collection('mahasiswa');

    try{
      await products.add({
        "nama" : nama,
        "npm" : npm,
        "alamat" : alamat,
        "program_studi" : program_studi,
        "jk" : jk,
        });
        Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menyimpan data product",
          onConfirm: () {
            cNPM.clear();
            cNama.clear();
           cAlamat.clear();
            cProgramStudi.clear();
            cJK.clear();
            Get.back();
            Get.back();
            textConfirm: "OK";
          }
        );
    }catch(e){
      
        print(e);
        Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Gagal Menambahkan Product.",
        );
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
  cNPM = TextEditingController();
  cNama=TextEditingController();
  cAlamat=TextEditingController();
  cProgramStudi=TextEditingController();
  cJK=TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cNPM.dispose();
    cNama.dispose();
    cAlamat.dispose();
    cProgramStudi.dispose();
    cJK.dispose();
    super.onClose();
  }
}
