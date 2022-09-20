extension Let<T extends Object> on T {
  ReturnType let<ReturnType>(ReturnType Function(T self) callback) {
    return callback(this);
  }
}
