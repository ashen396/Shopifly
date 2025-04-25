//
//  AddReminderView.swift
//  Shopifly
//
//  Created by Mac on 4/16/25.
//

import SwiftUI
import EventKit

struct AddReminderView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var dateSelected: Date = Date()
    @State var productName: String = ""
    @State var storeName: String = ""
    @State var showAlert: Bool = false
    @State var errorMessage: String = ""
    
    private func AddEvent(){
        let eventStore = EKEventStore()
        eventStore.requestAccess(to: .reminder) { (accessGranted, error) in
            let calendars = eventStore.calendars(for: .reminder)
            
            if let calendar = eventStore.defaultCalendarForNewEvents ?? calendars.first(where: { $0.allowsContentModifications }) {
            let event = EKEvent(eventStore: eventStore)
            event.title = "Checkout \(productName) at \(storeName)"
            event.startDate = dateSelected
            event.endDate = dateSelected.advanced(by: 3600)
            event.calendar = calendar

            do {
                    try eventStore.save(event, span: .thisEvent)
                    self.presentationMode.wrappedValue.dismiss()
                } catch {
                    errorMessage = error.localizedDescription.description
                    showAlert = true
                }
            }
        }
    }
    
    var body: some View {
        VStack{
            Group{
                Spacer()
                    .frame(width: Constants.screenWidth, height: 20, alignment: .center)
                
                HStack{
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .frame(width: 25, height: 25, alignment: .center)
                            .foregroundColor(.gray)
                    })
                }.padding(.horizontal, 25)
                .frame(width: Constants.screenWidth, height: 50, alignment: .trailing)
            }
            
            VStack{
                Text("Add to Reminder")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
                    .frame(width: Constants.screenWidth, height: 20, alignment: .center)
                
                Text("Reminder to checkout the product")
                    .font(.title3)
                    .foregroundColor(.gray)
                
                Spacer()
                    .frame(width: Constants.screenWidth, height: Constants.spacingHeight2, alignment: .center)
                
                DatePicker("Date", selection: $dateSelected, displayedComponents: [.date, .hourAndMinute])
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .padding(.horizontal, 40)
            }.frame(width: Constants.screenWidth, height: 650, alignment: .center)
            
            CustomButton(title: "Add to Calendar", foregroundColor: .white, backgroundColor: .blue){
                AddEvent()
            }.alert(isPresented: $showAlert, content: {
                Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            })
            
        }.frame(width: Constants.screenWidth, height: Constants.screenHeight, alignment: .top)
    }
}

struct AddReminderView_Previews: PreviewProvider {
    static var previews: some View {
        AddReminderView()
    }
}
