import { SideBarMask } from './CityChooseMask';
import { Province, City, CityData, cityData } from './data/CityDictionary';

@Component
export struct CustomSideBar {
  @Link selectedProvince: string;
  @Link selectedCity: string;
  @Link cityCode:string;
  @Link showSideBar:boolean;
  @State proportion:string[]=['20%','20%','60%']
  private provinceScroller: Scroller = new Scroller();
  private cityScroller: Scroller = new Scroller();

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
              .backgroundColor(this.selectedProvince === province.省 ? $r('app.color.button_selected_light') : Color.White)
              .alignSelf(ItemAlign.Start);
            });
          }
        }
        .scrollable(ScrollDirection.Vertical) // 滚动方向为垂直方向
        .scrollBarColor(Color.Gray) // 滚动条颜色
        .edgeEffect(EdgeEffect.Spring) // 滚动到边沿后回弹
        .width(this.proportion[0]) // 省份选择区域宽度
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
                        this.cityCode=city.编码;
                        this.showSideBar=false;
                        console.log(`Selected Province: ${this.selectedProvince}, Selected City: ${this.selectedCity}, City Code: ${this.cityCode}`);
                      })
                      .padding(10)
                      .borderRadius(5);
                  }
                  .width('100%')
                  .backgroundColor(this.selectedCity === city.市名 ? $r('app.color.button_selected_light') : Color.White)
                  .alignSelf(ItemAlign.Start);
                });
              }
            });
          }.height('100%')
        }
        .scrollable(ScrollDirection.Vertical) // 滚动方向为垂直方向
        .scrollBarColor(Color.Gray) // 滚动条颜色
        .edgeEffect(EdgeEffect.Spring) // 滚动到边沿后回弹
        .width(this.proportion[1]) // 市级选择区域宽度
        .backgroundColor($r("app.color.apparent_background_blue"));
        SideBarMask({ showSideBar: this.showSideBar }).height('100%').width(this.proportion[2])
      }
    }
    .sideBarWidth('100%')
    .showSideBar(this.showSideBar)
    .showControlButton(false)
  }
}
