abstract interface class ObservedData<T> {
  factory ObservedData.empty() = EmptyData;

  factory ObservedData.found(T value) = FoundData;
}

class EmptyData<T> implements ObservedData<T> {}

class FoundData<T> implements ObservedData<T> {
  T value;

  FoundData(this.value);
}
