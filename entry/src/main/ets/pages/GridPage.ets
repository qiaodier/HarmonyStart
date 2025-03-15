import ItemData from './ListPage'
@Entry
@Component
struct GridPage {
  @State message: string = 'Hello World'
gridData:Array<ItemData> = [
  new ItemData("我的最爱", $r("app.media.icon")),
  new ItemData("历史记录", $r("app.media.icon")),
  new ItemData("消息", $r("app.media.icon")),
  new ItemData("购物车", $r("app.media.icon")),
  new ItemData("我的目标", $r("app.media.icon")),
  new ItemData("圈子", $r("app.media.icon")),
  new ItemData("收藏", $r("app.media.icon")),
  new ItemData("回收站", $r("app.media.icon")),
  new ItemData("回收站1", $r("app.media.icon")),
  new ItemData("回收站2", $r("app.media.icon")),
]
  build() {
      Column() {
        Grid(){
          ForEach(this.gridData,(item:ItemData)=>{
            GridItem(){
              Column(){
                Image(item.img).width(30).height(30)
                Text(item.title+"")
              }
            }
          },(item:ItemData) => JSON.stringify(item))
        }.columnsTemplate("1fr 1fr 1fr 1fr")//4列
        // .rowsTemplate("1fr 1fr") //两行
        .rowsGap(12)//行间距
        // .columnsGap(8)//列间距
        .height(120)
        .backgroundColor(Color.White)
        .borderRadius(10)
        .margin(10)

      }.backgroundColor(Color.Grey)
      .width('100%')
      .height('100%')
    .justifyContent(FlexAlign.Start)

  }
}