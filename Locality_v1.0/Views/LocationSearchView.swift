//
//  LocationSearchView.swift
//  Locality_v1.0
//
//  Created by Varun Nair on 7/18/23.
//

import SwiftUI

struct LocationSearchView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var isShowingSearchView: Bool
    @State private var searchText = ""
    
    var body: some View {
        
        VStack {
            /// Header View
            HStack {
                Button(action: { isShowingSearchView = false }) {
                    Image(systemName: "chevron.backward")
                        .symbolVariant(.fill)
                    .padding(.horizontal)
                }
                
                TextField("Search here", text: $searchText)
                    .foregroundColor(.secondary)
                    .font(.subheadline)
                    .padding(.vertical, 5)
                    .background(Color(UIColor.systemBackground))
                    .background(
                        RoundedRectangle(cornerRadius: 15))
                
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width - 44, height: 50)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white)
                    .shadow(color: .black, radius: 3)
            )
            .padding(.top, 10)
            
            Divider()
                .padding(.vertical)
            
            /// List View
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(0..<7, id: \.self) { _ in
                        LocationSearchResultCell()
                    }
                }
            }
        }
        .background(.white)
        .navigationBarHidden(true)
    }
}

/*
#Preview {
    @StateObject static var viewModel = ViewModel()
    LocationSearchView(viewModel: viewModel)
}
*/
