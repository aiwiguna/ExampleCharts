//
//  CustomPieValueFormatter.swift
//  TestCharts
//
//  Created by Antoni Wiguna on 20/07/20.
//  Copyright © 2020 aiwiguna. All rights reserved.
//

import Foundation
import Charts

public class CustomPieValueFormatter: NSObject, IValueFormatter {
	public func stringForValue(_ value: Double, entry: ChartDataEntry, dataSetIndex: Int, viewPortHandler: ViewPortHandler?) -> String {
		
		let number = modf(value)
		let hour = String(format: "%.0f", number.0)
		let minute = String(format: "%.0f", 60 * number.1)
		return "\(hour) hour \(minute) minute"
	}
}
