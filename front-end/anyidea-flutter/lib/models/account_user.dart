class UserAccount {
    int id;
    String name;

    UserAccount(this.id, this.name);

    /* construct user account object from json */
    UserAccount.fromJson(Map json):id=json['id'],name=json['name'];

    Map toJson() {
        return {
            'id':id,
            'name':name
        };
    }
}