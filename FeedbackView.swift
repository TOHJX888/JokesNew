//
//  FeedbackView.swift
//  Jokes
//
//  Created by RGS on 13/5/23.
//

import SwiftUI

struct FeedbackView: View {
    var isPositiveFeedback: Bool
    
    var body: some View {
        VStack{
            Image(isPositiveFeedback ? "Happy" : "Angry")
                .resizable()
                .scaledToFit()
            Text(isPositiveFeedback ? "YAYYY!!!" : "NoOOOOooo")
        }
    }
}
struct FeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackView(isPositiveFeedback: true)
        FeedbackView(isPositiveFeedback: true)
    }
}
