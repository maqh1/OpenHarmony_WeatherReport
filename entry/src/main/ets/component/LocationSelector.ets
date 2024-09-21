import {GetData} from './DataFetcher'

@Component
export struct LocationSelector {
  @State selectedLocation: string = '选择城市';
  @Link showSideBar:boolean;

  build() {
    Column() {
      Text(this.selectedLocation)
        .fontSize(20)
        .onClick(() => {
            this.showSideBar=true;
        });

      // 可能会有一个城市选择的下拉列表或模态框
    }
    .padding(10)
    .backgroundColor(Color.White);
  }
}
