//
//  PersonaePage.swift
//  Error Nil
//
//  Created by Mingpeng Wang on 9/6/2023.
//

import SwiftUI

struct PersonaePage: View {
     @State private var personae: String = ""
     @State private var opportunityStatement: String = ""
     @State private var showAlert = false
     @State private var showInformation = false

     var body: some View {
         ZStack {
             Color(.sRGB, red: 1, green: 1, blue: 1)
                 .edgesIgnoringSafeArea(.all)
             VStack(spacing: 5) {

                 HStack {
                     Image(systemName: "arrow.backward")
                         .font(.system(size: 30, weight: .bold))
                         .foregroundColor(.black)
                     Spacer()

                     Text("Personae")
                         .font(.largeTitle)
                         .frame(maxWidth: .infinity, alignment: .center)
                     Spacer()

                     Button(action: {
                         showInformation = true
                     }) {
                         Image(systemName: "info.circle")
                             .font(.largeTitle)
                             .foregroundColor(.black)
                     }


                 }
                     .padding()

                 Text("Create a persona of the person you built this app for")
                     .frame(maxWidth: .infinity, alignment: .leading)
                     .font(.system(size: 24))
                     .padding(.top, 40)
                     .padding(.bottom, 10.0)

                 ZStack(alignment: .topLeading) {
                     TextEditor(text: $personae)
                         .padding(.vertical, 3)
                         .padding(.horizontal, 5)
                         .border(Color.black, width: 1)
                         .multilineTextAlignment(.leading)
                         .frame(height: 100)
                         .lineLimit(5)

                     if personae.isEmpty {

                         Text("Describe the persona here... \n\nHint: Don't be afraid to be specific ")
                             .foregroundColor(.gray)
                             .padding(EdgeInsets(top: 12, leading: 9, bottom: 0, trailing: 0))
                     }
                 }



                 Text("Create an Opportunity Statement")
                     .frame(maxWidth: .infinity, alignment: .leading)
                     .font(.system(size: 24))
                     .padding(.top, 80)
                     .padding(.bottom, 10.0)


                 ZStack(alignment: .topLeading) {
                     TextEditor(text: $opportunityStatement)
                         .padding(.vertical, 3)
                         .padding(.horizontal, 5)
                         .border(Color.black, width: 1)
                         .multilineTextAlignment(.leading)
                         .frame(height: 100)
                         .lineLimit(5)

                     if opportunityStatement.isEmpty {

                         Text("Write down the Opportunity Statement here... ")
                             .foregroundColor(.gray)
                             .padding(EdgeInsets(top: 12, leading: 9, bottom: 0, trailing: 0))
                     }
                 }


                 Spacer()
                     .padding(.top, 40)
                 HStack {
                     Spacer()
                     Button(action: {
                         showAlert = true
                     }) {
                         Text("Done")
                             .padding()
                             .background(Color.green)
                             .foregroundColor(.white)
                             .font(.title)
                             .cornerRadius(10)
                     }
                 }

                 Spacer()
             }
                 .padding()
                 .alert(isPresented: $showAlert) {
                 Alert(title: Text("Congratulations!"),
                     message: Text("Remeber you can go back anytime to edit this milestone"),
                     dismissButton: .default(Text("Dismiss")))
             }
                 .sheet(isPresented: $showInformation) {
                 // Content of the pop-up view
                 PersonaePopupView()
             }
         }

     }


 }

 struct PersonaePopupView: View {
     var body: some View {
             ScrollView {
                 VStack {
                     Text("Personae")
                         .font(.title)
                         .bold()
                         .padding()
                     
                     VStack(alignment: .leading) { // Align VStack content to the leading edge (left)
                         Group {
                             Text("Domain Personae")
                                 .font(.system(size: 20))
                                 .bold()

                             
                             Text("Create a persona of the person you built this app for.")
                                 .font(.system(size: 16))

                             
                             Text("Demographics")
                                 .font(.system(size: 17))
                                 .bold()
                             
                             Text("name, age, gender, role ,profession, etc.")
                                 .font(.system(size: 16))
                                                     
                             
                             Text("Goals, Needs")
                                 .font(.system(size: 17))
                                 .bold()
                             
                             Text("What do they need or wish could happen, what are they currently doing to address the problem.")
                                 .font(.system(size: 16))

                             
                             Text("Pain/Problems/Obstacles")
                                 .font(.system(size: 17))
                                 .bold()

                             
                             Text("What is the primary issue/ getting in the way.")
                                 .font(.system(size: 16))
                             
                             Text("Scenarios")
                                 .font(.system(size: 17))
                                 .bold()

                             Text("Describe some concrete and specific circumstances in which the user is struggling, trying to address an issue or dealing with a need.")
                                 .font(.system(size: 16))

                            
                             }
                         .padding(.horizontal, 10)
                         .padding(.bottom,20)
                         
                         Divider()
                         Group {
                             Text("Problem/Opportunity Statement")
                                 .font(.system(size: 20))
                                 .bold()
                             
                             Text("Create an opportunity statement that you have discovered from the persona.")
                                 .font(.system(size: 16))
                                 
                                 
                             
                             Text("Write down your Statement using the provided format below:")
                                 .font(.system(size: 16))
         
                             
                             Text("[Persona] [needs/wants/wishes] [because]")
                                 .font(.system(size: 16))
                                 .foregroundColor(.secondary)
                                 .padding(.horizontal, 16)
                             
                             Text("An example:\n\nNew mentors \n\nneeds a way to move their first steps into the new mentor role, \n\nbecause they're concerned about running a class for the first time.")
                                 .font(.system(size: 16))
                             
                         }
                         .padding(.horizontal, 10)
                         .padding(.bottom,20)
                             
              
                                 
                         }
                         
                         Spacer()
                     }
                     .frame(maxWidth: .infinity, alignment: .leading) // Set frame alignment to leading edge
                     
                 }
             }
         
 }

 struct PersonaePage_Previews: PreviewProvider {
     static var previews: some View {
         PersonaePage()
     }
 }

