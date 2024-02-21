@Entry
@Component
struct TabPage {
  @State message: string = 'Hello World'
  @State currentIndex:number = 0
  /**
   * 自定义tabbar
   */
  private controller:TabsController = new TabsController();
  @Builder TabBuilder(title:string,index:number,selectedImg:Resource,normaImg:Resource){
    Column(){
      Image(this.currentIndex === index?selectedImg:normaImg).width(40).height(40)
      Text(title).fontColor(this.currentIndex===index?'#1698CE':'#6B6B6B')
    }.onClick(()=>{
      this.currentIndex=index;
      this.controller.changeIndex(index);
    })
  }

  build() {
      Column() {
        Tabs({barPosition:BarPosition.End,controller:this.controller}){
          TabContent(){
            //首页布局
            Home()
          } //默认填充整个 宽高不可设置宽高属性
          .tabBar(this.TabBuilder('首页',0,$r('app.media.icon'),$r('app.media.app_icon')))
          TabContent(){
            //我的布局
            Mine()
          }
          .tabBar(this.TabBuilder('我的',1,$r('app.media.icon'),$r('app.media.app_icon')))
        }.vertical(false)
        .barWidth('90%')
        .barHeight(80)
        .barMode(BarMode.Fixed)
        .onChange((index:number)=>{
          this.currentIndex = index
        })
      }
      .width('100%')
  }
}


@Component
struct Home {


  build(){
    Column(){
      Text("home")
    }
  }
}

@Component
struct Mine {

  build(){
    Column(){
      Text("mine")
    }
  }
}