
@Component
export struct SideBarMask {
  @Link showSideBar: boolean;

  build() {
    Column()
      .backgroundColor($r("app.color.apparent_background"))
      .height('100%')
      .width('100%')
      .onClick(() => {
        // 切换 showSideBar 状态
        this.showSideBar = false;
      });
  }
}
