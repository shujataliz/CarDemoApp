//
//  CarDetailScreen.swift
//  CarAssignment
//
//  Created by Shujat Ali on 31/10/2023.
//

import SwiftUI

// Create the second screen
struct CarDetailScreen: View {
    var car: ItemViewModel

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: car.imageUrl))
            Text("Selected Car Model: **\(car.title)**")
            Text("Amount in Stock: **\(car.stock)**")
            Text(car.moreDetail)
            
            Spacer()
        }
        .navigationBarTitle(car.title)
    }
}

#Preview {
    NavigationStack {
        CarDetailScreen(car: ItemViewModel())
    }
    
}
