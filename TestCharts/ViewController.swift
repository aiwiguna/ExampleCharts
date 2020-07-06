//
//  ViewController.swift
//  TestCharts
//
//  Created by Antoni Wiguna on 06/07/20.
//  Copyright © 2020 aiwiguna. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {
	
	@IBOutlet weak var chart: LineChartView!
	
	
	let today = Date()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		setupChart()
		setupChartData()
	}
	
	private func setupChart() {
		let leftAxis = chart.leftAxis
		leftAxis.axisMinimum = -10
		leftAxis.axisMaximum = 400
		leftAxis.granularity = 100
		
		let rightAxis = chart.rightAxis
		rightAxis.enabled = false
		
		let startTime: Date = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month, .day], from: today)) ?? today
		
		var dayComponent = DateComponents()
		dayComponent.day = 1
		let endTime: Date = Calendar.current.date(byAdding: dayComponent, to: startTime) ?? today
		
		let xAxis = chart.xAxis
		xAxis.valueFormatter = TimeValueFormatter()
		xAxis.axisMinimum = startTime.timeIntervalSince1970
		xAxis.axisMaximum = endTime.timeIntervalSince1970
		xAxis.labelPosition = .bottom
		xAxis.granularity = 3600
		
		chart.setVisibleXRange(minXRange: 5 * 3600, maxXRange: 5 * 3600)
	}
	
	private func setupChartData() {
		var dataEntries: [ChartDataEntry] = []
		
		let startTime: Date = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month, .day], from: today)) ?? today
		
		
		for i in 0..<1000 {
			let value = arc4random_uniform(400)
			if value != 0 {
				let dataEntry = ChartDataEntry(x: Double(i) + startTime.timeIntervalSince1970, y: Double(value))
				dataEntries.append(dataEntry)
			}
			
		}
		let dataSet = LineChartDataSet(entries: dataEntries, label: "")
		let data = LineChartData(dataSet: dataSet)
		chart.data = data
	}
}

