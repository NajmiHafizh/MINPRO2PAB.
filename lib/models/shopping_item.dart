class ShoppingItem {
  final String id;
  final String nama;
  final int jumlah;
  final String kategori;

  ShoppingItem({
    required this.id,
    required this.nama,
    required this.jumlah,
    required this.kategori,
  });

  factory ShoppingItem.fromMap(Map<String, dynamic> map) {
    return ShoppingItem(
      id: map['id'].toString(),
      nama: map['nama'] ?? '',
      jumlah: map['jumlah'] is int
          ? map['jumlah']
          : int.tryParse(map['jumlah'].toString()) ?? 0,
      kategori: map['kategori'] ?? 'Makanan', // default kategori kalau kosong
    );
  }

  Map<String, dynamic> toMap() {
    return {'nama': nama, 'jumlah': jumlah, 'kategori': kategori};
  }
}
