//
//  ProgressWheel.swift
//  Error Nil
//
//  Created by Antonio Perez on 9/6/2023.
//

import SwiftUI

struct ProgressWheel: View {
    @State var goToBigIdea: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Image("logo3")
                    .resizable()
                    .frame(width: 260, height: 260, alignment: .center)
                Text("Progress Wheel Placeholder")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.black)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onTapGesture {
                goToBigIdea = true
            }
            .background(
                 NavigationLink(destination: BigIdeaPage(), isActive: $goToBigIdea) {
                     EmptyView()
                 }
                 .hidden()
             )
           
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ProgressWheel_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView { // Wrap the Welcome view with NavigationView
            ProgressWheel()
        }
        .previewDevice("iPhone 14 Pro")
    }
}
