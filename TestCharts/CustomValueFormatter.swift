//
//  CustomValueFormatter.swift
//  TestCharts
//
//  Created by Antoni Wiguna on 06/07/20.
//  Copyright © 2020 aiwiguna. All rights reserved.
//

import Foundation
import Charts

public class CustomValueFormatter: NSObject, IAxisValueFormatter {
	
	public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
		
		if value > 0 && value < 13 {
			var comp = DateComponents()
			comp.month = Int(value)
			comp.year = 2020
			
			let cal = Calendar.init(identifier: .gregorian)
			let date = cal.date(from: comp)
			
			let formatter = DateFormatter()
			formatter.dateFormat = "MMM ''yy"
			
			return formatter.string(for: date) ?? ""
		}else {
			return ""
		}
		
	}
}
