import { GetData, ApiResponse, Forecast, CityInfo, WeatherData } from '../component/DataFetcher';

@Component
export struct WeatherDisplay {
  @Link response: ApiResponse;
  build() {
    // 主列布局
    Column() {
      // 标题部分
      Column() {
        Text(`${this.response.cityInfo.city}, ${this.response.cityInfo.parent}`)
          .fontSize(28)
          .fontWeight('bold')
          .padding(10)
          .textAlign(TextAlign.Center)
          .fontColor(Color.White);

        Text(`更新时间: ${this.response.cityInfo.updateTime}`)
          .fontSize(16)
          .padding(5)
          .textAlign(TextAlign.Center)
          .fontColor('#D3D3D3');
      }
      .backgroundColor('#D80000FF')
      .padding(15)
      .borderRadius(10);

      // 当前天气信息部分
      Column() {
        // 当前温度
        Text(`当前温度: ${this.response.data.wendu} °C`)
          .fontSize(30)
          .fontWeight('bold')
          .padding(10)
          .fontColor(Color.Black);

        // 天气状况
        if(this.response.data.forecast[0]) {
          Text(`${this.response.data.forecast[0].type}`)
            .fontSize(22)
            .fontWeight('500')
            .padding(5)
            .fontColor(Color.Gray);

          // 高低温
          Row() {
            Text(`最高: ${this.response.data.forecast[0].high.split(' ')[1]}`)
              .fontSize(18)
              .padding(5)
              .fontColor(Color.Red);

            Blank();

            Text(`最低: ${this.response.data.forecast[0].low.split(' ')[1]}`)
              .fontSize(18)
              .padding(5)
              .fontColor(Color.Blue);
          }
          .padding(10);
        }
      }
      .backgroundColor('#40FFFF00')
      .padding(10)
      .borderRadius(10);

      // 额外信息部分
      Column() {
        Row() {
          Text(`湿度: ${this.response.data.shidu}`)
            .fontSize(18)
            .padding(5);

          Blank();

          Text(`空气质量: ${this.response.data.quality}`)
            .fontSize(18)
            .padding(5);
        }

        Row() {
          Text(`PM2.5: ${this.response.data.pm25}`)
            .fontSize(18)
            .padding(5);

          Blank();

          Text(`PM10: ${this.response.data.pm10}`)
            .fontSize(18)
            .padding(5);
        }

        Text(`感冒提示: ${this.response.data.ganmao}`)
          .fontSize(16)
          .padding(5)
          .fontColor('#444444');
      }
      .padding(10)
      .borderRadius(10);
    }
    .backgroundColor($r('app.color.background_apparent'))
    .width('100%');
  }
}
