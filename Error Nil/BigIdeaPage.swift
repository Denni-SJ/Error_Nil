//
//  BigIdeaPage.swift
//  Error Nil
//
//  Created by Antonio Perez on 7/6/2023.
//

import SwiftUI

struct BigIdeaPage: View {
     @State private var bigIdea: String = ""
     @State private var essentialQuestion: String = ""
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
                     TextEditor(text: $bigIdea)
                         .padding(.vertical, 3)
                         .padding(.horizontal, 5)
                         .border(Color.black, width: 1)
                         .multilineTextAlignment(.leading)
                         .frame(height: 100)
                         .lineLimit(5)

                     if bigIdea.isEmpty {

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
                     TextEditor(text: $essentialQuestion)
                         .padding(.vertical, 3)
                         .padding(.horizontal, 5)
                         .border(Color.black, width: 1)
                         .multilineTextAlignment(.leading)
                         .frame(height: 100)
                         .lineLimit(5)

                     if essentialQuestion.isEmpty {

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
                 BigIdeaPopupView()
             }
                 .navigationBarBackButtonHidden(true)
         }

     }///


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
         BigIdeaPage()
     }
 }
