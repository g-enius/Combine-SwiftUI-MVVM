//
//  DailyWeatherRow.swift
//  test2
//
//  Created by Charles Wang on 5/09/21.
//

import SwiftUI

struct DailyWeatherRow: View {
    private let viewModel: DailyWeatherRowViewModel
    
    init(viewModel: DailyWeatherRowViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack {
            VStack {
                Text("\(viewModel.day)")
                Text("\(viewModel.month)")
            }
            
            VStack(alignment: .leading) {
                Text("\(viewModel.title)")
                    .font(.body)
                Text("\(viewModel.fullDescription)")
                    .font(.footnote)
            }
            .padding(.leading, 8)
            
            Spacer()
            
            Text("\(viewModel.temperature)")
                .font(.title)
        }
    }
}
//
//struct DailyWeatherRow_Previews: PreviewProvider {
//    static var previews: some View {
//
//        DailyWeatherRow(viewModel: <#T##DailyWeatherRowViewModel#>)
//    }
//}
