public with sharing class ContractorInfoController {
  @AuraEnabled(cacheable=true)
  public static Contact getContact() {
    return ContactsService.getLoginContact();
  }
}