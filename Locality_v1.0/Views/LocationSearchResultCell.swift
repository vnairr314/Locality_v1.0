//
//  LocationSearchResultCell.swift
//  Locality_v1.0
//
//  Created by Varun Nair on 7/18/23.
//

import SwiftUI

struct LocationSearchResultCell: View {
    var body: some View {
        HStack {
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .foregroundColor(.blue)
                .accentColor(.white)
                .frame(width: 35, height: 35)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Starbucks Coffee")
                    .font(.body)
                
                Text("550 W 54th St, New York NY")
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                
                Divider()
            }
            .padding(.leading, 8)
            .padding(.vertical, 8)
        }
        .padding(.leading)
    }
}

#Preview {
    LocationSearchResultCell()
}
