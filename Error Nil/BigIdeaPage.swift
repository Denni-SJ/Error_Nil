//
//  BigIdeaPage.swift
//  Error Nil
//
//  Created by Antonio Perez on 7/6/2023.
//

import SwiftUI

struct BigIdeaPage: View {
    @AppStorage("didPerformInitialization") private var didPerformInitialization: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @State private var showAlert = false
    @State private var showInformation = false
    @State private var bigIdea1 = ""
    @State private var bigIdea2 = ""
    @AppStorage("BigIdea1") private var storageBigIdea1 = ""
    @AppStorage("BigIdea2") private var storageBigIdea2 = ""
    
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
                        
                        Text("Big Idea")
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
                    
                    Text("A Big Idea is a broad concept that can be explored in multiple ways")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 24))
                        .padding(.top, 40)
                        .padding(.bottom, 10.0)
                    
                    ZStack(alignment: .topLeading) {
                        TextEditor(text: $bigIdea1)
                            .padding(.vertical, 3)
                            .padding(.horizontal, 5)
                            .border(Color.black, width: 1)
                            .multilineTextAlignment(.leading)
                            .frame(height: 100)
                            .lineLimit(5)
                        
                        if bigIdea1.isEmpty {
                            Text("Write your Big Idea here...")
                                .foregroundColor(.gray)
                                .padding(EdgeInsets(top: 12, leading: 9, bottom: 0, trailing: 0))
                        }
                    }
                    
                    Text("Essential Question")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 24))
                        .padding(.top, 80)
                        .padding(.bottom, 10.0)
                    
                    ZStack(alignment: .topLeading) {
                        TextEditor(text: $bigIdea2)
                            .padding(.vertical, 3)
                            .padding(.horizontal, 5)
                            .border(Color.black, width: 1)
                            .multilineTextAlignment(.leading)
                            .frame(height: 100)
                            .lineLimit(5)
                        
                        if bigIdea2.isEmpty {
                            Text("Write your Essential Question here...")
                                .foregroundColor(.gray)
                                .padding(EdgeInsets(top: 12, leading: 9, bottom: 0, trailing: 0))
                        }
                    }
                    
                    Spacer()
                        .padding(.top, 40)
                    HStack {
                        Spacer()
                        Button(action: {
                            if bigIdea1.isEmpty || bigIdea2.isEmpty {
                                showAlert = true
                            } else {
                                storageBigIdea1 = bigIdea1
                                storageBigIdea2 = bigIdea2
                                showAlert = false
                                // Perform your logic here if validation passes
                                // ...
                            }
                        }) {
                            if storageBigIdea1.isEmpty && storageBigIdea2.isEmpty {
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
                    BigIdeaPopupView()
                }
            }
        }
        .onAppear {
            print("didPerformInitialization value: \(didPerformInitialization)")
            if !didPerformInitialization {
                // Perform your initialization logic here
                didPerformInitialization = true
            }
            // Perform any additional logic on view appear
        }
        .navigationBarBackButtonHidden(true)
    }
}



struct BigIdeaPopupView: View {
    var body: some View {
        VStack {
            Text("Big Idea Information")
                .font(.headline)
                .padding()
            
            Text("Information about Big Idea goes here")
                .font(.subheadline)
                .padding()
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
    }
}

struct BigIdeaPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BigIdeaPage()
        }
        .previewDevice("iPhone 14 Pro")
    }
}
