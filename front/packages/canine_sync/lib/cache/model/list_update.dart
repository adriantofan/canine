class ListUpdate<T> {
  // This are the all the items in the list after all changes were applied
  List<T> items;
  ListUpdate(
    this.items,
  );
  static empty<T, ID>() => ListUpdate<T>([]);
}
