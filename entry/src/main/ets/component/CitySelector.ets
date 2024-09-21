import { Province, City, CityData, cityData } from './data/CityDictionary';

@Component
export struct CustomSideBar {
  @State selectedProvince: string = '';
  @State selectedCity: string = '';
  provinceScroller: Scroller = new Scroller();
  cityScroller: Scroller = new Scroller();

  build() {
    SideBarContainer(SideBarContainerType.Embed) {
      Row() {
        // 左侧省份选择
        Scroll(this.provinceScroller) {
          Column() {
            // 省份选择
            ForEach(cityData.城市代码 as Province[], (province: Province) => {
              Row() {
                Text(province.省)
                  .onClick(() => {
                    this.selectedProvince = province.省;
                    this.selectedCity = ''; // 清空已选城市
                  })
                  .padding(10)
                  .borderRadius(5);
              }
              .width('100%')
              .backgroundColor(this.selectedProvince === province.省 ? Color.Blue : Color.White)
              .alignSelf(ItemAlign.Start);
            });
          }
        }
        .scrollable(ScrollDirection.Vertical) // 滚动方向为垂直方向
        .scrollBarColor(Color.Gray) // 滚动条颜色
        .edgeEffect(EdgeEffect.Spring) // 滚动到边沿后回弹
        .width('50%') // 省份选择区域宽度
        .backgroundColor($r("app.color.apparent_background_blue"))

        // 右侧市级选择
        Scroll(this.cityScroller) {
          Column() {
            // 市级选择
            ForEach(cityData.城市代码 as Province[], (province: Province) => {
              if (province.省 === this.selectedProvince) {
                ForEach(province.市 as City[], (city: City) => {
                  Row() {
                    Text(city.市名)
                      .onClick(() => {
                        this.selectedCity = city.市名; // 更新选中的城市
                      })
                      .padding(10)
                      .borderRadius(5);
                  }
                  .width('100%')
                  .backgroundColor(this.selectedCity === city.市名 ? Color.Blue : Color.White)
                  .alignSelf(ItemAlign.Start);
                });
              }
            });
          }.height('100%')
        }
        .scrollable(ScrollDirection.Vertical) // 滚动方向为垂直方向
        .scrollBarColor(Color.Gray) // 滚动条颜色
        .edgeEffect(EdgeEffect.Spring) // 滚动到边沿后回弹
        .width('50%') // 市级选择区域宽度
        .backgroundColor($r("app.color.apparent_background_blue"))
      }
    }
  }
}
