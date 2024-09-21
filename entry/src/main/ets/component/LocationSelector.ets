@Component
export struct LocationSelector {
  @State selectedLocation: string = '选择城市';
  @Link showSideBar: boolean;  // 确保从父组件传递过来

  build() {
    Column() {
      Text(this.selectedLocation)
        .fontSize(20)
    }
    .padding(10)
    .width('100%')
    .backgroundColor($r('app.color.button_color'))
    .onClick(() => {
      this.showSideBar = true;
    });
  }
}
