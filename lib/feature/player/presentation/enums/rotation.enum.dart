enum RotationEnum {
  left,
  right;

  int get value {
    switch(this) {
      case left:
        return -1;
      case right:
        return 1;
    }
  }
}