Chartkick.options = {
  donut: true, # ドーナツグラフ
  # width: '400px',
  colors: [ "#769fcd",
            "#b9d7ea",
            "#d6e6f2",
            "#f7fbfc",
          ],
  message: {empty: "データがありません"},
  thousands: ",", 
  suffix: "円",
  legend: false, # 凡例非表示
  library: { # ここからHighchartsのオプション
    chart: {
      backgroundColor: 'none',
      plotBorderWidth: 0, 
      plotShadow: false
    },
    plotOptions: {
      pie: {
        dataLabels: {
          enabled: true, 
          distance: -40, # ラベルの位置調節
          allowOverlap: false, # ラベルが重なったとき、非表示にする
          style: { #ラベルフォントの設定
            color: '#555', 
            textAlign: 'center', 
            textOutline: 0, #デフォルトではラベルが白枠で囲まれていてダサいので消す
          }
        },
        responsive: {
          rules: [{
            condition: {
              maxWidth: 400
          },
          chartOptions: {
            legend: {
              layout: 'horizontal',
              align: 'center',
              verticalAlign: 'bottom'
            }
            }
          }]
        },
        size: '100%',
        innerSize: '70%', # ドーナツグラフの中の円の大きさ
        borderWidth: 0,
      }
    },
  }
}