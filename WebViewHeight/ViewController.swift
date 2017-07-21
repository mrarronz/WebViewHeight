//
//  ViewController.swift
//  WebViewHeight
//
//  Created by Arron Zhu on 2017/7/19.
//  Copyright © 2017年 mrarronz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIWebViewDelegate {

    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    @IBOutlet weak var indicatorLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var webViewDict = Dictionary<Int, UIWebView>.init()
    var heightDict = Dictionary<Int, CGFloat>.init()
    let screenWidth = UIScreen.main.bounds.size.width
    
    var testArray = [
        "<p>如图，已知直线a∥b，点A、B、C在直线a上，点D、E、F在直线b上，AB=EF=2，若△CEF的面积为5，则△ABD的面积为（ &nbsp; ）<br/><img src=\"http://tikuimg.iknei.com/data/uploads/tiku/radio/2016/10/18/5805dd6f06162.png\" title=\"5805dd6f06162.png\" alt=\"001.png\"/></p>",
        "<p>下列说法中错误的个数是（　　）<br/>（1）过一点有且只有一条直线与已知直线平行．<br/>（2）在同一平面内，两条直线的位置关系只有相交、平行两种．<br/>（3）不相交的两条直线叫做平行线．<br/>（4）相等的角是对顶角．</p>",
        "<p>下列图象能正确反映其对应关系的是（  ）</p><p><img src=\"http://tiku.iknei.com/data/uploads/tiku/radio/20161024/1477294014245818.png\" title=\"580db7b6cd662.png\" alt=\"图片7.png\"/>向氢氧化钠溶液中加水稀释<p/><p><img src=\"http://tiku.iknei.com/data/uploads/tiku/radio/20161024/1477294029215305.png\" title=\"580db7c4104ae.png\" alt=\"图片8.png\"/>浓硫酸敞口放置一段时间<p/><p><img src=\"http://tiku.iknei.com/data/uploads/tiku/radio/20161024/1477294043929873.png\" title=\"580db7d256ed7.png\" alt=\"图片9.png\"/>向饱和石灰水中加入少量生石灰<p/><p><img src=\"http://tiku.iknei.com/data/uploads/tiku/radio/20161024/1477294059604496.png\" title=\"580db7e0e9f72.png\" alt=\"图片10.png\"/>MnO<sub>2</sub>对过氧化氢溶液分解的影响<p/>",
        "<p>有理数a、b、c在数轴上的位置如图所示,<br/><img src=\"http://tikuimg.iknei.com/data/uploads/tiku/radio/2016/07/22/57918bf54e24c.png\" title=\"57918bf54e24c.png\" alt=\"41.png\"/></p>\n<p>化简：|b-a|+|b+c|-|a-c|<br/></p>",
        "<p>小轩从如图所示的二次函数<img src=\"http://tiku.iknei.com/data/uploads/tiku/radio/20160720/1469006019801023.png\" title=\"578f40b8a2b3b.png\" alt=\"1.png\"/>的图像中，观察得出了下面五条信息：<br/><img src=\"http://tiku.iknei.com/data/uploads/tiku/radio/20160720/1469006051632168.png\" title=\"578f40c964b0e.png\" alt=\"2.png\"/><br/><img src=\"http://tiku.iknei.com/data/uploads/tiku/radio/20160720/1469006051192950.png\" title=\"578f40ce333cb.png\" alt=\"3.png\"/><img src=\"http://tiku.iknei.com/data/uploads/tiku/radio/20160720/1469006051575112.png\" title=\"578f40d0d63f2.png\" alt=\"4.png\"/><img src=\"http://tiku.iknei.com/data/uploads/tiku/radio/20160720/1469006051481142.png\" title=\"578f40d34a092.png\" alt=\"5.png\"/><img src=\"http://tiku.iknei.com/data/uploads/tiku/radio/20160720/1469006052833535.png\" title=\"578f40d5d6d65.png\" alt=\"6.png\"/><img src=\"http://tiku.iknei.com/data/uploads/tiku/radio/20160720/1469006052458533.png\" title=\"578f40d84d10b.png\" alt=\"7.png\"/><br/>你认为其中正确信息的个数有（  ）</p>",
        "<p>&nbsp; &nbsp; As has been all too apparent in recent days at Balcombe, few issues cause greater concern than energy policy. Many village communities feel their countryside is being ruined by the power-producing machines of wind farms; yet they never take &quot;direct action&quot;, even though the planning laws put them at a severe disadvantage. And the generous subsidies (财政补贴) , which encourage the expansion of wind power, are not favorable to the village communities and set landowners in conflict with other residents (居民) .<br/></p><p>&nbsp; &nbsp; Those who disagree with the rapid expansion of wind farms state that the damage they cause is out of proportion(比例) to the benefits they bring, because their energy output cannot match that of the carbon-based power stations they are supposed to replace. Supporters insist that wind must be part of a mix of renewables, nuclear and carbon, and that the country is committed to meeting EU ( European Union) targets for non-carbon energy generation.&nbsp;</p><p>&nbsp; &nbsp;Against this background, the fact that there is an argument within the Government over whether to publish an official report on wind farms&#39; impact on the countryside becomes even more extraordinary. The two parties in the coalition (联合) government are in disagreement over what it should say.</p><p>&nbsp; &nbsp;We have some advice for the two parties: publish the report, and let the country be the judge.Even if it contains evidence that wind farms are harmful, it will hardly be a pleasant surprise to people who do not like them. Equally, supporters must argue their case by acknowledging the concerns and explaining why they are either misplaced or worthy of much attention.</p><p>&nbsp; &nbsp;The suggestion that further negotiations are to take place to produce an &quot;acceptable&quot; report suggests that the politics of coalition government are doing the country harm in a certain way. Given the sensitivities involved, all the information should be available so that people can reach their own conclusions, rather than being left with the suspicion（猜疑）that facts are being replaced by political beliefs.</p>\n<p>1. We can learn from the first paragraph that__________.<br/></p><p>A. energy policy catches much attention of the public<br/>B. the residents are in favor of the expansion of wind farms<br/>C. many village communities are satisfied with the subsidies<br/>D. the planning laws offer great benefits to the residents<br/>2. Supporters think that the expansion of wind power__________.<br/>A. is more rapid than that of carbon-based power<br/>B. guarantees an increase in energy output<br/>C. is expected to be much better than that of nuclear power<br/>D. agrees with EU targets for non-carbon energy generation<br/>3. It can be inferred from the passage that__________.<br/>A. an official report will settle the energy problem<br/>B. the two parties are divided over the issue of wind farms<br/>C. the two parties have agreed on a further negotiation<br/>D. political beliefs concerning energy issue go against facts<br/>4. Which of the following reflects the author&#39;s opinion?<br/>A. Increase political impact on energy policy.<br/>B. Release a statement of supporters on wind farms.<br/>C. Let the nation judge the facts about wind power.<br/>D. Leave the two parties to reach their own conclusions.</p>"
    ]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        showLoading()
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "UITableViewCell")
        calculateWebHeight()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showLoading() {
        indicatorView.startAnimating()
        indicatorLabel.isHidden = false
    }
    
    func hideLoading() {
        indicatorView.stopAnimating()
        indicatorLabel.isHidden = true
    }
    
    // MARK: - UITableViewCellDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.testArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "UITableViewCell")
        }
        for subView in (cell?.contentView.subviews)! {
            if subView.isKind(of: UIWebView.classForCoder()) {
                subView.removeFromSuperview()
            }
        }
        let webView = webViewDict[indexPath.section]
        cell?.contentView.addSubview(webView!)
        return cell!
    }
    
    // MARK: - UITableViewCellDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if heightDict.count == 0 {
            return 44
        }
        let height = heightDict[indexPath.section]!
        if height != 0 {
            return height
        }
        return 44;
    }
    
    // MARK: -
    func calculateWebHeight() {
        for html in self.testArray {
            let index = self.testArray.index(of: html)
            var htmlString = html
            if htmlString.contains("<img") {
                htmlString = htmlString.replacingOccurrences(of: "<img", with: "<img style='max-width: 100%; vertical-align:middle;'")
            }
            // 注意：这里webView高度不能为0，如果设置为0webView在加载完成后使用sizeToFit()得不到真实高度
            let webView = UIWebView.init(frame: CGRect.init(x: 10, y: 0, width: screenWidth - 20, height: 1))
            webView.delegate = self
            webView.backgroundColor = UIColor.clear
            webView.isOpaque = false
            webView.dataDetectorTypes = UIDataDetectorTypes.init(rawValue: 0)
            webView.scrollView.isScrollEnabled = false
            webView.scrollView.showsVerticalScrollIndicator = false
            webView.scrollView.showsHorizontalScrollIndicator = false
            webView.isUserInteractionEnabled = false
            webView.tag = index!
            webView.loadHTMLString(htmlString, baseURL: nil)
            webViewDict.updateValue(webView, forKey: index!)
        }
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        // 使webView自适应高度
        webView.sizeToFit()
        let height = webView.bounds.size.height
        webView.frame = CGRect.init(x: 10, y: 0, width: screenWidth - 20, height: height)
        if !heightDict.keys.contains(webView.tag) {
            heightDict.updateValue(height, forKey: webView.tag)
            
            // 当字典个数与数据源个数一致时才刷新，避免多次重复刷新
            if heightDict.count >= testArray.count {
                self.tableView.reloadData()
                hideLoading()
            }
        }
    }
}

