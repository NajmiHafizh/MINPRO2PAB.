import 'package:flutter/material.dart';
import '../models/shopping_item.dart';
import '../services/supabase_service.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class FormPage extends StatefulWidget {
  final ShoppingItem? item;

  const FormPage({super.key, this.item});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _namaController = TextEditingController();
  final _jumlahController = TextEditingController();
  String? _selectedKategori;

  final SupabaseService service = SupabaseService();

  final List<String> _kategoriOptions = [
    'Makanan',
    'Minuman',
    'Peralatan',
    'Kebutuhan Lainnya',
  ];

  @override
  void initState() {
    super.initState();

    if (widget.item != null) {
      _namaController.text = widget.item!.nama;
      _jumlahController.text = widget.item!.jumlah.toString();

      final kategoriDb = widget.item!.kategori.trim();

      _selectedKategori = _kategoriOptions.firstWhere(
        (e) => e.toLowerCase() == kategoriDb.toLowerCase(),
        orElse: () => _kategoriOptions.first,
      );
    } else {
      _selectedKategori = _kategoriOptions.first;
    }
  }

  Future<void> simpanItem() async {
    final nama = _namaController.text.trim();
    final jumlah = int.tryParse(_jumlahController.text.trim()) ?? 0;
    final kategori = _selectedKategori;

    if (nama.isEmpty || jumlah <= 0 || kategori == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Isi semua field dengan benar")),
      );
      return;
    }

    final item = ShoppingItem(
      id: widget.item?.id ?? '',
      nama: nama,
      jumlah: jumlah,
      kategori: kategori,
    );

    try {
      if (widget.item == null) {
        await service.createItem(item);
      } else {
        await service.updateItem(item);
      }

      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Terjadi kesalahan: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.item != null;

    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? "Edit Barang" : "Tambah Barang")),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            CustomTextField(controller: _namaController, label: "Nama Barang"),
            const SizedBox(height: 16),

            CustomTextField(
              controller: _jumlahController,
              label: "Jumlah Barang",
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 16),

            DropdownButtonFormField<String>(
              value: _selectedKategori,
              decoration: const InputDecoration(labelText: "Kategori"),
              items: _kategoriOptions
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedKategori = value;
                });
              },
            ),

            const SizedBox(height: 30),

            CustomButton(
              text: isEdit ? "Update Barang" : "Tambah Barang",
              onPressed: simpanItem,
            ),
          ],
        ),
      ),
    );
  }
}
