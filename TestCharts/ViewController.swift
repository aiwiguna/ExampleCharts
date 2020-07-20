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
	
	@IBOutlet weak var chart: PieChartView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupChartData()
	}
	
	private func setupChartData() {
		var dataEntries: [ChartDataEntry] = []
		
		let forY: [Double] = [80.5, 70.6, 0.2 ,0 ,0]
		
		for i in 0..<forY.count {
			if forY[i] != 0 {
				let dataEntry = ChartDataEntry(x: Double(i+1), y: forY[i])
				dataEntries.append(dataEntry)
			}
			
		}
		let dataSet = PieChartDataSet(entries: dataEntries, label: "")
		let data = PieChartData(dataSet: dataSet)
		
		data.setValueFormatter(CustomPieValueFormatter())
		chart.data = data
	}
}

