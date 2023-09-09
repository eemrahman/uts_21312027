
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProductController extends GetxController {
  late TextEditingController cNama;
  late TextEditingController cNPM;
  late TextEditingController cAlamat;
  late TextEditingController cProgramStudi;
  late TextEditingController cJK;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String id) async{
    DocumentReference docRef = firestore.collection("mahasiswa").doc(id);

    return docRef.get();
  }

  void updateProduct(String npm, String nama, String alamat, String program_studi, String jk, String id) async {
    DocumentReference productById = firestore.collection("mahasiswa").doc(id);
    try {
      await productById.update({
        "nama" : nama,
        "npm" : npm,
        "alamat" : alamat,
        "program_studi" : program_studi,
        "jk" : jk,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data Mahasiswa.",
        onConfirm: () {
          cNPM.clear();
          cNama.clear();
          cAlamat.clear();
          cProgramStudi.clear();
          cJK.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );

    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Gagal Mengubah Product.",
      );
    }
  }

  @override
  void onInit(){
  cNPM = TextEditingController();
  cNama=TextEditingController();
  cAlamat=TextEditingController();
  cProgramStudi=TextEditingController();
  cJK=TextEditingController();
  super.onInit();
  }

  void onClose() {

    cNPM.dispose();
    cNama.dispose();
    cAlamat.dispose();
    cProgramStudi.dispose();
    cJK.dispose();
    super.onClose();
  }
}
