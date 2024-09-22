import { McLineChart, Options } from '@mcui/mccharts';
import { GetData, ApiResponse, Forecast, CityInfo, WeatherData } from '../component/DataFetcher';

@Component
export struct WeatherChart {
  @Link @Watch('updateWhenChange') response: ApiResponse;
  @State seriesOption: Options = new Options({
    xAxis: {
      data: [], // 初始化为空，稍后更新
      name: '日期',
      axisLabel:{fontSize:40,color:'#444444'}
    },
    yAxis: {
      axisLine:{show:false},
      axisLabel:{show:false,fontSize:40,color:'#444444'}
    },
    series: [
      {
        name: '最高气温',
        data: [], // 初始化为空，稍后更新
        smooth:true,
        label:{fontSize:35,color:'#444444'}
      },
      {
        name: '最低气温',
        data: [], // 初始化为空，稍后更新
        smooth:true,
        label:{fontSize:35,color:'#444444'}
      },

    ],
    legend: { // 删除图例
      show: false
    }
  });

  updateWhenChange(_:string):void{
    this.update();
  }

  update(){
    setTimeout(() => {
      if (this.response) {
        const forecast = this.response.data.forecast;
        const yesterday = this.response.data.yesterday;

        // 更新 x 轴和系列数据，使用 ymd 格式提取月份和日期
        const xAxisData = [
          `${yesterday.ymd.slice(5)}`, // 提取昨天的日期（MM-DD）
          ...forecast.map(f => `${f.ymd.slice(5)}`) // 提取未来的日期（MM-DD）
        ];
        const maxTempData = [
          parseFloat(yesterday.high.split(' ')[1]), // 昨天的最高气温
          ...forecast.map(f => parseFloat(f.high.split(' ')[1])) // 未来的最高气温
        ];
        const minTempData = [
          parseFloat(yesterday.low.split(' ')[1]), // 昨天的最低气温
          ...forecast.map(f => parseFloat(f.low.split(' ')[1])) // 未来的最低气温
        ];

        this.seriesOption.setVal({
          xAxis: {
            data: xAxisData
          },
          series: [
            {
              name: '最高气温',
              data: maxTempData
            },
            {
              name: '最低气温',
              data: minTempData
            }
          ]
        });
      }
    }, 2000);
  }

  // 动态修改数据
  aboutToAppear() {
    this.update();
  }

  private ImageScroller: Scroller = new Scroller();

  build() {
    Row() {
      Scroll(this.ImageScroller) {
        McLineChart({
          options: this.seriesOption
        }).width(1000).hitTestBehavior(HitTestMode.Transparent).backgroundColor($r('app.color.background_apparent'))
      }.scrollable(ScrollDirection.Horizontal)
      .scrollBar(BarState.On)
      .scrollBarWidth('10')
    }
  }
}
