import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/shopping_item.dart';

class SupabaseService {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<List<ShoppingItem>> getItems() async {
    final response = await supabase
        .from('shopping_items')
        .select()
        .order('nama');
    if (response == null) return [];
    return (response as List)
        .map((e) => ShoppingItem.fromMap(e as Map<String, dynamic>))
        .toList();
  }

  Future<void> createItem(ShoppingItem item) async {
    await supabase.from('shopping_items').insert(item.toMap());
  }

  Future<void> updateItem(ShoppingItem item) async {
    await supabase
        .from('shopping_items')
        .update(item.toMap())
        .eq('id', item.id);
  }

  Future<void> deleteItem(String id) async {
    await supabase.from('shopping_items').delete().eq('id', id);
  }
}
