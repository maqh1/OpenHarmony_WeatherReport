import {LocationSelector} from '../component/LocationSelector'
import {WeatherDisplay} from '../component/WeatherDisplay'
import {WeatherChart} from '../component/WeatherChart'
import {CustomSideBar} from '../component/CitySelector'
import {GetData,ApiResponse,Forecast,CityInfo,WeatherData, defaultResponse} from '../component/DataFetcher'
import {weatherIconDict} from '../component/WeatherSVGSelector'

@Entry
@Component
struct Index {
  @State selectedProvince: string='北京';
  @State selectedCity: string='北京';
  @State cityCode:string='101010100';
  @State response:ApiResponse=defaultResponse;
  @State showSideBar:boolean=false;

  update(){
    GetData(this.cityCode)
      .then(response => {
        this.response=response;
      })
      .catch((error:string) => {
        console.error('Error fetching data:', error);
      });
  }

  build() {
    Stack() {
      Column() {
        LocationSelector({ showSideBar: this.showSideBar }); // 地址选择组件
        WeatherDisplay({response:this.response}); // 天气显示组件
        WeatherChart({response:this.response})
          .height('20%')
          .width('100%'); // 温度变化曲线组件
        // 测试用按钮
        Button().onClick(()=>{
          this.update();
        })
        Image('/color-256/$\{weatherIconDict["晴天"}.png`').width('80%').fillColor(Color.Blue).height('50%').sourceSize({width:200,height:200}).outlineWidth('2%')
      }.onAppear(()=>{
        // this.update(); 暂时屏蔽，减少请求，增加素质
      })
        .alignSelf(ItemAlign.Start)
        .height('100%')
        .width('100%')
      CustomSideBar({showSideBar:this.showSideBar,selectedProvince:this.selectedProvince,selectedCity:this.selectedCity,cityCode:this.cityCode})
        .height('100%')
        .width('100%')
        .alignSelf(ItemAlign.Start)
        .hitTestBehavior(HitTestMode.Transparent)
    }
  }
}