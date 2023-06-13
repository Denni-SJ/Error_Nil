//
//  InvestigationPage.swift
//  Error Nil
//
//  Created by James Do on 9/6/2023.
//

import SwiftUI

struct investigationPage: View {
    @AppStorage("didPerformInitialization") private var didPerformInitialization: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    @State private var showAlert = false
    @State private var showInformation = false
    @State private var investigation = ""
    @State private var refinedChallenge = ""
    @AppStorage("investigation") private var storageInvestigation = ""
    @AppStorage("refinedChallenge") private var storageRefinedChallenge = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.sRGB, red: 1, green: 1, blue: 1)
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 5) {
                    
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "arrow.backward")
                                .font(.largeTitle)
                                .foregroundColor(.black)
                        }
                        Spacer()
                        
                        Text("Investigation")
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
                    
                    Text("Opportunities to explore, research and acquire necessary knowledge and skills for recognizing and creating a significant and enduring solution")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 24))
                        .padding(.top, 40)
                        .padding(.bottom, 10.0)
                    
                    ZStack(alignment: .topLeading) {
                        TextEditor(text: $investigation)
                            .padding(.vertical, 3)
                            .padding(.horizontal, 5)
                            .border(Color.black, width: 1)
                            .multilineTextAlignment(.leading)
                            .frame(height: 100)
                            .lineLimit(5)
                        
                        if investigation.isEmpty {
                            Text("Write your investigations here...")
                                .foregroundColor(.gray)
                                .padding(EdgeInsets(top: 12, leading: 9, bottom: 0, trailing: 0))
                        }
                        
                        Rectangle()
                            .opacity(0.00001)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                UIApplication.shared.sendAction(#selector(UIResponder.becomeFirstResponder), to: nil, from: nil, for: nil)
                            }
                    }
                    
                    Text("Refined Challenge")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 24))
                        .padding(.top, 80)
                        .padding(.bottom, 10.0)
                    
                    ZStack(alignment: .topLeading) {
                        TextEditor(text: $refinedChallenge)
                            .padding(.vertical, 3)
                            .padding(.horizontal, 5)
                            .border(Color.black, width: 1)
                            .multilineTextAlignment(.leading)
                            .frame(height: 100)
                            .lineLimit(5)
                        
                        if refinedChallenge.isEmpty {
                            Text("Write your Refined Challenge here...")
                                .foregroundColor(.gray)
                                .padding(EdgeInsets(top: 12, leading: 9, bottom: 0, trailing: 0))
                        }
                        
                        Rectangle()
                            .opacity(0.00001)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                UIApplication.shared.sendAction(#selector(UIResponder.becomeFirstResponder), to: nil, from: nil, for: nil)
                            }
                    }
                    
                    Spacer()
                        .padding(.top, 40)
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            if investigation.isEmpty || refinedChallenge.isEmpty {
                                showAlert = true
                            } else {
                                showAlert = false
                                storageInvestigation = investigation
                                storageRefinedChallenge = refinedChallenge
                                // Perform any other necessary actions
                            }
                        }) {
                            if investigation.isEmpty && refinedChallenge.isEmpty {
                                Text("Done")
                                    .padding()
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .cornerRadius(10)
                            } else {
                                Text("Update")
                                    .padding()
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    
                    Spacer()
                }
                .padding()
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Error"),
                          message: Text("Please fill in all fields!"),
                          dismissButton: .default(Text("OK")))
                }
                .sheet(isPresented: $showInformation) {
                    investigationPopupView()
                }
            }
        }
        .onAppear {
            if !didPerformInitialization {
                // Perform your initialization logic here
                didPerformInitialization = true
            }
            // Perform any additional logic on view appear
        }
        .navigationBarBackButtonHidden(true)
    }
}




 struct investigationPopupView: View {
     var body: some View {
         VStack {
             Text("Domain Investigation")
                 .font(.headline)
                 .padding()

             Text("A more thorough and polished exploration resulting in the development of a conceptual solution")
                 .font(.subheadline)
                 .padding()
             
             Text("Generating Guiding Questions")
                 .font(.headline)
                 .padding()
             
             Text("Starting from your challenge, produce a number of questions related to your challenge and the various aspects you must explore and learn in order to achieve it")
                 .font(.subheadline)
                 .padding()
             
             Text("Group, Refine & Prioritise")
                 .font(.headline)
                 .padding()
             
             Text("Copy and paste all your questions onto a new page ")
                 .font(.subheadline)
                 .padding()
             
             Text("Build Your Investigation Log")
                 .font(.headline)
                 .padding()
             
             Text("Replicate all the cards you have generated, then move them to the activities log column to begin your investigation. Elaborate each card and record your findings inside them")
                 .font(.subheadline)
                 .padding()

         }
             .padding()
             .background(Color.white)
             .cornerRadius(10)
         
         Spacer()
     }
 }

 struct investigationPage_Previews: PreviewProvider {
     static var previews: some View {
         investigationPage()
     }
 }
