import font from '@ohos.font'
import router from '@ohos.router'
//能取到
let params = router.getParams()?.['src'] as String
/**
 * 代办列表页面
 */
@Entry
@Component
struct ToDoList {
  dataList: Array<string> = ['晨跑', '早餐', '阅读', '学习', '盘串']
  //接收上个页面的参数，取不到
  // @State params: String = router.getParams()?.['src']
  onPageShow(){}
  build() {
    Column() {
      Text(params?.toString())
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .backgroundColor(Color.White)
        .margin({ bottom: 20 })
      Button("返回").onClick(() => {
        router.back()
      })
      Flex({ direction: FlexDirection.Column }) {
        ForEach(this.dataList, (item) => {
          ToDoItem({ content: item })
        })
      }
      .padding({ left: 10, right: 10 })
    }.backgroundColor(Color.Gray)
    .width("100%")
    .alignItems(HorizontalAlign.Center)
  }
}


@Component
struct ToDoItem {
  private content: string;
  @State isComplete: boolean = false

  build() {
    Row() {
      if (this.isComplete) {
        Image($r('app.media.icon')).width(50).height(50)
      } else {
        Image($r('app.media.app_icon')).width(50).height(50)
      }
      Text(this.content)
        .opacity(this.isComplete ? 0.4 : 1)
        .decoration({ type: this.isComplete ? TextDecorationType.LineThrough : TextDecorationType.None })
        .margin({ left: 20 })
    }
    .borderRadius(8)
    .backgroundColor(Color.White)
    .padding({ left: 10, right: 10, top: 5, bottom: 5 })
    .margin({ top: 5, bottom: 5 })
    .width("100%")
    .onClick(() => {
      this.isComplete = !this.isComplete
    })
  }
}