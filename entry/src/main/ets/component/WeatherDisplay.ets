
@Component
export struct WeatherDisplay {
  @State weatherData:number=10; // 暂时使用一个数字

  build() {
    Column() {
      Text(`当前温度: ${this.weatherData} °C`)
        .fontSize(24);

      Text(`天气状况: ${this.weatherData}`)
        .fontSize(20);
    }
    .padding(10)
    .backgroundColor(Color.Gray);
  }
}
