

class BankAccount {
  // TODO
  int id;
  String name;
  double balance = 0;

  BankAccount(this.id, this.name);
  credit(double amount) {
    balance = balance + amount;
  }

  withdraw(double amount) {
    if (amount > balance) {
      print("2 much 2 withdraw");
    }
    balance = balance - amount;
  }
}

class Bank {
  // TODO
  String name;
  List<BankAccount> accounts = [];
  Bank({required this.name});

  BankAccount createAccount(int id, String name) {
    for (var account in accounts) {
      if (account.id == id) {
        print("already have an account");
        return account;
      }
    }
    BankAccount newAccount = BankAccount(id, name);
    accounts.add(newAccount);
    return newAccount;
  }
}

void main() {
  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
