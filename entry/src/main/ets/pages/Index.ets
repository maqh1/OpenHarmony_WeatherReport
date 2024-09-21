import {LocationSelector} from '../component/LocationSelector'
import {WeatherDisplay} from '../component/WeatherDisplay'
import {WeatherChart} from '../component/WeatherChart'
import {CustomSideBar} from '../component/CitySelector'
import {SideBarMask} from '../component/CityChooseMask'

@Entry
@Component
struct Index {
  @State showSideBar:boolean=false;

  build() {
    Stack() {
      Column() {
        LocationSelector({ showSideBar: this.showSideBar }); // 地址选择组件
        WeatherDisplay(); // 天气显示组件
        WeatherChart()
          .height('20%')
          .width('100%'); // 温度变化曲线组件
      }
      .alignSelf(ItemAlign.Start)
      .height('100%')
      .width('100%')
      Row(){
        CustomSideBar().height('100%').width('60%').alignSelf(ItemAlign.Start)
        SideBarMask({ showSideBar: this.showSideBar }).height('100%').width('40%')
      }
      .alignSelf(ItemAlign.Start)
      .height('100%')
      .width('100%')

    }
  }
}