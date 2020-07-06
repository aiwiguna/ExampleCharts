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
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		setupChart()
		setupChartData()
	}
	
	private func setupChart() {
		let leftAxis = chart.leftAxis
		leftAxis.axisMinimum = -10
		leftAxis.axisMaximum = 100
		leftAxis.granularity = 20
		leftAxis.drawGridLinesEnabled = false
		
		let rightAxis = chart.rightAxis
		rightAxis.enabled = false
		
		let xAxis = chart.xAxis
		xAxis.valueFormatter = CustomValueFormatter()
		xAxis.axisMinimum = 0
		xAxis.axisMaximum = 13
		xAxis.labelPosition = .bottom
		xAxis.granularity = 1
		xAxis.drawGridLinesEnabled = false
		
		chart.setVisibleXRange(minXRange: 5, maxXRange: 5)
	}
	
	private func setupChartData() {
		var dataEntries: [ChartDataEntry] = []
		
		let forY: [Double] = [80, 70, 0 ,0 ,0]
		
		for i in 0..<forY.count {
			if forY[i] != 0 {
				let dataEntry = ChartDataEntry(x: Double(i+1), y: forY[i])
				dataEntries.append(dataEntry)
			}
			
		}
		let dataSet = LineChartDataSet(entries: dataEntries, label: "")
		let data = LineChartData(dataSet: dataSet)
		chart.data = data
	}
}

