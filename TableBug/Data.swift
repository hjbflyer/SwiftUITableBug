import SwiftUI

/// Person with minimal data,
struct Person: Identifiable {
  var id: String
  var name: String
  var firstName: String
  var addresses: [Address]

  init(name: String, firstName: String, addresses: [Address]) {
    self.id = UUID().uuidString
    self.name = name
    self.firstName = firstName
    self.addresses = addresses
  }
}

/// Address with minimal data.
struct Address: Identifiable {
  var id: String
  var street: String
  var zip: String
  var city: String

  init(street: String, zip: String, city: String) {
    self.id = UUID().uuidString
    self.street = street
    self.zip = zip
    self.city = city
  }
}

let person = Person(name: "Muster", firstName: "Hans", addresses: [
  Address(street: "Mauernstr. 1", zip: "10000", city: "Berlin"),
  Address(street: "Hafenstr. 11", zip: "20000", city: "Hamburg")
])
