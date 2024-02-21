import StartOptions from '@ohos.app.ability.StartOptions'
import router from '@ohos.router'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(30)
          .fontColor(Color.Red)
          .fontWeight(FontWeight.Bold)

          Button("页面跳转")
          .onClick((event:ClickEvent)=>{
            router.pushUrl({
              url:'pages/ToDoList',
              params:{
                src:"from hello world"
              }
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}






