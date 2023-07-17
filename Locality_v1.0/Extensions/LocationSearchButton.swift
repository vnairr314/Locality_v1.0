//
//  LocationSearch.swift
//  Locality_v1.0
//
//  Created by Varun Nair on 7/18/23.
//

import SwiftUI

struct LocationSearchButton: View {
    
    @Binding var isShowingSearchView: Bool
    
    var body: some View {
        
        HStack {
            Button(action: { isShowingSearchView = true }) {
                HStack {
                    Image(systemName: "location")
                        .symbolVariant(.fill)
                        .padding(.horizontal)
                    
                    Text("Search here")
                        .foregroundColor(Color(.darkGray))
                        .font(.subheadline)
                        .padding(.vertical, 5)
                        .background(
                            RoundedRectangle(cornerRadius: 15).fill(Color(UIColor.systemBackground))
                        )
                    
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width - 44, height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .shadow(color: .black, radius: 6))
            }
        }
    }
}

/*
#Preview {
    LocationSearchButton()
}
*/
