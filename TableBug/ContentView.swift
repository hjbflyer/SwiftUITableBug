import SwiftUI



struct ContentView: View {
  @State private var showingEditPage = false
  @State private var selected: Person.ID?
  @State var persons: [Person]
  @State var sortOrder = [KeyPathComparator(\Person.id)]
  var body: some View {
    VStack {
      Table(persons, selection: $selected, sortOrder: $sortOrder) {
        TableColumn("Name", value: \.name).width(100.0)
        TableColumn("Firstname", value: \.firstName ).width(100.0)
        TableColumn("Addresses", value: \.addresses, comparator: KeyPathComparator(\[Address].description)) { pers in
          ForEach(pers.addresses) { adr in
            HStack {
              Text(adr.street)
              Text(adr.zip)
              Text(adr.city)
            }}
        }
      }
      .contextMenu(forSelectionType: Person.ID.self) { _ in
        Button("Edit ...") { showingEditPage = true}.disabled(selected == nil)
      }
      .sheet(isPresented: $showingEditPage) {
        PersonTableEditor(person: person).id(UUID())
      }
    }
    .padding()
  }
}

#Preview {
  ContentView(persons: [person])
}

