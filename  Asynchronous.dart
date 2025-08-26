Future<String> getDataFormServer(){
  return Future.delayed(Duration(seconds:2),(){
    return "Get Data from Server";  
  });
}

Future<void> prosesData() async {
  print('Memulai proses...');
  try {
    // Menunggu hingga future selesai, lalu simpan hasilnya di variabel
    String data = await getDataFormServer();
    print(data); // Output: Data berhasil diambil!
  } catch (e) {
    print('Terjadi kesalahan: $e');
  } finally {
    print('Proses selesai.');
  }
}

Stream<int> hitungMundur(int dari) async* {
  for (int i = dari; i >= 0; i--) {
    await Future.delayed(Duration(seconds: 1));
    yield i; // Mengirimkan nilai i ke stream
  }
}


void main() {
  prosesData();
  print('Fungsi prosesData() dipanggil.'); // Ini akan dicetak duluan

  final stream = hitungMundur(5);

  stream.listen((angka) {
    print('Hitungan: $angka');
  });

  print('Memulai hitungan mundur...');
}