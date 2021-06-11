extension GenericExt<T> on T {
  R let<R>(R Function(T t) transform) => transform(this);

  R? safeCast<R>() => this is R ? (this as R) : null;
}
