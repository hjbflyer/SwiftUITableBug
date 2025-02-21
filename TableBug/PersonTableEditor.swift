//
//  PersonTableEditor.swift
//  TableBug
//
//  Created by Hans-J. Brede on 20.02.25.
//

import SwiftUI

struct PersonTableEditor: View {
  @Environment(\.dismiss) var dismiss
  @State var showingEditPage = false
  @State private var selected: Address.ID?
  @State var person: Person
  @State var sortOrder = [KeyPathComparator(\Address.id)]
  @State var perferred = false
  var body: some View {
    VStack {
      TextField("Name", text: $person.name)
      TextField("Firstname", text: $person.firstName)
      Table(person.addresses) {
        TableColumn("Street", value: \Address.street)
        TableColumn("Zip", value: \Address.zip)
        TableColumn("City", value: \Address.city)
      }
      Button { dismiss() } label: { Text("Cancel") }
    }
    // Work around to display the table
    .frame(height: 250.0)
    // ^^^^^^^^^^^^^^^^^^
    .padding()
  }
}

#Preview {
  PersonTableEditor(person: person)
}
