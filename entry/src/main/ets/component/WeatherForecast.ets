import { GetData, ApiResponse, Forecast, CityInfo, WeatherData } from '../component/DataFetcher';
import { getIconPath } from './WeatherImageSelector'

@Component
export struct WeatherForecast {
  @Link response: ApiResponse;
  private today = new Date().toISOString().split('T')[0];

  build() {
    // 主列布局
    Column() {
      // 检查 forecast 数据是否存在
      if (this.response.data.forecast) {
        Row(){
          Text(`${this.response.data.yesterday.ymd.slice(5)}`)
            .fontSize(15)
            .fontWeight('bold')
            .padding(10)
            .fontColor(Color.Black);
          Blank();
          Text(`${this.response.data.yesterday.week}`)
            .fontSize(15)
            .fontWeight('bold')
            .padding(10)
            .fontColor(Color.Black);
          Blank();
          Image(getIconPath(this.response.data.yesterday.type)).height('80%');
          Blank();
          // 最高气温
          Text(`${this.response.data.yesterday.high.split(' ')[1]}`)
            .fontSize(12)
            .padding(10)
            .fontColor(Color.Red);

          // 最低气温
          Text(`${this.response.data.yesterday.low.split(' ')[1]}`)
            .fontSize(12)
            .padding(10)
            .fontColor(Color.Blue);
        }
          .padding(5)
          .borderWidth(1)
          .borderColor('#D3D3D3') // 为每一行添加分隔线
          .backgroundColor('#00000000')
          .alignSelf(ItemAlign.Center)
          .alignItems(VerticalAlign.Center)
          .width('100%')
          .height('6.25%')
          .padding(5);
        ForEach(this.response.data.forecast as Forecast[], (day: Forecast) => {
          Row() {
            // 日期
            Text(`${day.ymd.slice(5)}`)
              .fontSize(15)
              .fontWeight('bold')
              .padding(10)
              .fontColor(Color.Black);
            Blank()
            Text(`${day.week}`)
              .fontSize(15)
              .fontWeight('bold')
              .padding(10)
              .fontColor(Color.Black);
            Blank();
            Image(getIconPath(day.type)).height('80%');
            Blank();
            // 最高气温
            Text(`${day.high.split(' ')[1]}`)
              .fontSize(12)
              .padding(10)
              .fontColor(Color.Red);
            // 最低气温
            Text(`${day.low.split(' ')[1]}`)
              .fontSize(12)
              .padding(10)
              .fontColor(Color.Blue);
          }
          .padding(5)
          .borderWidth(1)
          .borderColor('#D3D3D3') // 为每一行添加分隔线
          .backgroundColor(day.ymd === this.today ? '#40D4D4' : '#00000000') // 今天的行高亮
          .alignSelf(ItemAlign.Center)
          .alignItems(VerticalAlign.Center)
          .width('100%')
          .height('6.25%')
          .padding(5);
        });
      }

    }
    .backgroundColor($r('app.color.background_apparent')) // 背景颜色
    .width('100%')
    .height('100%');
  }
}
