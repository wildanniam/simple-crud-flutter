class StorageItem {
  final String nama;
  final String kategori;
  final String deskripsi;

  StorageItem({
    required this.nama,
    required this.kategori,
    required this.deskripsi,
  });

  factory StorageItem.fromJson(Map<String, dynamic> json) {
    return StorageItem(
      nama: json['nama'],
      kategori: json['kategori'],
      deskripsi: json['deskripsi'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
      'kategori': kategori,
      'deskripsi': deskripsi,
    };
  }
}
