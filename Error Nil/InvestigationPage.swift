//
//  InvestigationPage.swift
//  Error Nil
//
//  Created by James Do on 9/6/2023.
//

import SwiftUI

struct investigationPage: View {
     @State private var investigation: String = ""
     @State private var refinedChallenge: String = ""
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

                 Text("Opportunities to explore, research and acquire necessary knowledge and skills for recognising and creating a significant and enduring solution")
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
                     message: Text("Remember you can go back anytime to edit this milestone"),
                     dismissButton: .default(Text("Dismiss")))
             }
                 .sheet(isPresented: $showInformation) {
                 // Content of the pop-up view
                 investigationPopupView()
             }
                 .navigationBarBackButtonHidden(true)
         }
     }///



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