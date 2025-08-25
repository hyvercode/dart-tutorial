import 'dart:isolate';

// Fungsi entry point untuk Isolate baru
void findPrimes(SendPort sendPort) {
  // Komputasi berat: Mencari bilangan prima hingga 100.000
  final primes = <int>[];
  for (int i = 2; i <= 100000; i++) {
    bool isPrime = true;
    for (int j = 2; j <= i / 2; j++) {
      if (i % j == 0) {
        isPrime = false;
        break;
      }
    }
    if (isPrime) {
      primes.add(i);
    }
  }
  // Kirim hasil kembali ke Isolate utama
  sendPort.send(primes.length);
}

void main() async {
  print('Isolate utama: Mulai mencari bilangan prima...');

  // Membuat ReceivePort untuk menerima pesan dari Isolate baru
  final receivePort = ReceivePort();

  // Memulai Isolate baru dan mengirim SendPort-nya
  await Isolate.spawn(findPrimes, receivePort.sendPort);

  // Menunggu pesan dari Isolate baru
  final result = await receivePort.first;

  print('Isolate utama: Selesai! Ditemukan $result bilangan prima.');
  print('Isolate utama: Program selesai.');
}
