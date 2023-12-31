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
    @StateObject var viewModel = LocationSearchModel()
    @State private var isTextFieldInFocus = false
    
    var body: some View {
        
        VStack {
            /// Header View
            HStack {
                Button(action: { isShowingSearchView = false }) {
                    Image(systemName: "chevron.backward")
                        .symbolVariant(.fill)
                        .padding(.horizontal)
                }
                
                TextField("Search here", text: $viewModel.queryFragment)
                    .foregroundColor(Color(.label))
                    .font(.subheadline)
                    .padding(.vertical, 5)
                    .background(Color(UIColor.systemBackground))
                    .background(
                        RoundedRectangle(cornerRadius: 15).fill(Color.white))
                    .focusable(isTextFieldInFocus)
                    .onAppear {
                        isTextFieldInFocus = true
                    }
                
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width - 44, height: 50)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color(UIColor.systemBackground))
                    .shadow(color: .black, radius: 3)
            )
            .padding(.top, 10)
            
            Divider()
                .padding(.vertical)
            
            /// List View
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(viewModel.results, id: \.self) { result in
                        if !result.title.isEmpty {
                            LocationSearchResultCell(title: result.title, subtitle: result.subtitle)
                        }
                    }
                }
            }
        }
        .background(Color(UIColor.systemBackground))
        .navigationBarHidden(true)
        .preferredColorScheme(.light)
    }
}

/*
#Preview {
    @StateObject static var viewModel = ViewModel()
    LocationSearchView(viewModel: viewModel)
}
*/
