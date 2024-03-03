import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/features/select_contacts/repository/select_contact_repository.dart';

final contactprovider = FutureProvider((ref) {
  final getcontact = ref.watch(getcontactsproviderrepostry);

  return getcontact.getcontacts();
});
final selectcontactprovider = Provider((ref) {
  final selectconactreposit = ref.watch(getcontactsproviderrepostry);
  return selectcontactcontorller(
      ref: ref, selectcontactsrepository: selectconactreposit);
});

class selectcontactcontorller {
  selectcontactcontorller({
    required this.ref,
    required this.selectcontactsrepository,
  });

  final ProviderRef ref;
  Selectcontactsrepository selectcontactsrepository;

  selectcontactcontoller(BuildContext context, Contact selectedcontact) {
    selectcontactsrepository.Selectcontactfromlist(selectedcontact, context);
  }
}
