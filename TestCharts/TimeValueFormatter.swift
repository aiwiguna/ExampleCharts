//
//  TimeValueFormatter.swift
//  TestCharts
//
//  Created by Antoni Wiguna on 06/07/20.
//  Copyright © 2020 aiwiguna. All rights reserved.
//

import Foundation
import Charts

public class TimeValueFormatter: NSObject, IAxisValueFormatter {
	
	public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
		
		let date = Date(timeIntervalSince1970: value)
		
		let formatter = DateFormatter()
		formatter.dateFormat = "HH:mm"
		
		return formatter.string(for: date) ?? ""
	}
}
