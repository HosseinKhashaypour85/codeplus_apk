String setCategoryById(String id) {
  id = id.trim(); // Remove unnecessary spaces
  switch (id) {
    case '1gglq6i1rluxecl':
      return 'بک اند';
    case '5zu3vwomlu8kyt3':
      return 'فرانت اند';
    case '3pv8ugzwgje6rcg':
      return 'طراحی اپلیکیشن';
    case 's0le4meuq5bovis':
      return 'طراحی وب';
    default:
      return 'ناشناس';
  }
}
