


@Entry
@Component
struct ListPage {
  @State message: string = 'Hello World'
  settingListData: Array<ItemData> = [
  new ItemData($r("app.string.app_news"), $r("app.media.icon")),
  new ItemData($r("app.string.app_setting"), $r("app.media.icon")),
  new ItemData($r("app.string.app_server"), $r("app.media.icon")),
  new ItemData($r("app.string.app_server"), $r("app.media.icon")),
  new ItemData($r("app.string.app_server"), $r("app.media.icon")),
]
  build() {
      Column() {
        List(){
          ForEach(this.settingListData,(item:ItemData)=>{
            ListItem(){
              this.settingCell(item)
            }.margin({top:5,bottom:5}).backgroundColor(Color.Red).borderRadius(12).padding({left:10,right:10,top:10,bottom:10})
          },(item:ItemData) => JSON.stringify(item))
        }
        .margin({left:20,right:20,top:30})
        .borderRadius(20)
        .backgroundColor(Color.Green)
      }
      .width('100%')
  }

  @Builder settingCell(item:ItemData){
    Row(){
      Row(){
        Image(item.img).width(68).height(68)
        Text(item.title+"").margin({left:20})
      }
      if (item.others == null){
        Image($r('app.media.app_icon')).width(48).height(48)
      }else{
        Toggle({type:ToggleType.Switch,isOn:false})
      }
    }.justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
  }
}







export default class ItemData{
  title:Resource | String;
  img?:Resource;
  others?:Resource;

  constructor(title:Resource|String,img?:Resource,others?:Resource) {
    this.title = title;
    this.img = img;
    this.others = others;
  }
}