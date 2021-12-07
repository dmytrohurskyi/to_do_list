List<String> descendingStringSort(List<String> array){
  array.sort((b, a) => a.compareTo(b));
  return array;
}